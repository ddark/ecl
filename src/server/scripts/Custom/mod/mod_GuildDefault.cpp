#include "ScriptMgr.h"
#include "Config.h"
#include "Guild.h"
#include "GuildMgr.h"

class Mod_GuildDefault_PlayerScript : public PlayerScript
{
    public:
        Mod_GuildDefault_PlayerScript() : PlayerScript("gon_playerscripts") { }

   void OnLogin(Player* player, bool firstLogin)
    {
        if (firstLogin)
        {
            uint32 GUILD_ID_ALLIANCE = sConfigMgr->GetIntDefault("GuildDefault.IDA", 0);
            uint32 GUILD_ID_HORDE = sConfigMgr->GetIntDefault("GuildDefault.IDH", 0);
            Guild* guild = sGuildMgr->GetGuildById(player->GetTeam() == ALLIANCE ? GUILD_ID_ALLIANCE : GUILD_ID_HORDE);

            if (guild)
                guild->AddMember(player->GetGUID());
        }
    }
};


void AddSC_Mod_GuildDefault()
{
    //new Mod_GuildDefault_WorldScript();
    new Mod_GuildDefault_PlayerScript();
}
