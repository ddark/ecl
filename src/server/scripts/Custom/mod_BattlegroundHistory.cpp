#include "ScriptPCH.h"
#include "Config.h"
#include "Battleground.h"
#include "Guild.h"
#include "GuildMgr.h"

#define SQL_HISTORY "INSERT INTO world_battleground (MapId, BattleTypeId, BattleIsArena, BattleIsRated, BattleTime, WinnerGuildId, WinnerCount, WinnerData, LooserGuildId, LooserCount, LooserData, WinnerTeam, BattleBracket, BattleLevelMin, BattleLevelMax, WinnerArenaTeamId, LooserArenaTeamId) VALUES ('%u', '%u', '%u', '%u', '%u', '%u', '%u', '%s', '%u', '%u', '%s', '%u', '%u', '%u', '%u', '%u', '%u')"

bool BGHistoryEnable = false;
int32 BGHistoryGuildWinText = 11100;
int32 BGHistoryGuildLooseText = 11101;
int32 BGHistoryGuildWinLooseText = 11102;

class Mod_BattlegroundHistory_WorldScript : public WorldScript
{
    public:
        Mod_BattlegroundHistory_WorldScript() : WorldScript("Mod_BattlegroundHistory_WorldScript") { }

    void OnConfigLoad(bool /*reload*/)
    {
        BGHistoryEnable = sConfigMgr->GetBoolDefault("BattlegroundHistory.Enable", false);
    }
};

class Mod_BattlegroundHistory_AllBattlegroundScript : public AllBattlegroundScript
{
    public:
        Mod_BattlegroundHistory_AllBattlegroundScript() : AllBattlegroundScript("Mod_BattlegroundHistory_AllBattlegroundScript") { }

    void AllBattlegroundEnd(Battleground* bg)
    {
        if (!BGHistoryEnable)
            return;

        uint32 winner = bg->GetWinner() == WINNER_ALLIANCE ? ALLIANCE : HORDE;

        bool GuildWinIs = true;
        bool GuildLooseIs = true;
        uint32 GuildWinId = 0;
        uint32 GuildLooseId = 0;
        uint32 CountWin = 0;
        uint32 CountLoose = 0;
        std::string TeamWin;
        std::string TeamLoose;
        Guild* GuildWin = NULL;
        Guild* GuildLoose = NULL;

        uint32 totaldamagedone = 0;
        uint32 totalhealdone = 0;
        std::string damageDonePlayerName;
        std::string healingDonePlayerName;

        for (Battleground::BattlegroundScoreMap::const_iterator itr = bg->GetPlayerScoresBegin(); itr != bg->GetPlayerScoresEnd(); ++itr)
        {
            Player* player = ObjectAccessor::FindPlayer(itr->first);
            if (!player)
                continue;

            if(itr->second->DamageDone >= totaldamagedone)
            {
                totaldamagedone = itr->second->DamageDone;
                damageDonePlayerName = player->GetName().c_str();
            }

            if(itr->second->HealingDone >= totalhealdone)
            {
                totalhealdone = itr->second->HealingDone;
                healingDonePlayerName = player->GetName().c_str();
            }

            uint32 playerGuildId = player->GetGuildId();

            std::ostringstream Playerdata;
            Playerdata << player->GetGUIDLow() << ":";
            Playerdata << player->GetName() << ":";
            Playerdata << uint32(player->getLevel()) << ":";
            Playerdata << uint32(playerGuildId) << ":";
            Playerdata << itr->second->KillingBlows << ":";
            Playerdata << itr->second->Deaths << ":";
            Playerdata << itr->second->HonorableKills << ":";
            Playerdata << itr->second->DamageDone << ":";
            Playerdata << itr->second->HealingDone << ":";
            Playerdata << itr->second->BonusHonor << ":";
            Playerdata << uint32(player->getRace()) << ":";
            Playerdata << uint32(player->getClass()) << ":";
            Playerdata << uint32(player->getGender()) << " ";

            if (bg->GetPlayerTeam(player->GetGUID()) == winner)
            {
                CountWin++;
                TeamWin += Playerdata.str();

                if (GuildWinIs)
                {
                    if (GuildWinId == 0)
                        GuildWinId = playerGuildId;

                    GuildWinIs = GuildWinId != 0 && playerGuildId == GuildWinId;
                }
            }
            else
            {
                CountLoose++;
                TeamLoose += Playerdata.str();

                if (GuildLooseIs)
                {
                    if (GuildLooseId == 0)
                        GuildLooseId = playerGuildId;

                    GuildLooseIs = GuildLooseId != 0 && playerGuildId == GuildLooseId;
                }
            }
        }

        if (GuildWinIs && GuildWinId != 0)
            GuildWin = sGuildMgr->GetGuildById(GuildWinId);
        else
            GuildWinId = 0;

        if (GuildLooseIs && GuildLooseId != 0)
            GuildLoose = sGuildMgr->GetGuildById(GuildLooseId);
        else
            GuildLooseId = 0;

        uint32 ArenaTeamWin = 0;
        uint32 ArenaTeamLoose = 0;

        if(bg->isArena() && bg->isRated())
        {
            ArenaTeamWin = bg->GetArenaTeamIdForTeam(winner);
            ArenaTeamLoose = bg->GetArenaTeamIdForTeam(bg->GetOtherTeam(winner));
        }

        CharacterDatabase.PExecute(SQL_HISTORY, bg->GetMapId(), bg->GetTypeID(), uint32(bg->isArena()), uint32(bg->isRated()), uint32(bg->GetStartTime()/1000), GuildWinId, CountWin, TeamWin.c_str(), GuildLooseId, CountLoose, TeamLoose.c_str(), winner, bg->GetBracketId(), bg->GetMinLevel(), bg->GetMaxLevel(), ArenaTeamWin, ArenaTeamLoose);

        if(!bg->isArena() && (GuildWin || GuildLoose))
        {
            if (GuildWinIs && GuildWin)
            {
                if (GuildLooseIs && GuildLoose)
                    sWorld->SendWorldText(BGHistoryGuildWinLooseText, GuildWin->GetName().c_str(), GuildLoose->GetName().c_str(), damageDonePlayerName.c_str(), healingDonePlayerName.c_str());
                else
                    sWorld->SendWorldText(BGHistoryGuildWinText, GuildWin->GetName().c_str(), damageDonePlayerName.c_str(), healingDonePlayerName.c_str());
            }
            else if (GuildLooseIs && GuildLoose)
                sWorld->SendWorldText(BGHistoryGuildLooseText, GuildLoose->GetName().c_str(), damageDonePlayerName.c_str(), healingDonePlayerName.c_str());
        }
    }
};

void AddSC_Mod_BattlegroundHistory()
{
    new Mod_BattlegroundHistory_WorldScript();
    new Mod_BattlegroundHistory_AllBattlegroundScript();
}