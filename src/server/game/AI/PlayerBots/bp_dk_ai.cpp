// a simple DK class by rrtn :)
#include "bp_dk_ai.h"
#include "bp_ai.h"
#include "Player.h"
#include "Pet.h"

PlayerbotDeathKnightAI::PlayerbotDeathKnightAI(Player* const master, Player* const bot, PlayerbotAI* const ai) : PlayerbotClassAI(master, bot, ai)
{

    PLAGUE_STRIKE     = PlayerbotAI::InitSpell(me, PLAGUE_STRIKE_1); // Unholy
    DEATH_GRIP        = PlayerbotAI::InitSpell(me, DEATH_GRIP_1);
    DEATH_COIL        = PlayerbotAI::InitSpell(me, DEATH_COIL_DEATH_KNIGHT_1);
    DEATH_STRIKE      = PlayerbotAI::InitSpell(me, DEATH_STRIKE_1);
    UNHOLY_BLIGHT     = 0; // Passive
    SCOURGE_STRIKE    = PlayerbotAI::InitSpell(me, SCOURGE_STRIKE_1);
    DEATH_AND_DECAY   = PlayerbotAI::InitSpell(me, DEATH_AND_DECAY_1);
    CORPSE_EXPLOSION  = PlayerbotAI::InitSpell(me, CORPSE_EXPLOSION_1);
    BONE_SHIELD       = PlayerbotAI::InitSpell(me, BONE_SHIELD_1); // buffs
    ANTI_MAGIC_SHELL  = PlayerbotAI::InitSpell(me, ANTI_MAGIC_SHELL_1);
    ANTI_MAGIC_ZONE   = PlayerbotAI::InitSpell(me, ANTI_MAGIC_ZONE_1);
    GHOUL_FRENZY      = PlayerbotAI::InitSpell(me, GHOUL_FRENZY_1);
    RAISE_DEAD        = PlayerbotAI::InitSpell(me, RAISE_DEAD_1); // pets
    SUMMON_GARGOYLE   = PlayerbotAI::InitSpell(me, SUMMON_GARGOYLE_1);
    ARMY_OF_THE_DEAD  = PlayerbotAI::InitSpell(me, ARMY_OF_THE_DEAD_1);
    ICY_TOUCH         = PlayerbotAI::InitSpell(me, ICY_TOUCH_1); // Frost
    OBLITERATE        = PlayerbotAI::InitSpell(me, OBLITERATE_1);
    HOWLING_BLAST     = PlayerbotAI::InitSpell(me, HOWLING_BLAST_1);
    FROST_STRIKE      = PlayerbotAI::InitSpell(me, FROST_STRIKE_1);
    CHAINS_OF_ICE     = PlayerbotAI::InitSpell(me, CHAINS_OF_ICE_1);
    RUNE_STRIKE       = PlayerbotAI::InitSpell(me, RUNE_STRIKE_1);
    ICY_CLUTCH        = 0; // No such spell
    MIND_FREEZE       = PlayerbotAI::InitSpell(me, MIND_FREEZE_1);
    HUNGERING_COLD    = PlayerbotAI::InitSpell(me, HUNGERING_COLD_1);
    KILLING_MACHINE   = 0; // Passive
    DEATHCHILL        = PlayerbotAI::InitSpell(me, DEATHCHILL_1);
    HORN_OF_WINTER    = PlayerbotAI::InitSpell(me, HORN_OF_WINTER_1);
    ICEBOUND_FORTITUDE = PlayerbotAI::InitSpell(me, ICEBOUND_FORTITUDE_1);
    EMPOWER_WEAPON    = PlayerbotAI::InitSpell(me, EMPOWER_RUNE_WEAPON_1);
    UNBREAKABLE_ARMOR = PlayerbotAI::InitSpell(me, UNBREAKABLE_ARMOR_1);
    BLOOD_STRIKE      = PlayerbotAI::InitSpell(me, BLOOD_STRIKE_1); // Blood
    PESTILENCE        = PlayerbotAI::InitSpell(me, PESTILENCE_1);
    STRANGULATE       = PlayerbotAI::InitSpell(me, STRANGULATE_1);
    BLOOD_BOIL        = PlayerbotAI::InitSpell(me, BLOOD_BOIL_1);
    HEART_STRIKE      = PlayerbotAI::InitSpell(me, HEART_STRIKE_1);
    DANCING_WEAPON    = PlayerbotAI::InitSpell(me, DANCING_RUNE_WEAPON_1);
    DARK_COMMAND      = PlayerbotAI::InitSpell(me, DARK_COMMAND_1);
    MARK_OF_BLOOD     = PlayerbotAI::InitSpell(me, MARK_OF_BLOOD_1); // buffs
    RUNE_TAP          = PlayerbotAI::InitSpell(me, RUNE_TAP_1);
    VAMPIRIC_BLOOD    = PlayerbotAI::InitSpell(me, VAMPIRIC_BLOOD_1);
    DEATH_PACT        = PlayerbotAI::InitSpell(me, DEATH_PACT_1);
    HYSTERIA          = PlayerbotAI::InitSpell(me, HYSTERIA_1);
    UNHOLY_PRESENCE   = PlayerbotAI::InitSpell(me, UNHOLY_PRESENCE_1); // presence (TODO: better spell == presence)
    FROST_PRESENCE    = PlayerbotAI::InitSpell(me, FROST_PRESENCE_1);
    BLOOD_PRESENCE    = PlayerbotAI::InitSpell(me, BLOOD_PRESENCE_1);

    //RECENTLY_BANDAGED = 11196; // first aid check

    // racial
    ARCANE_TORRENT          = PlayerbotAI::InitSpell(me, ARCANE_TORRENT_DEATH_KNIGHT); // blood elf
    GIFT_OF_THE_NAARU       = PlayerbotAI::InitSpell(me, GIFT_OF_THE_NAARU_DEATH_KNIGHT); // draenei
    STONEFORM               = PlayerbotAI::InitSpell(me, STONEFORM_ALL); // dwarf
    ESCAPE_ARTIST           = PlayerbotAI::InitSpell(me, ESCAPE_ARTIST_ALL); // gnome
    EVERY_MAN_FOR_HIMSELF   = PlayerbotAI::InitSpell(me, EVERY_MAN_FOR_HIMSELF_ALL); // human
    BLOOD_FURY              = PlayerbotAI::InitSpell(me, BLOOD_FURY_MELEE_CLASSES); // orc
    WAR_STOMP               = PlayerbotAI::InitSpell(me, WAR_STOMP_ALL); // tauren
    BERSERKING              = PlayerbotAI::InitSpell(me, BERSERKING_ALL); // troll
    WILL_OF_THE_FORSAKEN    = PlayerbotAI::InitSpell(me, WILL_OF_THE_FORSAKEN_ALL); // undead
}

PlayerbotDeathKnightAI::~PlayerbotDeathKnightAI() {}

CombatManeuverReturns PlayerbotDeathKnightAI::DoFirstCombatManeuver(Unit* pTarget)
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

CombatManeuverReturns PlayerbotDeathKnightAI::DoFirstCombatManeuverPVE(Unit* /*pTarget*/)
{
    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotDeathKnightAI::DoFirstCombatManeuverPVP(Unit* /*pTarget*/)
{
    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotDeathKnightAI::DoNextCombatManeuver(Unit *pTarget)
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

CombatManeuverReturns PlayerbotDeathKnightAI::DoNextCombatManeuverPVE(Unit *pTarget)
{
    //if (!m_ai)  return RETURN_NO_ACTION_ERROR;
    //if (!m_bot) return RETURN_NO_ACTION_ERROR;

    //// DK Attacks: Unholy, Frost & Blood

    //// damage spells
    //Unit* pVictim = pTarget->getVictim();
    //Pet *pet = m_bot->GetPet();
    //float dist = pTarget->GetCombatReach();
    //std::ostringstream out;

    //switch (SpellSequence)
    //{
    //    case SPELL_DK_UNHOLY:
    //        if (UNHOLY_PRESENCE > 0 && !m_bot->HasAura(UNHOLY_PRESENCE, EFFECT_0) && !m_bot->HasAura(BLOOD_PRESENCE, EFFECT_0) && !m_bot->HasAura(FROST_PRESENCE, EFFECT_0) && m_ai->CastSpell(UNHOLY_PRESENCE, *m_bot))
    //            return RETURN_CONTINUE;

    //        // check for BONE_SHIELD in combat
    //        if (BONE_SHIELD > 0 && !m_bot->HasAura(BONE_SHIELD, EFFECT_0) && !m_bot->HasAura(ARMY_OF_THE_DEAD, EFFECT_0) && m_ai->CastSpell(BONE_SHIELD, *m_bot))
    //            return RETURN_CONTINUE;

    //        if (ARMY_OF_THE_DEAD > 0 && m_ai->GetAttackerCount() >= 5 && LastSpellUnholyDK < 1 && m_ai->CastSpell(ARMY_OF_THE_DEAD) && m_bot->HasAura(ARMY_OF_THE_DEAD, EFFECT_0))
    //        {
    //            out << " summoning Army of the Dead!";
    //            //m_ai->SetIgnoreUpdateTime(7);
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (PLAGUE_STRIKE > 0 && !pTarget->HasAura(PLAGUE_STRIKE, EFFECT_0) && LastSpellUnholyDK < 2 && m_ai->CastSpell(PLAGUE_STRIKE, *pTarget))
    //        {
    //            out << " Plague Strike";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (DEATH_GRIP > 0 && !pTarget->HasAura(DEATH_GRIP, EFFECT_0) && LastSpellUnholyDK < 3 && m_ai->CastSpell(DEATH_GRIP, *pTarget))
    //        {
    //            out << " Death Grip";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (DEATH_COIL > 0 && LastSpellUnholyDK < 4 && m_ai->CastSpell(DEATH_COIL, *pTarget))
    //        {
    //            out << " Death Coil";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (DEATH_STRIKE > 0 && !pTarget->HasAura(DEATH_STRIKE, EFFECT_0) && LastSpellUnholyDK < 5 && m_ai->CastSpell(DEATH_STRIKE, *pTarget))
    //        {
    //            out << " Death Strike";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (UNHOLY_BLIGHT > 0 && !pTarget->HasAura(UNHOLY_BLIGHT, EFFECT_0) && LastSpellUnholyDK < 6 && m_ai->CastSpell(UNHOLY_BLIGHT))
    //        {
    //            out << " Unholy Blight";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (SCOURGE_STRIKE > 0 && LastSpellUnholyDK < 7 && m_ai->CastSpell(SCOURGE_STRIKE, *pTarget))
    //        {
    //            out << " Scourge Strike";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (DEATH_AND_DECAY > 0 && m_ai->GetAttackerCount() >= 3 && dist <= ATTACK_DISTANCE && !pTarget->HasAura(DEATH_AND_DECAY, EFFECT_0) && LastSpellUnholyDK < 8 && m_ai->CastSpell(DEATH_AND_DECAY))
    //        {
    //            out << " Death and Decay";
    //            //m_ai->SetIgnoreUpdateTime(1);
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (SUMMON_GARGOYLE > 0 && !m_bot->HasAura(ARMY_OF_THE_DEAD, EFFECT_0) && !pTarget->HasAura(SUMMON_GARGOYLE, EFFECT_0) && LastSpellUnholyDK < 9 && m_ai->CastSpell(SUMMON_GARGOYLE, *pTarget))
    //        {
    //            out << " summoning Gargoyle";
    //            //m_ai->SetIgnoreUpdateTime(2);
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (CORPSE_EXPLOSION > 0 && dist <= ATTACK_DISTANCE && LastSpellUnholyDK < 10 && m_ai->CastSpell(CORPSE_EXPLOSION, *pTarget))
    //        {
    //            out << " Corpse Explosion";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (ANTI_MAGIC_SHELL > 0 && pTarget->IsNonMeleeSpellCasted(true) && !m_bot->HasAura(ANTI_MAGIC_SHELL, EFFECT_0) && LastSpellUnholyDK < 11 && m_ai->CastSpell(ANTI_MAGIC_SHELL, *m_bot))
    //        {
    //            out << " Anti-Magic Shell";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (ANTI_MAGIC_ZONE > 0 && pTarget->IsNonMeleeSpellCasted(true) && !m_bot->HasAura(ANTI_MAGIC_SHELL, EFFECT_0) && LastSpellUnholyDK < 12 && m_ai->CastSpell(ANTI_MAGIC_ZONE, *m_bot))
    //        {
    //            out << " Anti-Magic Zone";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (!pet && RAISE_DEAD > 0 && !m_bot->HasAura(ARMY_OF_THE_DEAD, EFFECT_0) && LastSpellUnholyDK < 13 && m_ai->CastSpell(RAISE_DEAD))
    //        {
    //            out << " summoning Ghoul";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (pet && GHOUL_FRENZY > 0 && pVictim == pet && !pet->HasAura(GHOUL_FRENZY, EFFECT_0) && LastSpellUnholyDK < 14 && m_ai->CastSpell(GHOUL_FRENZY, *pet))
    //        {
    //            out << " casting Ghoul Frenzy on pet";
    //            SpellSequence = SPELL_DK_FROST;
    //            LastSpellUnholyDK = LastSpellUnholyDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (LastSpellUnholyDK > 15)
    //        {
    //            LastSpellUnholyDK = 0;
    //            SpellSequence = SPELL_DK_FROST;
    //            return RETURN_NO_ACTION_OK; // Not really OK but that's just how the DK rotation works right now
    //        }

    //        LastSpellUnholyDK = 0;

    //    case SPELL_DK_FROST:
    //        if (FROST_PRESENCE > 0 && !m_bot->HasAura(FROST_PRESENCE, EFFECT_0) && !m_bot->HasAura(BLOOD_PRESENCE, EFFECT_0) && !m_bot->HasAura(UNHOLY_PRESENCE, EFFECT_0) && m_ai->CastSpell (FROST_PRESENCE, *m_bot))
    //            return RETURN_CONTINUE;

    //        if (DEATHCHILL > 0)
    //        {
    //            if (!m_bot->HasAura(DEATHCHILL, EFFECT_0) && !m_bot->HasAura(KILLING_MACHINE, EFFECT_0) && m_ai->CastSpell (DEATHCHILL, *m_bot))
    //                return RETURN_CONTINUE;
    //        }
    //        else if (KILLING_MACHINE > 0)
    //        {
    //            if (!m_bot->HasAura(KILLING_MACHINE, EFFECT_0) && !m_bot->HasAura(DEATHCHILL, EFFECT_0) && m_ai->CastSpell (KILLING_MACHINE, *m_bot))
    //                return RETURN_CONTINUE;
    //        }

    //        if (ICY_TOUCH > 0 && !pTarget->HasAura(ICY_TOUCH, EFFECT_0) && LastSpellFrostDK < 1 && m_ai->CastSpell(ICY_TOUCH, *pTarget))
    //        {
    //            out << " Icy Touch";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (OBLITERATE > 0 && LastSpellFrostDK < 2 && m_ai->CastSpell(OBLITERATE, *pTarget))
    //        {
    //            out << " Obliterate";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (FROST_STRIKE > 0 && LastSpellFrostDK < 3 && m_ai->CastSpell(FROST_STRIKE, *pTarget))
    //        {
    //            out << " Frost Strike";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (HOWLING_BLAST > 0 && m_ai->GetAttackerCount() >= 3 && LastSpellFrostDK < 4 && m_ai->CastSpell(HOWLING_BLAST, *pTarget))
    //        {
    //            out << " Howling Blast";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (CHAINS_OF_ICE > 0 && !pTarget->HasAura(CHAINS_OF_ICE, EFFECT_0) && LastSpellFrostDK < 5 && m_ai->CastSpell(CHAINS_OF_ICE, *pTarget))
    //        {
    //            out << " Chains of Ice";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (RUNE_STRIKE > 0 && LastSpellFrostDK < 6 && m_ai->CastSpell(RUNE_STRIKE, *pTarget))
    //        {
    //            out << " Rune Strike";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (ICY_CLUTCH > 0 && !pTarget->HasAura(ICY_CLUTCH, EFFECT_0) && LastSpellFrostDK < 7 && m_ai->CastSpell(ICY_CLUTCH, *pTarget))
    //        {
    //            out << " Icy Clutch";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (ICEBOUND_FORTITUDE > 0 && m_bot->GetHealthPct() < 50 && pVictim == m_bot && !m_bot->HasAura(ICEBOUND_FORTITUDE, EFFECT_0) && LastSpellFrostDK < 8 && m_ai->CastSpell(ICEBOUND_FORTITUDE, *m_bot))
    //        {
    //            out << " Icebound Fortitude";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (MIND_FREEZE > 0 && pTarget->IsNonMeleeSpellCasted(true) && dist <= ATTACK_DISTANCE && LastSpellFrostDK < 9 && m_ai->CastSpell(MIND_FREEZE, *pTarget))
    //        {
    //            out << " Mind Freeze";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (HUNGERING_COLD > 0 && m_ai->GetAttackerCount() >= 3 && dist <= ATTACK_DISTANCE && LastSpellFrostDK < 10 && m_ai->CastSpell(HUNGERING_COLD, *pTarget))
    //        {
    //            out << " Hungering Cold";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (EMPOWER_WEAPON > 0 && LastSpellFrostDK < 11 && m_ai->CastSpell(EMPOWER_WEAPON, *m_bot))
    //        {
    //            out << " Empower Rune Weapon";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (UNBREAKABLE_ARMOR > 0 && !m_bot->HasAura(UNBREAKABLE_ARMOR, EFFECT_0) && m_bot->GetHealthPct() < 70 && pVictim == m_bot && LastSpellFrostDK < 12 && m_ai->CastSpell(UNBREAKABLE_ARMOR, *m_bot))
    //        {
    //            out << " Unbreakable Armor";
    //            SpellSequence = SPELL_DK_BLOOD;
    //            LastSpellFrostDK = LastSpellFrostDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (LastSpellFrostDK > 13)
    //        {
    //            LastSpellFrostDK = 0;
    //            SpellSequence = SPELL_DK_BLOOD;
    //            return RETURN_NO_ACTION_OK; // Not really OK, but that's just how the DK rotation works right now
    //        }

    //        LastSpellFrostDK = 0;

    //    case SPELL_DK_BLOOD:
    //        if (BLOOD_PRESENCE > 0 && !m_bot->HasAura(BLOOD_PRESENCE, EFFECT_0) && !m_bot->HasAura(UNHOLY_PRESENCE, EFFECT_0) && !m_bot->HasAura(FROST_PRESENCE, EFFECT_0) && m_ai->CastSpell (BLOOD_PRESENCE, *m_bot))
    //            return RETURN_CONTINUE;

    //        if (MARK_OF_BLOOD > 0 && !pTarget->HasAura(MARK_OF_BLOOD, EFFECT_0) && LastSpellBloodDK < 1 && m_ai->CastSpell(MARK_OF_BLOOD, *pTarget))
    //        {
    //            out << " Mark of Blood";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (BLOOD_STRIKE > 0 && LastSpellBloodDK < 2 && m_ai->CastSpell(BLOOD_STRIKE, *pTarget))
    //        {
    //            out << " Blood Strike";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK =  LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (PESTILENCE > 0 && m_ai->GetAttackerCount() >= 3 && LastSpellBloodDK < 3 && m_ai->CastSpell(PESTILENCE, *pTarget))
    //        {
    //            out << " Pestilence";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (STRANGULATE > 0 && !pTarget->HasAura(STRANGULATE, EFFECT_0) && LastSpellBloodDK < 4 && m_ai->CastSpell(STRANGULATE, *pTarget))
    //        {
    //            out << " Strangulate";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (BLOOD_BOIL > 0 && m_ai->GetAttackerCount() >= 5 && dist <= ATTACK_DISTANCE && LastSpellBloodDK < 5 && m_ai->CastSpell(BLOOD_BOIL, *pTarget))
    //        {
    //            out << " Blood Boil";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (HEART_STRIKE > 0 && LastSpellBloodDK < 6 && m_ai->CastSpell(HEART_STRIKE, *pTarget))
    //        {
    //            out << " Heart Strike";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (VAMPIRIC_BLOOD > 0 && m_bot->GetHealthPct() < 70 && !m_bot->HasAura(VAMPIRIC_BLOOD, EFFECT_0) && LastSpellBloodDK < 7 && m_ai->CastSpell(VAMPIRIC_BLOOD, *m_bot))
    //        {
    //            out << " Vampiric Blood";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (RUNE_TAP > 0 && m_bot->GetHealthPct() < 70 && !m_bot->HasAura(VAMPIRIC_BLOOD, EFFECT_0) && LastSpellBloodDK < 8 && m_ai->CastSpell(RUNE_TAP, *m_bot))
    //        {
    //            out << " Rune Tap";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (HYSTERIA > 0 && m_bot->GetHealthPct() > 25 && !m_bot->HasAura(HYSTERIA, EFFECT_0) && LastSpellBloodDK < 9 && m_ai->CastSpell(HYSTERIA, *m_bot))
    //        {
    //            out << " Hysteria";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (DANCING_WEAPON > 0 && !m_bot->HasAura(DANCING_WEAPON, EFFECT_0) && LastSpellBloodDK < 10 && m_ai->CastSpell(DANCING_WEAPON, *pTarget))
    //        {
    //            out << " summoning Dancing Rune Weapon";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (DARK_COMMAND > 0 && m_bot->GetHealthPct() > 50 && pVictim != m_bot && !pTarget->HasAura(DARK_COMMAND, EFFECT_0) && LastSpellBloodDK < 11 && m_ai->CastSpell(DARK_COMMAND, *pTarget))
    //        {
    //            out << " Dark Command";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (pet && DEATH_PACT > 0 && m_bot->GetHealthPct() < 50 && LastSpellBloodDK < 12 && m_ai->CastSpell(DEATH_PACT, *pet))
    //        {
    //            out << " Death Pact (sacrifice pet)";
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            LastSpellBloodDK = LastSpellBloodDK + 1;
    //            return RETURN_CONTINUE;
    //        }
    //        if (LastSpellBloodDK > 13)
    //        {
    //            LastSpellBloodDK = 0;
    //            SpellSequence = SPELL_DK_UNHOLY;
    //            return RETURN_NO_ACTION_OK; // Not really OK but that's just how DK rotation works right now
    //        }
    //}
    //if (m_ai->GetManager()->m_confDebugWhisper)
    //    m_ai->TellMaster(out.str().c_str());

    return RETURN_NO_ACTION_UNKNOWN;
} // end DoNextCombatManeuver

CombatManeuverReturns PlayerbotDeathKnightAI::DoNextCombatManeuverPVP(Unit* pTarget)
{
    //if (m_ai->CastSpell(PLAGUE_STRIKE))
    //    return RETURN_CONTINUE;

    return DoNextCombatManeuverPVE(pTarget); // TODO: bad idea perhaps, but better than the alternative
}

void PlayerbotDeathKnightAI::DoNonCombatActions()
{
    //if (!m_ai)  return;
    //if (!m_bot) return;

    //SpellSequence = SPELL_DK_UNHOLY;

    //// buff master with HORN_OF_WINTER
    //if (HORN_OF_WINTER > 0)
    //    (!GetMaster()->HasAura(HORN_OF_WINTER, EFFECT_0) && m_ai->CastSpell (HORN_OF_WINTER, *GetMaster()));

    //// hp check
    //if (m_bot->getStandState() != UNIT_STAND_STATE_STAND)
    //    m_bot->SetStandState(UNIT_STAND_STATE_STAND);

    //if (EatDrinkBandage(false))
    //    return;
} // end DoNonCombatActions

// Match up with "Pull()" below
bool PlayerbotDeathKnightAI::CanPull()
{
    if (DEATH_GRIP && !me->HasSpellCooldown(DEATH_GRIP))
        return true;

    return false;
}

// Match up with "CanPull()" above
bool PlayerbotDeathKnightAI::Pull()
{
    //if (DEATH_GRIP && m_ai->CastSpell(DEATH_GRIP))
    //    return true;

    return false;
}
