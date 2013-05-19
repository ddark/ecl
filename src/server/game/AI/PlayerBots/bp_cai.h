#ifndef _PLAYERBOTCLASSAI_H
#define _PLAYERBOTCLASSAI_H

#include "Common.h"

class PlayerbotAI;
class Player;
class Unit;

enum CombatManeuverReturns
{
    // TODO: RETURN_NO_ACTION_UNKNOWN is not part of ANY_OK or ANY_ERROR. It's also bad form and should be eliminated ASAP.
    RETURN_NO_ACTION_OK                 = 0x01, // No action taken during this combat maneuver, as intended (just wait, etc...)
    RETURN_NO_ACTION_UNKNOWN            = 0x02, // No action taken during this combat maneuver, unknown reason
    RETURN_NO_ACTION_ERROR              = 0x04, // No action taken due to error
    RETURN_NO_ACTION_INVALIDTARGET      = 0x08, // No action taken - invalid target
    RETURN_FINISHED_FIRST_MOVES         = 0x10, // Last action of first-combat-maneuver finished, continue onto next-combat-maneuver
    RETURN_CONTINUE                     = 0x20, // Continue first moves; normal return value for next-combat-maneuver
    RETURN_NO_ACTION_INSUFFICIENT_POWER = 0x40, // No action taken due to insufficient power (rage, focus, mana, runes)
    RETURN_ANY_OK                       = 0x31, // All the OK values bitwise OR'ed
    RETURN_ANY_ACTION                   = 0x30, // All returns that result in action (which should also be 'OK')
    RETURN_ANY_ERROR                    = 0x4C  // All the ERROR values bitwise OR'ed
};

enum MainSpec
{
    MAGE_SPEC_FIRE              = 41,
    MAGE_SPEC_FROST             = 61,
    MAGE_SPEC_ARCANE            = 81,
    WARRIOR_SPEC_ARMS           = 161,
    WARRIOR_SPEC_PROTECTION     = 163,
    WARRIOR_SPEC_FURY           = 164,
    ROGUE_SPEC_COMBAT           = 181,
    ROGUE_SPEC_ASSASSINATION    = 182,
    ROGUE_SPEC_SUBTELTY         = 183,
    PRIEST_SPEC_DISCIPLINE      = 201,
    PRIEST_SPEC_HOLY            = 202,
    PRIEST_SPEC_SHADOW          = 203,
    SHAMAN_SPEC_ELEMENTAL       = 261,
    SHAMAN_SPEC_RESTORATION     = 262,
    SHAMAN_SPEC_ENHANCEMENT     = 263,
    DRUID_SPEC_FERAL            = 281,
    DRUID_SPEC_RESTORATION      = 282,
    DRUID_SPEC_BALANCE          = 283,
    WARLOCK_SPEC_DESTRUCTION    = 301,
    WARLOCK_SPEC_AFFLICTION     = 302,
    WARLOCK_SPEC_DEMONOLOGY     = 303,
    HUNTER_SPEC_BEASTMASTERY    = 361,
    HUNTER_SPEC_SURVIVAL        = 362,
    HUNTER_SPEC_MARKSMANSHIP    = 363,
    PALADIN_SPEC_RETRIBUTION    = 381,
    PALADIN_SPEC_HOLY           = 382,
    PALADIN_SPEC_PROTECTION     = 383,
    DEATHKNIGHT_SPEC_BLOOD      = 398,
    DEATHKNIGHT_SPEC_FROST      = 399,
    DEATHKNIGHT_SPEC_UNHOLY     = 400
};

class PlayerbotClassAI
{
    public:
        PlayerbotClassAI(Player* const master, Player* const bot, PlayerbotAI* const ai);
        virtual ~PlayerbotClassAI();

        //// all combat actions go here
        //CombatManeuverReturns DoFirstCombatManeuver(Unit*);
        //CombatManeuverReturns DoNextCombatManeuver(Unit*);
        //bool Pull() { /*DEBUG_LOG("[PlayerbotAI]: Warning: Using PlayerbotClassAI::Pull() rather than class specific function");*/ return false; }

        //// all non combat actions go here, ex buffs, heals, rezzes
        //virtual void DoNonCombatActions();
        //bool EatDrinkBandage(bool bMana = true, uint8 foodPercent = 50, uint8 drinkPercent = 50, uint8 bandagePercent = 70);

        // Utilities
        Player* GetMaster() const { return m_master; }
        Player* GetPlayerBot() const { return me; }
        PlayerbotAI* GetAI() const { return m_ai; }
        virtual void DoCombatActions() {}
        virtual void UpdateGroupActions(uint32 const /*diff*/) {}
        virtual void SendClassDebugInfo() {}
        //bool CanPull() const;
        //bool CastHoTOnTank();
        //time_t GetWaitUntil() const { return m_WaitUntil; }
        //void SetWait(uint8 t);
        //void ClearWait() { m_WaitUntil = 0; }
        ////void SetWaitUntil(time_t t) { m_WaitUntil = t; }

    protected:
        //CombatManeuverReturns DoFirstCombatManeuverPVE(Unit*);
        //CombatManeuverReturns DoNextCombatManeuverPVE(Unit*);
        //CombatManeuverReturns DoFirstCombatManeuverPVP(Unit*);
        //CombatManeuverReturns DoNextCombatManeuverPVP(Unit*);

        CombatManeuverReturns CastSpellNoRanged(uint32 /*nextAction*/, Unit* /*pTarget*/) { return RETURN_ANY_ERROR; }
        CombatManeuverReturns CastSpellWand(uint32 /*nextAction*/, Unit* /*pTarget*/, uint32 /*SHOOT*/) { return RETURN_ANY_ERROR; }
        //virtual CombatManeuverReturns HealPlayer(Player* target);
        //CombatManeuverReturns Buff(bool (*BuffHelper)(PlayerbotAI*, uint32, Unit*), uint32 spellId, uint32 type = JOB_ALL, bool bMustBeOOC = true);
        Player* GetHealTarget() { return NULL; }
        //Player* GetResurrectionTarget(JOB_TYPE type = JOB_ALL, bool bMustBeOOC = true);
        //JOB_TYPE GetTargetJob(Player* target);

        //// These values are used in GetHealTarget and can be overridden per class (to accomodate healing spell health checks)
        //uint8 m_MinHealthPercentTank;
        //uint8 m_MinHealthPercentHealer;
        //uint8 m_MinHealthPercentDPS;
        //uint8 m_MinHealthPercentMaster;

        //time_t m_WaitUntil;

        Player* const m_master;
        Player* const me;
        PlayerbotAI* const m_ai;

        //// first aid
        //uint32 RECENTLY_BANDAGED;
};

#endif
