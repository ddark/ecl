#include "bp_mag_ai.h"
#include "bp_ai.h"
#include "Player.h"
#include "Pet.h"

PlayerbotMageAI::PlayerbotMageAI(Player* const master, Player* const bot, PlayerbotAI* const ai) : PlayerbotClassAI(master, bot, ai)
{
    ARCANE_MISSILES         = PlayerbotAI::InitSpell(me, ARCANE_MISSILES_1);
    ARCANE_EXPLOSION        = PlayerbotAI::InitSpell(me, ARCANE_EXPLOSION_1);
    COUNTERSPELL            = PlayerbotAI::InitSpell(me, COUNTERSPELL_1);
    SLOW                    = PlayerbotAI::InitSpell(me, SLOW_1);
    ARCANE_BARRAGE          = PlayerbotAI::InitSpell(me, ARCANE_BARRAGE_1);
    ARCANE_BLAST            = PlayerbotAI::InitSpell(me, ARCANE_BLAST_1);
    ARCANE_POWER            = PlayerbotAI::InitSpell(me, ARCANE_POWER_1);
    DAMPEN_MAGIC            = PlayerbotAI::InitSpell(me, DAMPEN_MAGIC_1);
    AMPLIFY_MAGIC           = PlayerbotAI::InitSpell(me, AMPLIFY_MAGIC_1);
    MAGE_ARMOR              = PlayerbotAI::InitSpell(me, MAGE_ARMOR_1);
    MIRROR_IMAGE            = PlayerbotAI::InitSpell(me, MIRROR_IMAGE_1);
    ARCANE_INTELLECT        = PlayerbotAI::InitSpell(me, ARCANE_INTELLECT_1);
    ARCANE_BRILLIANCE       = PlayerbotAI::InitSpell(me, ARCANE_BRILLIANCE_1);
    DALARAN_INTELLECT       = PlayerbotAI::InitSpell(me, DALARAN_INTELLECT_1);
    DALARAN_BRILLIANCE      = PlayerbotAI::InitSpell(me, DALARAN_BRILLIANCE_1);
    MANA_SHIELD             = PlayerbotAI::InitSpell(me, MANA_SHIELD_1);
    CONJURE_WATER           = PlayerbotAI::InitSpell(me, CONJURE_WATER_1);
    CONJURE_FOOD            = PlayerbotAI::InitSpell(me, CONJURE_FOOD_1);
    FIREBALL                = PlayerbotAI::InitSpell(me, FIREBALL_1);
    FIRE_BLAST              = PlayerbotAI::InitSpell(me, FIRE_BLAST_1);
    FLAMESTRIKE             = PlayerbotAI::InitSpell(me, FLAMESTRIKE_1);
    SCORCH                  = PlayerbotAI::InitSpell(me, SCORCH_1);
    PYROBLAST               = PlayerbotAI::InitSpell(me, PYROBLAST_1);
    BLAST_WAVE              = PlayerbotAI::InitSpell(me, BLAST_WAVE_1);
    COMBUSTION              = PlayerbotAI::InitSpell(me, COMBUSTION_1);
    DRAGONS_BREATH          = PlayerbotAI::InitSpell(me, DRAGONS_BREATH_1);
    LIVING_BOMB             = PlayerbotAI::InitSpell(me, LIVING_BOMB_1);
    FROSTFIRE_BOLT          = PlayerbotAI::InitSpell(me, FROSTFIRE_BOLT_1);
    FIRE_WARD               = PlayerbotAI::InitSpell(me, FIRE_WARD_1);
    MOLTEN_ARMOR            = PlayerbotAI::InitSpell(me, MOLTEN_ARMOR_1);
    ICY_VEINS               = PlayerbotAI::InitSpell(me, ICY_VEINS_1);
    DEEP_FREEZE             = PlayerbotAI::InitSpell(me, DEEP_FREEZE_1);
    FROSTBOLT               = PlayerbotAI::InitSpell(me, FROSTBOLT_1);
    FROST_NOVA              = PlayerbotAI::InitSpell(me, FROST_NOVA_1);
    BLIZZARD                = PlayerbotAI::InitSpell(me, BLIZZARD_1);
    CONE_OF_COLD            = PlayerbotAI::InitSpell(me, CONE_OF_COLD_1);
    ICE_BARRIER             = PlayerbotAI::InitSpell(me, ICE_BARRIER_1);
    SUMMON_WATER_ELEMENTAL  = PlayerbotAI::InitSpell(me, SUMMON_WATER_ELEMENTAL_1);
    FROST_WARD              = PlayerbotAI::InitSpell(me, FROST_WARD_1);
    ICE_LANCE               = PlayerbotAI::InitSpell(me, ICE_LANCE_1);
    FROST_ARMOR             = PlayerbotAI::InitSpell(me, FROST_ARMOR_1);
    ICE_ARMOR               = PlayerbotAI::InitSpell(me, ICE_ARMOR_1);
    ICE_BLOCK               = PlayerbotAI::InitSpell(me, ICE_BLOCK_1);
    COLD_SNAP               = PlayerbotAI::InitSpell(me, COLD_SNAP_1);

    // RANGED COMBAT
    SHOOT                   = PlayerbotAI::InitSpell(me, SHOOT_2);

    //RECENTLY_BANDAGED       = 11196; // first aid check

    // racial
    ARCANE_TORRENT          = PlayerbotAI::InitSpell(me, ARCANE_TORRENT_MANA_CLASSES); // blood elf
    GIFT_OF_THE_NAARU       = PlayerbotAI::InitSpell(me, GIFT_OF_THE_NAARU_MAGE); // draenei
    ESCAPE_ARTIST           = PlayerbotAI::InitSpell(me, ESCAPE_ARTIST_ALL); // gnome
    EVERY_MAN_FOR_HIMSELF   = PlayerbotAI::InitSpell(me, EVERY_MAN_FOR_HIMSELF_ALL); // human
    BERSERKING              = PlayerbotAI::InitSpell(me, BERSERKING_ALL); // troll
    WILL_OF_THE_FORSAKEN    = PlayerbotAI::InitSpell(me, WILL_OF_THE_FORSAKEN_ALL); // undead
}

PlayerbotMageAI::~PlayerbotMageAI() {}

CombatManeuverReturns PlayerbotMageAI::DoFirstCombatManeuver(Unit* pTarget)
{
    //// There are NPCs in BGs and Open World PvP, so don't filter this on PvP scenarios (of course if PvP targets anyone but tank, all bets are off anyway)
    //// Wait until the tank says so, until any non-tank gains aggro or X seconds - whichever is shortest
    //if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TEMP_WAIT_TANKAGGRO)
    //{
    //    if (m_WaitUntil > m_ai->CurrentTime() && m_ai->GroupTankHoldsAggro())
    //    {
    //        return RETURN_NO_ACTION_OK; // wait it out
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

CombatManeuverReturns PlayerbotMageAI::DoFirstCombatManeuverPVE(Unit* /*pTarget*/)
{
    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotMageAI::DoFirstCombatManeuverPVP(Unit* /*pTarget*/)
{
    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotMageAI::DoNextCombatManeuver(Unit *pTarget)
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

CombatManeuverReturns PlayerbotMageAI::DoNextCombatManeuverPVE(Unit *pTarget)
{
    //if (!m_ai)  return RETURN_NO_ACTION_ERROR;
    //if (!m_bot) return RETURN_NO_ACTION_ERROR;

    //Unit* pVictim = pTarget->getVictim();
    //float dist = pTarget->GetCombatReach();
    //uint32 spec = m_bot->GetSpec();

    //if (m_ai->GetCombatStyle() != PlayerbotAI::COMBAT_RANGED && dist > ATTACK_DISTANCE)
    //    m_ai->SetCombatStyle(PlayerbotAI::COMBAT_RANGED);
    //// if can't shoot OR have no ranged (wand) equipped
    //else if(m_ai->GetCombatStyle() != PlayerbotAI::COMBAT_MELEE && (SHOOT == 0 || !m_bot->GetWeaponForAttack(RANGED_ATTACK, true)))
    //    m_ai->SetCombatStyle(PlayerbotAI::COMBAT_MELEE);

    ////Used to determine if this bot is highest on threat
    //Unit *newTarget = m_ai->FindAttacker((PlayerbotAI::ATTACKERINFOTYPE) (PlayerbotAI::AIT_VICTIMSELF | PlayerbotAI::AIT_HIGHESTTHREAT), m_bot);
    //if (newTarget) // TODO: && party has a tank
    //{
    //    // Insert instant threat reducing spell (if a mage has one)

    //    // Have threat, can't quickly lower it. 3 options remain: Stop attacking, lowlevel damage (wand), keep on keeping on.
    //    if (newTarget->GetHealthPct() > 25)
    //    {
    //        // If elite, do nothing and pray tank gets aggro off you
    //        // TODO: Is there an IsElite function? If so, find it and insert.
    //        //if (newTarget->IsElite())
    //        //    return;

    //        // Not an elite. You could insert FEAR here but in any PvE situation that's 90-95% likely
    //        // to worsen the situation for the group. ... So please don't.
    //        CastSpell(SHOOT, pTarget);
    //        return RETURN_CONTINUE;
    //    }
    //}

    //switch (spec)
    //{
    //    case MAGE_SPEC_FROST:
    //        if (ICY_VEINS > 0 && !m_bot->HasAura(ICY_VEINS, EFFECT_0) && CastSpell(ICY_VEINS, m_bot))
    //            return RETURN_CONTINUE;
    //        if (ICE_BLOCK > 0 && pVictim == m_bot && !m_bot->HasAura(ICE_BLOCK, EFFECT_0) && CastSpell(ICE_BLOCK, m_bot))
    //            return RETURN_CONTINUE;
    //        if (ICE_BARRIER > 0 && pVictim == m_bot && !m_bot->HasAura(ICE_BARRIER, EFFECT_0) && m_bot->GetHealthPct() < 50 && CastSpell(ICE_BARRIER, m_bot))
    //            return RETURN_CONTINUE;
    //        if (DEEP_FREEZE > 0 && pTarget->HasAura(AURA_STATE_FROZEN, EFFECT_0) && !pTarget->HasAura(DEEP_FREEZE, EFFECT_0) && CastSpell(DEEP_FREEZE, pTarget))
    //            return RETURN_CONTINUE;
    //        if (BLIZZARD > 0 && m_ai->GetAttackerCount() >= 5 && CastSpell(BLIZZARD, pTarget))
    //        {
    //            //m_ai->SetIgnoreUpdateTime(8);
    //            return RETURN_CONTINUE;
    //        }
    //        if (CONE_OF_COLD > 0 && dist <= ATTACK_DISTANCE && !pTarget->HasAura(CONE_OF_COLD, EFFECT_0) && CastSpell(CONE_OF_COLD, pTarget))
    //            return RETURN_CONTINUE;
    //        if (FROSTBOLT > 0 && !pTarget->HasAura(FROSTBOLT, EFFECT_0) && CastSpell(FROSTBOLT, pTarget))
    //            return RETURN_CONTINUE;
    //        if (FROST_WARD > 0 && !m_bot->HasAura(FROST_WARD, EFFECT_0) && CastSpell(FROST_WARD, m_bot))
    //            return RETURN_CONTINUE;
    //        if (FROST_NOVA > 0 && dist <= ATTACK_DISTANCE && !pTarget->HasAura(FROST_NOVA, EFFECT_0) && CastSpell(FROST_NOVA, pTarget))
    //            return RETURN_CONTINUE;
    //        if (ICE_LANCE > 0 && CastSpell(ICE_LANCE, pTarget))
    //            return RETURN_CONTINUE;
    //        if (SUMMON_WATER_ELEMENTAL > 0 && CastSpell(SUMMON_WATER_ELEMENTAL))
    //            return RETURN_CONTINUE;
    //        if (COLD_SNAP > 0 && CastSpell(COLD_SNAP, m_bot))
    //            return RETURN_CONTINUE;

    //        if (FROSTBOLT > 0)
    //            return CastSpell(FROSTBOLT, pTarget);
    //        break;

    //    case MAGE_SPEC_FIRE:
    //        if (FIRE_WARD > 0 && !m_bot->HasAura(FIRE_WARD, EFFECT_0) && CastSpell(FIRE_WARD, m_bot))
    //            return RETURN_CONTINUE;
    //        if (COMBUSTION > 0 && !m_bot->HasAura(COMBUSTION, EFFECT_0) && CastSpell(COMBUSTION, m_bot))
    //            return RETURN_CONTINUE;
    //        if (FIREBALL > 0 && CastSpell(FIREBALL, pTarget))
    //            return RETURN_CONTINUE;
    //        if (FIRE_BLAST > 0 && CastSpell(FIRE_BLAST, pTarget))
    //            return RETURN_CONTINUE;
    //        if (FLAMESTRIKE > 0 && CastSpell(FLAMESTRIKE, pTarget))
    //            return RETURN_CONTINUE;
    //        if (SCORCH > 0 && CastSpell(SCORCH, pTarget))
    //            return RETURN_CONTINUE;
    //        if (PYROBLAST > 0 && !pTarget->HasAura(PYROBLAST, EFFECT_0) && CastSpell(PYROBLAST, pTarget))
    //            return RETURN_CONTINUE;
    //        if (BLAST_WAVE > 0 && m_ai->GetAttackerCount() >= 3 && dist <= ATTACK_DISTANCE && CastSpell(BLAST_WAVE, pTarget))
    //            return RETURN_CONTINUE;
    //        if (DRAGONS_BREATH > 0 && dist <= ATTACK_DISTANCE && CastSpell(DRAGONS_BREATH, pTarget))
    //            return RETURN_CONTINUE;
    //        if (LIVING_BOMB > 0 && !pTarget->HasAura(LIVING_BOMB, EFFECT_0) && CastSpell(LIVING_BOMB, pTarget))
    //            return RETURN_CONTINUE;
    //        if (FROSTFIRE_BOLT > 0 && !pTarget->HasAura(FROSTFIRE_BOLT, EFFECT_0) && CastSpell(FROSTFIRE_BOLT, pTarget))
    //            return RETURN_CONTINUE;

    //        if (FIREBALL > 0)
    //            return CastSpell(FIREBALL, pTarget);
    //        break;

    //    case MAGE_SPEC_ARCANE:
    //        if (ARCANE_POWER > 0 && CastSpell(ARCANE_POWER, pTarget))
    //            return RETURN_CONTINUE;
    //        if (ARCANE_MISSILES > 0 && CastSpell(ARCANE_MISSILES, pTarget))
    //        {
    //            //m_ai->SetIgnoreUpdateTime(3);
    //            return RETURN_CONTINUE;
    //        }
    //        if (ARCANE_EXPLOSION > 0 && m_ai->GetAttackerCount() >= 3 && dist <= ATTACK_DISTANCE && CastSpell(ARCANE_EXPLOSION, pTarget))
    //            return RETURN_CONTINUE;
    //        if (COUNTERSPELL > 0 && pTarget->IsNonMeleeSpellCasted(true) && CastSpell(COUNTERSPELL, pTarget))
    //            return RETURN_CONTINUE;
    //        if (SLOW > 0 && !pTarget->HasAura(SLOW, EFFECT_0) && CastSpell(SLOW, pTarget))
    //            return RETURN_CONTINUE;
    //        if (ARCANE_BARRAGE > 0 && CastSpell(ARCANE_BARRAGE, pTarget))
    //            return RETURN_CONTINUE;
    //        if (ARCANE_BLAST > 0 && CastSpell(ARCANE_BLAST, pTarget))
    //            return RETURN_CONTINUE;
    //        if (MIRROR_IMAGE > 0 && CastSpell(MIRROR_IMAGE))
    //            return RETURN_CONTINUE;
    //        if (MANA_SHIELD > 0 && m_bot->GetHealthPct() < 70 && pVictim == m_bot && !m_bot->HasAura(MANA_SHIELD, EFFECT_0) && CastSpell(MANA_SHIELD, m_bot))
    //            return RETURN_CONTINUE;

    //        if (FIREBALL > 0)
    //            return CastSpell(FIREBALL, pTarget);
    //        break;
    //}

    //// No spec due to low level OR no spell found yet
    //if (FROSTBOLT > 0 && !pTarget->HasAura(FROSTBOLT, EFFECT_0))
    //    return CastSpell(FROSTBOLT, pTarget);
    //if (FIREBALL > 0) // Very low levels
    //    return CastSpell(FIREBALL, pTarget);

    return RETURN_NO_ACTION_ERROR; // What? Not even Fireball is available?
} // end DoNextCombatManeuver

CombatManeuverReturns PlayerbotMageAI::DoNextCombatManeuverPVP(Unit* pTarget)
{
    //if (m_ai->CastSpell(FIREBALL))
    //    return RETURN_CONTINUE;

    return DoNextCombatManeuverPVE(pTarget); // TODO: bad idea perhaps, but better than the alternative
}

void PlayerbotMageAI::DoNonCombatActions()
{
    //Player* master = GetMaster();

    //if (!m_bot || !master)
    //    return;

    //// Buff armor
    //if (MOLTEN_ARMOR)
    //{
    //    if (m_ai->SelfBuff(MOLTEN_ARMOR))
    //        return;
    //}
    //else if (MAGE_ARMOR)
    //{
    //    if (m_ai->SelfBuff(MAGE_ARMOR))
    //        return;
    //}
    //else if (ICE_ARMOR)
    //{
    //    if (m_ai->SelfBuff(ICE_ARMOR))
    //        return;
    //}
    //else if (FROST_ARMOR)
    //    if (m_ai->SelfBuff(FROST_ARMOR))
    //        return;

    //// buff group
    //if (m_bot->GetGroup() && ARCANE_BRILLIANCE && m_ai->HasSpellReagents(ARCANE_BRILLIANCE) && m_ai->Buff(ARCANE_BRILLIANCE, m_bot))
    //    return;
    //if (Buff(&PlayerbotMageAI::BuffHelper, ARCANE_INTELLECT, (JOB_ALL | JOB_MANAONLY)))
    //    return;

    //// conjure food & water + hp/mana check
    //if (m_bot->getStandState() != UNIT_STAND_STATE_STAND)
    //    m_bot->SetStandState(UNIT_STAND_STATE_STAND);

    //// TODO: The beauty of a mage is not only its ability to supply itself with water, but to share its water
    //// So, conjure at *least* 1.25 stacks, ready to trade a stack and still have some left for self
    //if (m_ai->FindDrink() == NULL && CONJURE_WATER && m_ai->CastSpell(CONJURE_WATER, *m_bot))
    //{
    //    m_ai->TellMaster("I'm conjuring some water.");
    //    //m_ai->SetIgnoreUpdateTime(3);
    //    return;
    //}
    //if (m_ai->FindFood() == NULL && CONJURE_FOOD && m_ai->CastSpell(CONJURE_FOOD, *m_bot))
    //{
    //    m_ai->TellMaster("I'm conjuring some food.");
    //    //m_ai->SetIgnoreUpdateTime(3);
    //    return;
    //}

    //if (EatDrinkBandage())
    //    return;
} // end DoNonCombatActions

// TODO: this and priest's BuffHelper are identical and thus could probably go in PlayerbotClassAI.cpp somewhere
bool PlayerbotMageAI::BuffHelper(PlayerbotAI* ai, uint32 spellId, Unit *target)
{
    //if (!ai)          return false;
    //if (spellId == 0) return false;
    //if (!target)      return false;

    //Pet* pet = target->GetTypeId() == TYPEID_PLAYER ? target->ToPlayer()->GetPet() : NULL;
    //if (pet && !pet->HasAuraType(SPELL_AURA_MOD_UNATTACKABLE) && ai->Buff(spellId, pet))
    //    return true;

    //if (ai->Buff(spellId, target))
    //    return true;

    return false;
}
