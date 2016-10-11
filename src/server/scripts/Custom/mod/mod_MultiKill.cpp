#include "Config.h"
#include "GuildMgr.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Battleground.h"
#include "BattlegroundMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "ArenaTeam.h"
#include "ArenaTeamMgr.h"
#include "World.h"
#include "WorldSession.h"
#include "Group.h"
#include "AchievementMgr.h"
#include "ObjectAccessor.h"
#include "Unit.h"
#include "SharedDefines.h"
#include "Creature.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "Language.h"
#include "Chat.h"
#include <sstream>
#include "Channel.h"
#include "MapManager.h"
#include "CreatureTextMgr.h"
#include "SmartScriptMgr.h"

#define GOLD 10000
#define KILL_TYPE_MULTI 0
#define KILL_TYPE_TOTAL 1
#define KILL_TYPE_FIRST 2


bool    MultiKillEnable                 = false;
bool    MultiKillLoaded                 = false;
bool    MultiKillBattleGround           = true;
bool    MultiKillLog                    = false;
int     MultiKillTimeBetween            = 15;
uint32  MultiKillMin                    = 0;
uint32  MultiKillMax                    = 0;

struct MultiKillTemplate
{
    uint8 Count;
    uint8 Type;
    uint32 BuffFirst;
    uint32 BuffSecond;
    uint16 Gold;
    uint32 Sound;
    uint32 Text;
    uint32 Honor;
    uint32 KillCredit;
};

struct MultiKillData
{
    time_t last;
    uint8 count;
    uint8 total;
};

std::vector<MultiKillTemplate> MultiKillInfo;

typedef std::map<uint32, MultiKillData> MultiKillMap;
MultiKillMap MultiKillPlayer;

void LoadDataFromDataBase()
{
    MultiKillLoaded = true;
    MultiKillInfo.clear();

	TC_LOG_ERROR("misc", "Loading MultiKill...");
    uint32 oldMSTime = getMSTime();

    QueryResult result = WorldDatabase.PQuery("SELECT `Count`, `BuffFirst`, `Gold`, `Sound`, `TrinityStringId`, `Honor`, `Type`, `KillCredit`, `BuffSecond` FROM `world_multikill`");

    if (!result)
    {
		TC_LOG_ERROR("misc", ">> `world_multikill` is empty");
        return;
    }

    uint16 count = 0;
    MultiKillMin = 0;
    MultiKillMax = 0;

    do
    {
        Field* fields = result->Fetch();

        MultiKillTemplate MultiKillTemp;

        MultiKillTemp.Count         = fields[0].GetUInt8();
        MultiKillTemp.BuffFirst     = fields[1].GetUInt32();
        MultiKillTemp.Gold          = fields[2].GetUInt16();
        MultiKillTemp.Sound         = fields[3].GetUInt32();
        MultiKillTemp.Text          = fields[4].GetUInt32();
        MultiKillTemp.Honor         = fields[5].GetUInt32();
        MultiKillTemp.Type          = fields[6].GetUInt8();
        MultiKillTemp.KillCredit    = fields[7].GetUInt32();
        MultiKillTemp.BuffSecond    = fields[8].GetUInt32();

        if (MultiKillTemp.Type > KILL_TYPE_FIRST)
        {
			TC_LOG_ERROR("misc", "MultiKill: KillType (Type: %u) non-existing", MultiKillTemp.Type);
            continue;
        }

        if (MultiKillTemp.Type == KILL_TYPE_FIRST && MultiKillTemp.Count != 0)
        {
			TC_LOG_ERROR("misc", "MultiKill: FirstKill (Type: %u) need count = 0", MultiKillTemp.Type);
            continue;
        }

        if (MultiKillTemp.BuffFirst != 0 && !sSpellMgr->GetSpellInfo(MultiKillTemp.BuffFirst))
        {
			TC_LOG_ERROR("misc", "MultiKill: BuffFirst spell (ID: %u) non-existing", MultiKillTemp.BuffFirst);
            MultiKillTemp.BuffFirst = 0;
        }

        if (MultiKillTemp.BuffSecond != 0 && !sSpellMgr->GetSpellInfo(MultiKillTemp.BuffSecond))
        {
			TC_LOG_ERROR("misc", "MultiKill: BuffSecond spell (ID: %u) non-existing", MultiKillTemp.BuffSecond);
            MultiKillTemp.BuffSecond = 0;
        }

        if (MultiKillTemp.Type == KILL_TYPE_MULTI && (MultiKillMin == 0 || MultiKillMin > MultiKillTemp.Count))
            MultiKillMin = MultiKillTemp.Count;

        if (MultiKillTemp.Type == KILL_TYPE_MULTI && (MultiKillMax == 0 || MultiKillMax < MultiKillTemp.Count))
            MultiKillMax = MultiKillTemp.Count;

        MultiKillInfo.push_back(MultiKillTemp);
        ++count;
    }
    while (result->NextRow());

	TC_LOG_ERROR("misc", ">> Loaded %u count for MultiKill in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

class Mod_MultiKill_WorldScript : public WorldScript
{
    public:
        Mod_MultiKill_WorldScript() : WorldScript("Mod_MultiKill_WorldScript") { }

    void OnConfigLoad(bool reload)
    {
		MultiKillEnable = sConfigMgr->GetBoolDefault("MultiKill.Enable", false);

        if (!reload) MultiKillPlayer.clear();

        if (!MultiKillEnable)
            return;

		MultiKillBattleGround =   sConfigMgr->GetBoolDefault("MultiKill.BattleGroundOnly", true);
		MultiKillLog          =   sConfigMgr->GetBoolDefault("MultiKill.Log", false);
		MultiKillTimeBetween  =   sConfigMgr->GetIntDefault("MultiKill.Time.Between", 15);

        if (!MultiKillLoaded || !reload)
            LoadDataFromDataBase();
    }

};

class Mod_MultiKill_PlayerScript : public PlayerScript
{
    public:
        Mod_MultiKill_PlayerScript() : PlayerScript("Mod_MultiKill_PlayerScript") { }

    void Reward(Player* player, uint8 killed, uint8 killedType)
    {
        if (!MultiKillEnable)
            return;

        for (uint16 i = 0; i < MultiKillInfo.size(); ++i)
        {
            if (MultiKillInfo[i].Count == killed && MultiKillInfo[i].Type == killedType)
            {
                Battleground* bg = NULL;
                if (player->InBattleground())
                    bg = player->GetBattleground();


                if (MultiKillInfo[i].BuffFirst != 0)
                    player->CastSpell(player, MultiKillInfo[i].BuffFirst, true);

                if (MultiKillInfo[i].BuffSecond != 0)
                    player->CastSpell(player, MultiKillInfo[i].BuffSecond, true);

                if (MultiKillInfo[i].Gold != 0)
                    player->ModifyMoney(MultiKillInfo[i].Gold * GOLD);

                if (MultiKillInfo[i].Sound != 0)
                {
                    if (bg)
                        bg->PlaySoundToAll(MultiKillInfo[i].Sound);
                    else
                    {
                        WorldPacket data(SMSG_PLAY_SOUND, 4);
						data << uint32(MultiKillInfo[i].Sound) << player->GetGUID().GetCounter();
                        sWorld->SendGlobalMessage(&data);
                    }
                }

                // Reward Honor
                if (MultiKillInfo[i].Honor != 0)
                    player->RewardHonor(NULL, 1, MultiKillInfo[i].Honor);

                // TrinityStringId
                if (MultiKillInfo[i].Text != 0)
                {
                    if (bg)
                        bg->SendWarningToAll(MultiKillInfo[i].Text, player->GetName().c_str());
                    else
                        sWorld->SendWorldText(MultiKillInfo[i].Text, player->GetName().c_str());
                }

                // KillCredit for quests/achi.
                if (MultiKillInfo[i].KillCredit != 0)
					player->KilledMonsterCredit(MultiKillInfo[i].KillCredit);//, 0); test

                if (!MultiKillLog)
                    return;

                CharacterDatabase.PExecute(
                    "INSERT INTO `character_multikill` (`guid`, `count`, `type`, `time`) VALUES ('%u', '%u', '%u', CURRENT_TIMESTAMP())",
					player->GetGUID().GetCounter(), killed, killedType
                );

                return;
            }
        }
    }

    void ResetCounter(uint32 guid)
    {
        if (!MultiKillEnable)
            return;

        MultiKillPlayer[guid].count = 0;
        MultiKillPlayer[guid].total = 0;
        MultiKillPlayer[guid].last = time(NULL);
    }

    void OnPVPKill(Player* killer, Player* killed)
    {
        if (!MultiKillEnable)
            return;

		uint32 killerGuid = killer->GetGUID().GetCounter();
		uint32 killedGuid = killed->GetGUID().GetCounter();

        ResetCounter(killedGuid);

        if (killerGuid == killedGuid)
            return;

        if (MultiKillBattleGround && !killer->InBattleground())
            return;

        time_t now = time(NULL);

        Reward(killer, ++MultiKillPlayer[killerGuid].total, KILL_TYPE_TOTAL);

        if (now - MultiKillPlayer[killerGuid].last > MultiKillTimeBetween)
            MultiKillPlayer[killerGuid].count = 0;

        MultiKillPlayer[killerGuid].last = now;

        if (MultiKillPlayer[killerGuid].count < MultiKillMax)
            MultiKillPlayer[killerGuid].count++;

        if (MultiKillPlayer[killerGuid].count < MultiKillMin)
            return;

        Reward(killer, MultiKillPlayer[killerGuid].count, KILL_TYPE_MULTI);
    }

    void OnPlayerJoinedBattleground(Player* player, Battleground* /*bg*/)
    {
		ResetCounter(player->GetGUID().GetCounter());
    }

    void OnPlayerFirstKillBattleground(Player* player, Battleground* /*bg*/)
    {
        Reward(player, 0, KILL_TYPE_FIRST);
    }

    void OnPlayerKilledByCreature(Creature* /*killer*/, Player* killed)
    {
        if (!MultiKillEnable)
            return;

		ResetCounter(killed->GetGUID().GetCounter());
    }

	void OnLogin(Player* player, bool /*firstLogin*/)
    {
		ResetCounter(player->GetGUID().GetCounter());
    }

    void OnLogout(Player* player)
    {
        if (!MultiKillEnable)
            return;

		uint32 guid = player->GetGUID().GetCounter();

        if (MultiKillPlayer.empty())
            return;

        MultiKillMap::iterator itr;

        for (itr = MultiKillPlayer.begin(); itr != MultiKillPlayer.end();)
        {
            if (itr->first == guid)
            {
                MultiKillPlayer.erase(itr);
                return;
            }
            else
                ++itr;
        }
    }
};

class Mod_MultiKill_CommandScript : public CommandScript
{
public:
    Mod_MultiKill_CommandScript() : CommandScript("Mod_MultiKill_CommandScript") { }

	std::vector<ChatCommand> GetCommands() const
    {
		std::vector<ChatCommand> commandTable =
        {
            { "multikill",      SEC_ADMINISTRATOR,  false, &HandleMultiKillChatCommand,        ""},
            //{ NULL,             0,                  false, NULL,                               "", NULL }
        };
        return commandTable;
    }

    static bool HandleMultiKillChatCommand(ChatHandler* /*handler*/, char const* args)
    {
        if (!MultiKillEnable || !*args)
            return false;

        std::string param = (char*)args;

        if (param == "reload")
        {
            LoadDataFromDataBase();
            return true;
        }

        return true;
    }
};

void AddSC_Mod_Multikill()
{
    new Mod_MultiKill_PlayerScript();
    new Mod_MultiKill_WorldScript();
    new Mod_MultiKill_CommandScript();
}
