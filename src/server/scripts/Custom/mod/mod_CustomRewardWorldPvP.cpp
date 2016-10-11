//#include "ScriptPCH.h"
#include "ReputationMgr.h"
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

bool CustomRewardPvPEnable = false;

struct CustomRewardPvPTemplate
{
    uint32 id;
    int8 req_type_is_battleground;
    int8 req_type_is_arena;
    uint16 req_zone_id;
    int16 req_map_id;
    uint32 req_target_race_mask;
    uint32 req_target_class_mask;
    uint32 req_self_race_mask;
    uint32 req_self_class_mask;
    uint32 req_target_guid;
    uint32 req_self_guid;
    uint32 req_target_guild_id;
    uint32 req_self_guild_id;
    uint32 reward_money_gold;
    uint32 reward_honor;
    uint32 reward_item_id;
    uint8 reward_item_count;
    uint32 reward_buff;
    uint8 reward_group;
    uint32 reward_rep_faction_id;
    int32 reward_rep_value;
};

std::vector<CustomRewardPvPTemplate> CustomRewardPvPInfo;

class Mod_CustomRewardPvP_WorldScript : public WorldScript
{
    public:
        Mod_CustomRewardPvP_WorldScript() : WorldScript("Mod_CustomRewardPvP_WorldScript") { }

    void LoadDataFromDataBase()
    {
        CustomRewardPvPInfo.clear();

		TC_LOG_ERROR("misc", "Loading CustomRewardPvPInfo...");
        uint32 oldMSTime = getMSTime();

        QueryResult result = WorldDatabase.PQuery("SELECT `id`, `req_type_is_battleground`, `req_type_is_arena`, `req_zone_id`, `req_map_id`, `req_target_race_mask`, `req_target_class_mask`, `req_self_race_mask`, "
            "`req_self_class_mask`, `req_target_guid`, `req_self_guid`, `req_target_guild_id`, `req_self_guild_id`, `reward_money_gold`, `reward_honor`, `reward_item_id`, `reward_item_count`, `reward_buff` "
            ", `reward_group`, `reward_rep_faction_id`, `reward_rep_value` FROM `world_custom_reward_pvp` WHERE `disabled` = 0");

        if (!result)
        {
			TC_LOG_ERROR("misc", ">> `world_custom_reward_pvp` is empty");
            return;
        }

        uint16 count = 0;

        do
        {
            Field* fields = result->Fetch();

            CustomRewardPvPTemplate RewardPvPTemp;

            RewardPvPTemp.id                        = fields[0].GetUInt32();
            RewardPvPTemp.req_type_is_battleground  = fields[1].GetInt8();
            RewardPvPTemp.req_type_is_arena         = fields[2].GetInt8();
            RewardPvPTemp.req_zone_id               = fields[3].GetUInt16();
            RewardPvPTemp.req_map_id                = fields[4].GetInt16();
            RewardPvPTemp.req_target_race_mask      = fields[5].GetUInt32();
            RewardPvPTemp.req_target_class_mask     = fields[6].GetUInt32();
            RewardPvPTemp.req_self_race_mask        = fields[7].GetUInt32();
            RewardPvPTemp.req_self_class_mask       = fields[8].GetUInt32();
            RewardPvPTemp.req_target_guid           = fields[9].GetUInt32();
            RewardPvPTemp.req_self_guid             = fields[10].GetUInt32();
            RewardPvPTemp.req_target_guild_id       = fields[11].GetUInt32();
            RewardPvPTemp.req_self_guild_id         = fields[12].GetUInt32();
            RewardPvPTemp.reward_money_gold         = fields[13].GetUInt32();
            RewardPvPTemp.reward_honor              = fields[14].GetUInt32();
            RewardPvPTemp.reward_item_id            = fields[15].GetUInt32();
            RewardPvPTemp.reward_item_count         = fields[16].GetUInt8();
            RewardPvPTemp.reward_buff               = fields[17].GetUInt32();
            RewardPvPTemp.reward_group              = fields[18].GetUInt8();
            RewardPvPTemp.reward_rep_faction_id     = fields[19].GetUInt32();
            RewardPvPTemp.reward_rep_value          = fields[20].GetInt32();

            CustomRewardPvPInfo.push_back(RewardPvPTemp);
            ++count;
        }
        while (result->NextRow());

		TC_LOG_ERROR("misc", ">> Loaded %u count for CustomRewardPvP in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
    }

    void OnConfigLoad(bool /*reload*/)
    {
		CustomRewardPvPEnable = sConfigMgr->GetBoolDefault("CustomRewardPvP.Enable", false);

        if (!CustomRewardPvPEnable)
            return;

        LoadDataFromDataBase();
    }

};

class Mod_CustomRewardPvP_PlayerScript : public PlayerScript
{
    public:
        Mod_CustomRewardPvP_PlayerScript() : PlayerScript("Mod_CustomRewardPvP_PlayerScript") { }

    bool CheckSelfReq(CustomRewardPvPTemplate& tpl, Player* pl) {
        if (tpl.req_self_class_mask != 0 && !(tpl.req_self_class_mask & pl->getClassMask())) {
            return false;
        }
        if (tpl.req_self_race_mask != 0 && !(tpl.req_self_race_mask & pl->getRaceMask())) {
            return false;
        }
		if (tpl.req_self_guid != 0 && tpl.req_self_guid != pl->GetGUID().GetCounter()) {
            return false;
        }
        if (tpl.req_self_guild_id != 0 && tpl.req_self_guild_id != pl->GetGuildId()) {
            return false;
        }
        return true;
    }

    void Reward(CustomRewardPvPTemplate& tpl, Player* pl) {
        if (tpl.reward_money_gold > 0)
            pl->ModifyMoney(tpl.reward_money_gold * GOLD);

        if (tpl.reward_buff > 0)
            pl->CastSpell(pl, tpl.reward_buff, true);

        if (tpl.reward_honor > 0)
            pl->RewardHonor(NULL, 1, tpl.reward_honor);

        if (tpl.reward_item_id > 0 && tpl.reward_item_count > 0)
            pl->AddItem(tpl.reward_item_id, tpl.reward_item_count);

        if (tpl.reward_rep_faction_id > 0 && tpl.reward_rep_value != 0) {
            if (FactionEntry const* factionEntry = sFactionStore.LookupEntry(tpl.reward_rep_faction_id))
                pl->GetReputationMgr().ModifyReputation(factionEntry, tpl.reward_rep_value);
        }
    }

    void OnPVPKill(Player* killer, Player* killed)
    {
		if (!CustomRewardPvPEnable || killed->HasAura(15007) || killer->GetGUID().GetCounter() == killed->GetGUID().GetCounter())
            return;

		uint32 killerGuid = killer->GetGUID().GetCounter();
		uint32 killedGuid = killed->GetGUID().GetCounter();
        bool isBattleground = killer->InBattleground();
        bool isArea = killer->InArena();
        uint32 zoneId = killer->GetZoneId();
        uint32 mapId = killer->GetMapId();
        uint32 targetRaceMask = killed->getRaceMask();
        uint32 targetClassMask = killed->getClassMask();
        uint32 guildId = killed->GetGuildId();

        for (uint32 i = 0; i < CustomRewardPvPInfo.size(); ++i)
        {
            CustomRewardPvPTemplate& tpl = CustomRewardPvPInfo[i];

            if (tpl.req_type_is_battleground != 0) {
                if (tpl.req_type_is_battleground > 0) {
                    if (!isBattleground) {
                        continue;
                    }
                } else {
                    if (isBattleground) {
                        continue;
                    }
                }
            }

            if (tpl.req_type_is_arena != 0) {
                if (tpl.req_type_is_arena > 0) {
                    if (!isArea) {
                        continue;
                    }
                } else {
                    if (isArea) {
                        continue;
                    }
                }
            }

            if (tpl.req_map_id != -1 && tpl.req_map_id != mapId) {
                continue;
            }

            if (tpl.req_zone_id != 0 && tpl.req_zone_id != zoneId) {
                continue;
            }

            if (tpl.req_target_race_mask != 0 && !(tpl.req_target_race_mask & targetRaceMask)) {
                continue;
            }

            if (tpl.req_target_class_mask != 0 && !(tpl.req_target_class_mask & targetClassMask)) {
                continue;
            }

            if (tpl.req_target_guid != 0 && tpl.req_target_guid != killedGuid) {
                continue;
            }

            if (tpl.req_target_guild_id != 0 && tpl.req_target_guild_id != guildId) {
                continue;
            }

            if (tpl.reward_group == 0) {
                Reward(tpl, killer);
            } else {
                if (Group* group = killer->GetGroup())
                {
                    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                    {
                        Player* player = itr->GetSource();

                        // for any leave or dead (with not released body) group member at appropriate distance
                        if (player && player->IsAtGroupRewardDistance(killed) && !player->GetCorpse()) {
                            Reward(tpl, player);
                        }
                    }
                } else {
                    Reward(tpl, killer);
                }
            }
        }
    }

};

void AddSC_Mod_CustomRewardPvP()
{
    new Mod_CustomRewardPvP_PlayerScript();
    new Mod_CustomRewardPvP_WorldScript();
}
