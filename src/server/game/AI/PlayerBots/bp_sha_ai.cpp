#include "bp_ai.h"
#include "bp_dk_ai.h"
#include "bp_sha_ai.h"
#include "Chat.h"
#include "Player.h"
#include "SpellAuras.h"
#include "Totem.h"

PlayerbotShamanAI::PlayerbotShamanAI(Player* const master, Player* const bot, PlayerbotAI* const ai) : PlayerbotClassAI(master, bot, ai)
{
    // restoration
    CHAIN_HEAL               = PlayerbotAI::InitSpell(me, CHAIN_HEAL_1);
    HEALING_WAVE             = PlayerbotAI::InitSpell(me, HEALING_WAVE_1);
    LESSER_HEALING_WAVE      = PlayerbotAI::InitSpell(me, LESSER_HEALING_WAVE_1);
    RIPTIDE                  = PlayerbotAI::InitSpell(me, RIPTIDE_1);
    ANCESTRAL_SPIRIT         = PlayerbotAI::InitSpell(me, ANCESTRAL_SPIRIT_1);
    EARTH_SHIELD             = PlayerbotAI::InitSpell(me, EARTH_SHIELD_1);
    WATER_SHIELD             = PlayerbotAI::InitSpell(me, WATER_SHIELD_1);
    EARTHLIVING_WEAPON       = PlayerbotAI::InitSpell(me, EARTHLIVING_WEAPON_1);
    TREMOR_TOTEM             = PlayerbotAI::InitSpell(me, TREMOR_TOTEM_1); // totems
    HEALING_STREAM_TOTEM     = PlayerbotAI::InitSpell(me, HEALING_STREAM_TOTEM_1);
    MANA_SPRING_TOTEM        = PlayerbotAI::InitSpell(me, MANA_SPRING_TOTEM_1);
    MANA_TIDE_TOTEM          = PlayerbotAI::InitSpell(me, MANA_TIDE_TOTEM_1);
    CURE_TOXINS              = PlayerbotAI::InitSpell(me, CURE_TOXINS_1);
    CLEANSE_SPIRIT           = PlayerbotAI::InitSpell(me, CLEANSE_SPIRIT_1);
    NATURES_SWIFTNESS_SHAMAN = PlayerbotAI::InitSpell(me, NATURES_SWIFTNESS_SHAMAN_1);
    TIDAL_FORCE              = PlayerbotAI::InitSpell(me, TIDAL_FORCE_1);
    // enhancement
    FOCUSED                  = 0; // Focused what?
    STORMSTRIKE              = PlayerbotAI::InitSpell(me, STORMSTRIKE_1);
    LAVA_LASH                = PlayerbotAI::InitSpell(me, LAVA_LASH_1);
    SHAMANISTIC_RAGE         = PlayerbotAI::InitSpell(me, SHAMANISTIC_RAGE_1);
    BLOODLUST                = PlayerbotAI::InitSpell(me, BLOODLUST_1);
    HEROISM                  = PlayerbotAI::InitSpell(me, HEROISM_1);
    FERAL_SPIRIT             = PlayerbotAI::InitSpell(me, FERAL_SPIRIT_1);
    LIGHTNING_SHIELD         = PlayerbotAI::InitSpell(me, LIGHTNING_SHIELD_1);
    ROCKBITER_WEAPON         = PlayerbotAI::InitSpell(me, ROCKBITER_WEAPON_1);
    FLAMETONGUE_WEAPON       = PlayerbotAI::InitSpell(me, FLAMETONGUE_WEAPON_1);
    FROSTBRAND_WEAPON        = PlayerbotAI::InitSpell(me, FROSTBRAND_WEAPON_1);
    WINDFURY_WEAPON          = PlayerbotAI::InitSpell(me, WINDFURY_WEAPON_1);
    STONESKIN_TOTEM          = PlayerbotAI::InitSpell(me, STONESKIN_TOTEM_1); // totems
    STRENGTH_OF_EARTH_TOTEM  = PlayerbotAI::InitSpell(me, STRENGTH_OF_EARTH_TOTEM_1);
    FROST_RESISTANCE_TOTEM   = PlayerbotAI::InitSpell(me, FROST_RESISTANCE_TOTEM_1);
    FLAMETONGUE_TOTEM        = PlayerbotAI::InitSpell(me, FLAMETONGUE_TOTEM_1);
    FIRE_RESISTANCE_TOTEM    = PlayerbotAI::InitSpell(me, FIRE_RESISTANCE_TOTEM_1);
    GROUNDING_TOTEM          = PlayerbotAI::InitSpell(me, GROUNDING_TOTEM_1);
    NATURE_RESISTANCE_TOTEM  = PlayerbotAI::InitSpell(me, NATURE_RESISTANCE_TOTEM_1);
    WIND_FURY_TOTEM          = PlayerbotAI::InitSpell(me, WINDFURY_TOTEM_1);
    STONESKIN_TOTEM          = PlayerbotAI::InitSpell(me, STONESKIN_TOTEM_1);
    WRATH_OF_AIR_TOTEM       = PlayerbotAI::InitSpell(me, WRATH_OF_AIR_TOTEM_1);
    EARTH_ELEMENTAL_TOTEM    = PlayerbotAI::InitSpell(me, EARTH_ELEMENTAL_TOTEM_1);
    MAELSTROM_WEAPON         = PlayerbotAI::InitSpell(me, MAELSTROM_WEAPON_1);
    // elemental
    LIGHTNING_BOLT           = PlayerbotAI::InitSpell(me, LIGHTNING_BOLT_1);
    EARTH_SHOCK              = PlayerbotAI::InitSpell(me, EARTH_SHOCK_1);
    FLAME_SHOCK              = PlayerbotAI::InitSpell(me, FLAME_SHOCK_1);
    PURGE                    = PlayerbotAI::InitSpell(me, PURGE_1);
    WIND_SHOCK               = 0; //NPC spell
    FROST_SHOCK              = PlayerbotAI::InitSpell(me, FROST_SHOCK_1);
    CHAIN_LIGHTNING          = PlayerbotAI::InitSpell(me, CHAIN_LIGHTNING_1);
    LAVA_BURST               = PlayerbotAI::InitSpell(me, LAVA_BURST_1);
    HEX                      = PlayerbotAI::InitSpell(me, HEX_1);
    STONECLAW_TOTEM          = PlayerbotAI::InitSpell(me, STONECLAW_TOTEM_1); // totems
    SEARING_TOTEM            = PlayerbotAI::InitSpell(me, SEARING_TOTEM_1);
    FIRE_NOVA_TOTEM          = 0; // NPC only spell, check FIRE_NOVA_1
    MAGMA_TOTEM              = PlayerbotAI::InitSpell(me, MAGMA_TOTEM_1);
    EARTHBIND_TOTEM          = PlayerbotAI::InitSpell(me, EARTHBIND_TOTEM_1);
    TOTEM_OF_WRATH           = PlayerbotAI::InitSpell(me, TOTEM_OF_WRATH_1);
    FIRE_ELEMENTAL_TOTEM     = PlayerbotAI::InitSpell(me, FIRE_ELEMENTAL_TOTEM_1);
    ELEMENTAL_MASTERY        = PlayerbotAI::InitSpell(me, ELEMENTAL_MASTERY_1);
    THUNDERSTORM             = PlayerbotAI::InitSpell(me, THUNDERSTORM_1);

    //RECENTLY_BANDAGED        = 11196; // first aid check

    // racial
    GIFT_OF_THE_NAARU        = PlayerbotAI::InitSpell(me, GIFT_OF_THE_NAARU_SHAMAN); // draenei
    BLOOD_FURY               = PlayerbotAI::InitSpell(me, BLOOD_FURY_SHAMAN); // orc
    WAR_STOMP                = PlayerbotAI::InitSpell(me, WAR_STOMP_ALL); // tauren
    BERSERKING               = PlayerbotAI::InitSpell(me, BERSERKING_ALL); // troll

    // totem buffs
    STRENGTH_OF_EARTH_EFFECT    = PlayerbotAI::InitSpell(me, STRENGTH_OF_EARTH_EFFECT_1);
    FLAMETONGUE_EFFECT          = PlayerbotAI::InitSpell(me, FLAMETONGUE_EFFECT_1);
    MAGMA_TOTEM_EFFECT          = PlayerbotAI::InitSpell(me, MAGMA_TOTEM_EFFECT_1);
    STONECLAW_EFFECT            = PlayerbotAI::InitSpell(me, STONECLAW_EFFECT_1);
    FIRE_RESISTANCE_EFFECT      = PlayerbotAI::InitSpell(me, FIRE_RESISTANCE_EFFECT_1);
    FROST_RESISTANCE_EFFECT     = PlayerbotAI::InitSpell(me, FROST_RESISTANCE_EFFECT_1);
    GROUDNING_EFFECT            = PlayerbotAI::InitSpell(me, GROUDNING_EFFECT_1);
    NATURE_RESISTANCE_EFFECT    = PlayerbotAI::InitSpell(me, NATURE_RESISTANCE_EFFECT_1);
    STONESKIN_EFFECT            = PlayerbotAI::InitSpell(me, STONESKIN_EFFECT_1);
    WINDFURY_EFFECT             = PlayerbotAI::InitSpell(me, WINDFURY_EFFECT_1);
    WRATH_OF_AIR_EFFECT         = PlayerbotAI::InitSpell(me, WRATH_OF_AIR_EFFECT_1);
    CLEANSING_TOTEM_EFFECT      = PlayerbotAI::InitSpell(me, CLEANSING_TOTEM_EFFECT_1);
    HEALING_STREAM_EFFECT       = PlayerbotAI::InitSpell(me, HEALING_STREAM_EFFECT_1);
    MANA_SPRING_EFFECT          = PlayerbotAI::InitSpell(me, MANA_SPRING_EFFECT_1);
    TREMOR_TOTEM_EFFECT         = PlayerbotAI::InitSpell(me, TREMOR_TOTEM_EFFECT_1);
    TOTEM_OF_WRATH_EFFECT       = PlayerbotAI::InitSpell(me, TOTEM_OF_WRATH_EFFECT_1);
    STONECLAW_EFFECT            = PlayerbotAI::InitSpell(me, STONECLAW_EFFECT_1);
    EARTHBIND_EFFECT            = PlayerbotAI::InitSpell(me, EARTHBIND_EFFECT_1);

    // Buffs that don't stack with totems
    IMPROVED_ICY_TALONS     = PlayerbotAI::InitSpell(me, IMPROVED_ICY_TALONS_1);
    HORN_OF_WINTER          = PlayerbotAI::InitSpell(me, HORN_OF_WINTER_1);
}

PlayerbotShamanAI::~PlayerbotShamanAI() {}

void PlayerbotShamanAI::SendClassDebugInfo()
{
    uint32 talentcost = 0;
    uint32 rank = 0;
    SpellInfo const* learnSpellInfo = NULL;
    ChatHandler ch(m_master->GetSession());
    uint8 loc = uint8(me->GetSession()->GetSessionDbcLocale());
    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(CHAIN_HEAL);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(HEALING_WAVE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(LESSER_HEALING_WAVE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(RIPTIDE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(ANCESTRAL_SPIRIT);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(EARTH_SHIELD);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(WATER_SHIELD);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(EARTHLIVING_WEAPON);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(TREMOR_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(HEALING_STREAM_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(MANA_SPRING_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(MANA_TIDE_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(CURE_TOXINS);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(CLEANSE_SPIRIT);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(NATURES_SWIFTNESS_SHAMAN);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(TIDAL_FORCE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(STORMSTRIKE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(LAVA_LASH);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(SHAMANISTIC_RAGE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(BLOODLUST);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(HEROISM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FERAL_SPIRIT);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(LIGHTNING_SHIELD);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(ROCKBITER_WEAPON);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FLAMETONGUE_WEAPON);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FROSTBRAND_WEAPON);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(WINDFURY_WEAPON);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(STONESKIN_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(STRENGTH_OF_EARTH_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FROST_RESISTANCE_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FLAMETONGUE_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FIRE_RESISTANCE_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(GROUNDING_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(NATURE_RESISTANCE_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(WIND_FURY_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(STONESKIN_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(WRATH_OF_AIR_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(EARTH_ELEMENTAL_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(MAELSTROM_WEAPON);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(LIGHTNING_BOLT);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(EARTH_SHOCK);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FLAME_SHOCK);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(PURGE);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(WIND_SHOCK);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FROST_SHOCK);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(CHAIN_LIGHTNING);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(LAVA_BURST);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(HEX);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(STONECLAW_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(SEARING_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FIRE_NOVA_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(MAGMA_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(EARTHBIND_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(TOTEM_OF_WRATH);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(FIRE_ELEMENTAL_TOTEM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(ELEMENTAL_MASTERY);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
    spellInfo = sSpellMgr->GetSpellInfo(THUNDERSTORM);
    if (spellInfo)
    {
        std::ostringstream str;
        str << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str << ' ' << localeNames[loc] << "]|h|r";
        talentcost = GetTalentSpellCost(spellInfo->Id);
        learnSpellInfo = sSpellMgr->GetSpellInfo(spellInfo->Effects[0].TriggerSpell);
        if (talentcost > 0 && spellInfo->GetNextRankSpell())
            rank = talentcost;
        else if (learnSpellInfo && learnSpellInfo->GetNextRankSpell())
            rank = spellInfo->GetRank();
        if (rank > 0)
            str << " Rank " << rank;
        ch.PSendSysMessage(str.str().c_str());
        str.clear();
    }
}

CombatManeuverReturns PlayerbotShamanAI::DoFirstCombatManeuver(Unit* /*pTarget*/)
{
    //// There are NPCs in BGs and Open World PvP, so don't filter this on PvP scenarios (of course if PvP targets anyone but tank, all bets are off anyway)
    //// Wait until the tank says so, until any non-tank gains aggro or X seconds - whichever is shortest
    //if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_TEMP_WAIT_TANKAGGRO)
    //{
    //    if (m_WaitUntil > m_ai->CurrentTime() && m_ai->GroupTankHoldsAggro())
    //    {
    //        if (PlayerbotAI::ORDERS_HEAL & m_ai->GetCombatOrder())
    //           return HealPlayer(GetHealTarget());
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

CombatManeuverReturns PlayerbotShamanAI::DoFirstCombatManeuverPVE(Unit* /*pTarget*/)
{
    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotShamanAI::DoFirstCombatManeuverPVP(Unit* /*pTarget*/)
{
    return RETURN_NO_ACTION_OK;
}

CombatManeuverReturns PlayerbotShamanAI::DoNextCombatManeuver(Unit* /*pTarget*/)
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

CombatManeuverReturns PlayerbotShamanAI::DoNextCombatManeuverPVE(Unit* /*pTarget*/)
{
    //if (!m_ai)  return RETURN_NO_ACTION_ERROR;
    //if (!me) return RETURN_NO_ACTION_ERROR;

    //uint32 spec = me->GetSpec();

    //// Make sure healer stays put, don't even melee (aggro) if in range.
    //if (m_ai->IsHealer() && m_ai->GetCombatStyle() != PlayerbotAI::COMBAT_RANGED)
    //    m_ai->SetCombatStyle(PlayerbotAI::COMBAT_RANGED);
    //else if (!m_ai->IsHealer() && m_ai->GetCombatStyle() != PlayerbotAI::COMBAT_MELEE)
    //    m_ai->SetCombatStyle(PlayerbotAI::COMBAT_MELEE);

    //// Heal
    //if (m_ai->IsHealer())
    //{
    //    if (HealPlayer(GetHealTarget()) & (RETURN_NO_ACTION_OK | RETURN_CONTINUE))
    //        return RETURN_CONTINUE;
    //}
    //else
    //{
    //    // Is this desirable? Debatable.
    //    // TODO: In a group/raid with a healer you'd want this bot to focus on DPS (it's not specced/geared for healing either)
    //    if (HealPlayer(me) & RETURN_CONTINUE)
    //        return RETURN_CONTINUE;
    //}

    //// Damage Spells
    //DropTotems();
    //CheckShields();
    //UseCooldowns();
    //switch (spec)
    //{
    //    case SHAMAN_SPEC_ENHANCEMENT:
    //        if (STORMSTRIKE > 0 && (!me->HasSpellCooldown(STORMSTRIKE)) && m_ai->CastSpell(STORMSTRIKE, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (FLAME_SHOCK > 0 && (!pTarget->HasAura(FLAME_SHOCK)) && m_ai->CastSpell(FLAME_SHOCK, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (EARTH_SHOCK > 0 && (!me->HasSpellCooldown(EARTH_SHOCK)) && m_ai->CastSpell(EARTH_SHOCK, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (LAVA_LASH > 0 && (!me->HasSpellCooldown(LAVA_LASH)) && m_ai->CastSpell(LAVA_LASH, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (MAELSTROM_WEAPON > 0 && LIGHTNING_BOLT > 0 && me->HasAura(MAELSTROM_WEAPON) && m_ai->CastSpell(LIGHTNING_BOLT, *pTarget))
    //            return RETURN_CONTINUE;
    //        /*if (FOCUSED > 0 && m_ai->CastSpell(FOCUSED, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        break;

    //    case SHAMAN_SPEC_RESTORATION:
    //        // fall through to elemental

    //    case SHAMAN_SPEC_ELEMENTAL:
    //        if (FLAME_SHOCK > 0 && (!pTarget->HasAura(FLAME_SHOCK)) && m_ai->CastSpell(FLAME_SHOCK, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (LAVA_BURST > 0 && (pTarget->HasAura(FLAME_SHOCK)) && (!me->HasSpellCooldown(LAVA_BURST)) && m_ai->CastSpell(LAVA_BURST, *pTarget))
    //            return RETURN_CONTINUE;
    //        if (LIGHTNING_BOLT > 0 && m_ai->CastSpell(LIGHTNING_BOLT, *pTarget))
    //            return RETURN_CONTINUE;
    //        /*if (PURGE > 0 && m_ai->CastSpell(PURGE, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        /*if (WIND_SHOCK > 0 && m_ai->CastSpell(WIND_SHOCK, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        /*if (FROST_SHOCK > 0 && !pTarget->HasAura(FROST_SHOCK, EFFECT_0) && m_ai->CastSpell(FROST_SHOCK, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        /*if (CHAIN_LIGHTNING > 0 && m_ai->CastSpell(CHAIN_LIGHTNING, *pTarget))
    //            return RETURN_CONTINUE;*/
    //        /*if (HEX > 0 && !pTarget->HasAura(HEX, EFFECT_0) && m_ai->CastSpell(HEX))
    //            return RETURN_CONTINUE;*/
    //}

    return RETURN_NO_ACTION_OK;
} // end DoNextCombatManeuver

CombatManeuverReturns PlayerbotShamanAI::DoNextCombatManeuverPVP(Unit* pTarget)
{
    //DropTotems();
    //CheckShields();
    //UseCooldowns();

    //Player* healTarget = (m_ai->GetScenarioType() == PlayerbotAI::SCENARIO_PVP_DUEL) ? GetHealTarget() : me;
    //if (HealPlayer(healTarget) & (RETURN_NO_ACTION_OK | RETURN_CONTINUE))
    //    return RETURN_CONTINUE;
    //if (m_ai->CastSpell(LIGHTNING_BOLT))
    //    return RETURN_CONTINUE;

    return DoNextCombatManeuverPVE(pTarget); // TODO: bad idea perhaps, but better than the alternative
}

CombatManeuverReturns PlayerbotShamanAI::HealPlayer(Player* /*target*/)
{
    //CombatManeuverReturns r = PlayerbotClassAI::HealPlayer(target);
    //if (r != RETURN_NO_ACTION_OK)
    //    return r;

    //if (!target->isAlive())
    //{
    //    if (ANCESTRAL_SPIRIT && m_ai->CastSpell(ANCESTRAL_SPIRIT, *target))
    //    {
    //        std::string msg = "Resurrecting ";
    //        msg += target->GetName();
    //        me->Say(msg, LANG_UNIVERSAL);
    //        return RETURN_CONTINUE;
    //    }
    //    return RETURN_NO_ACTION_ERROR; // not error per se - possibly just OOM
    //}

    //// Dispel if necessary
    //if (CURE_TOXINS > 0 && (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_NODISPEL) == 0)
    //{
    //    uint32 DISPEL = CLEANSE_SPIRIT > 0 ? CLEANSE_SPIRIT : CURE_TOXINS;
    //    uint32 dispelMask  = SpellInfo::GetDispelMask(DISPEL_POISON);
    //    uint32 dispelMask2  = SpellInfo::GetDispelMask(DISPEL_DISEASE);
    //    uint32 dispelMask3  = SpellInfo::GetDispelMask(DISPEL_CURSE);
    //    Unit::AuraMap const& auras = target->GetOwnedAuras();
    //    for (Unit::AuraMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
    //    {
    //        Aura *holder = itr->second;
    //        if ((1 << holder->GetSpellInfo()->Dispel) & dispelMask)
    //        {
    //            if (holder->GetSpellInfo()->Dispel == DISPEL_POISON)
    //            {
    //                if (m_ai->CastSpell(DISPEL, *target))
    //                    return RETURN_CONTINUE;
    //                return RETURN_NO_ACTION_ERROR;
    //            }
    //        }
    //        else if ((1 << holder->GetSpellInfo()->Dispel) & dispelMask2)
    //        {
    //            if (holder->GetSpellInfo()->Dispel == DISPEL_DISEASE)
    //            {
    //                if (m_ai->CastSpell(DISPEL, *target))
    //                    return RETURN_CONTINUE;
    //                return RETURN_NO_ACTION_ERROR;
    //            }
    //        }
    //        else if ((1 << holder->GetSpellInfo()->Dispel) & dispelMask3 & (DISPEL == CLEANSE_SPIRIT))
    //        {
    //            if (holder->GetSpellInfo()->Dispel == DISPEL_CURSE)
    //            {
    //                if (m_ai->CastSpell(DISPEL, *target))
    //                    return RETURN_CONTINUE;
    //                return RETURN_NO_ACTION_ERROR;
    //            }
    //        }
    //    }
    //}

    //// Everyone is healthy enough, return OK. MUST correlate to highest value below (should be last HP check)
    //if (target->GetHealthPct() >= 80)
    //    return RETURN_NO_ACTION_OK;

    //// Technically the best rotation is CHAIN + LHW + LHW, or RIPTIDE + LHW + LHW (proc Tidal Waves then two short LHW), subbing in HW for trouble (bad mana efficiency)
    //if (target->GetHealthPct() < 30 && HEALING_WAVE > 0 && m_ai->CastSpell(HEALING_WAVE, *target))
    //    return RETURN_CONTINUE;
    //if (target->GetHealthPct() < 50 && LESSER_HEALING_WAVE > 0 && m_ai->CastSpell(LESSER_HEALING_WAVE, *target))
    //    return RETURN_CONTINUE;
    //if (target->GetHealthPct() < 60 && RIPTIDE > 0 && !target->HasAura(RIPTIDE, EFFECT_0) && m_ai->CastSpell(RIPTIDE, *target))
    //    return RETURN_CONTINUE;
    //if (target->GetHealthPct() < 80 && CHAIN_HEAL > 0 && m_ai->CastSpell(CHAIN_HEAL, *target))
    //    return RETURN_CONTINUE;

    return RETURN_NO_ACTION_UNKNOWN;
} // end HealTarget

void PlayerbotShamanAI::DropTotems()
{
    //if (!m_ai)  return;
    //if (!me) return;

    //uint32 spec = me->GetSpec();

    //Totem* earth = NULL;
    //Totem* fire = NULL;
    //Totem* water = NULL;
    //Totem* air = NULL;

    //for (uint8 slot = SUMMON_SLOT_TOTEM; slot < MAX_TOTEM_SLOT; ++slot)
    //{
    //    if (!me->m_SummonSlot[slot])
    //        continue;

    //    Creature* tot = me->GetMap()->GetCreature(me->m_SummonSlot[slot]);
    //    if (tot && tot->isTotem())
    //    {
    //        Totem* totem = tot->ToTotem();
    //        if (totem->GetTotemType() == SUMMON_TYPE_TOTEM_EARTH)
    //            earth = totem;
    //        else if (totem->GetTotemType() == SUMMON_TYPE_TOTEM_FIRE)
    //            fire = totem;
    //        else if (totem->GetTotemType() == SUMMON_TYPE_TOTEM_WATER)
    //            water = totem;
    //        else if (totem->GetTotemType() == SUMMON_TYPE_TOTEM_AIR)
    //            air = totem;
    //    }
    //}

    //// Earth Totems
    //if ((earth == NULL) || (me->GetDistance(earth) > 30))
    //{
    //    if (STRENGTH_OF_EARTH_TOTEM > 0 && m_ai->CastSpell(STRENGTH_OF_EARTH_TOTEM))
    //    {}
    //}

    //// Fire Totems
    //if ((fire == NULL) || (me->GetDistance(fire) > 30))
    //{
    //    if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_RESIST_FROST && FROST_RESISTANCE_TOTEM > 0 && m_ai->CastSpell(FROST_RESISTANCE_TOTEM))
    //    {}
    //    else if (spec == SHAMAN_SPEC_ELEMENTAL && TOTEM_OF_WRATH > 0 && m_ai->CastSpell(TOTEM_OF_WRATH))
    //    {}
    //    // If the spec didn't take totem of wrath, use flametongue
    //    else if ((spec != SHAMAN_SPEC_ELEMENTAL || TOTEM_OF_WRATH == 0) && FLAMETONGUE_TOTEM > 0 && m_ai->CastSpell(FLAMETONGUE_TOTEM))
    //    {}
    //}

    //// Air totems
    //if ((air == NULL) || (me->GetDistance(air) > 30))
    //{
    //    if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_RESIST_NATURE && NATURE_RESISTANCE_TOTEM > 0 && m_ai->CastSpell(NATURE_RESISTANCE_TOTEM))
    //    {}
    //    else if (spec == SHAMAN_SPEC_ENHANCEMENT)
    //    {
    //        if (WIND_FURY_TOTEM > 0 /*&& !me->HasAura(IMPROVED_ICY_TALONS)*/ && m_ai->CastSpell(WIND_FURY_TOTEM))
    //        {}
    //    }
    //    else
    //    {
    //        if (WRATH_OF_AIR_TOTEM > 0 && m_ai->CastSpell(WRATH_OF_AIR_TOTEM))
    //        {}
    //    }
    //}

    //// Water Totems
    //if ((water == NULL) || (me->GetDistance(water) > 30))
    //{
    //    if (m_ai->GetCombatOrder() & PlayerbotAI::ORDERS_RESIST_FIRE && FIRE_RESISTANCE_TOTEM > 0 && m_ai->CastSpell(FIRE_RESISTANCE_TOTEM))
    //    {}
    //    else if (MANA_SPRING_TOTEM > 0 && m_ai->CastSpell(MANA_SPRING_TOTEM))
    //    {}
    //}

    /*if (EARTH_ELEMENTAL_TOTEM > 0 && m_ai->CastSpell(EARTH_ELEMENTAL_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (EARTHBIND_TOTEM > 0 && !pTarget->HasAura(EARTHBIND_TOTEM, EFFECT_0) && !me->HasAura(STRENGTH_OF_EARTH_TOTEM, EFFECT_0) && m_ai->CastSpell(EARTHBIND_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (FIRE_ELEMENTAL_TOTEM > 0 && m_ai->CastSpell(FIRE_ELEMENTAL_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (FIRE_NOVA_TOTEM > 0 && m_ai->CastSpell(FIRE_NOVA_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (GROUNDING_TOTEM > 0 && !me->HasAura(GROUNDING_TOTEM, EFFECT_0) && !me->HasAura(WRATH_OF_AIR_TOTEM, EFFECT_0) && !me->HasAura(WIND_FURY_TOTEM, EFFECT_0) && m_ai->CastSpell(GROUNDING_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (HEALING_STREAM_TOTEM > 0 && me->GetHealthPct() < 50 && !me->HasAura(HEALING_STREAM_TOTEM, EFFECT_0) && !me->HasAura(MANA_SPRING_TOTEM, EFFECT_0) && m_ai->CastSpell(HEALING_STREAM_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (MAGMA_TOTEM > 0 && (!me->HasAura(TOTEM_OF_WRATH, EFFECT_0)) && m_ai->CastSpell(MAGMA_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (SEARING_TOTEM > 0 && !pTarget->HasAura(SEARING_TOTEM, EFFECT_0) && !me->HasAura(TOTEM_OF_WRATH, EFFECT_0) && m_ai->CastSpell(SEARING_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (STONECLAW_TOTEM > 0 && me->GetHealthPct() < 51 && !pTarget->HasAura(STONECLAW_TOTEM, EFFECT_0) && !pTarget->HasAura(EARTHBIND_TOTEM, EFFECT_0) && !me->HasAura(STRENGTH_OF_EARTH_TOTEM, EFFECT_0) && m_ai->CastSpell(STONECLAW_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (STONESKIN_TOTEM > 0 && !me->HasAura(STONESKIN_TOTEM, EFFECT_0) && !me->HasAura(STRENGTH_OF_EARTH_TOTEM, EFFECT_0) && m_ai->CastSpell(STONESKIN_TOTEM))
        return RETURN_CONTINUE;*/
    /*if (TREMOR_TOTEM > 0 && !me->HasAura(STRENGTH_OF_EARTH_TOTEM, EFFECT_0) && m_ai->CastSpell(TREMOR_TOTEM))
        return RETURN_CONTINUE;*/
}

void PlayerbotShamanAI::CheckShields()
{
    //if (!m_ai)  return;
    //if (!me) return;

    //uint32 spec = me->GetSpec();

    //if (spec == SHAMAN_SPEC_ENHANCEMENT && LIGHTNING_SHIELD > 0 && !me->HasAura(LIGHTNING_SHIELD, EFFECT_0))
    //    m_ai->CastSpell(LIGHTNING_SHIELD, *me);
    //else if ((spec == SHAMAN_SPEC_ELEMENTAL || spec == SHAMAN_SPEC_RESTORATION) && WATER_SHIELD > 0 && !me->HasAura(WATER_SHIELD, EFFECT_0))
    //    m_ai->CastSpell(WATER_SHIELD, *me);
    //if (EARTH_SHIELD > 0 && !GetMaster()->HasAura(EARTH_SHIELD, EFFECT_0))
    //    m_ai->CastSpell(EARTH_SHIELD, *(GetMaster()));
}

void PlayerbotShamanAI::UseCooldowns()
{
    //if (!m_ai)  return;
    //if (!me) return;

    //uint32 spec = me->GetSpec();

    //if (BLOODLUST > 0 && (!GetMaster()->HasAura(BLOODLUST, EFFECT_0)) && m_ai->CastSpell(BLOODLUST))
    //{}
    //else if (HEROISM > 0 && (!GetMaster()->HasAura(HEROISM, EFFECT_0)) && m_ai->CastSpell(HEROISM))
    //{}

    //switch (spec)
    //{
    //    case SHAMAN_SPEC_ENHANCEMENT:
    //        if (SHAMANISTIC_RAGE > 0 && m_ai->CastSpell(SHAMANISTIC_RAGE, *me))
    //            return;
    //        else if (FERAL_SPIRIT > 0 && m_ai->CastSpell(FERAL_SPIRIT))
    //            return;
    //        break;

    //    case SHAMAN_SPEC_ELEMENTAL:
    //        if (ELEMENTAL_MASTERY > 0 && m_ai->CastSpell(ELEMENTAL_MASTERY, *me))
    //            return;
    //        else if (THUNDERSTORM > 0 && m_ai->CastSpell(THUNDERSTORM, *me))
    //            return;
    //        break;

    //    case SHAMAN_SPEC_RESTORATION:
    //        if (MANA_TIDE_TOTEM > 0 && (me->GetPower(POWER_MANA)*100/me->GetMaxPower(POWER_MANA)) < 50 && m_ai->CastSpell(MANA_TIDE_TOTEM))
    //            return;
    //        else if (NATURES_SWIFTNESS_SHAMAN > 0 && m_ai->CastSpell(NATURES_SWIFTNESS_SHAMAN))
    //            return;
    //        else if (TIDAL_FORCE > 0 && m_ai->CastSpell(TIDAL_FORCE))
    //            return;

    //    default:
    //        break;
    //}
}

void PlayerbotShamanAI::DoNonCombatActions()
{
//    if (!m_ai)   return;
//    if (!me)  return;
//
//    if (!me->isAlive() || me->IsInDuel()) return;
//
//    uint32 spec = me->GetSpec();
//
//    CheckShields();
///*
//       // buff myself weapon
//       if (ROCKBITER_WEAPON > 0)
//            (!me->HasAura(ROCKBITER_WEAPON, EFFECT_0) && !me->HasAura(EARTHLIVING_WEAPON, EFFECT_0) && !me->HasAura(WINDFURY_WEAPON, EFFECT_0) && !me->HasAura(FLAMETONGUE_WEAPON, EFFECT_0) && !me->HasAura(FROSTBRAND_WEAPON, EFFECT_0) && m_ai->CastSpell(ROCKBITER_WEAPON,*me) );
//       else if (EARTHLIVING_WEAPON > 0)
//            (!me->HasAura(EARTHLIVING_WEAPON, EFFECT_0) && !me->HasAura(EARTHLIVING_WEAPON, EFFECT_0) && !me->HasAura(FLAMETONGUE_WEAPON, EFFECT_0) && !me->HasAura(FROSTBRAND_WEAPON, EFFECT_0) && !me->HasAura(ROCKBITER_WEAPON, EFFECT_0) && m_ai->CastSpell(WINDFURY_WEAPON,*me) );
//       else if (WINDFURY_WEAPON > 0)
//            (!me->HasAura(WINDFURY_WEAPON, EFFECT_0) && !me->HasAura(EARTHLIVING_WEAPON, EFFECT_0) && !me->HasAura(FLAMETONGUE_WEAPON, EFFECT_0) && !me->HasAura(FROSTBRAND_WEAPON, EFFECT_0) && !me->HasAura(ROCKBITER_WEAPON, EFFECT_0) && m_ai->CastSpell(WINDFURY_WEAPON,*me) );
//       else if (FLAMETONGUE_WEAPON > 0)
//            (!me->HasAura(FLAMETONGUE_WEAPON, EFFECT_0) && !me->HasAura(EARTHLIVING_WEAPON, EFFECT_0) && !me->HasAura(WINDFURY_WEAPON, EFFECT_0) && !me->HasAura(FROSTBRAND_WEAPON, EFFECT_0) && !me->HasAura(ROCKBITER_WEAPON, EFFECT_0) && m_ai->CastSpell(FLAMETONGUE_WEAPON,*me) );
//       else if (FROSTBRAND_WEAPON > 0)
//            (!me->HasAura(FROSTBRAND_WEAPON, EFFECT_0) && !me->HasAura(EARTHLIVING_WEAPON, EFFECT_0) && !me->HasAura(WINDFURY_WEAPON, EFFECT_0) && !me->HasAura(FLAMETONGUE_WEAPON, EFFECT_0) && !me->HasAura(ROCKBITER_WEAPON, EFFECT_0) && m_ai->CastSpell(FROSTBRAND_WEAPON,*me) );
// */
//    // Mainhand
//    Item* weapon;
//    weapon = me->GetItemByPos(EQUIPMENT_SLOT_MAINHAND);
//    if (weapon && (weapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT) == 0) && spec == SHAMAN_SPEC_RESTORATION)
//        m_ai->CastSpell(EARTHLIVING_WEAPON, *me);
//    else if (weapon && (weapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT) == 0) && spec == SHAMAN_SPEC_ELEMENTAL)
//        m_ai->CastSpell(FLAMETONGUE_WEAPON, *me);
//    else if (weapon && (weapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT) == 0) && spec == SHAMAN_SPEC_ENHANCEMENT)
//        m_ai->CastSpell(WINDFURY_WEAPON, *me);
//
//    //Offhand
//    weapon = me->GetItemByPos(EQUIPMENT_SLOT_OFFHAND);
//    if (weapon && (weapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT) == 0) && spec == SHAMAN_SPEC_ENHANCEMENT)
//        m_ai->CastSpell(FLAMETONGUE_WEAPON, *me);
//
//    // Revive
//    if (HealPlayer(GetResurrectionTarget()) & RETURN_CONTINUE)
//        return;
//
//    // Heal
//    if (m_ai->IsHealer())
//    {
//        if (HealPlayer(GetHealTarget()) & RETURN_CONTINUE)
//            return;// RETURN_CONTINUE;
//    }
//    else
//    {
//        // Is this desirable? Debatable.
//        // TODO: In a group/raid with a healer you'd want this bot to focus on DPS (it's not specced/geared for healing either)
//        if (HealPlayer(me) & RETURN_CONTINUE)
//            return;// RETURN_CONTINUE;
//    }
//
//    // hp/mana check
//    if (me->getStandState() != UNIT_STAND_STATE_STAND)
//        me->SetStandState(UNIT_STAND_STATE_STAND);
//
//    if (EatDrinkBandage())
//        return;
} // end DoNonCombatActions

bool PlayerbotShamanAI::CastHoTOnTank()
{
    //if (!m_ai) return false;

    //if ((PlayerbotAI::ORDERS_HEAL & m_ai->GetCombatOrder()) == 0) return false;

    // Shaman: Healing Stream Totem, Earthliving Weapon, and Riptide (with talents)
    // None of these are cast before Pulling

    return false;
}

void PlayerbotShamanAI::UpdateGroupActions(uint32 const diff)
{
    if (me->IsMounted() || me->HasUnitState(UNIT_STATE_CASTING) ||
        me->HasAuraType(SPELL_AURA_MOD_SILENCE) ||
        me->HasAuraType(SPELL_AURA_MOD_PACIFY_SILENCE) ||
        (me->GetInterruptMask() & AURA_INTERRUPT_FLAG_NOT_SEATED))
        return;

    MainSpec spec = MainSpec(m_ai->GetMySpec());
    //1 Shaman specific
    //1.1 item enchancements
    //casts are instant so check even in combat
    //1.1.1 mainhand
    Item* weapon = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
    if (weapon && !weapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT))
    {
        //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotShamanAI:: %s has found unenchanted mainhand weapon %s", me->GetName().c_str(), weapon->GetTemplate()->Name1.c_str());
        switch (spec)
        {
            case SHAMAN_SPEC_RESTORATION:
                if (EARTHLIVING_WEAPON)
                {
                    m_ai->CastSpell(weapon, EARTHLIVING_WEAPON);
                    //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotShamanAI:: %s tries to enchant with Earthliving", me->GetName().c_str());
                }
                break;
            case SHAMAN_SPEC_ELEMENTAL:
                if (FLAMETONGUE_WEAPON)
                {
                    m_ai->CastSpell(weapon, FLAMETONGUE_WEAPON);
                    //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotShamanAI:: %s tries to enchant with Flametongue", me->GetName().c_str());
                }
                break;
            case SHAMAN_SPEC_ENHANCEMENT:
                if (WINDFURY_WEAPON)
                {
                    m_ai->CastSpell(weapon, WINDFURY_WEAPON);
                    //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotShamanAI:: %s tries to enchant with Windfury", me->GetName().c_str());
                }
                else if (FROSTBRAND_WEAPON)
                {
                    m_ai->CastSpell(weapon, FROSTBRAND_WEAPON);
                    //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotShamanAI:: %s tries to enchant with Frostbrand", me->GetName().c_str());
                }
                break;
            default:
                break;
        }
    }
    //1.1.2 offhand
    weapon = me->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
    if (weapon && !weapon->GetEnchantmentId(TEMP_ENCHANTMENT_SLOT))
    {
        switch (spec)
        {
            case SHAMAN_SPEC_RESTORATION:
                if (EARTHLIVING_WEAPON)
                    m_ai->CastSpell(weapon, EARTHLIVING_WEAPON);
                break;
            case SHAMAN_SPEC_ELEMENTAL:
                if (FLAMETONGUE_WEAPON)
                    m_ai->CastSpell(weapon, FLAMETONGUE_WEAPON);
                break;
            case SHAMAN_SPEC_ENHANCEMENT:
                if (WINDFURY_WEAPON)
                    m_ai->CastSpell(weapon, WINDFURY_WEAPON);
                else if (FROSTBRAND_WEAPON)
                    m_ai->CastSpell(weapon, FROSTBRAND_WEAPON);
                break;
            default:
                break;
        }
    }
    //1.2 elemental shield: self
    if (spec == SHAMAN_SPEC_RESTORATION && WATER_SHIELD && !me->HasAura(WATER_SHIELD))
    {
        m_ai->CastSpell(me, WATER_SHIELD);
    }
    else if (LIGHTNING_SHIELD && !me->HasAura(LIGHTNING_SHIELD))
    {
        m_ai->CastSpell(me, LIGHTNING_SHIELD);
    }
    //end Shaman specific

    //2 Heal

    //3 Cure
    //3.1 Cure Toxins
    if (CURE_TOXINS)
        m_ai->CureGroup(me, CURE_TOXINS, diff);
    //3.2 Tremor totem, TODO:
    //if (TREMOR_TOTEM)
    //{}
    //end Cure

    //4 Non-combat Actions




    if (me->duel && me->duel->startTimer != 0)
        return;
}
