#include "ScriptPCH.h"
#include "Config.h"

#define RANKS_MAX 14

struct ttlForPvP
{
    uint32 hk;
    uint16 tA;
    uint16 tH;
};

ttlForPvP ttl[] = 
{
    {100, 1, 15}, // 0
    {250, 2, 16}, // 1
    {500, 3, 17}, // 2
    {1000, 4, 18}, // 3
    {1500, 5, 19}, // 4
    {2500, 6, 20}, // 5
    {4000, 7, 21}, // 6
    {5555, 8, 22}, // 7
    {7500, 9, 23}, // 8
    {10000, 10, 24}, // 9
    {15000, 11, 25}, // 10
    {20000, 12, 26}, // 11
    {25000, 13, 27}, // 12
    {50000, 14, 28} // 13
};

bool HonorRankEnable        = false;
bool HonorRankCheckKill     = false;
bool HonorRankCheckLogin    = false;
bool HonorRankSetNew        = false;

class Mod_HonorRank_WorldScript : public WorldScript
{
    public:
        Mod_HonorRank_WorldScript()
            : WorldScript("Mod_HonorRank_WorldScript")
        {
        }

    void OnConfigLoad(bool /*reload*/)
    {
        HonorRankEnable         = sConfigMgr->GetBoolDefault("HonorRank.Enable", false);

        if (!HonorRankEnable)
            return;

        HonorRankCheckKill      = sConfigMgr->GetBoolDefault("HonorRank.Check.Kill", false);
        HonorRankCheckLogin     = sConfigMgr->GetBoolDefault("HonorRank.Check.Login", false);
        HonorRankSetNew         = sConfigMgr->GetBoolDefault("HonorRank.SetNew", false);
    }
};

class Mod_HonorRank_PlayerScript : public PlayerScript
{
    public:
        Mod_HonorRank_PlayerScript() : PlayerScript("Mod_HonorRank_PlayerScript") { }

    bool CheckTitleIndex(uint8 i, Player* player)
    {
        if(i >= RANKS_MAX)
            return false;

        if(ttl[i].hk > player->GetUInt32Value(PLAYER_FIELD_LIFETIME_HONORABLE_KILLS))
            return false;

        uint16 tId = player->GetTeam() == ALLIANCE ? ttl[i].tA : ttl[i].tH;

        if(!player->HasTitle(tId))
            if (CharTitlesEntry const* title = sCharTitlesStore.LookupEntry(tId))
            {
                player->SetTitle(title);

                if (HonorRankSetNew)
                    player->SetUInt32Value(PLAYER_CHOSEN_TITLE, tId);
            }

        return true;
    }

    void CheckAllTitle(Player* player)
    {
        for (uint8 i = 0; i < RANKS_MAX; ++i)
            if(!CheckTitleIndex(i, player))
                break;
    }

    void OnPVPKill(Player* killer, Player* /*killed*/)
    {
        if (!HonorRankEnable || !HonorRankCheckLogin)
            return;

        CheckAllTitle(killer);
    }

    void OnLogin(Player* player)
    {
        if (!HonorRankEnable || !HonorRankCheckKill)
            return;

        CheckAllTitle(player);
    }
};

void AddSC_Mod_HonorRank()
{
    new Mod_HonorRank_PlayerScript();
    new Mod_HonorRank_WorldScript();
}