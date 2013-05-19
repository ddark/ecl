/*
** Experimental!!!
** Dynamic Difficulty
*/

#include "ScriptPCH.h"
#include "Config.h"
#include <math.h>

#define DI_SQL_GET "SELECT `InstanceId`, `InstanceLevel` FROM `world_instance`"
#define DI_SQL_SAVE "REPLACE INTO `world_instance` (`InstanceId`, `InstanceLevel`) VALUES ('%u', '%u')"
#define DI_SQL_DELETE "DELETE FROM `world_instance` WHERE `InstanceId` = '%u'"
#define DI_SQL_CLEANUP "DELETE `w` FROM `world_instance` `w` LEFT JOIN `instance` `i` ON `w`.`InstanceId` = `i`.`id` WHERE `i`.`id` IS NULL"

enum DynamicDifficulty
{
    DD_MAX_LEVEL = 80,
    DD_EXPANSION_BC = 59,
    DD_EXPANSION_WOTLK = 69,
    DD_EXPANSION_CATACLYSM = 79,
};

bool DDEnable = false; // Dynamic Difficulty
bool DDDungeon = true; // only dungeon

int DDLevel = DD_MAX_LEVEL; // world level when not only dungeon
/* future:
        -1 : dynamic
        0 : correcting features
        1..X : all creature in level
*/
struct DITemplate
{
    DITemplate() : level(0) {} // по умолчанию уровень подземелья 0, что значит не используются
                               // динамические подземелья
    uint8 level;

    bool isValid() const { return level != 0; }
};

typedef std::map<uint32, DITemplate> DIMap;
DIMap DIData;

void DILoadDataFromDB()
{
    DIData.clear();

    CharacterDatabase.PExecute(DI_SQL_CLEANUP);

    TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, "Loading DynamicInstance...");
    uint32 oldMSTime = getMSTime();

    QueryResult result = CharacterDatabase.PQuery(DI_SQL_GET);

    uint16 count = 0;

    if (!result)
    {
        TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, ">> `world_instance` is empty");
        return;
    }
    do
    {
        Field* fields = result->Fetch();

        DIData[fields[0].GetUInt32()].level = fields[1].GetUInt8();
    }
    while (result->NextRow());

    TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, ">> Loaded %u instances for DynamicInstance in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

bool DICreateOrExisted(Map* map)
{
    if (!DDEnable || !map->IsDungeon())
        return false;

    if (DIData[map->GetInstanceId()].isValid())
        return true;

    Map::PlayerList const &players = map->GetPlayers();

    if (!players.isEmpty())
        if (Player* player = players.begin()->getSource())
        {
            DIData[map->GetInstanceId()].level = player->getLevel();
            CharacterDatabase.PExecute(DI_SQL_SAVE, map->GetInstanceId(), DIData[map->GetInstanceId()].level);
            return true;
        }
    return false;
}

void DIRemoveData(uint32 instanceid)
{
    if (!DDEnable)
        return;

    if (DIData.empty())
        return;

    if (!DIData[instanceid].isValid())
        return;

    CharacterDatabase.PExecute(DI_SQL_DELETE, instanceid);

    DIMap::iterator itr;

    for (itr = DIData.begin(); itr != DIData.end();)
    {
        if (itr->first == instanceid)
        {
            DIData.erase(itr);
            return;
        }
        else
            ++itr;
    }
}

/*
    CREATURE_TYPE_BEAST            = 1,
    CREATURE_TYPE_DRAGONKIN        = 2,
    CREATURE_TYPE_DEMON            = 3,
    CREATURE_TYPE_ELEMENTAL        = 4,
    CREATURE_TYPE_GIANT            = 5,
    CREATURE_TYPE_UNDEAD           = 6,
    CREATURE_TYPE_HUMANOID         = 7,
    CREATURE_TYPE_CRITTER          = 8,
    CREATURE_TYPE_MECHANICAL       = 9,
    CREATURE_TYPE_NOT_SPECIFIED    = 10,
    CREATURE_TYPE_TOTEM            = 11,
    CREATURE_TYPE_NON_COMBAT_PET   = 12,
    CREATURE_TYPE_GAS_CLOUD        = 13
    
    CREATURE_FAMILY_WOLF           = 1,
    CREATURE_FAMILY_CAT            = 2,
    CREATURE_FAMILY_SPIDER         = 3,
    CREATURE_FAMILY_BEAR           = 4,
    CREATURE_FAMILY_BOAR           = 5,
    CREATURE_FAMILY_CROCOLISK      = 6,
    CREATURE_FAMILY_CARRION_BIRD   = 7,
    CREATURE_FAMILY_CRAB           = 8,
    CREATURE_FAMILY_GORILLA        = 9,
    CREATURE_FAMILY_HORSE_CUSTOM   = 10,                    // not exist in DBC but used for horse like beasts in DB
    CREATURE_FAMILY_RAPTOR         = 11,
    CREATURE_FAMILY_TALLSTRIDER    = 12,
    CREATURE_FAMILY_FELHUNTER      = 15,
    CREATURE_FAMILY_VOIDWALKER     = 16,
    CREATURE_FAMILY_SUCCUBUS       = 17,
    CREATURE_FAMILY_DOOMGUARD      = 19,
    CREATURE_FAMILY_SCORPID        = 20,
    CREATURE_FAMILY_TURTLE         = 21,
    CREATURE_FAMILY_IMP            = 23,
    CREATURE_FAMILY_BAT            = 24,
    CREATURE_FAMILY_HYENA          = 25,
    CREATURE_FAMILY_BIRD_OF_PREY   = 26,
    CREATURE_FAMILY_WIND_SERPENT   = 27,
    CREATURE_FAMILY_REMOTE_CONTROL = 28,
    CREATURE_FAMILY_FELGUARD       = 29,
    CREATURE_FAMILY_DRAGONHAWK     = 30,
    CREATURE_FAMILY_RAVAGER        = 31,
    CREATURE_FAMILY_WARP_STALKER   = 32,
    CREATURE_FAMILY_SPOREBAT       = 33,
    CREATURE_FAMILY_NETHER_RAY     = 34,
    CREATURE_FAMILY_SERPENT        = 35,
    CREATURE_FAMILY_MOTH           = 37,
    CREATURE_FAMILY_CHIMAERA       = 38,
    CREATURE_FAMILY_DEVILSAUR      = 39,
    CREATURE_FAMILY_GHOUL          = 40,
    CREATURE_FAMILY_SILITHID       = 41,
    CREATURE_FAMILY_WORM           = 42,
    CREATURE_FAMILY_RHINO          = 43,
    CREATURE_FAMILY_WASP           = 44,
    CREATURE_FAMILY_CORE_HOUND     = 45,
    CREATURE_FAMILY_SPIRIT_BEAST   = 46
*/
bool DICreatureCalcStats(Creature* creature)
{
    if (!DDEnable || !creature->isAlive())
        return false;

    if (creature->isTotem() || creature->isTrigger() || creature->GetCreatureType() == CREATURE_TYPE_CRITTER || creature->isSpiritService())
        return false;

    uint8 level = 1;
    
    Map* map = creature->GetMap();
    Difficulty MapDiff = map->GetDifficulty();
        
    if (DDDungeon)
    {
        if (!map || !DICreateOrExisted(map))
            return false;

        uint32 instanceid = map->GetInstanceId();
        
        level = DIData[instanceid].level;
    }
    else
        level = DDLevel;

    const CreatureTemplate* cinfo = creature->GetCreatureTemplate();

    creature->SetLevel(level);

    // check expansion from level
    uint8 expansion = 0;
    bool max = level > DD_EXPANSION_CATACLYSM;
    if (level > DD_EXPANSION_BC)
        expansion++;
    if (level > DD_EXPANSION_WOTLK)
        expansion++;

    uint32 rank = creature->isPet() ? 0 : cinfo->rank;

    CreatureBaseStats const* stats = sObjectMgr->GetCreatureBaseStats(level, cinfo->unit_class);

    float damagemod = 1.0f;
    float healthmod = 1.0f;
    //uint32 attackTime = cinfo->baseattacktime;

    if (rank == CREATURE_ELITE_ELITE)
    {
        healthmod *= sWorld->getRate(RATE_CREATURE_ELITE_ELITE_HP);
        damagemod *= 4;
    }
    else if (rank == CREATURE_ELITE_RAREELITE)
    {
        healthmod *= sWorld->getRate(RATE_CREATURE_ELITE_RAREELITE_HP);
        damagemod *= 6;
    }
    else if (rank == CREATURE_ELITE_WORLDBOSS)
    {
        healthmod *= sWorld->getRate(RATE_CREATURE_ELITE_WORLDBOSS_HP);
        damagemod *= 16;
    }
    else if (rank == CREATURE_ELITE_RARE)
    {
        healthmod *= sWorld->getRate(RATE_CREATURE_ELITE_RARE_HP);
        damagemod *= 4;
    }
    // CREATURE_ELITE_NORMAL
    else
    {
        //healthmod *= sWorld->getRate(RATE_CREATURE_ELITE_NORMAL_HP);
    }
    
    if (MapDiff == DUNGEON_DIFFICULTY_HEROIC)
    {
        damagemod *= 1.5;
    }
    else if (MapDiff == DUNGEON_DIFFICULTY_EPIC) // WTF?
    {
        damagemod *= 4;
    }
    else if (MapDiff == RAID_DIFFICULTY_10MAN_NORMAL)
    {
        damagemod *= 2.5;
    }
    else if (MapDiff == RAID_DIFFICULTY_25MAN_NORMAL)
    {
        damagemod *= 3.5;
    }
    else if (MapDiff == RAID_DIFFICULTY_10MAN_HEROIC)
    {
        damagemod *= 4;
    }
    else if (MapDiff == RAID_DIFFICULTY_25MAN_HEROIC)
    {
        damagemod *= 5;
    }
    // REGULAR_DIFFICULTY, DUNGEON_DIFFICULTY_NORMAL
    else
    {
        //..nothing
    }
/*
    if (cinfo->type == CREATURE_TYPE_BEAST)
    {
        if (cinfo->family == CREATURE_FAMILY_WOLF)
            attackTime = 1500;
        else if (cinfo->family == CREATURE_FAMILY_CAT)
            attackTime = 1000;
    }
*/
    uint32 basehp = stats->GenerateHealth(expansion, cinfo->ModHealth);
    uint32 health = uint32(basehp * healthmod);
    
    //float dmgbase = (0.5 * pow(1.05, level * 2)) * (attackTime / 1000) * damagemod;
    float dmgbase = 1;

    if (expansion == 0)
        dmgbase = 1.7 * level;
    else if (expansion == 1)
        dmgbase = 4 * level;
    else if (expansion == 2 && !max)
        dmgbase = 4 * level;
    else if (max)
        dmgbase = 6 * level;
    dmgbase *= cinfo->dmg_multiplier;

    float dmgmin = dmgbase * 0.95;
    float dmgmax = dmgbase * 1.05;

    creature->SetCreateHealth(health);
    creature->SetMaxHealth(health);
    creature->SetHealth(health);
    creature->ResetPlayerDamageReq();

    uint32 mana = uint32(stats->GenerateMana(cinfo) * healthmod * cinfo->ModHealth);

    creature->SetCreateMana(mana);
    creature->SetMaxPower(POWER_MANA, mana);
    creature->SetPower(POWER_MANA, mana);

    creature->SetModifierValue(UNIT_MOD_HEALTH, BASE_VALUE, (float)health);
    creature->SetModifierValue(UNIT_MOD_MANA, BASE_VALUE, (float)mana);

    creature->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, dmgmin);
    creature->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, dmgmax);
    creature->SetBaseWeaponDamage(OFF_ATTACK, MINDAMAGE, dmgmin);
    creature->SetBaseWeaponDamage(OFF_ATTACK, MAXDAMAGE, dmgmax);
    creature->SetBaseWeaponDamage(RANGED_ATTACK, MINDAMAGE, dmgmin);
    creature->SetBaseWeaponDamage(RANGED_ATTACK, MAXDAMAGE, dmgmax);

    creature->SetModifierValue(UNIT_MOD_ATTACK_POWER, BASE_VALUE, cinfo->attackpower * damagemod);

    creature->UpdateAllStats();
    return true;
}

/*
** Функция создания добычи
**
** Варианты:
**  1. Создание шаблонов под каждый тип существа + возможность
**     указать шаблон для определенного существа для диапазонов
**     уровней. (минимальное вмешательство в ядро)
**  2. Создать аналог системы добычи как в дополнении 5+ (Mists of Pandaria),
**     Случайным образом определять игроков которые получат плюшку
**     и случайным образом с огромной таблицы предметов выбирать по критериям,
**     можно добавить дополнительные требования чтобы боссы с оружием
**     имели большую вероятность отдать аналог оружия, но это доп. расчеты.
*/
uint32 DICreatureLoot(Creature* creature)
{
    if (DDDungeon)
    {
        Map* map = creature->GetMap();

        if (!map || !DICreateOrExisted(map))
            return 0;
    }

    // if 0, used default value from database
    return 0;
}

class Mod_DynamicInstance_WorldScript : public WorldScript
{
    public:
        Mod_DynamicInstance_WorldScript() : WorldScript("Mod_DynamicInstance_WorldScript") { }

    void OnConfigLoad(bool /*reload*/)
    {
        DDEnable  = ConfigMgr::GetBoolDefault("DynamicDifficulty.Enable", false);
        DDDungeon = ConfigMgr::GetBoolDefault("DynamicDifficulty.DungeonOnly", true);
        DDLevel   = ConfigMgr::GetIntDefault("DynamicDifficulty.WorldLevel", DD_MAX_LEVEL);

        if (!DDEnable)
            return;

        DILoadDataFromDB();
    }
};

class Mod_DynamicInstance_AllInstanceScript : public AllInstanceScript
{
    public:
        Mod_DynamicInstance_AllInstanceScript() : AllInstanceScript("Mod_DynamicInstance_AllInstanceScript") { }

    void AllInstanceDeleteFromDB(uint32 instanceid)
    {
        if (DDDungeon)
            DIRemoveData(instanceid);
    }

    void AllInstanceOnPlayerEnter(Map* map, Player* /*player*/)
    {
        if (DDDungeon)
            DICreateOrExisted(map);
    }
};

class Mod_DynamicInstance_AllCreatureScript : public AllCreatureScript
{
    public:
        Mod_DynamicInstance_AllCreatureScript() : AllCreatureScript("Mod_DynamicInstance_AllCreatureScript") { }

    void AllCreatureSelectLevel(Creature* creature, bool& needSetStats)
    {
        if (!DDEnable)
            return;

        needSetStats = !DICreatureCalcStats(creature);
    }

    void AllCreatureCreate(Creature* creature)
    {
        DICreatureCalcStats(creature);
    }

    void AllCreatureCreateLoot(Creature* creature, uint32& lootid)
    {
        if (!DDEnable || lootid != 0)
            return;

        if (uint32 newlootid = DICreatureLoot(creature))
            lootid = newlootid;
    }

    void AllCreatureSpellDamageMod(Creature const* creature, SpellInfo const* spellProto, DamageEffectType /*damagetype*/, float& doneTotalMod)
    {
        //if (spellProto->SchoolMask == SPELL_SCHOOL_MASK_NORMAL)
            //return;
            
        if (!DDEnable)
            return;
            
        if (!spellProto->MaxLevel)
            return;
            
        if (creature->isTotem() || creature->isTrigger() || creature->GetCreatureType() == CREATURE_TYPE_CRITTER || creature->isSpiritService())
            return;
            
        /*uint8 level = creature->GetCreatureTemplate()->maxlevel;
        
        if (level > DD_MAX_LEVEL)
            level = DD_MAX_LEVEL;*/
        
        if (DDDungeon)
        {
            Map* map = creature->GetMap();
            
            if (!map || !map->IsDungeon())
                return;
        }

        doneTotalMod *= pow(1.05, (1.3 * (creature->getLevel() - spellProto->SpellLevel)));
    }
};

void AddSC_Mod_DynamicInstance()
{
    new Mod_DynamicInstance_WorldScript();
    new Mod_DynamicInstance_AllInstanceScript();
    new Mod_DynamicInstance_AllCreatureScript();
}