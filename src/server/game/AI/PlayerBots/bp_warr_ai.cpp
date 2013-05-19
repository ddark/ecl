/*
   Name    : PlayerbotWarriorAI.cpp
   Complete: maybe around 37%
   Author  : Natsukawa
   Version : 0.39
 */
#include "bp_ai.h"
#include "bp_warr_ai.h"
#include "Player.h"

class PlayerbotAI;
PlayerbotWarriorAI::PlayerbotWarriorAI(Player* const master, Player* const bot, PlayerbotAI* const ai) : PlayerbotClassAI(master, bot, ai)
{
    AUTO_SHOT               = PlayerbotAI::InitSpell(me, AUTO_SHOT_2); // GENERAL

    BATTLE_STANCE           = PlayerbotAI::InitSpell(me, BATTLE_STANCE_1); //ARMS
    CHARGE                  = PlayerbotAI::InitSpell(me, CHARGE_1); //ARMS
    OVERPOWER               = PlayerbotAI::InitSpell(me, OVERPOWER_1); // ARMS
    HEROIC_STRIKE           = PlayerbotAI::InitSpell(me, HEROIC_STRIKE_1); //ARMS
    REND                    = PlayerbotAI::InitSpell(me, REND_1); //ARMS
    THUNDER_CLAP            = PlayerbotAI::InitSpell(me, THUNDER_CLAP_1);  //ARMS
    HAMSTRING               = PlayerbotAI::InitSpell(me, HAMSTRING_1);  //ARMS
    MOCKING_BLOW            = PlayerbotAI::InitSpell(me, MOCKING_BLOW_1);  //ARMS
    RETALIATION             = PlayerbotAI::InitSpell(me, RETALIATION_1);  //ARMS
    SWEEPING_STRIKES        = PlayerbotAI::InitSpell(me, SWEEPING_STRIKES_1); //ARMS
    MORTAL_STRIKE           = PlayerbotAI::InitSpell(me, MORTAL_STRIKE_1);  //ARMS
    BLADESTORM              = PlayerbotAI::InitSpell(me, BLADESTORM_1);  //ARMS
    HEROIC_THROW            = PlayerbotAI::InitSpell(me, HEROIC_THROW_1);  //ARMS
    SHATTERING_THROW        = PlayerbotAI::InitSpell(me, SHATTERING_THROW_1);  //ARMS
    BLOODRAGE               = PlayerbotAI::InitSpell(me, BLOODRAGE_1); //PROTECTION
    DEFENSIVE_STANCE        = PlayerbotAI::InitSpell(me, DEFENSIVE_STANCE_1); //PROTECTION
    DEVASTATE               = PlayerbotAI::InitSpell(me, DEVASTATE_1); //PROTECTION
    SUNDER_ARMOR            = PlayerbotAI::InitSpell(me, SUNDER_ARMOR_1); //PROTECTION
    TAUNT                   = PlayerbotAI::InitSpell(me, TAUNT_1); //PROTECTION
    SHIELD_BASH             = PlayerbotAI::InitSpell(me, SHIELD_BASH_1); //PROTECTION
    REVENGE                 = PlayerbotAI::InitSpell(me, REVENGE_1); //PROTECTION
    SHIELD_BLOCK            = PlayerbotAI::InitSpell(me, SHIELD_BLOCK_1); //PROTECTION
    DISARM                  = PlayerbotAI::InitSpell(me, DISARM_1); //PROTECTION
    SHIELD_WALL             = PlayerbotAI::InitSpell(me, SHIELD_WALL_1); //PROTECTION
    SHIELD_SLAM             = PlayerbotAI::InitSpell(me, SHIELD_SLAM_1); //PROTECTION
    VIGILANCE               = PlayerbotAI::InitSpell(me, VIGILANCE_1); //PROTECTION
    DEVASTATE               = PlayerbotAI::InitSpell(me, DEVASTATE_1); //PROTECTION
    SHOCKWAVE               = PlayerbotAI::InitSpell(me, SHOCKWAVE_1); //PROTECTION
    CONCUSSION_BLOW         = PlayerbotAI::InitSpell(me, CONCUSSION_BLOW_1); //PROTECTION
    SPELL_REFLECTION        = PlayerbotAI::InitSpell(me, SPELL_REFLECTION_1); //PROTECTION
    LAST_STAND              = PlayerbotAI::InitSpell(me, LAST_STAND_1); //PROTECTION
    BATTLE_SHOUT            = PlayerbotAI::InitSpell(me, BATTLE_SHOUT_1); //FURY
    DEMORALIZING_SHOUT      = PlayerbotAI::InitSpell(me, DEMORALIZING_SHOUT_1); //FURY
    CLEAVE                  = PlayerbotAI::InitSpell(me, CLEAVE_1); //FURY
    INTIMIDATING_SHOUT      = PlayerbotAI::InitSpell(me, INTIMIDATING_SHOUT_1); //FURY
    EXECUTE                 = PlayerbotAI::InitSpell(me, EXECUTE_1); //FURY
    CHALLENGING_SHOUT       = PlayerbotAI::InitSpell(me, CHALLENGING_SHOUT_1); //FURY
    SLAM                    = PlayerbotAI::InitSpell(me, SLAM_1); //FURY
    BERSERKER_STANCE        = PlayerbotAI::InitSpell(me, BERSERKER_STANCE_1); //FURY
    INTERCEPT               = PlayerbotAI::InitSpell(me, INTERCEPT_1); //FURY
    DEATH_WISH              = PlayerbotAI::InitSpell(me, DEATH_WISH_1); //FURY
    BERSERKER_RAGE          = PlayerbotAI::InitSpell(me, BERSERKER_RAGE_1); //FURY
    WHIRLWIND               = PlayerbotAI::InitSpell(me, WHIRLWIND_1); //FURY
    PUMMEL                  = PlayerbotAI::InitSpell(me, PUMMEL_1); //FURY
    BLOODTHIRST             = PlayerbotAI::InitSpell(me, BLOODTHIRST_1); //FURY
    RECKLESSNESS            = PlayerbotAI::InitSpell(me, RECKLESSNESS_1); //FURY
    RAMPAGE                 = 0; // passive
    HEROIC_FURY             = PlayerbotAI::InitSpell(me, HEROIC_FURY_1); //FURY
    COMMANDING_SHOUT        = PlayerbotAI::InitSpell(me, COMMANDING_SHOUT_1); //FURY
    ENRAGED_REGENERATION    = PlayerbotAI::InitSpell(me, ENRAGED_REGENERATION_1); //FURY
    PIERCING_HOWL           = PlayerbotAI::InitSpell(me, PIERCING_HOWL_1); //FURY

    //RECENTLY_BANDAGED       = 11196; // first aid check

    // racial
    GIFT_OF_THE_NAARU       = PlayerbotAI::InitSpell(me, GIFT_OF_THE_NAARU_WARRIOR); // draenei
    STONEFORM               = PlayerbotAI::InitSpell(me, STONEFORM_ALL); // dwarf
    ESCAPE_ARTIST           = PlayerbotAI::InitSpell(me, ESCAPE_ARTIST_ALL); // gnome
    EVERY_MAN_FOR_HIMSELF   = PlayerbotAI::InitSpell(me, EVERY_MAN_FOR_HIMSELF_ALL); // human
    SHADOWMELD              = PlayerbotAI::InitSpell(me, SHADOWMELD_ALL); // night elf
    BLOOD_FURY              = PlayerbotAI::InitSpell(me, BLOOD_FURY_MELEE_CLASSES); // orc
    WAR_STOMP               = PlayerbotAI::InitSpell(me, WAR_STOMP_ALL); // tauren
    BERSERKING              = PlayerbotAI::InitSpell(me, BERSERKING_ALL); // troll
    WILL_OF_THE_FORSAKEN    = PlayerbotAI::InitSpell(me, WILL_OF_THE_FORSAKEN_ALL); // undead

    //Procs
    SLAM_PROC               = PlayerbotAI::InitSpell(me, SLAM_PROC_1);
    BLOODSURGE              = PlayerbotAI::InitSpell(me, BLOODSURGE_1);
    TASTE_FOR_BLOOD         = PlayerbotAI::InitSpell(me, TASTE_FOR_BLOOD_1);
    SUDDEN_DEATH            = PlayerbotAI::InitSpell(me, SUDDEN_DEATH_1);
}
PlayerbotWarriorAI::~PlayerbotWarriorAI() {}

CombatManeuverReturns PlayerbotWarriorAI::DoFirstCombatManeuver(Unit* pTarget)
{
    //// There are NPCs in BGs and Open World PvP, so don't filter this on PvP scenarios (of course if PvP targets anyone but tank, all bets are off anyway)
    //// Wait until the tank says so, until any non-tank gains aggro or X seconds - whichever is shortest
    //if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TEMP_WAIT_TANKAGGRO)
    //{
    //    if (m_WaitUntil > m_ai->CurrentTime() && m_ai->GroupTankHoldsAggro())
    //    {
    //        if (PlayerbotAI::ORDERS_TANK & m_ai->GetCombatOrder())
    //        {
    //            if (pTarget->GetCombatReach() <= ATTACK_DISTANCE)
    //            {
    //                // Set everyone's UpdateAI() waiting to 2 seconds
    //                m_ai->SetGroupIgnoreUpdateTime(2);
    //                // Clear their TEMP_WAIT_TANKAGGRO flag
    //                m_ai->ClearGroupCombatOrder(PlayerbotAI::ORDERS_TEMP_WAIT_TANKAGGRO);
    //                // Start attacking, force target on current target
    //                m_ai->Attack(m_ai->GetCurrentTarget());

    //                // While everyone else is waiting 2 second, we need to build up aggro, so don't return
    //            }
    //            else
    //            {
    //                // TODO: add check if target is ranged
    //                return RETURN_NO_ACTION_OK; // wait for target to get nearer
    //            }
    //        }
    //        else
    //            return RETURN_NO_ACTION_OK; // wait it out
    //    }
    //    else
    //    {
    //        m_ai->ClearGroupCombatOrder(PlayerbotAI::ORDERS_TEMP_WAIT_TANKAGGRO);
    //    }
    //}

    //if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TEMP_WAIT_OOC)
    //{
    //    if (m_WaitUntil > m_ai->CurrentTime() && !m_ai->IsGroupInCombat())
    //        return RETURN_NO_ACTION_OK; // wait it out
    //    else
    //        m_ai->ClearGroupCombatOrder(PlayerbotAI::ORDERS_TEMP_WAIT_OOC);
    //}

    //switch (m_ai->GetScenarioType())
    //{
    //    case PlayerbotAI::SCENARIO_PVP_DUEL:
    //    case PlayerbotAI::SCENARIO_PVP_BG:
    //    case PlayerbotAI::SCENARIO_PVP_ARENA:
    //    case PlayerbotAI::SCENARIO_PVP_OPENWORLD:
    //        return DoFirstCombatManeuverPVP(pTarget);
    //    case PlayerbotAI::SCENARIO_PVE:
    //    case PlayerbotAI::SCENARIO_PVE_ELITE:
    //    case PlayerbotAI::SCENARIO_PVE_RAID:
    //    default:
    //        return DoFirstCombatManeuverPVE(pTarget);
    //        break;
    //}

    return RETURN_NO_ACTION_ERROR;
}

CombatManeuverReturns PlayerbotWarriorAI::DoFirstCombatManeuverPVE(Unit* pTarget)
{
    //if (!m_ai)  return RETURN_NO_ACTION_ERROR;
    //if (!m_bot) return RETURN_NO_ACTION_ERROR;

    //float fTargetDist = pTarget->GetCombatReach();

    //if (DEFENSIVE_STANCE && (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TANK))
    //{
    //    if (!m_bot->HasAura(DEFENSIVE_STANCE, EFFECT_0) && m_ai->CastSpell(DEFENSIVE_STANCE))
    //        return RETURN_CONTINUE;
    //    else if (TAUNT > 0 && m_bot->HasAura(DEFENSIVE_STANCE, EFFECT_0) && m_ai->CastSpell(TAUNT, *pTarget))
    //        return RETURN_FINISHED_FIRST_MOVES;
    //}

    //if (BERSERKER_STANCE)
    //{
    //    if (!m_bot->HasAura(BERSERKER_STANCE, EFFECT_0) && m_ai->CastSpell(BERSERKER_STANCE))
    //        return RETURN_CONTINUE;
    //    if (BLOODRAGE > 0 && m_bot->HasAura(BERSERKER_STANCE, EFFECT_0) && m_bot->GetPower(POWER_RAGE)/10 <= 10)
    //        return m_ai->CastSpell(BLOODRAGE) ? RETURN_FINISHED_FIRST_MOVES : RETURN_NO_ACTION_ERROR;
    //    if (INTERCEPT > 0 && m_bot->HasAura(BERSERKER_STANCE, EFFECT_0))
    //    {
    //        if (fTargetDist < 8.0f)
    //            return RETURN_NO_ACTION_OK;
    //        else if (fTargetDist > 25.0f)
    //            return RETURN_CONTINUE; // wait to come into range
    //        else if (INTERCEPT > 0 && m_ai->CastSpell(INTERCEPT, *pTarget))
    //        {
    //            float x, y, z;
    //            pTarget->GetContactPoint(m_bot, x, y, z, 3.666666f);
    //            m_bot->Relocate(x, y, z);
    //            return RETURN_FINISHED_FIRST_MOVES;
    //        }
    //    }
    //}

    //if (BATTLE_STANCE)
    //{
    //    if (!m_bot->HasAura(BATTLE_STANCE, EFFECT_0) && m_ai->CastSpell(BATTLE_STANCE))
    //        return RETURN_CONTINUE;
    //    if (CHARGE > 0 && m_bot->HasAura(BATTLE_STANCE, EFFECT_0))
    //    {
    //        if (fTargetDist < 8.0f)
    //            return RETURN_NO_ACTION_OK;
    //        if (fTargetDist > 25.0f)
    //            return RETURN_CONTINUE; // wait to come into range
    //        else if (CHARGE > 0 && m_ai->CastSpell(CHARGE, *pTarget))
    //        {
    //            float x, y, z;
    //            pTarget->GetContactPoint(m_bot, x, y, z, 3.666666f);
    //            m_bot->Relocate(x, y, z);
    //            return RETURN_FINISHED_FIRST_MOVES;
    //        }
    //    }
    //}

    return RETURN_NO_ACTION_OK;
}

// TODO: blatant copy of PVE for now, please PVP-port it
CombatManeuverReturns PlayerbotWarriorAI::DoFirstCombatManeuverPVP(Unit *pTarget)
{
    //if (!m_ai)  return RETURN_NO_ACTION_ERROR;
    //if (!m_bot) return RETURN_NO_ACTION_ERROR;

    //float fTargetDist = pTarget->GetCombatReach();

    //if (DEFENSIVE_STANCE && (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TANK))
    //{
    //    if (!m_bot->HasAura(DEFENSIVE_STANCE, EFFECT_0) && m_ai->CastSpell(DEFENSIVE_STANCE))
    //        return RETURN_CONTINUE;
    //    else if (TAUNT > 0 && m_bot->HasAura(DEFENSIVE_STANCE, EFFECT_0) && m_ai->CastSpell(TAUNT, *pTarget))
    //        return RETURN_FINISHED_FIRST_MOVES;
    //}

    //if (BERSERKER_STANCE)
    //{
    //    if (!m_bot->HasAura(BERSERKER_STANCE, EFFECT_0) && m_ai->CastSpell(BERSERKER_STANCE))
    //        return RETURN_CONTINUE;
    //    if (BLOODRAGE > 0 && m_bot->HasAura(BERSERKER_STANCE, EFFECT_0) && m_bot->GetPower(POWER_RAGE)/10 <= 10)
    //        return m_ai->CastSpell(BLOODRAGE) ? RETURN_FINISHED_FIRST_MOVES : RETURN_NO_ACTION_ERROR;
    //    if (INTERCEPT > 0 && m_bot->HasAura(BERSERKER_STANCE, EFFECT_0))
    //    {
    //        if (fTargetDist < 8.0f)
    //            return RETURN_NO_ACTION_OK;
    //        else if (fTargetDist > 25.0f)
    //            return RETURN_CONTINUE; // wait to come into range
    //        else if (INTERCEPT > 0 && m_ai->CastSpell(INTERCEPT, *pTarget))
    //        {
    //            float x, y, z;
    //            pTarget->GetContactPoint(m_bot, x, y, z, 3.666666f);
    //            m_bot->Relocate(x, y, z);
    //            return RETURN_FINISHED_FIRST_MOVES;
    //        }
    //    }
    //}

    //if (BATTLE_STANCE)
    //{
    //    if (!m_bot->HasAura(BATTLE_STANCE, EFFECT_0) && m_ai->CastSpell(BATTLE_STANCE))
    //        return RETURN_CONTINUE;
    //    if (CHARGE > 0 && m_bot->HasAura(BATTLE_STANCE, EFFECT_0))
    //    {
    //        if (fTargetDist < 8.0f)
    //            return RETURN_NO_ACTION_OK;
    //        if (fTargetDist > 25.0f)
    //            return RETURN_CONTINUE; // wait to come into range
    //        else if (CHARGE > 0 && m_ai->CastSpell(CHARGE, *pTarget))
    //        {
    //            float x, y, z;
    //            pTarget->GetContactPoint(m_bot, x, y, z, 3.666666f);
    //            m_bot->Relocate(x, y, z);
    //            return RETURN_FINISHED_FIRST_MOVES;
    //        }
    //    }
    //}

    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotWarriorAI::DoNextCombatManeuver(Unit *pTarget)
{
    //switch (m_ai->GetScenarioType())
    //{
    //    case PlayerbotAI::SCENARIO_PVP_DUEL:
    //    case PlayerbotAI::SCENARIO_PVP_BG:
    //    case PlayerbotAI::SCENARIO_PVP_ARENA:
    //    case PlayerbotAI::SCENARIO_PVP_OPENWORLD:
    //        return DoNextCombatManeuverPVP(pTarget);
    //    case PlayerbotAI::SCENARIO_PVE:
    //    case PlayerbotAI::SCENARIO_PVE_ELITE:
    //    case PlayerbotAI::SCENARIO_PVE_RAID:
    //    default:
    //        return DoNextCombatManeuverPVE(pTarget);
    //        break;
    //}

    return RETURN_NO_ACTION_ERROR;
}

CombatManeuverReturns PlayerbotWarriorAI::DoNextCombatManeuverPVE(Unit *pTarget)
{
    //if (!m_ai)  return RETURN_NO_ACTION_ERROR;
    //if (!m_bot) return RETURN_NO_ACTION_ERROR;

    ////Unit* pVictim = pTarget->getVictim();
    ////float fTargetDist = pTarget->GetCombatReach();
    //uint32 spec = m_bot->GetSpec();

    ////If we have devastate it will replace SA in our rotation
    ////uint32 SUNDER = (DEVASTATE > 0 ? DEVASTATE : SUNDER_ARMOR);

    ////Used to determine if this bot is highest on threat
    //Unit* newTarget = m_ai->FindAttacker((PlayerbotAI::ATTACKERINFOTYPE) (PlayerbotAI::AIT_VICTIMSELF | PlayerbotAI::AIT_HIGHESTTHREAT), m_bot);

    //// do shouts, berserker rage, etc...
    //if (BERSERKER_RAGE > 0 && !m_bot->HasAura(BERSERKER_RAGE, EFFECT_0))
    //    m_ai->CastSpell(BERSERKER_RAGE);
    //else if (BLOODRAGE > 0 && m_bot->GetPower(POWER_RAGE)/10 <= 10)
    //    m_ai->CastSpell(BLOODRAGE);

    //CheckShouts();

    //switch (spec)
    //{
    //    case WARRIOR_SPEC_ARMS:
    //        // Execute doesn't scale too well with extra rage and uses up *all* rage preventing use of other skills
    //        //Haven't found a way to make sudden death work yet, either wrong spell or it needs an effect index(probably)
    //        if (EXECUTE > 0 && (pTarget->GetHealthPct() < 20 || m_bot->HasAura(SUDDEN_DEATH)) && m_bot->GetPower(POWER_RAGE)/10 < 30 && m_ai->CastSpell (EXECUTE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (REND > 0 && !pTarget->HasAura(REND, EFFECT_0) && m_ai->CastSpell(REND, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (MORTAL_STRIKE > 0 && !m_bot->HasSpellCooldown(MORTAL_STRIKE) && m_ai->CastSpell(MORTAL_STRIKE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SHATTERING_THROW > 0 && !pTarget->HasAura(SHATTERING_THROW, EFFECT_0) && !m_bot->HasSpellCooldown(SHATTERING_THROW) && m_ai->CastSpell(SHATTERING_THROW, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (BLADESTORM > 0 && !m_bot->HasSpellCooldown(BLADESTORM) /*&& m_ai->GetAttackerCount() >= 3*/ && m_ai->CastSpell(BLADESTORM, *pTarget))
    //            return RETURN_CONTINUE;
    //        // No way to tell if overpower is active (yet), however taste for blood works
    //        if (OVERPOWER > 0 && m_bot->HasAura(TASTE_FOR_BLOOD) && m_ai->CastSpell(OVERPOWER, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (HEROIC_STRIKE > 0 && m_ai->CastSpell(HEROIC_STRIKE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SLAM > 0 && m_ai->CastSpell(SLAM, *pTarget))
    //        {
    //            //m_ai->SetIgnoreUpdateTime(1.5); // TODO: SetIgnoreUpdateTime takes a uint8 - how will 1.5 work as a value?
    //            return RETURN_CONTINUE;
    //        }

    //    case WARRIOR_SPEC_FURY:
    //        if (EXECUTE > 0 && pTarget->GetHealthPct() < 20 && m_ai->CastSpell (EXECUTE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (BLOODTHIRST > 0 && !m_bot->HasSpellCooldown(BLOODTHIRST) && m_ai->CastSpell(BLOODTHIRST, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (WHIRLWIND > 0 && !m_bot->HasSpellCooldown(WHIRLWIND) && m_ai->CastSpell(WHIRLWIND, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SLAM > 0 && m_bot->HasAura(BLOODSURGE, EFFECT_0) && m_ai->CastSpell(SLAM, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (HEROIC_STRIKE > 0 && m_ai->CastSpell(HEROIC_STRIKE, *pTarget))
    //            return RETURN_CONTINUE;

    //    case WARRIOR_SPEC_PROTECTION:
    //        if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TANK && !newTarget && TAUNT > 0 && !m_bot->HasSpellCooldown(TAUNT) && m_ai->CastSpell(TAUNT, *pTarget))
    //            return RETURN_CONTINUE;
    //        // No way to tell if revenge is active (yet)
    //        /*if (REVENGE > 0 && m_ai->CastSpell(REVENGE, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        if (REND > 0 && !pTarget->HasAura(REND, EFFECT_0) && m_ai->CastSpell(REND, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (THUNDER_CLAP > 0 && !pTarget->HasAura(THUNDER_CLAP) && m_ai->CastSpell(THUNDER_CLAP, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (DEMORALIZING_SHOUT > 0 && !pTarget->HasAura(DEMORALIZING_SHOUT, EFFECT_0) && m_ai->CastSpell(DEMORALIZING_SHOUT, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (CONCUSSION_BLOW > 0 && !m_bot->HasSpellCooldown(CONCUSSION_BLOW) && m_ai->CastSpell(CONCUSSION_BLOW, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SHOCKWAVE > 0 && !m_bot->HasSpellCooldown(SHOCKWAVE) && m_ai->CastSpell(SHOCKWAVE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SHIELD_SLAM > 0 && !m_bot->HasSpellCooldown(SHIELD_SLAM) && m_ai->CastSpell(SHIELD_SLAM, *pTarget))
    //            return RETURN_CONTINUE;
    //        /*if (SUNDER > 0 && !pTarget->HasAura(SUNDER_ARMOR) && m_ai->CastSpell(SUNDER, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        if (HEROIC_STRIKE > 0 && m_ai->CastSpell(HEROIC_STRIKE, *pTarget))
    //            return RETURN_CONTINUE;

    //    /*case WarriorSpellPreventing:
    //        if (SHIELD_BASH > 0 && m_ai->CastSpell(SHIELD_BASH, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (PUMMEL > 0 && m_ai->CastSpell(PUMMEL, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SPELL_REFLECTION > 0 && !m_bot->HasAura(SPELL_REFLECTION, EFFECT_0) && m_ai->CastSpell(SPELL_REFLECTION, *m_bot))
    //            return RETURN_CONTINUE;
    //        break;

    //    case WarriorBattle:
    //        if (LAST_STAND > 0 && !m_bot->HasAura(LAST_STAND, EFFECT_0) && m_bot->GetHealthPct() < 50 && m_ai->CastSpell(LAST_STAND, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (DEATH_WISH > 0 && !m_bot->HasAura(DEATH_WISH, EFFECT_0) && m_ai->CastSpell(DEATH_WISH, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (RETALIATION > 0 && pVictim == m_bot && m_ai->GetAttackerCount() >= 2 && !m_bot->HasAura(RETALIATION, EFFECT_0) && m_ai->CastSpell(RETALIATION, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (SWEEPING_STRIKES > 0 && m_ai->GetAttackerCount() >= 2 && !m_bot->HasAura(SWEEPING_STRIKES, EFFECT_0) && m_ai->CastSpell(SWEEPING_STRIKES, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (INTIMIDATING_SHOUT > 0 && m_ai->GetAttackerCount() > 5 && m_ai->CastSpell(INTIMIDATING_SHOUT, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (ENRAGED_REGENERATION > 0 && !m_bot->HasAura(BERSERKER_RAGE, EFFECT_0) && !m_bot->HasAura(ENRAGED_REGENERATION, EFFECT_0) && m_bot->GetHealth() < m_bot->GetMaxHealth() * 0.5 && m_ai->CastSpell(ENRAGED_REGENERATION, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (HAMSTRING > 0 && !pTarget->HasAura(HAMSTRING, EFFECT_0) && m_ai->CastSpell(HAMSTRING, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (CHALLENGING_SHOUT > 0 && pVictim != m_bot && m_bot->GetHealthPct() > 25 && !pTarget->HasAura(MOCKING_BLOW, EFFECT_0) && !pTarget->HasAura(CHALLENGING_SHOUT, EFFECT_0) && m_ai->CastSpell(CHALLENGING_SHOUT, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (CLEAVE > 0 && m_ai->CastSpell(CLEAVE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (PIERCING_HOWL > 0 && && m_ai->GetAttackerCount() >= 3 && !pTarget->HasAura(WAR_STOMP, EFFECT_0) && !pTarget->HasAura(PIERCING_HOWL, EFFECT_0) && !pTarget->HasAura(SHOCKWAVE, EFFECT_0) && !pTarget->HasAura(CONCUSSION_BLOW, EFFECT_0) && m_ai->CastSpell(PIERCING_HOWL, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (MOCKING_BLOW > 0 && pVictim != m_bot && m_bot->GetHealthPct() > 25 && !pTarget->HasAura(MOCKING_BLOW, EFFECT_0) && !pTarget->HasAura(CHALLENGING_SHOUT, EFFECT_0) && m_ai->CastSpell(MOCKING_BLOW, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (HEROIC_THROW > 0 && m_ai->CastSpell(HEROIC_THROW, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_TAUREN && !pTarget->HasAura(WAR_STOMP, EFFECT_0) && !pTarget->HasAura(PIERCING_HOWL, EFFECT_0) && !pTarget->HasAura(SHOCKWAVE, EFFECT_0) && !pTarget->HasAura(CONCUSSION_BLOW, EFFECT_0) && m_ai->CastSpell(WAR_STOMP, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_HUMAN && m_bot->HasUnitState(UNIT_STAT_STUNNED) || m_bot->HasAuraType(SPELL_AURA_MOD_FEAR) || m_bot->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED) || m_bot->HasAuraType(SPELL_AURA_MOD_CHARM) && m_ai->CastSpell(EVERY_MAN_FOR_HIMSELF, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_UNDEAD_PLAYER && m_bot->HasAuraType(SPELL_AURA_MOD_FEAR) || m_bot->HasAuraType(SPELL_AURA_MOD_CHARM) && m_ai->CastSpell(WILL_OF_THE_FORSAKEN, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_DWARF && m_bot->HasAuraState(AURA_STATE_DEADLY_POISON) && m_ai->CastSpell(STONEFORM, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_GNOME && m_bot->HasUnitState(UNIT_STAT_STUNNED) || m_bot->HasAuraType(SPELL_AURA_MOD_DECREASE_SPEED) && m_ai->CastSpell(ESCAPE_ARTIST, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_NIGHTELF && pVictim == m_bot && m_bot->GetHealthPct() < 25 && !m_bot->HasAura(SHADOWMELD, EFFECT_0) && m_ai->CastSpell(SHADOWMELD, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_ORC && !m_bot->HasAura(BLOOD_FURY, EFFECT_0) && m_ai->CastSpell(BLOOD_FURY, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_TROLL && !m_bot->HasAura(BERSERKING, EFFECT_0) && m_ai->CastSpell(BERSERKING, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (m_bot->getRace() == RACE_DRAENEI && m_bot->GetHealthPct() < 25 && !m_bot->HasAura(GIFT_OF_THE_NAARU, EFFECT_0) && m_ai->CastSpell(GIFT_OF_THE_NAARU, *m_bot))
    //            return RETURN_CONTINUE;
    //        break;

    //    case WarriorDefensive:
    //        if (DISARM > 0 && !pTarget->HasAura(DISARM, EFFECT_0) && m_ai->CastSpell(DISARM, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (SHIELD_BLOCK > 0 && !m_bot->HasAura(SHIELD_BLOCK, EFFECT_0) && m_ai->CastSpell(SHIELD_BLOCK, *m_bot))
    //            return RETURN_CONTINUE;
    //        if (SHIELD_WALL > 0 && !m_bot->HasAura(SHIELD_WALL, EFFECT_0) && m_ai->CastSpell(SHIELD_WALL, *m_bot))
    //            return RETURN_CONTINUE;
    //        break;*/
    //}

    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotWarriorAI::DoNextCombatManeuverPVP(Unit* pTarget)
{
    //if (m_ai->CastSpell(HEROIC_STRIKE))
    //    return RETURN_CONTINUE;

    return DoNextCombatManeuverPVE(pTarget); // TODO: bad idea perhaps, but better than the alternative
}

//Buff and rebuff shouts
void PlayerbotWarriorAI::CheckShouts()
{
    //if (!m_ai)  return;
    //if (!m_bot) return;

    //if (m_bot->GetSpec() == WARRIOR_SPEC_PROTECTION && COMMANDING_SHOUT > 0)
    //{
    //    if (!m_bot->HasAura(COMMANDING_SHOUT, EFFECT_0) && m_ai->CastSpell(COMMANDING_SHOUT))
    //        return;
    //}
    //else // Not prot, or prot but no Commanding Shout yet
    //{
    //    if (!m_bot->HasAura(BATTLE_SHOUT, EFFECT_0) && m_ai->CastSpell(BATTLE_SHOUT))
    //        return;
    //}
}

void PlayerbotWarriorAI::DoNonCombatActions()
{
    //if (!m_ai)  return;
    //if (!m_bot) return;

    //uint32 spec = m_bot->GetSpec();

    ////Stance Check
    //if (spec == WARRIOR_SPEC_ARMS && !m_bot->HasAura(BATTLE_STANCE, EFFECT_0))
    //    m_ai->CastSpell(BATTLE_STANCE);
    //else if (spec == WARRIOR_SPEC_FURY && !m_bot->HasAura(BERSERKER_STANCE, EFFECT_0))
    //    m_ai->CastSpell(BERSERKER_STANCE);
    //else if (spec == WARRIOR_SPEC_PROTECTION && !m_bot->HasAura(DEFENSIVE_STANCE, EFFECT_0))
    //    m_ai->CastSpell(DEFENSIVE_STANCE);

    //// buff master with VIGILANCE
    //if (VIGILANCE > 0)
    //    (!GetMaster()->HasAura(VIGILANCE, EFFECT_0) && m_ai->CastSpell(VIGILANCE, *GetMaster()));

    //// hp check
    //if (m_bot->getStandState() != UNIT_STAND_STATE_STAND)
    //    m_bot->SetStandState(UNIT_STAND_STATE_STAND);

    //if (EatDrinkBandage(false))
    //    return;

    //if (m_bot->getRace() == RACE_DRAENEI && !m_bot->HasAura(GIFT_OF_THE_NAARU, EFFECT_0) && m_bot->GetHealthPct() < 70)
    //{
    //    m_ai->TellMaster("I'm casting gift of the naaru.");
    //    m_ai->CastSpell(GIFT_OF_THE_NAARU, *m_bot);
    //    return;
    //}
} // end DoNonCombatActions

// Match up with "Pull()" below
bool PlayerbotWarriorAI::CanPull()
{
    if (!me) return false;
    if (!m_ai) return false;

    if (me->GetUInt32Value(PLAYER_AMMO_ID)) // Having ammo equipped means a weapon is equipped as well. Probably. [TODO: does this work with throwing knives? Can a playerbot 'cheat' ammo into the slot without a proper weapon?]
    {
        // Can't do this, CanPull CANNOT check for anything that requires a target
        //if (!m_ai->IsInRange(m_ai->GetCurrentTarget(), AUTO_SHOT))
        //{
        //    m_ai->TellMaster("I'm out of range.");
        //    return false;
        //}
        return true;
    }

    return false;
}

// Match up with "CanPull()" above
bool PlayerbotWarriorAI::Pull()
{
    //if (!m_bot) return false;
    //if (!m_ai)  return false;

    //if (m_ai->GetCurrentTarget() && m_ai->GetCurrentTarget()->GetCombatReach() > ATTACK_DISTANCE)
    //{
    //    if (!m_ai->IsInRange(m_ai->GetCurrentTarget(), AUTO_SHOT))
    //    {
    //        m_ai->TellMaster("I'm out of range.");
    //        return false;
    //    }

    //    // activate auto shot: Reworked to account for AUTO_SHOT being a triggered spell
    //    if (AUTO_SHOT && m_ai->GetCurrentSpellId() != AUTO_SHOT)
    //    {
    //        m_bot->CastSpell(m_ai->GetCurrentTarget(), AUTO_SHOT, true);
    //        return true;
    //    }
    //}
    //else // target is in melee range
    //{
    //    m_ai->Attack(m_ai->GetCurrentTarget());
    //    return true;
    //}

    return false;
}
