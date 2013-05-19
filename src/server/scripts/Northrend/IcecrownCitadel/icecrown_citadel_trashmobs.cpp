/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2009-2011 Eilo <https://github.com/eilo>
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

// Recopilaciones de varias fuentes
// Adiciones y modificaciones por Eilo
// Script final por Eilo

#include "ScriptPCH.h"
 
enum Spells
{
/*-----Trash de Martillo de la Luz-----*/
    //## Ancient Skeletal Soldier ##
    SPELL_SHIELD_BASH             = 70964,

    //## Deathbound Ward ##
    SPELL_SABER_LASH              = 71021,
    SPELL_DISRUPTING_SHOUT        = 71022,

    //## Nerubar Broodkeeper ##
    SPELL_CRYPT_SCARABS           = 70965,
    SPELL_DARK_MENDING            = 71020,
    SPELL_WEB_WRAP                = 70980,

    //## Servant of the Throne ##
    SPELL_GLACIAL_BLAST           = 71029,
/*
    //## The Damned ##
    SPELL_BONE_FLURRY             = 70960,
    SPELL_SHATTERED_BONES         = 70961,
    SPELL_SHATTERED_BONES_VISUAL  = 70963,
*/
/*--Trash de Oratorio de los Malditos--*/
    // ## Deathspeaker Servant ##
    SPELL_CHAOS_BOLT_10M          = 69576,    
    SPELL_CHAOS_BOLT_25M          = 71108,
    SPELL_CONSUMING_SHADOWS       = 69405,
    SPELL_CURSE_OF_AGONY_10M      = 69404,
    SPELL_CURSE_OF_AGONY_25M      = 71112,

    // ## Deathspeaker Disciple ##
    SPELL_SHADOW_BOLT_DEATHSPEAKER= 69387, //tambien la usa deathspeaker attendant   
    SPELL_DARK_BLESSING           = 69391,
    SPELL_SHADOW_MEND_10M         = 69389,
    SPELL_SHADOW_MEND_25M         = 71107,

    //## Deathspeaker Attendant ##
    SPELL_SHADOW_NOVA_10M         = 69355,
    SPELL_SHADOW_NOVA_25M         = 71106,

    //## Deathspeaker Zealot ##
    SPELL_SHADOW_CLEAVE           = 69492,

    //## Deathspeaker High Priest ##
    SPELL_DARK_RECKONING          = 69483,
    SPELL_AURA_OF_DARKNESS        = 69491,

/*---------Trash de La Espiral---------*/
	//## Valkyr Herald ##
    SPELL_SEVERED_ESSENCE_10M     = 71906,
    SPELL_SEVERED_ESSENCE_25M     = 71942,

/*----Trash de Talleres de la Peste----*/
    //## Blighted Abomination ##
    SPELL_CLEAVE                  = 40504,
    SPELL_PLAGUE_CLOUD            = 71150,
    SPELL_SCOURGE_HOOK            = 71140,

    //## Vengeful Fleshreaper ##
    SPELL_LEAPING_FACE_MAUL       = 71164,
    SPELL_DEVOUR_HUMANOID         = 71164,

    //## Plague Scientist ##
    SPELL_PLAGUE_BLAST            = 73079,
    SPELL_PLAGUE_STREAM           = 69871,
    SPELL_COMBOBULATING_SPRAY     = 71103,

    //## Pustulating Horror ##
    SPELL_BLIGHT_BOMB             = 71088,
    SPELL_BUBBLING_PUS_10M        = 71089,
    SPELL_BUBBLING_PUS_25M        = 71090,

    //## Decaying Colossus ##
    SPELL_MASSIVE_STOMP_10M       = 71114,
    SPELL_MASSIVE_STOMP_25M       = 71115,

/*--------Trash de Salas Carmesi--------*/
    //## Darkfallen Archmage ##
    SPELL_AMPLIFY_MAGIC_10M       = 70408,
    SPELL_AMPLIFY_MAGIC_25M       = 72336,
    SPELL_BLAST_WAVE_10M          = 70407,
    SPELL_BLAST_WAVE_25M          = 71151,
    SPELL_FIREBALL_10M            = 70409,
    SPELL_FIREBALL_25M            = 71153,
    SPELL_POLYMORPH_SPIDER        = 70410,
    //esta spell hay que ver como se usa y su interaccion con el orbe
    SPELL_SIPHON_ESSENCE          = 70299, //tambien la usa Darkfallen Blood Knight y Darkfallen Noble

    //## Darkfallen Blood Knight ##
    SPELL_VAMPIRIC_AURA           = 71736,
    SPELL_UNHOLY_STRIKE           = 70437, //tambien la usa el Darkfallen Tactician
    SPELL_BLOOD_MIRROR_DAMAGE     = 70445,
    SPELL_BLOOD_MIRROR_BUFF       = 70451,
    SPELL_BLOOD_MIRROR_DUMMY      = 70450,

    //## Darkfallen Noble ##
    SPELL_CHAINS_OF_SHADOW        = 70645,
    SPELL_SHADOW_BOLT_10M         = 72960,
    SPELL_SHADOW_BOLT_25M         = 72961,

    //## Npc Vampiric Fiend ##
    SPELL_DISEASE_CLOUD           = 41290,
    SPELL_LEECHING_ROT            = 70671,

    //## Darkfallen Advisor ##
    SPELL_LICH_SLAP_10M           = 72057,
    SPELL_LICH_SLAP_25M           = 72421,
    SPELL_SHROUD_OF_PROTECTION    = 72065,
    SPELL_SHROUD_OF_SPELL_WARDING = 72066,

    //## Darkfallen Commander ##
    SPELL_VAMPIRE_RUSH_10M        = 70449,
    SPELL_VAMPIRE_RUSH_25M        = 71155,
    SPELL_BATTLE_SHOUT            = 70750,

    //## Darkfallen Lieutenant ##
    SPELL_VAMPIRIC_CURSE          = 70423,
    SPELL_REND_FLESH_10M          = 70435,
    SPELL_REND_FLESH_25M          = 71154,

    //## Darkfallen Tactician ##
    SPELL_SHADOWSTEP              = 70431,
    SPELL_BLOOD_SAP               = 70432,

/*---Trash de Camaras de Alaescarcha---*/
    //## Ymirjar Deathbringer ##
    SPELL_BANISH                  = 71298,
    SPELL_DEATHS_EMBRACE_10M      = 71299,
    SPELL_DEATHS_EMBRACE_25M      = 71300,
    SPELL_SHADOW_BOLT_YMIRJAR_10M = 71296,
    SPELL_SHADOW_BOLT_YMIRJAR_25M = 71297,
    SPELL_SUMMON_YMIRJAR          = 71303,

    //## Ymirjar Frostbinder ##
    SPELL_ARCTIC_CHILL            = 71270,
    SPELL_FROZEN_ORB              = 71274,
    SPELL_TWISTED_WINDS           = 71306,
    SPELL_SPIRIT_STREAM           = 69929, // tambien la usa Ymirjar Deathbringer

    //## Ymirjar Battle-Maiden ##
    SPELL_ADRENALINE_RUSH         = 71258,
    SPELL_BARBARIC_STRIKE         = 71257,

    //## Ymirjar Huntress ##
    SPELL_ICE_TRAP                = 71249,
    SPELL_RAPID_SHOT              = 71251,
    SPELL_SHOOT                   = 71253,
    SPELL_VOLLEY                  = 71252,
    SPELL_SUMMON_WARHAWK          = 71705,
/*
    //## Ymirjar Warlord ##
    SPELL_WHIRLWIND               = 41056,
*/
    // Npc Empowering Orb Visual Stalker
    // aun sin datos adicionales de este npc

/* esta spell tienen todos los npcs para credito de
muerte con la cadena de quest de la shadowmourne */
    SPELL_SOUL_FEAST_ALL          = 71203
};

enum npcs
{
/*-----Trash de Martillo de la Luz-----*/
    NPC_DEATHBOUND_WARD          = 37007,
    NPC_SERVANT_OF_THE_THRONE    = 36724,
    NPC_ANCIENT_SKELETAL_SOLDIER = 37012,
    // NPC_THE_DAMNED               = 37011,
    NPC_NERUBAR_BROODKEEPER      = 36725,
/*--Trash de Oratorio de los Malditos--*/
    NPC_DEATHSPEAKER_SERVANT     = 36805,
    NPC_DEATHSPEAKER_ZEALOT      = 36808,
    NPC_DEATHSPEAKER_DISCIPLE    = 36807,
    NPC_DEATHSPEAKER_ATTENDANT   = 36811,
    NPC_DEATHSPEAKER_HIGH_PRIEST = 36829,
/*---------Trash de La Espiral---------*/
    NPC_VALKYR_HERALD            = 37098,
/*----Trash de Talleres de la Peste----*/
    NPC_BLIGHTED_ABOMINATION     = 37022,
    NPC_VENGEFUL_FLESHREAPER     = 37038,
    NPC_PUSTULATING_HORROR       = 10404,
    NPC_PLAGUE_SCIENTIST         = 37023,
    NPC_DECAYING_COLOSSUS        = 36880,
/*--------Trash de Salas Carmesi--------*/
    NPC_DARKFALLEN_ARCHMAGE      = 37664,
    NPC_DARKFALLEN_BLOOD_KNIGHT  = 37595,
    NPC_DARKFALLEN_NOBLE         = 37663,
    NPC_VAMPIRIC_FIEND           = 37901,
    NPC_DARKFALLEN_ADVISOR       = 37571,
    NPC_DARKFALLEN_COMMANDER     = 37662,
    NPC_DARKFALLEN_TACTICIAN     = 37666,
    NPC_DARKFALLEN_LIEUTENANT    = 37665,
/*---Trash de Camaras de Alaescarcha---*/
    NPC_YMIRJAR_DEATHBRINGER     = 38125,
    NPC_YMIRJAR_FROSTBINDER      = 37127,
    NPC_YMIRJAR_BATTLE_MAIDEN    = 37132,
    NPC_YMIRJAR_HUNTRESS         = 37134,
    // NPC_YMIRJAR_WARLORD          = 37133

    //Empowering Orb Visual Stalker 38463
};

//#########  Ancient Skeletal Soldier ##############
class npc_ancient_skeletal_soldier_icc : public CreatureScript
{
    public:
        npc_ancient_skeletal_soldier_icc() : CreatureScript("npc_ancient_skeletal_soldier_icc") { }
 
        struct npc_ancient_skeletal_soldier_iccAI : public ScriptedAI
        {
            npc_ancient_skeletal_soldier_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBASH_Timer;

            void Reset()
            {
                m_uiBASH_Timer = 5000; //inicia en 5 segundos
            }
 
            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
            if (!UpdateVictim())
                return;
 
            if (m_uiBASH_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SHIELD_BASH);
                //repite cada 10 segundos
                m_uiBASH_Timer = 10000;
            }
            else
               m_uiBASH_Timer -= uiDiff;
 
            DoMeleeAttackIfReady();
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ancient_skeletal_soldier_iccAI(creature);
        }
};

//#########  Deathbound Ward ##############
class npc_deathbound_ward_icc : public CreatureScript
{
    public:
        npc_deathbound_ward_icc() : CreatureScript("npc_deathbound_ward_icc") { }
 
        struct npc_deathbound_ward_iccAI : public ScriptedAI
        {
            npc_deathbound_ward_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiDisrupting_Shout_Timer;
            uint32 m_uiSaber_Lash_Timer;

            void Reset()
            {
                m_uiDisrupting_Shout_Timer = 10000; //resetea en 10
                m_uiSaber_Lash_Timer = 7000;
            }
 
            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiDisrupting_Shout_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_DISRUPTING_SHOUT);
                    //cada 15 segundos interrumpe a todo el mundo en rango
                    m_uiDisrupting_Shout_Timer = 15000;
                }
                else
                    m_uiDisrupting_Shout_Timer -= uiDiff;

                if (m_uiSaber_Lash_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SABER_LASH);
                    //cada 7 segundos al tanke
                    m_uiSaber_Lash_Timer = 7000;
                }
                else
                    m_uiSaber_Lash_Timer -= uiDiff;
        
                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathbound_ward_iccAI(creature);
        }
};

//#########  Nerubar Broodkeeper ##############
class npc_nerubar_broodkeeper_icc : public CreatureScript
{
    public:
        npc_nerubar_broodkeeper_icc() : CreatureScript("npc_nerubar_broodkeeper_icc") { }
 
        struct npc_nerubar_broodkeeper_iccAI : public ScriptedAI
        {
            npc_nerubar_broodkeeper_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiSCARABS_Timer;
            uint32 m_uiMENDING_Timer;
            uint32 m_uiWRAPS_Timer;

            void Reset()
            {
                m_uiSCARABS_Timer = 1000; //inicia en 1 segundo
                m_uiMENDING_Timer = urand(5000, 8000); //entre 5 a 8 segs
                m_uiWRAPS_Timer = urand(5000, 8000); //entre 5 a 8 segs
            }
 
            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
            if (!UpdateVictim())
                return;
 
            if (m_uiWRAPS_Timer <= uiDiff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                           DoCast(target, SPELL_WEB_WRAP);
                //repite entre 5 u 8 segundos
                m_uiWRAPS_Timer = urand(5000, 8000);
            }
            else
               m_uiWRAPS_Timer -= uiDiff;
  
            if (m_uiMENDING_Timer <= uiDiff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                           DoCast(target, SPELL_DARK_MENDING);
                //repite entre 5 u 8 segundos
                m_uiMENDING_Timer = urand(5000, 8000);
            }
            else
               m_uiMENDING_Timer -= uiDiff;

            if (m_uiSCARABS_Timer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_CRYPT_SCARABS);
                //cada 2 segundos
                m_uiSCARABS_Timer = 2000;
            }
            else
               m_uiSCARABS_Timer -= uiDiff;
 
            DoMeleeAttackIfReady();
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_nerubar_broodkeeper_iccAI(creature);
        }
};

//#########  Servant of the Throne ##############
class npc_servant_of_the_throne_icc : public CreatureScript
{
    public:
        npc_servant_of_the_throne_icc() : CreatureScript("npc_servant_of_the_throne_icc") { }

        struct npc_servant_of_the_throne_iccAI : public ScriptedAI
        {
            npc_servant_of_the_throne_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiGlacial_Blast_Timer;

            void Reset()
            {
                m_uiGlacial_Blast_Timer = 1000; //inicia pegando practicamente       
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiGlacial_Blast_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                           DoCast(target, SPELL_GLACIAL_BLAST);
                    //cada 6 segundos
                    m_uiGlacial_Blast_Timer = 6000;
                }
                else
                   m_uiGlacial_Blast_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_servant_of_the_throne_iccAI(creature);
        }
};
/*
//#########  The Damned ##############
class npc_the_damned_icc : public CreatureScript
{
    public:
        npc_the_damned_icc() : CreatureScript("npc_the_damned_icc") { }

        struct npc_the_damned_iccAI : public ScriptedAI
        {
            npc_the_damned_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
        
            uint32 m_uiBone_Flurry_Timer;

            void Reset()
            {
                m_uiBone_Flurry_Timer = 20000;    
            }

            void JustDied(Unit * killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
                DoCastAOE(SPELL_SHATTERED_BONES);
		        DoCast(me, SPELL_SHATTERED_BONES_VISUAL);
                DoCast(me, SPELL_SHATTERED_BONES_VISUAL);
                DoCast(me, SPELL_SHATTERED_BONES_VISUAL);
                DoCast(me, SPELL_SHATTERED_BONES_VISUAL);
            }

            void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBone_Flurry_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_BONE_FLURRY);
                    //repite entre 20 a 30 segundos
                    m_uiBone_Flurry_Timer = urand(20000, 30000);
                }
                else
                    m_uiBone_Flurry_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_the_damned_iccAI(creature);
        }
};
*/
//#########  Deathspeaker Servant 10 man ##############
class npc_deathspeaker_servant_10man_icc : public CreatureScript
{
    public:
        npc_deathspeaker_servant_10man_icc() : CreatureScript("npc_deathspeaker_servant_10man_icc") { }

        struct npc_deathspeaker_servant_10man_iccAI : public ScriptedAI
        {
            npc_deathspeaker_servant_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiCHAOS_Timer;
            uint32 m_uiCONSUMING_Timer;
            uint32 m_uiCURSE_Timer;

            void Reset()
            {
                m_uiCHAOS_Timer = 2000;
                m_uiCONSUMING_Timer = urand(3000, 5000); //iniciando rapidamente
                m_uiCURSE_Timer = urand(3000, 5000); //iniciando rapidamente
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiCHAOS_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_CHAOS_BOLT_10M);
                    //repite entre 3 a 4 segundos para darle holgura
                    m_uiCHAOS_Timer = urand(3000, 4000);
                }
                else
                    m_uiCHAOS_Timer -= uiDiff;

                if (m_uiCONSUMING_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                            DoCast(target, SPELL_CONSUMING_SHADOWS);
                    //repite entre 8 a 15 segs
                    m_uiCONSUMING_Timer = urand(8000, 15000);
                }
                else
                    m_uiCONSUMING_Timer -= uiDiff;

                if (m_uiCURSE_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_CURSE_OF_AGONY_10M);
         
                    m_uiCURSE_Timer = urand(15000, 20000);
                }
                else
                    m_uiCURSE_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_servant_10man_iccAI(creature);
        }
};

//#########  Deathspeaker Servant 25 man ##############
class npc_deathspeaker_servant_25man_icc : public CreatureScript
{
    public:
        npc_deathspeaker_servant_25man_icc() : CreatureScript("npc_deathspeaker_servant_25man_icc") { }

        struct npc_deathspeaker_servant_25man_iccAI : public ScriptedAI
        {
            npc_deathspeaker_servant_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiCHAOS_Timer;
            uint32 m_uiCONSUMING_Timer;
            uint32 m_uiCURSE_Timer;

            void Reset()
            {
                m_uiCHAOS_Timer = 2000;
                m_uiCONSUMING_Timer = urand(2000, 3000); //iniciando rapido
                m_uiCURSE_Timer = urand(2000, 3000); //iniciando rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiCHAOS_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_CHAOS_BOLT_25M);
                    //entre 4 a 6 segs
                    m_uiCHAOS_Timer = (4000, 6000);
                }
                else
                    m_uiCHAOS_Timer -= uiDiff;

                if (m_uiCONSUMING_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_CONSUMING_SHADOWS);
                    //entre 6 a 10 segundos, es 25man eh
                    m_uiCONSUMING_Timer = urand(6000, 10000);
                }
                else
                    m_uiCONSUMING_Timer -= uiDiff;

                if (m_uiCURSE_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_CURSE_OF_AGONY_25M);
                    //repite entre 10 a 15 segs
                    m_uiCURSE_Timer = urand(10000, 15500);
                }
                else
                    m_uiCURSE_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_servant_25man_iccAI(creature);
        }
};

//#########  Deathspeaker Disciple 10 man ##############
class npc_deathspeaker_disciple_10man_icc : public CreatureScript
{
    public:
        npc_deathspeaker_disciple_10man_icc() : CreatureScript("npc_deathspeaker_disciple_10man_icc") { }

        struct npc_deathspeaker_disciple_10man_iccAI : public ScriptedAI
        {
            npc_deathspeaker_disciple_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}
 
            uint32 m_uiBOLT_Timer;
            uint32 m_uiBLESSING_Timer;
            uint32 m_uiMEND_Timer;

            void Reset()
            {
                m_uiBOLT_Timer = 2000;
                m_uiBLESSING_Timer = urand(3000, 5000);
                m_uiMEND_Timer = urand(5000, 10000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_BOLT_DEATHSPEAKER);
                    //repite entre 3 a 7 segs
                    m_uiBOLT_Timer = urand(3000, 7000);
                }
                else
                    m_uiBOLT_Timer -= uiDiff;

                if (m_uiBLESSING_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_DARK_BLESSING);
                    //repite entre 8 a 15 segs
                    m_uiBLESSING_Timer = urand(8000, 15000);
                }
                else
                    m_uiBLESSING_Timer -= uiDiff;
 
                if (m_uiMEND_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_SHADOW_MEND_10M);
                    //repite entre 8 a 15 segs
                    m_uiMEND_Timer = urand(8000, 10000);
                }
                else
                    m_uiMEND_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_disciple_10man_iccAI(creature);
        }
};

//#########  Deathspeaker Disciple 25 man ##############
class npc_deathspeaker_disciple_25man_icc : public CreatureScript
{
    public:
        npc_deathspeaker_disciple_25man_icc() : CreatureScript("npc_deathspeaker_disciple_25man_icc") { }

        struct npc_deathspeaker_disciple_25man_iccAI : public ScriptedAI
        {
            npc_deathspeaker_disciple_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBOLT_Timer;
            uint32 m_uiBLESSING_Timer;
            uint32 m_uiMEND_Timer;

            void Reset()
            {
                m_uiBOLT_Timer = 2000;
                m_uiBLESSING_Timer = urand(1000, 3000); // inicia rapido
                m_uiMEND_Timer = urand(3000, 5000); //inicia rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_BOLT_DEATHSPEAKER);
                    //repite entre 2 a 3 segs
                    m_uiBOLT_Timer = urand(2000, 3000);
                }
                else
                    m_uiBOLT_Timer -= uiDiff;

                if (m_uiBLESSING_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_DARK_BLESSING);
                    //repite entre 8 a 10 segs
                    m_uiBLESSING_Timer = urand(8000, 10000);
                }
                else
                    m_uiBLESSING_Timer -= uiDiff;

                if (m_uiMEND_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_SHADOW_MEND_25M);
                    //repite entre 5 a 8 segs
                    m_uiMEND_Timer = urand(5000, 8000);
                }
                else
                    m_uiMEND_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_disciple_25man_iccAI(creature);
        }
};

//#########  Deathspeaker Attendant 10 man ##############
class npc_deathspeaker_attendant_10man_icc : public CreatureScript
{
    public:
        npc_deathspeaker_attendant_10man_icc() : CreatureScript("npc_deathspeaker_attendant_10man_icc") { }

        struct npc_deathspeaker_attendant_10man_iccAI : public ScriptedAI
        {
            npc_deathspeaker_attendant_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBOLT_Timer;
            uint32 m_uiNOVA_Timer;

            void Reset()
            {
                m_uiBOLT_Timer = 2000;
                m_uiNOVA_Timer = urand(5000, 10000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_BOLT_DEATHSPEAKER);
                    //repite cada 3 a 5 segs
                    m_uiBOLT_Timer = urand(3000, 5000);
                }
                else
                    m_uiBOLT_Timer -= uiDiff;

                if (m_uiNOVA_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_SHADOW_NOVA_10M);
                    //repite cada 5 a 10 segs
                    m_uiNOVA_Timer = urand(5000, 10000);
                }
                else
                    m_uiNOVA_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_attendant_10man_iccAI(creature);
        }
};

//#########  Deathspeaker Attendant 25 man ##############
class npc_deathspeaker_attendant_25man_icc : public CreatureScript
{
    public:
        npc_deathspeaker_attendant_25man_icc() : CreatureScript("npc_deathspeaker_attendant_25man_icc") { }

        struct npc_deathspeaker_attendant_25man_iccAI : public ScriptedAI
        {
            npc_deathspeaker_attendant_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBOLT_Timer;
            uint32 m_uiNOVA_Timer;

            void Reset()
            {
                m_uiBOLT_Timer = 2000;
                m_uiNOVA_Timer = urand(5000, 8000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_BOLT_DEATHSPEAKER);
                    //entre cada 2 a 3 segs
                    m_uiBOLT_Timer = urand(2000, 3000);
                }
                else
                    m_uiBOLT_Timer -= uiDiff;

                if (m_uiNOVA_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_SHADOW_NOVA_25M);
                    //entre cada 5 a 10 segs
                    m_uiNOVA_Timer = urand(5000, 10000);
                }
                else
                    m_uiNOVA_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_attendant_25man_iccAI(creature);
        }
};

//#########  Deathspeaker Zealot ##############
class npc_deathspeaker_zealot_icc : public CreatureScript
{
    public:
        npc_deathspeaker_zealot_icc() : CreatureScript("npc_deathspeaker_zealot_icc") { }

        struct npc_deathspeaker_zealot_iccAI : public ScriptedAI
        {
            npc_deathspeaker_zealot_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiCLEAVE_Timer;

            void Reset()
            {
                m_uiCLEAVE_Timer = 6000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiCLEAVE_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_CLEAVE);
                    //cada 6 segs
                    m_uiCLEAVE_Timer = 6000;
                }
                else
                    m_uiCLEAVE_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_zealot_iccAI(creature);
        }
};

//#########  Deathspeaker High Priest ##############
class npc_deathspeaker_high_priest_icc : public CreatureScript
{
    public:
        npc_deathspeaker_high_priest_icc() : CreatureScript("npc_deathspeaker_high_priest_icc") { }
 
        struct npc_deathspeaker_high_priest_iccAI : public ScriptedAI
        {
            npc_deathspeaker_high_priest_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiRECKONING_Timer;
            uint32 m_uiAURA_Timer;

            void Reset()
            {
                m_uiRECKONING_Timer = 2000; //inicia rapidamente
                m_uiAURA_Timer = 1000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiAURA_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_AURA_OF_DARKNESS);
                    //cada 12 a 18 segs el aura of darkness
                    m_uiAURA_Timer = urand(12000, 18000);
                }
                else
                    m_uiAURA_Timer -= uiDiff;

                if (m_uiRECKONING_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_DARK_RECKONING);
                    //repite cada 10 a 12 segs
                    m_uiRECKONING_Timer = urand(10000, 12000);
                }
                else
                    m_uiRECKONING_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_deathspeaker_high_priest_iccAI(creature);
        }
};

//#########  Valkyr Herald 10 man ##############
class npc_valkyr_herald_10man_icc : public CreatureScript
{
    public:
        npc_valkyr_herald_10man_icc() : CreatureScript("npc_valkyr_herald_10man_icc") { }
 
        struct npc_valkyr_herald_10man_iccAI : public ScriptedAI
        {
            npc_valkyr_herald_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiESSENCE_Timer;

            void Reset()
            {
                m_uiESSENCE_Timer = 1000; //inicia rapidamente
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiESSENCE_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_SEVERED_ESSENCE_10M);
                    //cada 2 a 8 segs
                    m_uiESSENCE_Timer = urand(2000, 8000);
                }
                else
                    m_uiESSENCE_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_valkyr_herald_10man_iccAI(creature);
        }
};

//#########  Valkyr Herald 25 man ##############
class npc_valkyr_herald_25man_icc : public CreatureScript
{
    public:
        npc_valkyr_herald_25man_icc() : CreatureScript("npc_valkyr_herald_25man_icc") { }
 
        struct npc_valkyr_herald_25man_iccAI : public ScriptedAI
        {
            npc_valkyr_herald_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiESSENCE_Timer;

            void Reset()
            {
                m_uiESSENCE_Timer = 1000; //inicia rapidamente
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiESSENCE_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_SEVERED_ESSENCE_25M);
                    //cada 2 a 8 segs
                    m_uiESSENCE_Timer = urand(2000, 8000);
                }
                else
                    m_uiESSENCE_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_valkyr_herald_25man_iccAI(creature);
        }
};

//#########  Blighted Abomination ##############
class npc_blighted_abomination_icc : public CreatureScript
{
    public:
        npc_blighted_abomination_icc() : CreatureScript("npc_blighted_abomination_icc") { }

        struct npc_blighted_abomination_iccAI : public ScriptedAI
        {
            npc_blighted_abomination_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiCLOUD_Timer;
            uint32 m_uiCLEAVE_Timer;
            uint32 m_uiHOOK_Timer;

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void Reset()
            {
                m_uiCLOUD_Timer = 10000;
                m_uiCLEAVE_Timer = 4000;
                m_uiHOOK_Timer = 5000;
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiCLOUD_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_PLAGUE_CLOUD);
                    //cada 20 segs
                    m_uiCLOUD_Timer = 20000;
                }
                else
                    m_uiCLOUD_Timer -= uiDiff;

                if (m_uiHOOK_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_SCOURGE_HOOK);
                    //se repite cada 12 a 20 segs
                    m_uiHOOK_Timer = urand(12000, 20000);
                }
                else
                    m_uiHOOK_Timer -= uiDiff;
 
                if (m_uiCLEAVE_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_CLEAVE);
                    //cada 6 segs
                    m_uiCLEAVE_Timer = 6000;
                }
                else
                    m_uiCLEAVE_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_blighted_abomination_iccAI(creature);
        }
};

//#########  Vengeful Fleshreaper ##############
class npc_vengeful_fleshreapert_icc : public CreatureScript
{
    public:
        npc_vengeful_fleshreapert_icc() : CreatureScript("npc_vengeful_fleshreapert_icc") { }

        struct npc_vengeful_fleshreapert_iccAI : public ScriptedAI
        {
            npc_vengeful_fleshreapert_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiJUMP_Timer;
            uint32 m_uiDEVOUR_Timer;

            void Reset()
            {
                m_uiJUMP_Timer = urand(3000, 20000);
                m_uiDEVOUR_Timer = urand(3000, 5000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiJUMP_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_LEAPING_FACE_MAUL);
                    //entre 20 y 40 segs
                    m_uiJUMP_Timer = urand(20000,40000);
                }
                else
                    m_uiJUMP_Timer -= uiDiff;

                if (m_uiDEVOUR_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_DEVOUR_HUMANOID);
                    //entre 5 y 8 segs
                    m_uiDEVOUR_Timer = urand(5000,8000);
                }
                else
                    m_uiDEVOUR_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_vengeful_fleshreapert_iccAI(creature);
        }
};

//#########  Plague Scientist ##############
class npc_plague_scientist_icc : public CreatureScript
{
    public:
        npc_plague_scientist_icc() : CreatureScript("npc_plague_scientist_icc") { }
 
        struct npc_plague_scientist_iccAI : public ScriptedAI
        {
            npc_plague_scientist_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBLAST_Timer;
            uint32 m_uiSTREAM_Timer;
            uint32 m_uiSTREAM_OUT_Timer;
            uint32 m_uiSPRAY_Timer;    

            void Reset()
            {
                m_uiBLAST_Timer = 2000;
                m_uiSTREAM_Timer = urand(8000, 12000);
                m_uiSTREAM_OUT_Timer = 24000;
                m_uiSPRAY_Timer = urand(5000, 8000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSTREAM_Timer <= uiDiff)
                {
                    if (m_uiSTREAM_OUT_Timer > uiDiff)
                    {
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                            DoCast(target, SPELL_PLAGUE_STREAM);
                        // maximo 24 segs para que deje de castear
                        m_uiSTREAM_OUT_Timer -= uiDiff;
                    }
                    else
                    {
                        me->CastStop(SPELL_PLAGUE_STREAM);
                        // se repite de entre 15 a 20 segs
                        m_uiSTREAM_OUT_Timer = urand(15000, 20000);
                    }
                }
                else
                    m_uiSTREAM_Timer -= uiDiff;

                if (m_uiSPRAY_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_COMBOBULATING_SPRAY);
                    // cada 8 a 12 segs se repite
                    m_uiSPRAY_Timer = urand(8000, 12000);
                }
                else
                    m_uiSPRAY_Timer -= uiDiff;
 
                if (m_uiBLAST_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_PLAGUE_BLAST);
                    // cada 2 a 3 segs se repite
                    m_uiBLAST_Timer = urand(2000, 3000);
                }
                else
                    m_uiBLAST_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_plague_scientist_iccAI(creature);
        }
};

//#########  Pustulating Horror 10 man ##############
class npc_pustulating_horror_10man_icc : public CreatureScript
{
    public:
        npc_pustulating_horror_10man_icc() : CreatureScript("npc_pustulating_horror_10man_icc") { }

        struct npc_pustulating_horror_10man_iccAI : public ScriptedAI
        {
            npc_pustulating_horror_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiPUS_Timer;

            void Reset()
            {
                m_uiPUS_Timer = 2000; //iniciando rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (HealthBelowPct(15)) // depende de la vida
                {
                    DoCastAOE(SPELL_BLIGHT_BOMB);
                    // hacemos mas rapido el pus
                    m_uiPUS_Timer = 5000;
                }

                if (m_uiPUS_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST, 0))
                        DoCast(target, SPELL_BUBBLING_PUS_10M);
				    if (HealthAbovePct(15))
                        // cada 15 a 25 segs se repite
                        m_uiPUS_Timer = urand(15000, 25000);
                }
                else
                    m_uiPUS_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_pustulating_horror_10man_iccAI(creature);
        }
};

//#########  Pustulating Horror 25 man ##############
class npc_pustulating_horror_25man_icc : public CreatureScript
{
    public:
        npc_pustulating_horror_25man_icc() : CreatureScript("npc_pustulating_horror_25man_icc") { }

        struct npc_pustulating_horror_25man_iccAI : public ScriptedAI
        {
            npc_pustulating_horror_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiPUS_Timer;

            void Reset()
            {
                m_uiPUS_Timer = 2000; //iniciando rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (HealthBelowPct(15)) // depende de la vida
                {
                    DoCastAOE(SPELL_BLIGHT_BOMB);
                    // hacemos mas rapido el pus
                    m_uiPUS_Timer = 5000;
                }

                if (m_uiPUS_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_NEAREST, 0))
                        DoCast(target, SPELL_BUBBLING_PUS_25M);
				    if (HealthAbovePct(15))
                        // cada 15 a 20 segs se repite
                        m_uiPUS_Timer = urand(15000, 20000);
                }
                else
                    m_uiPUS_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_pustulating_horror_25man_iccAI(creature);
        }
};

//#########  Decaying Colossus 10 man ##############
class npc_decaying_colossus_10man_icc : public CreatureScript
{
    public:
        npc_decaying_colossus_10man_icc() : CreatureScript("npc_decaying_colossus_10man_icc") { }

        struct npc_decaying_colossus_10man_iccAI : public ScriptedAI
        {
            npc_decaying_colossus_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiSTOMP_Timer;

            void Reset()
            {
                m_uiSTOMP_Timer = 5000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSTOMP_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_MASSIVE_STOMP_10M);
                    // cada 15 a 25 segs se repite
                    m_uiSTOMP_Timer = urand(15000, 25000);
                }
                else
                    m_uiSTOMP_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_decaying_colossus_10man_iccAI(creature);
        }
};

//#########  Decaying Colossus 25 man ##############
class npc_decaying_colossus_25man_icc : public CreatureScript
{
    public:
        npc_decaying_colossus_25man_icc() : CreatureScript("npc_decaying_colossus_25man_icc") { }

        struct npc_decaying_colossus_25man_iccAI : public ScriptedAI
        {
            npc_decaying_colossus_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiSTOMP_Timer;

            void Reset()
            {
                m_uiSTOMP_Timer = 5000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSTOMP_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_MASSIVE_STOMP_25M);
                    // cada 15 a 25 segs se repite
                    m_uiSTOMP_Timer = urand(15000, 25000);
                }
                else
                    m_uiSTOMP_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };
 
        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_decaying_colossus_25man_iccAI(creature);
        }
};

//#########  Darkfallen Archmage 10 man ##############
class npc_darkfallen_archmage_10man_icc : public CreatureScript
{
    public:
        npc_darkfallen_archmage_10man_icc() : CreatureScript("npc_darkfallen_archmage_10man_icc") { }

        struct npc_darkfallen_archmage_10man_iccAI : public ScriptedAI
        {
            npc_darkfallen_archmage_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiAMPLIFY_Timer;
            uint32 m_uiBLAST_Timer;
            uint32 m_uiFIREBALL_Timer;
            uint32 m_uiPOLYMORPH_Timer;

            void Reset()
            {
                m_uiAMPLIFY_Timer = urand(10000, 15000);
                m_uiBLAST_Timer = urand(8000, 10000);
                m_uiFIREBALL_Timer = 2000;
                m_uiPOLYMORPH_Timer = urand(9000, 12000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiAMPLIFY_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_AMPLIFY_MAGIC_10M);
                    // amplificar cada 15 a 20 segs
                    m_uiAMPLIFY_Timer = urand(15000, 20000);
                }
                else
                    m_uiAMPLIFY_Timer -= uiDiff;

                if (m_uiPOLYMORPH_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_POLYMORPH_SPIDER);
                    // se repite cada 15 a 18 segs
                    m_uiPOLYMORPH_Timer = urand(15000, 18000);
                }
                else
                    m_uiPOLYMORPH_Timer -= uiDiff;

                if (m_uiFIREBALL_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_FIREBALL_10M);
                    // repite cada 3 a 4 segs
                    m_uiFIREBALL_Timer = urand(3000, 4000);
                }
                else
                    m_uiFIREBALL_Timer -= uiDiff;
 
                if (m_uiBLAST_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_BLAST_WAVE_10M);
                    // repite el blast de 10 a 20 segs
                    m_uiBLAST_Timer = urand(10000, 20000);
                }
                else
                    m_uiBLAST_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_archmage_10man_iccAI(creature);
        }
};

//#########  Darkfallen Archmage 25 man ##############
class npc_darkfallen_archmage_25man_icc : public CreatureScript
{
    public:
        npc_darkfallen_archmage_25man_icc() : CreatureScript("npc_darkfallen_archmage_25man_icc") { }

        struct npc_darkfallen_archmage_25man_iccAI : public ScriptedAI
        {
            npc_darkfallen_archmage_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiAMPLIFY_Timer;
            uint32 m_uiBLAST_Timer;
            uint32 m_uiFIREBALL_Timer;
            uint32 m_uiPOLYMORPH_Timer;

            void Reset()
            {
                m_uiAMPLIFY_Timer = urand(10000, 15000);
                m_uiBLAST_Timer = urand(8000, 10000);
                m_uiFIREBALL_Timer = 2000;
                m_uiPOLYMORPH_Timer = urand(9000, 12000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiAMPLIFY_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_AMPLIFY_MAGIC_25M);
                    // amplificar de 10 a 15 segs
                    m_uiAMPLIFY_Timer = urand(10000, 15000);
                }
                else
                    m_uiAMPLIFY_Timer -= uiDiff;

                if (m_uiPOLYMORPH_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_POLYMORPH_SPIDER);
                    // se repite cada 12 a 15 segs
                    m_uiPOLYMORPH_Timer = urand(12000, 15000);
                }
                else
                    m_uiPOLYMORPH_Timer -= uiDiff;

                if (m_uiFIREBALL_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_FIREBALL_25M);
                    // repite cada 2 a 3 segs
                    m_uiFIREBALL_Timer = urand(2000, 3000);
                }
                else
                    m_uiFIREBALL_Timer -= uiDiff;
 
                if (m_uiBLAST_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_BLAST_WAVE_25M);
                    // repite el blast de 10 a 20 segs
                    m_uiBLAST_Timer = urand(10000, 20000);
                }
                else
                    m_uiBLAST_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_archmage_25man_iccAI(creature);
        }
};

//#########  Darkfallen Blood Knight ##############
class npc_darkfallen_blood_knight_icc : public CreatureScript
{
    public:
        npc_darkfallen_blood_knight_icc() : CreatureScript("npc_darkfallen_blood_knight_icc") { }

        struct npc_darkfallen_blood_knight_iccAI : public ScriptedAI
        {
            npc_darkfallen_blood_knight_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiAURA_Timer;
            uint32 m_uiSTRIKE_Timer;
            uint32 m_uiMIRROR_Timer;

            void Reset()
            {
                m_uiAURA_Timer = urand(12000, 15000);
                m_uiSTRIKE_Timer = urand(2000, 3000); //iniciando rapido
                m_uiMIRROR_Timer = urand(4000, 5000); //iniciando rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSTRIKE_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_UNHOLY_STRIKE);
                    // castea cada 3 a 4 segs
                    m_uiSTRIKE_Timer = urand(3000, 4000);
                }
                else
                    m_uiSTRIKE_Timer -= uiDiff;

                if (m_uiAURA_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_VAMPIRIC_AURA);
                    // casteando cada 12 a 15 segs
                    m_uiAURA_Timer = urand(12000, 15000);
                }
                else
                    m_uiAURA_Timer -= uiDiff;

                if (m_uiMIRROR_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    {
                        DoCast(me->getVictim(),SPELL_BLOOD_MIRROR_DUMMY);
                        me->getVictim()->CastSpell(target,SPELL_BLOOD_MIRROR_DAMAGE,true);
                        me->CastSpell(me->getVictim(),SPELL_BLOOD_MIRROR_BUFF,true);
                        // castea el mirror entre 32 a 37 segs para ayudar un poco
                        m_uiMIRROR_Timer = urand(32000, 37000);
                    }
                }
                else
                    m_uiMIRROR_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_blood_knight_iccAI(creature);
        }
};

//#########  Darkfallen Noble 10 man ##############
class npc_darkfallen_noble_10man_icc : public CreatureScript
{
    public:
        npc_darkfallen_noble_10man_icc() : CreatureScript("npc_darkfallen_noble_10man_icc") { }
 
        struct npc_darkfallen_noble_10man_iccAI : public ScriptedAI
        {
            npc_darkfallen_noble_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiCHAINS_Timer;
            uint32 m_uiBOLT_Timer;
            uint32 m_uiFIEND_Timer;

            void Reset()
            {
                m_uiCHAINS_Timer = urand(2000, 4000); //inicia rapido
                m_uiBOLT_Timer = urand(3000, 5000);
                m_uiFIEND_Timer = 15000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_BOLT_10M);
                    // castea cada 4 a 5 segs
                    m_uiBOLT_Timer = urand(4000, 5000);
                }
                else
                    m_uiBOLT_Timer -= uiDiff;

                if (m_uiCHAINS_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_CHAINS_OF_SHADOW);
                    // las cadenas si cada 20 a 25 segs
                    m_uiCHAINS_Timer = urand(20000, 25000);
                }
                else
                    m_uiCHAINS_Timer -= uiDiff;

                if (m_uiFIEND_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        if (me->SummonCreature(NPC_VAMPIRIC_FIEND,target->GetPositionX(),target->GetPositionY(),target->GetPositionZ()))
                            // lo summonea cada minuto al esbirro
                            m_uiFIEND_Timer = 60000;
                }
                else
                    m_uiFIEND_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_noble_10man_iccAI(creature);
        }
};

//#########  Darkfallen Noble 25 man ##############
class npc_darkfallen_noble_25man_icc : public CreatureScript
{
    public:
        npc_darkfallen_noble_25man_icc() : CreatureScript("npc_darkfallen_noble_25man_icc") { }

        struct npc_darkfallen_noble_25man_iccAI : public ScriptedAI
        {
            npc_darkfallen_noble_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiCHAINS_Timer;
            uint32 m_uiBOLT_Timer;
            uint32 m_uiFIEND_Timer;

            void Reset()
            {
                m_uiCHAINS_Timer = urand(2000, 4000); //inicia rapido
                m_uiBOLT_Timer = urand(3000, 5000);
                m_uiFIEND_Timer = 15000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_SHADOW_BOLT_25M);
                    // castea cada 3 a 4 segs
                    m_uiBOLT_Timer = urand(3000, 4000);
                }
                else
                    m_uiBOLT_Timer -= uiDiff;

                if (m_uiCHAINS_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_CHAINS_OF_SHADOW);
                    // las cadenas cada 15 a 20 segs
                    m_uiCHAINS_Timer = urand(15000, 20000);
                }
                else
                    m_uiCHAINS_Timer -= uiDiff;

                if (m_uiFIEND_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        if (me->SummonCreature(NPC_VAMPIRIC_FIEND,target->GetPositionX(),target->GetPositionY(),target->GetPositionZ()))
                            // lo summonea cada minuto al esbirro
                            m_uiFIEND_Timer = 60000;
                }
                else
                    m_uiFIEND_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_noble_25man_iccAI(creature);
        }
};
 
 //#########  Npc Vampiric Fiend ##############
class npc_vampiric_fiend_icc : public CreatureScript
{
    public:
        npc_vampiric_fiend_icc() : CreatureScript("npc_vampiric_fiend_icc") { }

        struct npc_vampiric_fiend_iccAI : public ScriptedAI
        {
            npc_vampiric_fiend_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiLEECHING_Timer;

            void Reset()
            {
                m_uiLEECHING_Timer = 10000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void EnterCombat(Unit* /*target*/)
            {
                DoCast(me, SPELL_DISEASE_CLOUD);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiLEECHING_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_LEECHING_ROT);
                    // despawn en 3 segs despues de chupar
                    me->DespawnOrUnsummon(3000);
                    // castea cada 10 segs
                    m_uiLEECHING_Timer = 10000;
                }
                else
                    m_uiLEECHING_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_vampiric_fiend_iccAI(creature);
        }
};

//#########  Darkfallen Advisor 10 man ##############
class npc_darkfallen_advisor_10man_icc : public CreatureScript
{
    public:
        npc_darkfallen_advisor_10man_icc() : CreatureScript("npc_darkfallen_advisor_10man_icc") { }
 
        struct npc_darkfallen_advisor_10man_iccAI : public ScriptedAI
        {
            npc_darkfallen_advisor_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiLICH_Timer;
            uint32 m_uiPROTECTION_Timer;

            void Reset()
            {
                m_uiLICH_Timer = urand(2000, 5000); //inicia rapido
                m_uiPROTECTION_Timer = urand(10000, 15000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiLICH_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_LICH_SLAP_10M);
                    // castea cada 10 segs
                    m_uiLICH_Timer = 10000;
                }
                else
                    m_uiLICH_Timer -= uiDiff;

                if (m_uiPROTECTION_Timer <= uiDiff)
                {
                    if (Unit* target = urand(0, 1) ? SelectTarget(SELECT_TARGET_RANDOM, 0) : DoSelectLowestHpFriendly(40.0f))
                    {
                        DoCast(target,SPELL_SHROUD_OF_PROTECTION);
                        DoCast(target,SPELL_SHROUD_OF_SPELL_WARDING);
                        //casteando proteccion entr 15 a 20 segs
                        m_uiPROTECTION_Timer = urand(15000, 20000);
                    }
                }
                else
                    m_uiPROTECTION_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_advisor_10man_iccAI(creature);
        }
};

//#########  Darkfallen Advisor 25 man ##############
class npc_darkfallen_advisor_25man_icc : public CreatureScript
{
    public:
        npc_darkfallen_advisor_25man_icc() : CreatureScript("npc_darkfallen_advisor_25man_icc") { }
 
        struct npc_darkfallen_advisor_25man_iccAI : public ScriptedAI
        {
            npc_darkfallen_advisor_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiLICH_Timer;
            uint32 m_uiPROTECTION_Timer;

            void Reset()
            {
                m_uiLICH_Timer = urand(2000, 5000); //inicia rapido
                m_uiPROTECTION_Timer = urand(10000, 15000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiLICH_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_LICH_SLAP_25M);
                    // castea entre 5 y 8 segs
                    m_uiLICH_Timer = urand(5000, 8000);
                }
                else
                    m_uiLICH_Timer -= uiDiff;

                if (m_uiPROTECTION_Timer <= uiDiff)
                {
                    if (Unit* target = urand(0, 1) ? SelectTarget(SELECT_TARGET_RANDOM, 0) : DoSelectLowestHpFriendly(40.0f))
                    {
                        DoCast(target,SPELL_SHROUD_OF_PROTECTION);
                        DoCast(target,SPELL_SHROUD_OF_SPELL_WARDING);
                        //casteando proteccion entr 12 a 15 segs
                        m_uiPROTECTION_Timer = urand(12000, 15000);
                    }
                }
                else
                    m_uiPROTECTION_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_advisor_25man_iccAI(creature);
        }
};

//#########  Darkfallen Commander 10 man ##############
class npc_darkfallen_commander_10man_icc : public CreatureScript
{
    public:
        npc_darkfallen_commander_10man_icc() : CreatureScript("npc_darkfallen_commander_10man_icc") { }
 
        struct npc_darkfallen_commander_10man_iccAI : public ScriptedAI
        {
            npc_darkfallen_commander_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiRUSH_Timer;
            uint32 m_uiSHOUT_Timer;

            void Reset()
            {
                m_uiRUSH_Timer = urand(4000, 8000); //inicia rapido
                m_uiSHOUT_Timer = urand(8000, 10000); //incia rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSHOUT_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_BATTLE_SHOUT);
                    // cada 15 a 20 segs
                    m_uiSHOUT_Timer = urand(15000, 20000);
                }
                else
                    m_uiSHOUT_Timer -= uiDiff;

                if (m_uiRUSH_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_VAMPIRE_RUSH_10M);
                    // castea cada 10 a 15 segs
                    m_uiRUSH_Timer = urand(10000, 15000);
                }
                else
                    m_uiRUSH_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_commander_10man_iccAI(creature);
        }
};

//#########  Darkfallen Commander 25 man ##############
class npc_darkfallen_commander_25man_icc : public CreatureScript
{
    public:
        npc_darkfallen_commander_25man_icc() : CreatureScript("npc_darkfallen_commander_25man_icc") { }

        struct npc_darkfallen_commander_25man_iccAI : public ScriptedAI
        {
            npc_darkfallen_commander_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiRUSH_Timer;
            uint32 m_uiSHOUT_Timer;

            void Reset()
            {
                m_uiRUSH_Timer = urand(4000, 8000); //inicia rapido
                m_uiSHOUT_Timer = urand(8000, 10000); //incia rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSHOUT_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_BATTLE_SHOUT);
                    // cada 15 a 20 segs
                    m_uiSHOUT_Timer = urand(15000, 20000);
                }
                else
                    m_uiSHOUT_Timer -= uiDiff;

                if (m_uiRUSH_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_VAMPIRE_RUSH_25M);
                    // castea cada 10 a 15 segs
                    m_uiRUSH_Timer = urand(10000, 15000);
                }
                else
                    m_uiRUSH_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_commander_25man_iccAI(creature);
        }
};

//#########  Darkfallen Lieutenant 10M ##############
class npc_darkfallen_lieutenant_10man_icc : public CreatureScript
{
    public:
        npc_darkfallen_lieutenant_10man_icc() : CreatureScript("npc_darkfallen_lieutenant_10man_icc") { }

        struct npc_darkfallen_lieutenant_10man_iccAI : public ScriptedAI
        {
            npc_darkfallen_lieutenant_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiREND_Timer;
            uint32 m_uiCURSE_Timer;

            void Reset()
            {
                m_uiREND_Timer = urand(1000, 2000); //inicia rapido
                m_uiCURSE_Timer = urand(8000, 15000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiREND_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_REND_FLESH_10M);
                    // cada 25 segs
                    m_uiREND_Timer = 25000;
                }
                else
                    m_uiREND_Timer -= uiDiff;

                if (m_uiCURSE_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_VAMPIRIC_CURSE);
                    // entre 10 a 20 segs
                    m_uiCURSE_Timer = urand(10000, 20000);
                }
                else
                    m_uiCURSE_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_lieutenant_10man_iccAI(creature);
        }
};

//#########  Darkfallen Lieutenant 25M ##############
class npc_darkfallen_lieutenant_25man_icc : public CreatureScript
{
    public:
        npc_darkfallen_lieutenant_25man_icc() : CreatureScript("npc_darkfallen_lieutenant_25man_icc") { }

        struct npc_darkfallen_lieutenant_25man_iccAI : public ScriptedAI
        {
            npc_darkfallen_lieutenant_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiREND_Timer;
            uint32 m_uiCURSE_Timer;

            void Reset()
            {
                m_uiREND_Timer = urand(1000, 2000); //inicia rapido
                m_uiCURSE_Timer = urand(8000, 15000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiREND_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_REND_FLESH_25M);
                    // igual cada 25 segs
                    m_uiREND_Timer = 25000;
                }
                else
                    m_uiREND_Timer -= uiDiff;

                if (m_uiCURSE_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_VAMPIRIC_CURSE);
                    // entre 10 y 20 segs
                    m_uiCURSE_Timer = urand(10000, 20000);
                }
                else
                    m_uiCURSE_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_lieutenant_25man_iccAI(creature);
        }
};

//#########  Darkfallen Tactician ##############
class npc_darkfallen_tactician_icc : public CreatureScript
{
    public:
        npc_darkfallen_tactician_icc() : CreatureScript("npc_darkfallen_tactician_icc") { }

        struct npc_darkfallen_tactician_iccAI : public ScriptedAI
        {
            npc_darkfallen_tactician_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiSHADOWSTEP_Timer;
            uint32 m_uiSAP_Timer;
            uint32 m_uiSTRIKE_Timer;

            void Reset()
            {
                m_uiSHADOWSTEP_Timer = urand(1000, 2000); //inicia rapido
                m_uiSAP_Timer = urand(5000, 15000);
                m_uiSTRIKE_Timer = urand(2000, 3000); //inicia rapido
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSTRIKE_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_UNHOLY_STRIKE);
                    // cada 6 segs
                    m_uiSTRIKE_Timer = 6000;
                }
                else
                    m_uiSTRIKE_Timer -= uiDiff;

                if (m_uiSAP_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_BLOOD_SAP);
                    // entre 15 y 25 segs
                    m_uiSAP_Timer = urand(15000, 25000);
                }
                else
                    m_uiSAP_Timer -= uiDiff;

                if (m_uiSHADOWSTEP_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_SHADOWSTEP);
                    // entre 15 y 20 segs
                    m_uiSHADOWSTEP_Timer = urand(15000, 20000);
                }
                else
                    m_uiSHADOWSTEP_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_darkfallen_tactician_iccAI(creature);
        }
};

//#########  Ymirjar Deathbringer 10 man ##############
class npc_ymirjar_deathbringer_10man_icc : public CreatureScript
{
    public:
        npc_ymirjar_deathbringer_10man_icc() : CreatureScript("npc_ymirjar_deathbringer_10man_icc") { }

        struct npc_ymirjar_deathbringer_10man_iccAI : public ScriptedAI
        {
            npc_ymirjar_deathbringer_10man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBANISH_Timer;
            uint32 m_uiEMBRACE_Timer;
            uint32 m_uiBOLT_Timer;

            void Reset()
            {
                m_uiBANISH_Timer = urand(5000, 10000);
                m_uiEMBRACE_Timer = urand(10000, 15000);
                m_uiBOLT_Timer = urand(1000, 2000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiEMBRACE_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_DEATHS_EMBRACE_10M);
                    // cada 15 a 25 segs
                    m_uiEMBRACE_Timer = urand(15000, 25000);
                }
                else
                    m_uiEMBRACE_Timer -= uiDiff;

                if (m_uiBANISH_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_BANISH);
                    //repite cada 15 a 25 segs
                    m_uiBANISH_Timer = urand(15000, 25000);
                }
                else
                    m_uiBANISH_Timer -= uiDiff;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(),SPELL_SHADOW_BOLT_YMIRJAR_10M);
                    //repite cada 2 segs
                    m_uiBOLT_Timer = 2000;
                }
                else
                    m_uiBOLT_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ymirjar_deathbringer_10man_iccAI(creature);
        }
};

//#########  Ymirjar Deathbringer 25 man ##############
class npc_ymirjar_deathbringer_25man_icc : public CreatureScript
{
    public:
        npc_ymirjar_deathbringer_25man_icc() : CreatureScript("npc_ymirjar_deathbringer_25man_icc") { }

        struct npc_ymirjar_deathbringer_25man_iccAI : public ScriptedAI
        {
            npc_ymirjar_deathbringer_25man_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiBANISH_Timer;
            uint32 m_uiEMBRACE_Timer;
            uint32 m_uiBOLT_Timer;

            void Reset()
            {
                m_uiBANISH_Timer = urand(5000, 10000);
                m_uiEMBRACE_Timer = urand(5000, 10000); //inicia rapido
                m_uiBOLT_Timer = urand(1000, 2000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiEMBRACE_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_DEATHS_EMBRACE_25M);
                    // cada 15 a 20 segs
                    m_uiEMBRACE_Timer = urand(15000, 20000);
                }
                else
                    m_uiEMBRACE_Timer -= uiDiff;

                if (m_uiBANISH_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_BANISH);
                    //repite cada 15 a 20 segs
                    m_uiBANISH_Timer = urand(15000, 20000);
                }
                else
                    m_uiBANISH_Timer -= uiDiff;

                if (m_uiBOLT_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(),SPELL_SHADOW_BOLT_YMIRJAR_25M);
                    //repite cada 2 segs
                    m_uiBOLT_Timer = 2000;
                }
                else
                    m_uiBOLT_Timer -= uiDiff;
 
                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ymirjar_deathbringer_25man_iccAI(creature);
        }
};

//#########  Ymirjar Frostbinder ##############
class npc_ymirjar_frostbinder_icc : public CreatureScript
{
    public:
        npc_ymirjar_frostbinder_icc() : CreatureScript("npc_ymirjar_frostbinder_icc") { }

        struct npc_ymirjar_frostbinder_iccAI : public ScriptedAI
        {
            npc_ymirjar_frostbinder_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiORB_Timer;

            void Reset()
            {
                m_uiORB_Timer = 1000;
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiORB_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_FROZEN_ORB);
                    //repite cada 3 a 5 segs
                    m_uiORB_Timer = urand(3000, 5000);
                }
                else
                    m_uiORB_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ymirjar_frostbinder_iccAI(creature);
        }
};

//#########  Ymirjar Battle-Maiden ##############
class npc_ymirjar_battlemaiden_icc : public CreatureScript
{
    public:
        npc_ymirjar_battlemaiden_icc() : CreatureScript("npc_ymirjar_battlemaiden_icc") { }

        struct npc_ymirjar_battlemaiden_iccAI : public ScriptedAI
        {
            npc_ymirjar_battlemaiden_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiRUSH_Timer;
            uint32 m_uiSTRIKE_Timer;

            void Reset()
            {
                m_uiRUSH_Timer = urand(10000, 15000);
                m_uiSTRIKE_Timer = urand(1000, 5000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiSTRIKE_Timer <= uiDiff)
                {
                    DoCast(me->getVictim(), SPELL_BARBARIC_STRIKE);
                    // cada 2 a 3 segs
                    m_uiSTRIKE_Timer = urand(2000, 3000);
                }
                else
                    m_uiSTRIKE_Timer -= uiDiff;

                if (m_uiRUSH_Timer <= uiDiff)
                {
                    DoCast(me, SPELL_ADRENALINE_RUSH);
                    //repite cada 15 a 25 segs
                    m_uiRUSH_Timer = urand(15000, 25000);
                }
                else
                    m_uiRUSH_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ymirjar_battlemaiden_iccAI(creature);
        }
};

//#########  Ymirjar Huntress ##############
class npc_ymirjar_huntress_icc : public CreatureScript
{
    public:
        npc_ymirjar_huntress_icc() : CreatureScript("npc_ymirjar_huntress_icc") { }

        struct npc_ymirjar_huntress_iccAI : public ScriptedAI
        {
            npc_ymirjar_huntress_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiTRAP_Timer;
            uint32 m_uiRSHOT_Timer;
            uint32 m_uiSHOT_Timer;
            uint32 m_uiVOLLEY_Timer;

            void Reset()
            {
                m_uiTRAP_Timer = urand(5000, 15000);
                m_uiRSHOT_Timer = urand(10000, 15000);
                m_uiSHOT_Timer = urand(1000, 2000);
                m_uiVOLLEY_Timer = urand(5000, 15000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void EnterCombat(Unit* /*target*/)
            {
                if (Is25ManRaid())
                    DoCast(SPELL_SUMMON_WARHAWK);
            }

            void UpdateAI(uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiRSHOT_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_RAPID_SHOT);
                    // cada 15 a 25 segs
                    m_uiRSHOT_Timer = urand(15000, 25000);
                }
                else
                    m_uiRSHOT_Timer -= uiDiff;

                if (m_uiVOLLEY_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target,SPELL_VOLLEY);
                    //repite cada 10 a 15 segs
                    m_uiVOLLEY_Timer = urand(10000, 15000);
                }
                else
                    m_uiVOLLEY_Timer -= uiDiff;
 
                if (m_uiTRAP_Timer <= uiDiff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(target, SPELL_ICE_TRAP);
                    //repite cada 30 a 35 segs
                    m_uiTRAP_Timer = urand(30000, 35000);
                }
                else
                    m_uiTRAP_Timer -= uiDiff;

                if (me->isAttackReady())
                {
                    if (me->IsWithinMeleeRange(me->getVictim()))
                        DoMeleeAttackIfReady();
                    else if (m_uiSHOT_Timer <= uiDiff)
                    {
                        DoCast(me->getVictim(),SPELL_SHOOT);
                        m_uiSHOT_Timer = 1000;
                    }
                    else
					    m_uiSHOT_Timer -= uiDiff;
                }
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ymirjar_huntress_iccAI(creature);
        }
};
/*
//#########  Ymirjar Warlord ##############
class npc_ymirjar_warlord_icc : public CreatureScript
{
    public:
        npc_ymirjar_warlord_icc() : CreatureScript("npc_ymirjar_warlord_icc") { }

        struct npc_ymirjar_warlord_iccAI : public ScriptedAI
        {
            npc_ymirjar_warlord_iccAI(Creature* pCreature) : ScriptedAI(pCreature) {}

            uint32 m_uiWHIRLWIND_Timer;

            void Reset()
            {
                m_uiWHIRLWIND_Timer = urand(5000, 15000);
            }

            void JustDied(Unit* killer)
            {
                DoCast(me,SPELL_SOUL_FEAST_ALL);
            }

            void UpdateAI(const uint32 uiDiff)
            {
                if (!UpdateVictim())
                    return;

                if (m_uiWHIRLWIND_Timer <= uiDiff)
                {
                    DoCastAOE(SPELL_WHIRLWIND);
                    //repite cada 12 a 20 segs
                    m_uiWHIRLWIND_Timer = urand(12000, 20000);
                }
                else
                    m_uiWHIRLWIND_Timer -= uiDiff;

                DoMeleeAttackIfReady();   
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_ymirjar_warlord_iccAI(creature);
        }
};
*/
void AddSC_icecrown_citadel_trashmobs()
{
        new npc_ancient_skeletal_soldier_icc();
        new npc_deathbound_ward_icc();
        new npc_servant_of_the_throne_icc();
        // new npc_the_damned_icc();
        new npc_deathspeaker_servant_10man_icc();
        new npc_deathspeaker_servant_25man_icc();
        new npc_deathspeaker_disciple_10man_icc();
        new npc_deathspeaker_disciple_25man_icc();
        new npc_deathspeaker_attendant_10man_icc();
        new npc_deathspeaker_attendant_25man_icc();
        new npc_deathspeaker_zealot_icc();
        new npc_deathspeaker_high_priest_icc();
        new npc_valkyr_herald_10man_icc();
        new npc_valkyr_herald_25man_icc();
        new npc_blighted_abomination_icc();
        new npc_vengeful_fleshreapert_icc();
        new npc_plague_scientist_icc();
        new npc_pustulating_horror_10man_icc();
        new npc_pustulating_horror_25man_icc();
        new npc_decaying_colossus_10man_icc();
        new npc_decaying_colossus_25man_icc();
        new npc_darkfallen_archmage_10man_icc();
        new npc_darkfallen_archmage_25man_icc();
        new npc_darkfallen_blood_knight_icc();
        new npc_darkfallen_noble_10man_icc();
        new npc_darkfallen_noble_25man_icc();
        new npc_vampiric_fiend_icc();
        new npc_darkfallen_advisor_10man_icc();
        new npc_darkfallen_advisor_25man_icc();
        new npc_darkfallen_commander_10man_icc();
        new npc_darkfallen_commander_25man_icc();
        new npc_darkfallen_lieutenant_10man_icc();
        new npc_darkfallen_lieutenant_25man_icc();
        new npc_darkfallen_tactician_icc();
        new npc_ymirjar_deathbringer_10man_icc();
        new npc_ymirjar_deathbringer_25man_icc();
        new npc_ymirjar_frostbinder_icc();
        new npc_ymirjar_battlemaiden_icc();
        new npc_ymirjar_huntress_icc();
        // new npc_ymirjar_warlord_icc();
}