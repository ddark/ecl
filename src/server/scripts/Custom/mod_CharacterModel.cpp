#include "ScriptPCH.h"
#include "Config.h"

#define SQL_INFO "SELECT `model_id`, `size` FROM `character_model` WHERE `guid` = '%u'"

bool CharacterModelEnable   = false;

class mod_CharacterModel_WorldScript : public WorldScript
{
    public:
        mod_CharacterModel_WorldScript() : WorldScript("mod_CharacterModel_WorldScript") { }

    // Called after the world configuration is (re)loaded.
    void OnConfigLoad(bool /*reload*/)
    {
        CharacterModelEnable    = ConfigMgr::GetBoolDefault("CharacterModel.Enable", false);
    }
};

class mod_CharacterModel_PlayerScript : public PlayerScript
{
    public:
        mod_CharacterModel_PlayerScript() : PlayerScript("mod_CharacterModel_PlayerScript") { }

    // Called when a player logs in.
    void OnLogin(Player* player)
    {
        if (!CharacterModelEnable)
            return;

        QueryResult result = CharacterDatabase.PQuery(SQL_INFO, player->GetGUIDLow());
        if (!result)
            return;
            
        player->SetNativeDisplayId((*result)[0].GetUInt32());
        player->SetObjectScale((*result)[1].GetFloat());
        player->SetDisplayId(player->GetNativeDisplayId());
    }
};

void AddSC_Mod_CharacterModel()
{
    new mod_CharacterModel_WorldScript();
    new mod_CharacterModel_PlayerScript();
}