//#include "ScriptPCH.h"
#include "Config.h"
#include "Group.h"
#include "Guild.h"
#include "GuildMgr.h"

#define SQL_BOSS_HISTORY_LOG "INSERT INTO `boss_history` (`GuildId`, `CreatureEntry`, `KillerCount`, `KillData`, `MapSpawnMode`, `MapId`, `MapRaid`, `CreatureName`, `MapName`, `MapMaxPlayers`) VALUES ('%u', '%u', '%u', '%s', '%u', '%u', '%u', '%s', '%s', '%u')"
#define DATA_SEPARATOR ":"
#define PEOPLE_SEPARATOR " "

bool    BossHistoryEnable       = false;
bool    BossHistoryInstance     = false;
bool    BossHistoryLog          = false;
bool    BossHistoryAnnounce     = false;
int32   BossHistoryNormalText   = 31006;
int32   BossHistoryHeroicText   = 31007;

class mod_BossHistory_WorldScript : public WorldScript
{
    public:
        mod_BossHistory_WorldScript() : WorldScript("mod_BossHistory_WorldScript") { }

    void OnConfigLoad(bool /*reload*/)
    {
		BossHistoryEnable =      sConfigMgr->GetBoolDefault("BossHistory.Enable", false);

        if (!BossHistoryEnable)
            return;

		BossHistoryInstance = sConfigMgr->GetBoolDefault("BossHistory.InstanceOnly", false);
		BossHistoryAnnounce = sConfigMgr->GetBoolDefault("BossHistory.Announce", false);
		BossHistoryLog      = sConfigMgr->GetBoolDefault("BossHistory.Log", false);
		BossHistoryNormalText = sConfigMgr->GetIntDefault("BossHistory.NormalTextId", 31006);
		BossHistoryHeroicText = sConfigMgr->GetIntDefault("BossHistory.HeroicTextId", 31007);
    }
};

class mod_BossHistory_AllCreatureScript : public AllCreatureScript
{
    public:
        mod_BossHistory_AllCreatureScript() : AllCreatureScript("mod_BossHistory_AllCreatureScript") { }

    void AllCreatureJustDied(Creature* creature)
    {
        if (!BossHistoryEnable)
            return;

        if (creature->GetCreatureTemplate()->rank != CREATURE_ELITE_WORLDBOSS)
            return;

        Player* recipient = creature->GetLootRecipient();
        if (!recipient)
            return;

        Map* map = creature->GetMap();
        if (!map)
            return;

        uint32 Entry = creature->GetEntry();
        InstanceMap* instance = map->ToInstanceMap();
        
        if (BossHistoryInstance && (!map->Instanceable() || !instance))
            return;
        
        std::string bossName(creature->GetNameForLocaleIdx(sObjectMgr->GetDBCLocaleIndex()));
        std::string mapName(creature->GetMap()->GetMapName());
        
        uint8 spawnMode = map->GetSpawnMode();
        uint32 GuildId = 0;
        bool IsGuildKill = true;
        uint32 KillerCount = 0;
        std::string TeamKill;

        if(Group *pGroup = recipient->GetGroup())
        {
            for(GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                Player* Temp = itr->GetSource();

                if(!Temp)
                    continue;

                KillerCount++;
                uint32 playerGuildId = Temp->GetGuildId();
                if (BossHistoryLog)
                {
                    std::ostringstream PeopleData;
					PeopleData << Temp->GetGUID().GetCounter() << DATA_SEPARATOR;
                    PeopleData << Temp->GetName() << DATA_SEPARATOR;
                    PeopleData << uint32(Temp->getLevel()) << DATA_SEPARATOR;
                    PeopleData << playerGuildId << DATA_SEPARATOR;
                    PeopleData << uint32(Temp->IsAlive()) << DATA_SEPARATOR;
                    PeopleData << uint32(Temp->IsAtGroupRewardDistance(creature)) << PEOPLE_SEPARATOR;
                    TeamKill += PeopleData.str();
                }

                if (IsGuildKill)
                {
                    if (GuildId == 0)
                        GuildId = playerGuildId;

                    IsGuildKill = GuildId != 0 && playerGuildId == GuildId;
                }
            }
        }
        else
        {
            KillerCount = 1;
            GuildId = recipient->GetGuildId();
            IsGuildKill = GuildId != 0;

            if (BossHistoryLog)
            {
                std::ostringstream PeopleData;
				PeopleData << recipient->GetGUID().GetCounter() << DATA_SEPARATOR;
                PeopleData << recipient->GetName() << DATA_SEPARATOR;
                PeopleData << uint32(recipient->getLevel()) << DATA_SEPARATOR;
                PeopleData << recipient->GetGuildId() << DATA_SEPARATOR;
                PeopleData << uint32(recipient->IsAlive()) << DATA_SEPARATOR;
                PeopleData << uint32(1) << PEOPLE_SEPARATOR;
                TeamKill += PeopleData.str();
            }
        }

        if (GuildId == 0 && IsGuildKill)
            IsGuildKill = false;

        if (!IsGuildKill)
            GuildId = 0;
            
        uint32 mapMaxPlayers = instance ? instance->GetMaxPlayers() : 40;

        if (BossHistoryAnnounce && IsGuildKill)
        {
            int32 TextId = BossHistoryNormalText;
            std::string guildName(sGuildMgr->GetGuildById(GuildId)->GetName());

            if (map->IsRaid())
            {
                if (spawnMode == RAID_DIFFICULTY_25MAN_HEROIC || spawnMode == RAID_DIFFICULTY_10MAN_HEROIC)
                    TextId = BossHistoryHeroicText;
            }
            else if (spawnMode == DUNGEON_DIFFICULTY_HEROIC)
                    TextId = BossHistoryHeroicText;

            sWorld->SendWorldText(TextId, mapName.c_str(), bossName.c_str(), mapMaxPlayers, guildName.c_str(), KillerCount);
        }

        if (!BossHistoryLog) return;

        CharacterDatabase.EscapeString(TeamKill);
        CharacterDatabase.EscapeString(bossName);
        CharacterDatabase.EscapeString(mapName);
        CharacterDatabase.PExecute(SQL_BOSS_HISTORY_LOG, GuildId, Entry, KillerCount, TeamKill.c_str(), spawnMode, map->GetId(), uint8(map->IsRaid()), bossName.c_str(), mapName.c_str(), mapMaxPlayers);
    }
};

void AddSC_Mod_BossHistory()
{
    new mod_BossHistory_AllCreatureScript();
    new mod_BossHistory_WorldScript();
}
