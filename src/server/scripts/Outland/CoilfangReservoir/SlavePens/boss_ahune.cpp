/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "LFGMgr.h"
#include "Group.h"

enum Spells
{
 // Ahune
    SPELL_AHUNES_SHIELD         = 45954,
    SPELL_COLD_SLAP             = 46145,
    SPELL_SUMMON_MINION_VISUAL  = 46103, // Midsummer - Ahune - Summon Minion, Lower
    SPELL_GHOST_VISUAL          = 46786,
    SPELL_ICE_SPIKE             = 50094,

    SPELL_LOOT_CHEST            = 45939,

    SPELL_AHUNE_ACHIEVEMENT     = 62043, // Midsummer - Ahune - DIES, Achievement

    // Coldweave
    SPELL_BITTER_BLAST          = 46406,

    // Frostwind
    SPELL_LIGHTNING_SHIELD      = 12550,
    SPELL_WIND_BUFFET           = 46568,

    // Hailstone
    SPELL_CHILLING_AURA         = 46885, // periodic trigger
    SPELL_PULVERIZE             = 2676,
};

enum NPCs
{
    // Creatures
    NPC_AHUNE = 25740,
    NPC_FROZEN_CORE = 25865,
    NPC_GHOST_OF_AHUNE = 26239,
    NPC_SKARTHIS_SUMMONER = 40446,
    NPC_AHUNITE_HAILSTONE = 25755,
    NPC_AHUNITE_COLDWEAVE  = 25756,
    NPC_AHUNITE_FROSTWIND = 25757
};

enum Events
{
    EVENT_SPIKE             = 1,
    EVENT_SUBMERGE          = 2,
    EVENT_EMERGE            = 3,
    EVENT_SUMMON_HAILSTONE  = 4,
    EVENT_SUMMON_COLDWEAVE  = 5,
    EVENT_SUMMON_FROSTWIND  = 6,
    EVENT_GHOST_VISUAL      = 7,
};

enum Actions
{
    ACTION_START
};
    
enum Phases
{
    PHASE_ONE    = 0,
    PHASE_TWO    = 1,
};

#define GOSSIP_SUMMON "Disturb the Stone and summon Lord Ahune.";
// These positions are guessed, not sniffed.
Position const SummonPositions[4] =
{
        {-97.084167f, -205.559113f, -1.198052f, 1.47574f}, // Ahune / Frozen-Core
        {-96.584648f, -212.704102f, -1.229972f, 1.621793f}, // Hailstone
        {-87.471329f, -212.218582f, -1.284526f, 1.763164f}, // Coldweave #1
        {-102.942009f, -211.860504f, -1.300179f, 1.555034f}, // Coldweave #2
};

class boss_ahune : public CreatureScript
{
public:
    boss_ahune() : CreatureScript("boss_ahune") { }

    struct boss_ahuneAI : public ScriptedAI
    {
        boss_ahuneAI(Creature* creature) : ScriptedAI(creature), summons(me) //{ }
   {
                SetCombatMovement(false);
			 }

        uint64 frozenCoreGUID;

        EventMap events;
        SummonList summons;

        void Reset()
        {
            frozenCoreGUID = 0;
            events.Reset();
            me->SetVisible(false);
            me->SetReactState(REACT_PASSIVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SUBMERGED);
            me->SummonGameObject(187882, -57.1839f, -163.09f, -1.86789f, 0, 0, 0, 0.998636f, 0.0522129f, 0);
        }

        void EnterCombat(Unit* /*who*/)
        {
            DoCast(me, SPELL_AHUNES_SHIELD );
            me->SetVisible(true);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
            me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);
            me->SetReactState(REACT_AGGRESSIVE);
            DoZoneInCombat();

            events.Reset();            
            events.SetPhase(PHASE_ONE);
            events.ScheduleEvent(EVENT_SUBMERGE, 90000, 0, PHASE_ONE);
            events.ScheduleEvent(EVENT_SPIKE, 5000, 0, PHASE_ONE);
            events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 1000, 0, PHASE_ONE);
            events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 1000, 0, PHASE_ONE);
        }

        void JustReachedHome()
        {
            if(Creature* temp = me->GetMap()->GetCreature(frozenCoreGUID))
                temp->DespawnOrUnsummon();

            summons.DespawnAll();
        }

        void JustSummoned(Creature* summoned)
        {
            DoZoneInCombat(summoned);
            summons.Summon(summoned);
        }

        void SummonedCreatureDespawn(Creature* summoned)
        {
            summons.Despawn(summoned);
        }

        
        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START:
                    DoZoneInCombat();
                    break;                    
            }
        }

        void JustDied(Unit* /*killer*/)
        {
            DoCast(me, SPELL_LOOT_CHEST);
            DoCast(me, SPELL_AHUNE_ACHIEVEMENT);

            Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (!players.isEmpty())
				{
                if (Group* group = players.begin()->GetSource()->GetGroup())
                    if (group->isLFGGroup())
                        sLFGMgr->FinishDungeon(group->GetGUID(), 285);
              }
               // sLFGMgr->FinishDungeon(players.begin()->GetSource()->GetGroup()->GetGUID(), 287);
        }

        void UpdateAI(uint32 diff)
        {

            //Return since we have no target
            if (!UpdateVictim())
                return;

            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_SPIKE:
                    if (Unit *target = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true))
                        DoCast(target, SPELL_ICE_SPIKE);
                        events.ScheduleEvent(EVENT_SPIKE, urand(10000, 15000), 0, PHASE_ONE);
                        break;
                    case EVENT_SUBMERGE:
                        events.Reset();
                        events.SetPhase(PHASE_TWO);
                        events.ScheduleEvent(EVENT_EMERGE, 40000, 0, PHASE_TWO);
                        me->AttackStop();
                        me->SetReactState(REACT_PASSIVE);
                        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
                        me->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_SUBMERGED);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);
                        if (Unit* frozenCore = me->SummonCreature(NPC_FROZEN_CORE, SummonPositions[0], TEMPSUMMON_CORPSE_DESPAWN))
                            {
                                frozenCoreGUID = frozenCore->GetGUID();
                                frozenCore->SetHealth(me->GetHealth()); // sync health on phase change
                            }
                        break;
                    case EVENT_EMERGE:
                        if (Creature* frozenCore = me->GetCreature(*me, frozenCoreGUID))
                            me->SetHealth(frozenCore->GetHealth()); // sync health on phase change

                        events.Reset();
                        events.SetPhase(PHASE_ONE);
                        events.ScheduleEvent(EVENT_SUBMERGE, 90000, 0, PHASE_ONE);
                        events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 5000, 0, PHASE_ONE);
                        events.ScheduleEvent(EVENT_SUMMON_FROSTWIND, 5000, 0, PHASE_ONE);
                        events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 5000, 0, PHASE_ONE);
                        me->SetReactState(REACT_AGGRESSIVE);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_IMMUNE_TO_PC);
                        me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                        me->HandleEmoteCommand(EMOTE_ONESHOT_EMERGE);

                        // despawn core
                        if (Creature* frozenCore = me->GetCreature(*me, frozenCoreGUID))
                            frozenCore->DespawnOrUnsummon(0);
                        break;
                    case EVENT_SUMMON_HAILSTONE:
                        me->SummonCreature(NPC_AHUNITE_HAILSTONE, SummonPositions[1], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                        events.ScheduleEvent(EVENT_SUMMON_HAILSTONE, 20000, 0, PHASE_ONE);
                        break;
                    case EVENT_SUMMON_COLDWEAVE: // they always come in pairs of two
                        me->CastSpell(SummonPositions[2].GetPositionX(), SummonPositions[2].GetPositionY(), SummonPositions[2].GetPositionZ(), SPELL_SUMMON_MINION_VISUAL, false);
                        me->SummonCreature(NPC_AHUNITE_COLDWEAVE, SummonPositions[2], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                        me->CastSpell(SummonPositions[3].GetPositionX(), SummonPositions[3].GetPositionY(), SummonPositions[3].GetPositionZ(), SPELL_SUMMON_MINION_VISUAL, false);
                        me->SummonCreature(NPC_AHUNITE_COLDWEAVE, SummonPositions[3], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                        events.ScheduleEvent(EVENT_SUMMON_COLDWEAVE, 10000, 0, PHASE_ONE);
                        break;
                    case EVENT_SUMMON_FROSTWIND: // not in first phase 1
                        me->SummonCreature(NPC_AHUNITE_FROSTWIND, SummonPositions[urand(2,3)], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 3000);
                        events.ScheduleEvent(EVENT_SUMMON_FROSTWIND, 10000, 0, PHASE_ONE);
                        break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new  boss_ahuneAI(creature);
    }

};
class npc_frozen_core : public CreatureScript
{
    public:
        npc_frozen_core() : CreatureScript("npc_frozen_core") { }

        struct npc_frozen_coreAI : public ScriptedAI
        {
            npc_frozen_coreAI (Creature* creature) : ScriptedAI(creature) {  }

             EventMap events;

            void Reset()
            {
            events.Reset();

                events.ScheduleEvent(EVENT_GHOST_VISUAL, 6000); // every 6 seconds Ghost Visual

                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK_DEST, true);
            }

            void JustDied(Unit* killer)
            {
                if (me->IsSummon())
                    if (Unit* owner = me->ToTempSummon()->GetSummoner())
                        if (owner && owner->IsAlive())
                            killer->Kill(owner);
            }
        
            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);
                
                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_GHOST_VISUAL:
                            if (TempSummon* ghost = me->GetMap()->SummonCreature(NPC_GHOST_OF_AHUNE, SummonPositions[0], NULL, 1300))
                            {
                                ghost->SetFacingTo(1.511675f);
                                ghost->CastSpell(ghost, SPELL_GHOST_VISUAL, false);
                            }

                            events.ScheduleEvent(EVENT_GHOST_VISUAL, 6000);
                            break;
                    }
                }
            }
        };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new  npc_frozen_coreAI(creature);
    }
};

/*#############
# ahune's adds
##############*/

class npc_ahunite_hailstone : public CreatureScript
{
public:
    npc_ahunite_hailstone() : CreatureScript("npc_ahunite_hailstone") { }

    struct npc_ahunite_hailstoneAI  : public ScriptedAI
    {
        npc_ahunite_hailstoneAI (Creature* creature) : ScriptedAI(creature)
        {
            Reset();
        }

        uint32 uiChillTimer;
        uint32 uiPulverizeTimer;

        void Reset()
        {
            DoCast(me, SPELL_CHILLING_AURA);
            uiPulverizeTimer = 7000;
            uiChillTimer = 5000;
        }

        void UpdateAI(uint32 uiDiff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if(uiChillTimer < uiDiff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM,0))
                    DoCast(target, SPELL_CHILLING_AURA);
                uiChillTimer = 5000;
            }
            else uiChillTimer -= uiDiff;

            if(uiPulverizeTimer < uiDiff)
            {
                DoCastVictim(SPELL_PULVERIZE);
                uiPulverizeTimer = 10000;
            }
            else uiPulverizeTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new  npc_ahunite_hailstoneAI(creature);
    }
};

class npc_ahunite_coldwave : public CreatureScript
{
public:
    npc_ahunite_coldwave() : CreatureScript("npc_ahunite_coldwave") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new  npc_ahunite_coldwaveAI(creature);
    }

    struct npc_ahunite_coldwaveAI : public ScriptedAI
    {
        npc_ahunite_coldwaveAI (Creature* creature) : ScriptedAI(creature)
        {
            Reset();
        }

        uint32 uiBlastTimer;

        void Reset()
        {
            uiBlastTimer = 5000;
        }

        void UpdateAI(uint32 uiDiff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if(uiBlastTimer < uiDiff)
            {
                DoCastVictim(SPELL_BITTER_BLAST);
                uiBlastTimer = urand(4000, 7000);
            }
            else uiBlastTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };
};

class npc_ahunite_frostwind : public CreatureScript
{
public:
    npc_ahunite_frostwind() : CreatureScript("npc_ahunite_frostwind") { }

    struct npc_ahunite_frostwindAI : public ScriptedAI
    {
        npc_ahunite_frostwindAI (Creature* creature) : ScriptedAI(creature)
        {
            Reset();
        }

        uint32 uiBuffedTimer;

        void Reset()
        {
            DoCast(me, SPELL_LIGHTNING_SHIELD);
            uiBuffedTimer = 6000;
        }

        void UpdateAI(uint32 uiDiff)
        {

            if(uiBuffedTimer < uiDiff)
            {
                DoCastVictim(SPELL_WIND_BUFFET);
                uiBuffedTimer = 6000;
            }
            else uiBuffedTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new  npc_ahunite_frostwindAI(creature);
    }
};

/*######################
# go_ice_stone_midsummer
########################*/
class go_ice_stone_midsummer : public GameObjectScript
{
public:
    go_ice_stone_midsummer() : GameObjectScript("go_ice_stone_midsummer") { }

    bool OnGossipHello(Player* player, GameObject* go)
    {
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Disturb the Stone and summon Lord Ahune.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, go->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, GameObject* go, uint32 /*sender*/, uint32 action)
    {
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF:
                if (Unit* ahune = go->GetOwner())
                {
                    player->CLOSE_GOSSIP_MENU();
                    ahune->ToCreature()->AI()->DoAction(ACTION_START);
                    go->Delete();
                }
                break;
        }
        
        return true;
    }
};

void AddSC_boss_ahune()
{
    new boss_ahune();
    new npc_frozen_core();
    new npc_ahunite_hailstone();
    new npc_ahunite_coldwave();
    new npc_ahunite_frostwind();
    new go_ice_stone_midsummer();
}
