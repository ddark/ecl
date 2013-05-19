#include "ScriptPCH.h"
#include "Config.h"
#include "Guild.h"
#include "GuildMgr.h"

bool GuildDefaultEnable = false;
uint32 GuildDefaultId = 0;
uint32 GuildDefaultRank = 0;

class Mod_GuildDefault_WorldScript : public WorldScript
{
    public:
        Mod_GuildDefault_WorldScript() : WorldScript("Mod_GuildDefault_WorldScript") { }

    void OnConfigLoad(bool /*reload*/)
    {
        GuildDefaultEnable  = ConfigMgr::GetBoolDefault("GuildDefault.Enable", false);
        GuildDefaultId      = ConfigMgr::GetIntDefault("GuildDefault.ID", 0);
        GuildDefaultRank    = ConfigMgr::GetIntDefault("GuildDefault.Rank", 0);
    }
};

class Mod_GuildDefault_PlayerScript : public PlayerScript
{
    public:
        Mod_GuildDefault_PlayerScript() : PlayerScript("Mod_GuildDefault_PlayerScript") { }

    // Called when a player is created.
    void OnCreate(Player* player)
    {
        if (!GuildDefaultEnable || GuildDefaultId == 0)
            return;

        Guild* guild = sGuildMgr->GetGuildById(GuildDefaultId);

        if (!guild)
            return;

        guild->AddMember(player->GetGUID());
        
        if (GuildDefaultRank == 0)
            return;
            
        guild->ChangeMemberRank(player->GetGUID(), GuildDefaultRank);
    }
};

void AddSC_Mod_GuildDefault()
{
    new Mod_GuildDefault_WorldScript();
    new Mod_GuildDefault_PlayerScript();
}