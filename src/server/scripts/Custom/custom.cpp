#include "ScriptPCH.h"

/* This is where custom scripts' loading functions should be declared. */
 //Bots
//Bots
void AddSC_druid_bot();
void AddSC_hunter_bot();
void AddSC_mage_bot();
void AddSC_paladin_bot();
void AddSC_priest_bot();
void AddSC_rogue_bot();
void AddSC_shaman_bot();
void AddSC_warlock_bot();
void AddSC_warrior_bot();
void AddSC_script_bot_commands();
void AddSC_NPC_Transmogrify();
// Custom
void AddSC_npc_hunterpetvendor();
// Custom mods: START
void AddSC_Mod_ArenaWatcher(); // by FrozenSouL (version by Codels)
void AddSC_Mod_AuctionHouseBot(); // by Codels
void AddSC_Mod_AutoLearn(); // by Codels
void AddSC_Mod_BattlegroundHistory(); // by Codels
void AddSC_Mod_BossHistory(); // by Codels
void AddSC_Mod_CharacterHistory(); // by Codels
void AddSC_Mod_CharacterModel(); // by Codels
void AddSC_Mod_CustomRewardPvP(); // by Codels
void AddSC_mod_DefaultSpec(); // by Codels
void AddSC_Mod_DynamicInstance(); // by Codels
void AddSC_Mod_DynamicRate(); // by Codels
void AddSC_Mod_ExternalMail(); // by ???
void AddSC_Mod_Tournaments(); // by Codels
void AddSC_Mod_GuildDefault(); // by s@m
void AddSC_Mod_HonorRank(); // by Codels
void AddSC_Mod_ItemUpgrade(); // by Codels
void AddSC_Mod_MailHistory(); // by Codels
void AddSC_Mod_Multikill(); // by Codels
void AddSC_Mod_SpecialCode(); // by Codels
void AddSC_npc_buffer(); // by Dimon
void AddSC_event_npc(); // by Dimon
void AddSC_Npc_Buff(); // by Dimon
void AddSC_npc_arena_setup(); // by Dimon
void AddSC_System_Censure(); // by Dimon
void AddSC_npcs_mini_boss(); // by Dimon
void AddSC_npc_morph(); // by Dimon
void AddSC_buffcommand(); // by Dimon
void AddSC_npc_change();// by saqirmdev
void AddSC_boss_pvpchalenge(); // by Dimon
void AddSC_GuildHouse();
void AddSC_npc_gurubashi_theme();
// Fake Players
void AddSC_fake_commandscript();
void AddSC_cs_world_chat();
void AddSC_npc_enchant();
void AddSC_icc_rep_rings();
// Fast Arena Start
void AddSC_NPC_TransmogDisplayVendor();
void AddSC_fast_arena_start();
void AddSC_mr_spell(); // by Dimon
void AddSC_Mod_LexicsCutter(); // by ???
// Custom mods: END
//TeleNPC2
void AddSC_npc_teleport();
// Custom
void AddSC_npc_all();
void AddSC_vip_commandscript();

/* This is where custom scripts should be added. */
void AddSC_custom()
{
	AddSC_Mod_ArenaWatcher();
	AddSC_Mod_AuctionHouseBot();
	AddSC_Mod_AutoLearn();
	AddSC_Mod_BattlegroundHistory();
	AddSC_Mod_BossHistory();
	AddSC_Mod_CharacterHistory();
	AddSC_Mod_CharacterModel();
	AddSC_Mod_CustomRewardPvP();
	AddSC_mod_DefaultSpec();
	AddSC_Mod_DynamicInstance();
	AddSC_Mod_DynamicRate();
	AddSC_Mod_ExternalMail();
	AddSC_Mod_Tournaments();
	AddSC_Mod_GuildDefault();
	AddSC_Mod_HonorRank();
	AddSC_Mod_ItemUpgrade();
	AddSC_Mod_MailHistory();
	AddSC_Mod_Multikill();
	AddSC_Mod_SpecialCode();
	AddSC_npc_hunterpetvendor();
	AddSC_npc_teleport();
	AddSC_npc_buffer();
	AddSC_Npc_Buff();
	AddSC_event_npc();
	AddSC_npc_arena_setup();
	AddSC_buffcommand();
	AddSC_mr_spell();
	AddSC_boss_pvpchalenge();
	AddSC_System_Censure();
	AddSC_npcs_mini_boss();
	AddSC_npc_morph();
	AddSC_npc_enchant();
	AddSC_icc_rep_rings();
	//Bots
	AddSC_druid_bot();
	AddSC_hunter_bot();
	AddSC_mage_bot();
	AddSC_paladin_bot();
	AddSC_priest_bot();
	AddSC_rogue_bot();
	AddSC_shaman_bot();
	AddSC_warlock_bot();
	AddSC_warrior_bot();
	AddSC_script_bot_commands();
	// Fake Players
	AddSC_fake_commandscript();
	AddSC_GuildHouse();
	AddSC_npc_gurubashi_theme();
	AddSC_npc_change();
	AddSC_NPC_TransmogDisplayVendor();
	// Fast Arena Start
	AddSC_npc_all();
	AddSC_fast_arena_start();
	AddSC_cs_world_chat();
	AddSC_Mod_LexicsCutter();
	AddSC_NPC_Transmogrify();
	AddSC_vip_commandscript();
}
