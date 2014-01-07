/*########################################################
# Mini Bosses #
# Case di Gilda - BloodyWars #
# <https://www.bloodywars.net/> #
# <https://github.com/A-Metaphysical-Drama/BloodyCore> #
########################################################*/

/* ScriptData
SDName: BloodyWars Mini Bosses
SDAuthor: PrinceCreed
SDComment: Likantropo, Lava Boost, Quel'Nagas, Might of Sylvanas, Trollzilla, Perotharn e Uznam
SDCategory: Mini-Boss Case di Gilda
EndScriptData */

#include "ScriptPCH.h"
#include "Chat.h"
#include "Language.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptMgr.h"

enum LikantropoSpells
{
    ENRAGE = 48138,
    FRENZY = 48142,
    MORTAL_WOUND = 59265,
    WORGEN_BITE = 55266,
    WORGEN_CALL = 53095,
    DECREPIT_FEVER = 54098,
    SUMMON_WORGEN = 27020
};

// Likantropo yells
#define SAY_LIKANTROPO_AGGRO "Eindringlinge ! Ihr sollt meine Sklaven werden"
#define SAY_LIKANTROPO_SLAY "Ich werde langsam wütend"
#define SAY_LIKANTROPO_DEATH "Neeeein! Das ist unmöglich..."
#define SAY_LIKANTROPO_MORPH "Das werdet ihr bereuen"

enum LavaBoostSpells
{
    HEALING_WAVE = 51586,
    LIGHTNING_BOLT = 59024,
    BLOODLUST = 41185,
    LIGHTNING_SHIELD = 59025,
    SUMMON_AIR_ELEMENTAL = 30418,
    LAVA_BURST = 59519,
    CHAIN_LIGHTNING = 54531,
    FLAME_SHOCK = 43303,
    EARTH_SHOCK = 43305,
    LIGHTNING_RING = 59848
};

// Lava Boost yells
#define SAY_LAVA_AGGRO "Ihr wagt es der Wut der Elemente zu trotzen ?!"
#define SAY_LAVA_SLAY "Schockierend!"
#define SAY_LAVA_DEATH "Natur - Warum hast du mich verlassen ?"
#define SAY_LAVA_BLOOD "Bloodlust!"

enum QuelNagasSpells
{
    SPELL_MAGIC_BARRIER = 38112,
    SPELL_TOXIC_SPORES = 38575,
    TOXIC_SPORES_TRIGGER = 22207,
    SUMMONED_MURLOC = 27649,
    SPELL_POISON_BOLT_VOLLEY = 54098,
    SPELL_ENTANGLE = 38316,
    SPELL_WRATH = 20698
};

// Quel'Nagas yells
#define SAY_NAGAS_AGGRO "Ihr werdet dem Abgrund entgegenblicken!"
#define SAY_NAGAS_SLAY "Könnt ihr mithalten?!"
#define SAY_NAGAS_DEATH "Ich kann es nicht glauben!"
#define SAY_NAGAS_SUMMON "Murlocs!"

enum SylvanasSpells
{
    SPELL_MULTISHOT = 40872,
    SPELL_VOLLEY = 38633,
    SUMMONED_SNAKE = 29444,
    SPELL_BOLT_VOLLEY = 34780,
    SPELL_BEWITCHING_AURA = 29486,
    SPELL_REJUVENATION = 71142,
    SPELL_ICE_TRAP = 71249,
    SPELL_AURA_ROT = 25818
};

// Might of Sylvanas yells
#define SAY_SYLVANAS_AGGRO "Die Quel'Dorei werden niemals untergehen!"
#define SAY_SYLVANAS_SLAY "Shorel'aran!"
#define SAY_SYLVANAS_DEATH "Ich werde zurückkehren"
#define SAY_SYLVANAS_ICE "Ein wenig Tod gefällig?"

enum TrollzillaSpells
{
    SPELL_FRENZY = 28131,
    SPELL_CLEAVE = 33480,
    SPELL_FIRE_SHIELD = 30513,
    SPELL_WAR_STOMP = 56427,
    SUMMON_FIRE_ELEMENTAL = 30416
};

// Trollzilla yells
#define SAY_TROLLZILLA_AGGRO "Ich... euch... zerstören..."
#define SAY_TROLLZILLA_SLAY "Hakkar... Für euch..."
#define SAY_TROLLZILLA_DEATH "Hakk... aaaa...rrr...."
#define SAY_TROLLZILLA_FRENZY "Ich... langsam... WÜTEND!"

enum PerotharnSpells
{
    STORM_OF_GRIEF = 59772,
    SHADOW_BURST = 34436,
    PIERCING_SHADOW = 36698,
    SHADOW_FLAME = 22539,
    HARVEST_SOUL = 28679,
    SHADOW_BOLT = 41957
};

// Perotharn yells
#define SAY_PEROTHARN_AGGRO "Ich werde euch als Geschenk ansehen und töten!"
#define SAY_PEROTHARN_SLAY "Bald wirst du einer von uns sein!"
#define SAY_PEROTHARN_DEATH "Meister... vergib mir..."
#define SAY_PEROTHARN_SOUL "Meister, hier kommen eure Seelen!"

enum UznamSpells
{
    EARTHQUAKE = 46240,
    WHIRLWIND = 52027,
    SHOCK_OF_SORROW = 50760,
    ENTROPIC_AURA = 36784,
    AURAL_SHOCK = 14538
};

// Uznam yells
#define SAY_UZNAM_AGGRO "Wer entweiht mein Heiligtum?"
#define SAY_UZNAM_SLAY "Ihr währt eine würdige Trophäe."
#define SAY_UZNAM_DEATH "Auferstanden? Mir dürstet nach Blut"
#define SAY_UZNAM_SPECIAL "Ich werde etwas müde."
#define EMOTE_WHIRL "Mögen die Stürme beginnen!"


/*#########
# Likantropo
#########*/

class npc_likantropo : public CreatureScript
{
public:
    npc_likantropo() : CreatureScript("npc_likantropo") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_likantropoAI (pCreature);
    }

    struct npc_likantropoAI : public ScriptedAI
    {
        npc_likantropoAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 EnrageTimer;
        uint32 WoundTimer;
        uint32 BiteTimer;
        uint32 FeverTimer;
        bool Enraged;
        bool Worgen;

        void Reset()
        {
            me->RestoreDisplayId();
            EnrageTimer = 15000;
            WoundTimer = 5000;
            BiteTimer = 45000;
            FeverTimer = 12000;
            Enraged = false;
            Worgen = false;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_LIKANTROPO_AGGRO, LANG_UNIVERSAL, 0);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_LIKANTROPO_SLAY, LANG_UNIVERSAL, 0);
            // In caso di morte di un pg, evoca un worgen dal suo corpo <3 ale
            if (victim->GetTypeId() == TYPEID_PLAYER)
                victim->SummonCreature(SUMMON_WORGEN, victim->GetPositionX(), victim->GetPositionY(), victim->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_LIKANTROPO_DEATH, LANG_UNIVERSAL, 0);
            me->RestoreDisplayId();
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            // Piccoli Enrage (durata 8 secondi) che raddoppiano il danno ogni 20 sec circa
            if (EnrageTimer <= uiDiff)
            {
                DoCast(me, ENRAGE);
                EnrageTimer = urand(20000,25000);
            } else EnrageTimer -= uiDiff;

            // Ogni 5 sec applica uno stack di wound che riduce del 5% le cure (max 15 stack)
            if (WoundTimer <= uiDiff)
            {
                DoCastVictim(MORTAL_WOUND);
                WoundTimer = 5000;
            } else WoundTimer -= uiDiff;

            // Ogni 20 sec applica un disease che riduce del 50% gli hp e fa 3k ogni 3 sec per 21 sec
            if (FeverTimer <= uiDiff)
            {
                DoCastAOE(DECREPIT_FEVER);
                FeverTimer = 20000;
            } else FeverTimer -= uiDiff;

            // Ogni 45 secondi Whirlwind che colpisce ad area facendo il danno normale
            // e contemporaneamente trasforma un target a caso in Worgen, disattivandogli le spell
            if (BiteTimer <= uiDiff)
            {
                DoCast(me, WORGEN_BITE);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
                    me->AddAura(WORGEN_CALL, pTarget);
                BiteTimer = 45000;
            } else BiteTimer -= uiDiff;

            // Ad 80% hp si trasforma in Worgen
            if (HealthBelowPct(80) && !Worgen)
            {
                me->SetDisplayId(26787);
                me->MonsterYell(SAY_LIKANTROPO_MORPH, LANG_UNIVERSAL, 0);
                DoCast(me, ENRAGE);
                EnrageTimer = urand(25000,35000);
                Worgen = true;
            }

            // Enrage a 15% di vita (aumenta 50% attack speed e 50% damage)
            if (HealthBelowPct(15) && !Enraged)
            {
                DoCast(me, FRENZY);
                Enraged = true;
            }

            DoMeleeAttackIfReady();
        }
    };

};


/*#########
# Lava Boost
#########*/

class npc_lava_boost : public CreatureScript
{
public:
    npc_lava_boost() : CreatureScript("npc_lava_boost") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_lava_boostAI (pCreature);
    }

    struct npc_lava_boostAI : public ScriptedAI
    {
        npc_lava_boostAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 ChainTimer;
        uint32 LavaTimer;
        uint32 FlameTimer;
        uint32 ShockTimer;
        bool Haste;
        bool Healed;

        void Reset()
        {
            ChainTimer = 8000;
            LavaTimer = 15000;
            FlameTimer = 4000;
            ShockTimer = 20000;
            Haste = false;
            Healed = false;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_LAVA_AGGRO, LANG_UNIVERSAL, 0);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_LAVA_SLAY, LANG_UNIVERSAL, 0);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_LAVA_DEATH, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            // Chain Lightning ogni 10/15 sec
            if (ChainTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                DoCastVictim(CHAIN_LIGHTNING);
                ChainTimer = urand(10000,15000);
            } else ChainTimer -= uiDiff;

            // Ogni 15 sec casta Lava Burst su un target random da 8/10k
            if (LavaTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
                    DoCast(pTarget, LAVA_BURST);
                DoCast(me, LIGHTNING_SHIELD);
                LavaTimer = 15000;
            } else LavaTimer -= uiDiff;

            // Ogni 20 sec casta Earth Shock su un target random
            if (ShockTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,1))
                    DoCast(pTarget, EARTH_SHOCK);
                DoCast(me, LIGHTNING_RING);
                ShockTimer = 20000;
            } else ShockTimer -= uiDiff;

            // Ogni 12 sec applica Flame Shock sul tank
            if (FlameTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                DoCastVictim(FLAME_SHOCK);
                FlameTimer = 12000;
            } else FlameTimer -= uiDiff;

            // A 25% hp si cura con Healing Wave (solo una volta)
            if (HealthBelowPct(25) && !Healed)
            {
                me->InterruptNonMeleeSpells(false);
                DoCast(me, HEALING_WAVE);
                ChainTimer = 8000;
                LavaTimer = 10000;
                FlameTimer = 4000;
                ShockTimer = 15000;
                Healed = true;
            }

            // Bloodlust a 50% di vita e Summon Air Elemental
            if (HealthBelowPct(50) && !Haste)
            {
                me->InterruptNonMeleeSpells(false);
                DoCast(me, BLOODLUST);
                me->MonsterYell(SAY_LAVA_BLOOD, LANG_UNIVERSAL, 0);
                me->SummonCreature(SUMMON_AIR_ELEMENTAL, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
                Haste = true;
            }

            DoSpellAttackIfReady(LIGHTNING_BOLT);
        }
    };

};


/*#########
# Quel'Nagas
#########*/

class npc_quel_nagas : public CreatureScript
{
public:
    npc_quel_nagas() : CreatureScript("npc_quel_nagas") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_quel_nagasAI (pCreature);
    }

    struct npc_quel_nagasAI : public ScriptedAI
    {
        npc_quel_nagasAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 Phase2Timer;
        uint32 Phase1Timer;
        uint32 SporeTimer;
        uint32 PoisonTimer;
        uint32 RootTimer;
        bool Phase1;

        void Reset()
        {
            Phase2Timer = 60000;
            Phase1Timer = 90000;
            SporeTimer = 6000;
            PoisonTimer = 15000;
            RootTimer = 25000;
            Phase1 = true;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_NAGAS_AGGRO, LANG_UNIVERSAL, 0);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_NAGAS_SLAY, LANG_UNIVERSAL, 0);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_NAGAS_DEATH, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            // Summon Phase
            if (Phase2Timer <= uiDiff)
            {
                Phase1 = false;
                me->InterruptNonMeleeSpells(false);
                me->SetReactState(REACT_PASSIVE);
                me->AttackStop();
                me->RemoveAllAuras();
                // In Fase 2 evoca 3 Murloc
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    for (uint8 i = 1; i <= 3; i++)
                    {
                        me->SummonCreature(SUMMONED_MURLOC, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
                    }
                me->AddAura(SPELL_MAGIC_BARRIER, me);
                me->MonsterYell(SAY_NAGAS_SUMMON, LANG_UNIVERSAL, 0);
                Phase2Timer = 90000;
            } else Phase2Timer -= uiDiff;

            // Normal Phase
            if (Phase1Timer <= uiDiff)
            {
                Phase1 = true;
                me->InterruptNonMeleeSpells(false);
                me->SetReactState(REACT_AGGRESSIVE);
                me->RemoveAurasDueToSpell(SPELL_MAGIC_BARRIER);
                DoZoneInCombat();
                if (me->getThreatManager().isThreatListEmpty())
                    EnterEvadeMode();
                Phase1Timer = 90000;
            } else Phase1Timer -= uiDiff;

            if (Phase1)
            {
                // Ogni 15 sec lancia una spora velenosa ai piedi di un player random
                if (SporeTimer <= uiDiff)
                {
                    me->InterruptNonMeleeSpells(false);
                    if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    {
                        Creature* trig = me->SummonCreature(TOXIC_SPORES_TRIGGER, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 30000);
                        if (trig)
                        {
                            trig->setFaction(14);
                            trig->CastSpell(trig, SPELL_TOXIC_SPORES,true);
                        }
                    }
                    SporeTimer = 15000;
                } else SporeTimer -= uiDiff;

                // Poison ad area ogni 10 sec
                if (PoisonTimer <= uiDiff)
                {
                    me->InterruptNonMeleeSpells(false);
                    DoCastAOE(SPELL_POISON_BOLT_VOLLEY);
                    PoisonTimer = 10000;
                } else PoisonTimer -= uiDiff;

                // Radici su un target random ogni 25 sec
                if (RootTimer <= uiDiff)
                {
                    me->InterruptNonMeleeSpells(false);
                    if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                        DoCast(pTarget, SPELL_ENTANGLE);
                    RootTimer = 25000;
                } else RootTimer -= uiDiff;
            }

            DoSpellAttackIfReady(SPELL_WRATH);
        }
    };

};


/*#########
# Might of Sylvanas
#########*/

class npc_might_of_sylvanas : public CreatureScript
{
public:
    npc_might_of_sylvanas() : CreatureScript("npc_might_of_sylvanas") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_might_of_sylvanasAI (pCreature);
    }

    struct npc_might_of_sylvanasAI : public ScriptedAI
    {
        npc_might_of_sylvanasAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 MultiTimer;
        uint32 VolleyTimer;
        uint32 SnakeTimer;
        uint32 PoisonTimer;
        uint32 TrapTimer;
        uint32 HealTimer;
        bool Haste;
        bool Healed;

        void Reset()
        {
            MultiTimer = 2000;
            VolleyTimer = 15000;
            SnakeTimer = 5000;
            PoisonTimer = 12000;
            TrapTimer = 20000;
            HealTimer = 25000;
            Haste = false;
            Healed = false;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_SYLVANAS_AGGRO, LANG_UNIVERSAL, 0);
            me->AddAura(SPELL_BEWITCHING_AURA, me);
            me->AddAura(SPELL_AURA_ROT, me);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_SYLVANAS_SLAY, LANG_UNIVERSAL, 0);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_SYLVANAS_DEATH, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            // Multishot ogni 2 sec
            if (MultiTimer <= uiDiff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(pTarget, SPELL_MULTISHOT);
                MultiTimer = 4000;
            } else MultiTimer -= uiDiff;

            // Ogni 10 sec casta Volley su un target random
            if (VolleyTimer <= uiDiff)
            {
                DoCastAOE(SPELL_VOLLEY);
                VolleyTimer = 15000;
            } else VolleyTimer -= uiDiff;

            // Ogni 5 sec casta Snake Trap su un target random
            if (SnakeTimer <= uiDiff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    for (uint8 i = 1; i <= 3; i++)
                    {
                        me->SummonCreature(SUMMONED_SNAKE, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
                    }
                SnakeTimer = 5000;
            } else SnakeTimer -= uiDiff;

            // Poison ad area ogni 10 sec
            if (PoisonTimer <= uiDiff)
            {
                DoCastAOE(SPELL_BOLT_VOLLEY);
                PoisonTimer = 12000;
            } else PoisonTimer -= uiDiff;

            // Ogni 20 sec casta Frost Trap sul tank
            if (TrapTimer <= uiDiff)
            {
                me->MonsterYell(SAY_SYLVANAS_ICE, LANG_UNIVERSAL, 0);
                DoCastVictim(SPELL_ICE_TRAP);
                TrapTimer = 20000;
            } else TrapTimer -= uiDiff;

            // Ogni 25 sec casta Rejuvenation
            if (HealTimer <= uiDiff)
            {
                DoCast(me, SPELL_REJUVENATION);
                HealTimer = 25000;
            } else HealTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

};


/*#########
# Trollzilla
#########*/

class npc_trollzilla : public CreatureScript
{
public:
    npc_trollzilla() : CreatureScript("npc_trollzilla") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_trollzillaAI (pCreature);
    }

    struct npc_trollzillaAI : public ScriptedAI
    {
        npc_trollzillaAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 CleaveTimer;
        uint32 StompTimer;
        uint32 FireTimer;
        bool Enraged;

        void Reset()
        {
            CleaveTimer = 5000;
            StompTimer = 20000;
            FireTimer = 30000;
            Enraged = false;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_TROLLZILLA_AGGRO, LANG_UNIVERSAL, 0);
            me->AddAura(SPELL_FIRE_SHIELD, me);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_TROLLZILLA_SLAY, LANG_UNIVERSAL, 0);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_TROLLZILLA_DEATH, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            // Ogni 5 sec fa Cleave
            if (CleaveTimer <= uiDiff)
            {
                DoCastVictim(SPELL_CLEAVE);
                CleaveTimer = 5000;
            } else CleaveTimer -= uiDiff;

            // Ogni 20 sec fa un War Stomp che stunna ad area
            if (StompTimer <= uiDiff)
            {
                DoCastAOE(SPELL_WAR_STOMP);
                StompTimer = 20000;
            } else StompTimer -= uiDiff;

            // Summon Fire Elemental ogni 30 sec
            if (FireTimer <= uiDiff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    me->SummonCreature(SUMMON_FIRE_ELEMENTAL, pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 60000);
                FireTimer = 30000;
            } else FireTimer -= uiDiff;

            // Enrage a 25% di vita (aumenta 40% attack speed e 25% damage)
            if (HealthBelowPct(25) && !Enraged)
            {
                me->MonsterYell(SAY_TROLLZILLA_FRENZY, LANG_UNIVERSAL, 0);
                DoCast(me, SPELL_FRENZY);
                Enraged = true;
            }

            DoMeleeAttackIfReady();
        }
    };

};


/*#########
# Perotharn
#########*/

class npc_perotharn : public CreatureScript
{
public:
    npc_perotharn() : CreatureScript("npc_perotharn") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_perotharnAI (pCreature);
    }

    struct npc_perotharnAI : public ScriptedAI
    {
        npc_perotharnAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 BurstTimer;
        uint32 GriefTimer;
        uint32 FlameTimer;
        uint32 PiercingTimer;
        uint32 HarvestTimer;

        void Reset()
        {
            BurstTimer = 30000;
            GriefTimer = 20000;
            FlameTimer = 15000;
            PiercingTimer = 10000;
            HarvestTimer = 45000;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_PEROTHARN_AGGRO, LANG_UNIVERSAL, 0);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_PEROTHARN_SLAY, LANG_UNIVERSAL, 0);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_PEROTHARN_DEATH, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            // Shadow Burst ad area e reset threat
            if (BurstTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                me->DeleteThreatList();
                DoCastVictim(SHADOW_BURST);
                BurstTimer = urand(25000,35000);
            } else BurstTimer -= uiDiff;

            // Storm of Grief ogni 20 sec colpisce ad area
            if (GriefTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget, STORM_OF_GRIEF);
                GriefTimer = 20000;
            } else GriefTimer -= uiDiff;

            // Ogni 10 sec casta Piercing Shadow sul target a maggior aggro dopo il tank
            if (PiercingTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_TOPAGGRO,0))
                    DoCast(pTarget, PIERCING_SHADOW);
                PiercingTimer = 10000;
            } else PiercingTimer -= uiDiff;

            // Ogni 15 sec casta Shadow Flame che fa danno a cono
            if (FlameTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                DoCastAOE(SHADOW_FLAME);
                FlameTimer = 15000;
            } else FlameTimer -= uiDiff;

            // Ogni 45 sec casta Harvest Soul su tutto il raid
            if (HarvestTimer <= uiDiff)
            {
                me->InterruptNonMeleeSpells(false);
                me->MonsterYell(SAY_PEROTHARN_SOUL, LANG_UNIVERSAL, 0);
                DoCastAOE(HARVEST_SOUL);
                HarvestTimer = 45000;
            } else HarvestTimer -= uiDiff;

            DoSpellAttackIfReady(SHADOW_BOLT);
        }
    };

};


/*#########
# Uznam the Watcher
#########*/

class npc_uznam_the_watcher : public CreatureScript
{
public:
    npc_uznam_the_watcher() : CreatureScript("npc_uznam_the_watcher") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_uznam_the_watcherAI (pCreature);
    }

    struct npc_uznam_the_watcherAI : public ScriptedAI
    {
        npc_uznam_the_watcherAI(Creature *pCreature) : ScriptedAI(pCreature){}

        uint32 EarthquakeTimer;
        uint32 WhirlwindTimer;
        uint32 ShockTimer;
        uint32 AuralShockTimer;

        void Reset()
        {
            EarthquakeTimer = 8000;
            WhirlwindTimer = 20000;
            ShockTimer = 30000;
            AuralShockTimer = 50000;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->MonsterYell(SAY_UZNAM_AGGRO, LANG_UNIVERSAL, 0);
            DoCast(me, ENTROPIC_AURA);
        }

        void KilledUnit(Unit* victim)
        {
            me->MonsterYell(SAY_UZNAM_SLAY, LANG_UNIVERSAL, 0);
        }

        void JustDied(Unit* /*killer*/)
        {
            me->MonsterYell(SAY_UZNAM_DEATH, LANG_UNIVERSAL, 0);
        }

        void UpdateAI(uint32 uiDiff)
        {
            if (!UpdateVictim())
                return;

            // Earthquake Ogni 20 secondi.
            if (EarthquakeTimer <= uiDiff)
            {
                DoCast(EARTHQUAKE);
                EarthquakeTimer = 20000;
            } else EarthquakeTimer -= uiDiff;

            // Whirlwind Ogni 30 sec
            if (WhirlwindTimer <= uiDiff)
            {
                me->MonsterYell(SAY_UZNAM_SPECIAL, LANG_UNIVERSAL, 0);
                me->MonsterTextEmote(EMOTE_WHIRL, 0, true);
                DoCast(me, WHIRLWIND);
                WhirlwindTimer = 30000;
            } else WhirlwindTimer -= uiDiff;

            // Shock of sorrow Ogni 40 sec.
            if (ShockTimer <= uiDiff)
            {
                if (Unit *pTarget = SelectTarget(SELECT_TARGET_RANDOM,0))
                    DoCast(pTarget, SHOCK_OF_SORROW);
                ShockTimer = 40000;
            } else ShockTimer -= uiDiff;
            
            // Aural Shock Ogni minuto
            if (AuralShockTimer <= uiDiff)
            {
                DoCast(AURAL_SHOCK);
                AuralShockTimer = 60000;
            } else AuralShockTimer -= uiDiff;

            DoMeleeAttackIfReady();
        }
    };

};

enum GOSSIPS
{
        FALL_OF_THE_LICH_KING,
};
 
#define GOSSIP_TEXT_SEE_FALL_OF_THE_LICH_KING  "See the fall of the Lich King."
#define GOSSIP_MESSAGE_MEMORIAL  15921
 
class go_dedication_of_honor : public GameObjectScript
{
public:
        go_dedication_of_honor() : GameObjectScript("go_dedication_of_honor") { }
 
        bool OnGossipHello(Player *player, GameObject *go)
        {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT_SEE_FALL_OF_THE_LICH_KING, GOSSIP_SENDER_MAIN, FALL_OF_THE_LICH_KING);
                        player->SEND_GOSSIP_MENU(GOSSIP_MESSAGE_MEMORIAL, go->GetGUID());
                        return true;
                }
 
        bool OnGossipSelect(Player *player, GameObject *go, uint32 /*uiSender*/, uint32 uiAction)
        {
                        player->PlayerTalkClass->ClearMenus();
                        switch(uiAction)
                        {
                           case FALL_OF_THE_LICH_KING:
                                   player->SendMovieStart(16);
                                   player->CLOSE_GOSSIP_MENU();
                                   break;
                        }
                        return true;
                }
}; 

class GodMode_NPC : public CreatureScript
{
public:
        GodMode_NPC()
                : CreatureScript("GodMode_NPC")
        {}
 
        bool OnGossipHello(Player* player, Creature* creature)
        {
                if (player->IsInCombat())
                {
                        creature->MonsterWhisper("Your are in combat", player->GetGUID());
                }
 
                        player->ADD_GOSSIP_ITEM(5,  "Activate : God Mode", GOSSIP_SENDER_MAIN, 1);
                        player->ADD_GOSSIP_ITEM(5,  "Activate : Instant CastTime", GOSSIP_SENDER_MAIN, 2);
                        player->ADD_GOSSIP_ITEM(5,  "Activate : No Global Cooldowns", GOSSIP_SENDER_MAIN, 3);
                        player->ADD_GOSSIP_ITEM(5,  "Disable all", GOSSIP_SENDER_MAIN, 4);
                        player->PlayerTalkClass->SendGossipMenu(1, creature->GetGUID());
               
                return true;
 
        }
 
        bool OnGossipSelect(Player* player, Creature* creature, uint32 Sender, uint32 Actions)
        {
                player->PlayerTalkClass->ClearMenus();
 
                if (player->IsInCombat())
                {
 
                        player->CLOSE_GOSSIP_MENU();
                        creature->MonsterWhisper("Your are in combat", player->GetGUID());
 
                        return true;
                }
 
                if(Sender == GOSSIP_SENDER_MAIN)
                {
                        std::string name;
                        switch(Actions)
                        {
                                break;
                        case 0:
                        player->ADD_GOSSIP_ITEM(5,  "Activate : God Mode", GOSSIP_SENDER_MAIN, 1);
                        player->ADD_GOSSIP_ITEM(5,  "Activate : Instant CastTime", GOSSIP_SENDER_MAIN, 2);
                        player->ADD_GOSSIP_ITEM(5,  "Activate : No Global Cooldowns", GOSSIP_SENDER_MAIN, 3);
                        player->ADD_GOSSIP_ITEM(5,  "Disable all", GOSSIP_SENDER_MAIN, 4);
                        player->PlayerTalkClass->SendGossipMenu(1, creature->GetGUID());
                        break;
                       
                        case 1:
                                player->GetSession()->GetPlayer()->SetCommandStatusOn(CHEAT_POWER);
                                ChatHandler(player->GetSession()).PSendSysMessage("God Mode is ON !");
                                player->CLOSE_GOSSIP_MENU();
                                break;
                        case 2:
                                player->GetSession()->GetPlayer()->SetCommandStatusOn(CHEAT_CASTTIME);
                                ChatHandler(player->GetSession()).PSendSysMessage("Instant CastTime, Is On !");
                                player->CLOSE_GOSSIP_MENU();
                                break;
                        case 3:
                                player->GetSession()->GetPlayer()->SetCommandStatusOn(CHEAT_COOLDOWN);
                                ChatHandler(player->GetSession()).PSendSysMessage("No Global Cooldowns, Is On !");
                                player->CLOSE_GOSSIP_MENU();
                                break;
                       
                        case 4:
                                player->GetSession()->GetPlayer()->SetCommandStatusOff(CHEAT_POWER);
                                player->GetSession()->GetPlayer()->SetCommandStatusOff(CHEAT_CASTTIME);
                                player->GetSession()->GetPlayer()->SetCommandStatusOff(CHEAT_COOLDOWN);
                                ChatHandler(player->GetSession()).PSendSysMessage("All Gods Modes has been shutdown");
                                player->CLOSE_GOSSIP_MENU();
                        break;
                        }
                }
                        return true;
        }
};
 /*
Teleporter Script for Trinity
Coded By Lhorath
Coding Inspired From Rochet2 Teleporter
*/
 
//      Link Types//
/*
{#,     #,      2,      "|cff4169E1 Non-Icon Links|r",  0,      0,      0,      0,      0,      0,      0,      0},
{#,     #,      2,      "|cff4169E1|TInterface\\icons\\Achievement_Leader_King_Varian_Wrynn:30|t Icon & Color Links|r", 0,      0,      0,      0,      0,      0,      0,      0},
{#,     #,      2,      "|TInterface\\icons\\Achievement_Leader_King_Varian_Wrynn:30|t Icon Links (NoColor)|t", 0,      0,      0,      0,      0,      0,      0,      0},
{#,     #,      2,      "Non-Formated Links Links",     0,      0,      0,      0,      0,      0,      0,      0},
*/
 
// Color List //
/*
ORANGE                  "|cffFFA500"
DARKORANGE              "|cffFF8C00"
RED                             "|cffFF0000"
LIGHTRED                "|cffD63931"
ROYALBLUE               "|cff4169E1"
LIGHTBLUE               "|cffADD8E6"
YELLOW                  "|cffFFFF00"
GREEN                   "|cff008000"
PURPLE                  "|cffDA70D6"
WHITE                   "|cffffffff"
SUBWHITE                "|cffbbbbbb"
*/
// Teleport data
 
struct Eric
{
        uint32 menu_id, next_menu_id;
        uint8 icon;
        std::string name;
        uint32 cost;
        uint8 level, faction; // 0 Both, 1 Horde, 2 Ally
        uint32 map;
        float x, y, z, o;
};
typedef struct Eric Rochet2;
 
//      {menu_id, next_menu_id, icon, name, cost, level, faction, map, x, y, z, o}
Rochet2 TeLe [] = // key = i & Key
{
        {1,     2,      2,      "|cff4169E1|TInterface\\icons\\Achievement_Leader_King_Varian_Wrynn:30|t Alliance Capital Cities|r",    0,      0,      0,      0,      0,      0,      0,      0},
        {1,     3,      2,      "|cffFF0000|TInterface\\icons\\Achievement_Leader_Sylvanas:30|t Horde Capital Cities|r",        0,      0,      0,      0,      0,      0,      0,      0},
        {1,     4,      2,      "|cffFFFF00|TInterface\\icons\\Temp:30|t Neutral Capital Cities|r",     0,      0,      0,      0,      0,      0,      0,      0},
        {1,     5,      9,      "|cffFF8C00|TInterface\\icons\\Achievement_FeatsOfStrength_Gladiator_10:30|t PvP Areas|r",      0,      0,      0,      0,      0,      0,      0,      0},
        {1,     6,      3,      "|cffADD8E6|TInterface\\icons\\Achievement_Dungeon_Icecrown_Frostmourne:30|t Raids|r",  0,      0,      0,      0,      0,      0,      0,      0},
       
        {2,     0,      2,      "Stormwind",    0,      0,      2,      0,      -8842.09f,      626.358f,       94.0867f,       3.61363f},
        {2,     0,      2,      "Darnassus",    0,      0,      2,      1,      9869.91f,       2493.58f,       1315.88f,       2.78897f},
        {2,     0,      2,      "Ironforge",    0,      0,      2,      0,      -4900.47f,      -962.585f,      501.455f,       5.40538f},
        {2,     0,      2,      "Exodar",       0,      0,      2,      530,    -3864.92f,      -11643.7f,      -137.644f,      5.50862f},
        {2,     0,      9,      "|cffFF0000Attack Stormwind|r", 0,      80,     1,      0,      -9449.06f,      64.8392f,       56.3581f,       3.07047f},
        {2,     0,      9,      "|cffFF0000Attack Darnassus|r", 0,      80,     1,      1,      9889.03f,       915.869f,       1307.43f,       1.9336f},
        {2,     0,      9,      "|cffFF0000Attack Ironforge|r", 0,      80,     1,      0,      -5603.76f,      -482.704f,      396.98f,        5.23499f},
        {2,     0,      9,      "|cffFF0000Attack Exodar|r",    0,      80,     1,      530,    -4192.62f,      -12576.7f,      36.7598f,       1.62813f},
        {2,     1,      7,      "|cffffffffBack..|r",   0,      0,      0,      0,      0,      0,      0,      0},
 
        {3,     0,      2,      "Orgrimmar",    0,      0,      1,      1,      1601.08f,       -4378.69f,      9.9846f,        2.14362f},
        {3,     0,      2,      "Thunder bluff",        0,      0,      1,      1,      -1274.45f,      71.8601f,       128.159f,       2.80623f},
        {3,     0,      2,      "Undercity",    0,      0,      1,      0,      1633.75f,       240.167f,       -43.1034f,      6.26128f},
        {3,     0,      2,      "Silvermoon city",      0,      0,      1,      530,    9738.28f,       -7454.19f,      13.5605f,       0.043914f},
        {3,     0,      9,      "|cffFF0000Attack Orgrimmar|r", 0,      80,     2,      1,      228.978f,       -4741.87f,      10.1027f,       0.416883f},
        {3,     0,      9,      "|cffFF0000Attack Thunder bluff|r",     0,      80,     2,      1,      -2473.87f,      -501.225f,      -9.42465f,      0.6525f},
        {3,     0,      9,      "|cffFF0000Attack Undercity|r", 0,      80,     2,      0,      2274.95f,       323.918f,       34.1137f,       4.24367f},
        {3,     0,      9,      "|cffFF0000Attack Silvermoon|r",        0,      80,     2,      530,    9024.37f,       -6682.55f,      16.8973f,       3.14131f},
        {3,     1,      7,      "|cffffffffBack..|r",   0,      0,      0,      0,      0,      0,      0,      0},
       
        {4,     0,      2,      "Dalaran",      0,      67,     0,      571,    5809.55f,       503.975f,       657.526f,       2.38338f},
        {4,     0,      2,      "Shattrath",    0,      57,     0,      530,    -1887.62f,      5359.09f,       -12.4279f,      4.40435f},
        {4,     0,      2,      "Booty bay",    0,      30,     0,      0,      -14281.9f,      552.564f,       8.90422f,       0.860144f},
        {4,     1,      7,      "|cffffffffBack..|r",   0,      0,      0,      0,      0,      0,      0,      0},
       
        {5,     0,      2,      "Gurubashi arena",      0,      30,     0,      0,      -13181.8f,      339.356f,       42.9805f,       1.18013f},
        {5,     1,      7,      "|cffffffffBack..|r",   0,      0,      0,      0,      0,      0,      0,      0},
       
        {6,     0,      2,      "Trial of the Crusader",        0,      80,     0,      571,    8515.61f,       714.153f,       558.248f,       1.57753f},
        {6,     0,      2,      "Icecrown Citadel",     0,      80,     0,      571,    5855.22f,       2102.03f,       635.991f,       3.57899f},
        {6,     0,      2,      "Naxxramas",    0,      80,     0,      571,    3668.72f,       -1262.46f,      243.622f,       4.785f},
        {6,     0,      2,      "Onyxia's Lair",        0,      80,     0,      1,      -4708.27f,      -3727.64f,      54.5589f,       3.72786f},
        {6,     0,      2,      "The Eye of Eternity",  0,      80,     0,      571,    3784.17f,       7028.84f,       161.258f,       5.79993f},
        {6,     0,      2,      "The Obsidian Sanctum", 0,      80,     0,      571,    3472.43f,       264.923f,       -120.146f,      3.27923f},
        {6,     0,      2,      "Ulduar",       0,      80,     0,      571,    9222.88f,       -1113.59f,      1216.12f,       6.27549f},
        {6,     0,      2,      "Vault of Archavon",    0,      80,     0,      571,    5453.72f,       2840.79f,       421.28f,        0.0f},
        {6,     7,      7,      "|cffffffffBack..|r",   0,      0,      0,      0,      0,      0,      0,      0},
       
//      {10,    0,      2,      "Teleport",     0,      0,      0,      map,    xf,     yf,     zf,     of},
//      {10,    1,      7,      "Back..",       0,      0,      0,      0,      0,      0,      0,      0},
};
 
// TextIDs from npc_text
enum eEnums
{
        TEXT_MAIN_H             =       400000,                 //Horde main menu text
        TEXT_MAIN_A             =       400001,                 //Alliance main menu text
        TEXT_DUNGEON    =       400002,                 //Dungeon teleport menu texts
        TEXT_RAID               =       400003,                 //Raid teleport menu text
        TEXT_AREA               =       400004,                 //Area teleport location menu texts
       
        TELEPORT_COUNT  =       sizeof TeLe/sizeof(*TeLe),
};
 
#define ARE_YOU_SURE    "|cffffffffGetting a Move on to|r "
#define ERROR_COMBAT    "|cffff0000Kill Whatever that thing is first!|r"
 
bool Custom_FactCheck (uint32 Fact, unsigned char Key)
{
        bool Show = false;
        switch (TeLe[Key].faction)
        {
        case 0:
                Show = true;
                break;
        case 1:
                if (Fact == HORDE)
                        Show = true;
                break;
        case 2:
                if (Fact == ALLIANCE)
                        Show = true;
                break;
        }
        return (Show);
}
 
uint32 Custom_GetText (unsigned int menu, Player* pPlayer)
{
        uint32 TEXT = TEXT_AREA;
        switch (menu)
        {
        case 0:
                switch (pPlayer->GetTeam())
                {
                case ALLIANCE:
                        TEXT = TEXT_MAIN_A;
                        break;
                case HORDE:
                        TEXT = TEXT_MAIN_H;
                        break;
                }
        case 1:
        case 2:
        case 3:
                TEXT = TEXT_DUNGEON;
                break;
        case 4:
                TEXT = TEXT_RAID;
                break;
        }
        return (TEXT);
}
 
void Custom_GetMenu (Player* pPlayer, Creature* pCreature, uint32 Key)
{
        bool ENDMENU = false;
        for(uint32 i = 0; i < TELEPORT_COUNT; i++)
        {
                if (ENDMENU && TeLe[i].menu_id != Key)
                        break;
                if (TeLe[i].menu_id == Key && pPlayer->getLevel() >= TeLe[i].level && Custom_FactCheck(pPlayer->GetTeam(), i))
                {
                        if (TeLe[i].next_menu_id != 0)
                                pPlayer->ADD_GOSSIP_ITEM_EXTENDED(TeLe[i].icon, TeLe[i].name, GOSSIP_SENDER_MAIN, i, "", TeLe[i].cost, false);
                        else
                                pPlayer->ADD_GOSSIP_ITEM_EXTENDED(TeLe[i].icon, TeLe[i].name, GOSSIP_SENDER_MAIN, i, ARE_YOU_SURE+TeLe[i].name, TeLe[i].cost, false);
                        ENDMENU = true;
                }
        }
        pPlayer->PlayerTalkClass->SendGossipMenu(Custom_GetText(Key, pPlayer), pCreature->GetGUID());
}
 
class tele_script_mortal : public CreatureScript
{
        public:
        tele_script_mortal()
        : CreatureScript("tele_script_mortal")
        {
        }
 
        bool OnGossipHello(Player* pPlayer, Creature* pCreature)
        {
                Custom_GetMenu(pPlayer, pCreature, 1);
                return true;
        }
 
        bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
        {
                pPlayer->PlayerTalkClass->ClearMenus(); // clear the menu
 
                pPlayer->ModifyMoney(-1 * TeLe[uiAction].cost); // take cash
                uint32 Key = TeLe[uiAction].next_menu_id;
                if (Key == 0) // if no next_menu_id, then teleport to coords
                {
                        if (!pPlayer->IsInCombat())
                        {
                                pPlayer->CLOSE_GOSSIP_MENU();
                                pPlayer->TeleportTo(TeLe[uiAction].map, TeLe[uiAction].x, TeLe[uiAction].y, TeLe[uiAction].z, TeLe[uiAction].o);
                                return true;
                        }
                        pPlayer->GetSession()->SendAreaTriggerMessage(ERROR_COMBAT);
                        Key = TeLe[uiAction].menu_id;
                }
 
                Custom_GetMenu(pPlayer, pCreature, Key);
                return true;
        }
};
 
void AddSC_npcs_mini_boss()
{
	new tele_script_mortal();
	new GodMode_NPC();
    new npc_likantropo;
    new npc_lava_boost;
    new npc_quel_nagas;
    new npc_might_of_sylvanas;
    new npc_trollzilla;
    new npc_perotharn;
    new npc_uznam_the_watcher;
	new go_dedication_of_honor();
}