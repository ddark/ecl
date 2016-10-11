/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Log.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
// This is where scripts' loading functions should be declared:
void AddSC_GMIsland_Theminator();
void AddSC_Mod_CustomRewardPvP();
void AddSC_Transmogrification();
void AddSC_Mod_GuildDefault();
void AddSC_Mod_Multikill();
void AddSC_Mod_BossHistory();
// The name of this function should match:
// void Add${NameOfDirectory}Scripts()
void AddSC_npc_1v1arena();
void AddSC_mod_DefaultSpec(); // by Codels
void AddSC_Mod_Tournaments(); // by Codels
void AddSC_Mod_AutoLearn();
void AddSC_npc_hunterpetvendor();
void AddSC_Resets();
void AddSC_guildmaster();
void AddSC_premium_commandscript();
void AddSC_event_npc();
//void AddSC_Boss_Announcer();
void AddSC_boss_two();
void AddSC_orrig();
void AddSC_lighthardmode();
//void AddSC_npc_teleport();
void AddSC_Mod_ItemUpgrade();
void AddSC_Mod_DynamicRate();
void AddSC_npc_teleport();
void AddSC_NPC_TransmogDisplayVendor();

void AddCustomScripts()
{
	AddSC_NPC_TransmogDisplayVendor();
	//AddSC_Boss_Announcer();
	AddSC_Mod_AutoLearn();
	AddSC_Mod_Tournaments();
	AddSC_mod_DefaultSpec();
	AddSC_npc_hunterpetvendor();
	AddSC_Resets();
	AddSC_guildmaster();
	AddSC_premium_commandscript();
	AddSC_event_npc();
	AddSC_npc_1v1arena();
    AddSC_Transmogrification();
    AddSC_boss_two();
    AddSC_orrig();
    AddSC_lighthardmode();
    //AddSC_npc_teleport();
	AddSC_Mod_Multikill();
	AddSC_Mod_BossHistory();
	AddSC_Mod_GuildDefault();
	AddSC_Mod_ItemUpgrade();
	AddSC_Mod_DynamicRate();
	AddSC_Mod_CustomRewardPvP();
	AddSC_GMIsland_Theminator();
    AddSC_npc_teleport();
}
