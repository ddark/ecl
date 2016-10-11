#include "Log.h"
#include "AccountMgr.h"
#include "SpellAuras.h"
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
bool    DynamicRateEnable               = false;
float   DynamicRateMin                  = 0.0f;
float   DynamicRateDefault              = 1.0f;
float   DynamicRateMax                  = 100.0f;
bool    DynamicRateAccount              = false;
bool    DynamicRateCharacter            = false;
int     DynamicRateCooldown             = 120;

struct DynamicRateInfo
{
    float rate;
    bool character;
    time_t update;
};

typedef std::map<uint32, DynamicRateInfo> DynamicRateMap; 
DynamicRateMap DynamicRate;

class Mod_DynamicRate_WorldScript : public WorldScript
{
    public:
        Mod_DynamicRate_WorldScript()
            : WorldScript("Mod_DynamicRate_WorldScript")
        {
        }

    void OnConfigLoad(bool /*reload*/)
    {
		DynamicRateEnable = sConfigMgr->GetBoolDefault("DynamicRate.Enable", false);

        if (!DynamicRateEnable)
            return;

		DynamicRateMin          = sConfigMgr->GetFloatDefault("DynamicRate.Min", 0.0f);
		DynamicRateDefault      = sConfigMgr->GetFloatDefault("DynamicRate.Default", 1.0f);
		DynamicRateMax          = sConfigMgr->GetFloatDefault("DynamicRate.Max", 100.0f);
		DynamicRateAccount      = sConfigMgr->GetBoolDefault("DynamicRate.Account", false);
		DynamicRateCharacter    = sConfigMgr->GetBoolDefault("DynamicRate.Character", false);
		DynamicRateCooldown     = sConfigMgr->GetIntDefault("DynamicRate.Cooldown", 120);
    }
};

class Mod_DynamicRate_CommandScript : public CommandScript
{
public:
	Mod_DynamicRate_CommandScript() : CommandScript("Mod_DynamicRate_CommandScript") { }

	std::vector<ChatCommand> GetCommands() const
	{
		static std::vector<ChatCommand> rateCommandTable =
		{
			{ "account", SEC_PLAYER, false, &HandleSetGameRateAccount, "" },//, NULL },
			{ "character", SEC_PLAYER, false, &HandleSetGameRateCharacter, "" },//, "", NULL },
			//{ NULL, 0, false, NULL, "", NULL },
		};

		static std::vector<ChatCommand> commandTable =
		{
			{ "rate", SEC_PLAYER, true, NULL, "", rateCommandTable },
			//{ NULL, 0, false, NULL, "", NULL }
		};
		return commandTable;
	}

    static bool HandleSetGameRateAccount(ChatHandler* handler, char const* args)
    {
        if (!DynamicRateEnable || !*args || !handler)
            return false;

		uint32 guid = handler->GetSession()->GetPlayer()->GetGUID().GetCounter();

        if (DynamicRate[guid].update + DynamicRateCooldown > time(NULL))
        {
            handler->SendSysMessage(LANG_RATE_WAIT);
            return true;
        }

        float rate = (float)atof((char*)args);

        if (rate < DynamicRateMin || rate > DynamicRateMax)
        {
            handler->PSendSysMessage(LANG_RATE_BETWEEN, DynamicRateMin, DynamicRateMax);
            return true;
        }
        
        if (!DynamicRate[guid].character)
            DynamicRate[guid].rate = rate;

        CharacterDatabase.PExecute("REPLACE INTO `account_rate` (`id`, `rate`) VALUES ('%u', '%f')", handler->GetSession()->GetAccountId(), rate);
        DynamicRate[guid].update = time(NULL);

        handler->SendSysMessage(LANG_RATE_SET_ACCOUNT);
        return true;
    }

    static bool HandleSetGameRateCharacter(ChatHandler* handler, char const* args)
    {
        if (!DynamicRateEnable) return false;

        if (!*args)
            return false;

		uint32 guid = handler->GetSession()->GetPlayer()->GetGUID().GetCounter();

        if (DynamicRate[guid].update + DynamicRateCooldown > time(NULL))
        {
            handler->SendSysMessage(LANG_RATE_WAIT);
            return true;
        }

        float rate = (float)atof((char*)args);

        if (rate < DynamicRateMin || rate > DynamicRateMax)
        {
            handler->PSendSysMessage(LANG_RATE_BETWEEN, DynamicRateMin, DynamicRateMax);
            return true;
        }

        DynamicRate[guid].character = true;
        DynamicRate[guid].rate = rate;

        CharacterDatabase.PExecute("REPLACE INTO `character_rate` (`guid`, `rate`) VALUES ('%u', '%f')", guid, rate);
        DynamicRate[guid].update = time(NULL);

        handler->PSendSysMessage(LANG_RATE_SET_CHARACTER, rate, handler->GetSession()->GetPlayer()->GetName().c_str());
        return true;
    }
};

class Mod_DynamicRate_PlayerScript : public PlayerScript
{
    public:
        Mod_DynamicRate_PlayerScript()
            : PlayerScript("Mod_DynamicRate_PlayerScript")
        {
        }

    void OnGiveXP(Player* player, uint32& amount, Unit* /*victim*/)
    {
        if (!DynamicRateEnable) return;

		amount *= DynamicRate[player->GetGUID().GetCounter()].rate;
    }

	void OnLogin(Player* player, bool /**/)
    {
        if (!DynamicRateEnable) return;

		uint32 guid = player->GetGUID().GetCounter();

        DynamicRate[guid].rate = DynamicRateDefault;
        DynamicRate[guid].update = time(NULL);
        DynamicRate[guid].character = false;

        QueryResult rslt = CharacterDatabase.PQuery("SELECT `rate` FROM `character_rate` WHERE `guid` = '%u'", guid);
        if (rslt)
        {
            DynamicRate[guid].rate = (*rslt)[0].GetFloat();
            DynamicRate[guid].character = true;
        }
        else
        {
            rslt = CharacterDatabase.PQuery("SELECT `rate` FROM `account_rate` WHERE `id` = '%u'", player->GetSession()->GetAccountId());
            if (rslt)
                DynamicRate[guid].rate = (*rslt)[0].GetFloat();
        }

        if (DynamicRate[guid].rate > DynamicRateMax) DynamicRate[guid].rate = DynamicRateMax;
        if (DynamicRate[guid].rate < DynamicRateMin) DynamicRate[guid].rate = DynamicRateMin;

        if (player->getLevel() < sWorld->getIntConfig(CONFIG_MAX_PLAYER_LEVEL))
        {
            if(DynamicRate[guid].rate > 0)
                player->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_XP_GAIN);
            else
                player->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_NO_XP_GAIN);
        }
    }

    void OnLogout(Player* player)
    {
        if (!DynamicRateEnable)
            return;

		uint32 guid = player->GetGUID().GetCounter();

        if (DynamicRate.empty())
            return;

        DynamicRateMap::iterator itr;

        for (itr = DynamicRate.begin(); itr != DynamicRate.end();)
        {
            if (itr->first == guid)
            {
                DynamicRate.erase(itr);
                return;
            }
            else
                ++itr;
        }
    }
};

void AddSC_Mod_DynamicRate()
{
    new Mod_DynamicRate_WorldScript();
    new Mod_DynamicRate_CommandScript();
    new Mod_DynamicRate_PlayerScript();
}
