#ifndef _PLAYERBOTAI_H
#define _PLAYERBOTAI_H

#include "Common.h"
#include "DBCEnums.h"

//class Group;
class Item;
class Player;
class PlayerbotClassAI;
class PlayerbotMgr;
class Quest;
class Spell;
class SpellInfo;
class Unit;
class WorldObject;
class WorldPacket;

struct Position;

enum BotSpecial
{
    SPELL_ROOT              = 42716 // Netherspite SPELL_BANISH_ROOT "Self Root Forever (No Visual)"
};

enum BotStates
{
    //BOTSTATE_NORMAL                 = 0x000,    //nothing
    BOTSTATE_FOLLOW                 = 0x001,    //following (deprecated?)
    BOTSTATE_STAY                   = 0x002,    //stay (not same as MOVEMENT_FLAG_HOLD_GROUND!)
    BOTSTATE_COMBAT                 = 0x004,    //do combat moves
    BOTSTATE_LOOTING                = 0x008,    //need to perform loot sequence
    BOTSTATE_TAME                   = 0x010,    //has target to tame (deprecated?)
    BOTSTATE_DELAYED                = 0x020,    //delayed operations queued (wtf?)
    BOTSTATE_RESET                  = 0x040     //need to reset these flags
};

enum BotCombatStates
{
    COMBAT_STATE_RANGED             = 0x001,    //do ranged combat
    COMBAT_STATE_STAY               = 0x002,    //stay in place
    COMBAT_STATE_PVP                = 0x004,    //for PvP behaviour
    COMBAT_STATE_RESET              = 0x008     //free to change movement (used to chase current target)
};

enum BotMovementFlags
{
    MOVEMENT_FLAG_NONE              = 0x000,    //following normally
    MOVEMENT_FLAG_TARGET_CHANGED    = 0x001,    //should be present to follow others
    MOVEMENT_FLAG_HOLD_GROUND       = 0x002,    //rotate only
    MOVEMENT_FLAG_RANDOM_MOVEMENT   = 0x004     //move randomly while doing nothing
};

enum RacialTraits
{
    ARCANE_TORRENT_MANA_CLASSES    = 28730,
    ARCANE_TORRENT_DEATH_KNIGHT    = 50613,
    ARCANE_TORRENT_ROGUE           = 25046,
    BERSERKING_ALL                 = 26297,
    BLOOD_FURY_MELEE_CLASSES       = 20572,
    BLOOD_FURY_WARLOCK             = 33702,
    BLOOD_FURY_SHAMAN              = 33697,
    ESCAPE_ARTIST_ALL              = 20589,
    EVERY_MAN_FOR_HIMSELF_ALL      = 59752,
    GIFT_OF_THE_NAARU_DEATH_KNIGHT = 59545,
    GIFT_OF_THE_NAARU_HUNTER       = 59543,
    GIFT_OF_THE_NAARU_MAGE         = 59548,
    GIFT_OF_THE_NAARU_PALADIN      = 59542,
    GIFT_OF_THE_NAARU_PRIEST       = 59544,
    GIFT_OF_THE_NAARU_SHAMAN       = 59547,
    GIFT_OF_THE_NAARU_WARRIOR      = 28880,
    SHADOWMELD_ALL                 = 58984,
    STONEFORM_ALL                  = 20594,
    WAR_STOMP_ALL                  = 20549,
    WILL_OF_THE_FORSAKEN_ALL       = 7744
};

struct AfterCast
{
        AfterCast();

        //WorldLocation* GetTravelLocation() const { return _travelDest; }
        //void SetTravelLocation(WorldLocation* loc) { _travelDest = loc; }
        inline Unit* GetTarget() const;
        inline void SetTarget(Unit* target);
        inline void SetAfterCastCommand(void (*newAfterCast)(Unit*));
        inline void LaunchAfterCastCommand();

    private:
        //WorldLocation* _travelDest;
        Unit* _afterCastTarget;
        void (*afterCast)(Unit*);
};

class PlayerbotAI
{
    public:
        PlayerbotAI(PlayerbotMgr* const mgr, Player* const bot);
        virtual ~PlayerbotAI();

        Player* GetMaster() const;
        //inline BotState GetBotState() const { return m_botState; }
        //inline void SetBotState(BotState state) { m_botState = state; }

        //on world update tick
        void UpdateAI(uint32 diff);
        void ReloadClassAI();

        //actions
        void UpdateDeadActions(uint32 diff);
        void UpdateIncombatActions();
        void UpdateFollowActions(uint32 diff);

        //states
        void UpdateMountedState(uint32 diff);
        void UpdateStandState();

        inline uint8 GetBotState() const { return _botStates; }
        inline bool HasBotState(BotStates state) const { return (_botStates & state); }
        inline void AddBotState(BotStates state) { if (!(_botStates & state)) _botStates |= state; }
        inline void ClearBotState(BotStates state) { if (_botStates & state) _botStates &= ~state; }

        //casts
        // units
        bool CastSpell(Unit* victim, uint32 spellId) const;
        bool CastSpell(Unit* victim, SpellInfo const* spellInfo) const;
        // items
        bool CastSpell(Item* item, uint32 spellId) const;
        bool CastSpell(Item* item, SpellInfo const* spellInfo) const;
        //  cures
        void CureGroup(Player* player, uint32 cureSpell, const uint32 diff);
    private:
        inline bool _CureTarget(Unit* target, SpellInfo const* spellInfo) const;
        bool _CanCureTarget(Unit* target, SpellInfo const* spellInfo) const;
    public:

        //spells
        static uint32 InitSpell(Player* caster, uint32 baseSpell);

        inline bool IsMoving() const;

        //currspell
        inline Spell* GetCurrentSpell() const;
        inline uint32 GetCurrentSpellId() const;

        //movement
        void SetMovement(WorldObject* followTarget);
        inline uint8 GetMovementFlags() const { return _movementFlags; }
        inline bool HasMovementFlag(BotMovementFlags flag) const { return (_movementFlags & flag); }
        inline void AddMovementFlag(BotMovementFlags flag) { if (!(_movementFlags & flag)) _movementFlags |= flag; }
        inline void ClearMovementFlag(BotMovementFlags flag) { if (_movementFlags & flag) _movementFlags &= ~flag; }
        inline void RemoveMovementFlag(BotMovementFlags flag) { ClearMovementFlag(flag); }
        inline bool CanMove() const { return (!(_movementFlags & MOVEMENT_FLAG_HOLD_GROUND)); }
        inline bool CanFollowOthers() const { return (_movementFlags & MOVEMENT_FLAG_TARGET_CHANGED); }

        //combat
        inline uint8 GetCombatStates() const { return _combatStates; }
        inline bool HasCombatState(BotCombatStates state) const { return (_combatStates & state); }
        inline void AddCombatState(BotCombatStates state) { if (!(_combatStates & state)) _combatStates |= state; }
        inline void ClearCombatState(BotCombatStates state) { if (_combatStates & state) _combatStates &= ~state; }
        inline bool ShouldRanged() const { return (_combatStates & COMBAT_STATE_RANGED); }
        inline bool ShouldStay() const { return (_combatStates & COMBAT_STATE_STAY); }

        bool HasAttackTarget(uint8 myclass, uint32 myspec);
        Unit* GetAttackTarget(bool ranged, bool byspell, bool &reset) const;
        void GetInPosition(bool force, bool ranged, Unit* target = NULL, Position* pos = NULL);

        //combat utils
        static bool CanPlayerbotAttack(Player* bot, Unit* target, int8 byspell = 0);
        static bool IsUnitInDuel(Unit* target, Player* master);
        static bool IsUnitInPlayersParty(Unit* unit, Player* master);

        //packets
        void OnBotOutgoingPacket(WorldPacket const& packet);
        void HandleTeleportAck();

        //commands
        void HandleCommand(std::string const& /*msg*/, Player& /*player*/) {}

        //interraction
        inline void Tell(std::string const& text, uint64 targetGUID = 0);

        //utilities
        static uint32 GetLostHP(Unit* unit);
        static uint8 GetHealthPCT(Unit* unit);
        static uint8 GetManaPCT(Unit* unit);

        //temp / debug
        //TODO: init range for classes
        uint32 GetMySpec() const { return _mySpec; }
        inline float GetMinAttackRange(Unit* target) const;
        void InviteToMastersGroup() { _InviteToMastersGroup(); }
        void SendDebugInfo() { _SendDebugInfo(); }
        inline void GiveLevel(uint8 /*level*/) {}
        inline void AcceptQuest(Quest const* /*quest*/, Player* /*divider*/) {}

    protected:
        static inline bool CCed(Unit* unit, bool root = false);

    private:
        inline void _doTimers(uint32 diff);

        void _UnbindInstance(uint32 mapId, Difficulty diff);
        void _InviteToMastersGroup();
        void _SendDebugInfo();

        Unit* _opponent;

        PlayerbotMgr* const _mgr;
        Player* const me;
        PlayerbotClassAI* _classAI;

        AfterCast* _afterCast;

        uint32 _mySpec;

        uint8 _botStates;
        uint8 _combatStates;
        uint8 _movementFlags;

        uint32 _followTimer;
        uint64 _followTargetGUID;

        uint32 _waitTimer;
        uint32 _mountTimer;
        uint32 _cureTimer;
        uint32 _selfResTimer;

        bool _canSelfRes;

        //// This is called from ChatHandler.cpp when there is an incoming message to the bot
        //// from a whisper or from the party channel
        //void HandleCommand(std::string const& text, Player& fromPlayer);

        ////Packets
        //void HandleBotOutgoingPacket(const WorldPacket& packet);

        //// This is called by WorldSession.cpp
        //// when it detects that a bot is being teleported. It acknowledges to the server to complete the
        //// teleportation
        //void HandleTeleportAck();

        //// Returns what kind of situation we are in so the ai can react accordingly
        //ScenarioType GetScenarioType() const { return m_ScenarioType; }
        //CombatStyle GetCombatStyle() const { return m_combatStyle; }
        //void SetCombatStyle(CombatStyle cs) { m_combatStyle = cs; }

        //PlayerbotClassAI* GetClassAI() const { return _classAI; }
        //PlayerbotMgr* GetManager() const { return _mgr; }

        //// finds spell ID for matching substring args
        //// in priority of full text match, spells not taking reagents, and highest rank
        //uint32 getSpellId(const char* args, bool master = false) const;
        //uint32 getPetSpellId(const char* args) const;
        //// Initialize spell using rank 1 spell id
        //uint32 initPetSpell(uint32 spellIconId);

        //// extract mail ids from links
        //void extractMailIds(std::string const& text, std::list<uint32>& mailIds) const;

        //// extract quest ids from links
        //void extractQuestIds(std::string const& text, std::list<uint32>& questIds) const;

        //// extract auction ids from links
        //void extractAuctionIds(std::string const& text, std::list<uint32>& auctionIds) const;

        //// extracts talent ids to list
        //void extractTalentIds(std::string const& text, std::list<talentPair>& talentIds) const;

        //// extracts item ids from links
        //void extractItemIds(std::string const& text, std::list<uint32>& itemIds) const;

        //// extract spellid from links
        //void extractSpellId(std::string const& text, uint32 &spellId) const;

        //// extract spellids from links to list
        //void extractSpellIdList(std::string const& text, BotEntryList& m_spellsToLearn) const;

        //// extracts currency from a string as #g#s#c and returns the total in copper
        //uint32 extractMoney(std::string const& text) const;

        //// extracts gameobject info from link
        //void extractGOinfo(std::string const& text, BotObjectList& m_lootTargets) const;

        //// finds items in bots equipment and adds them to foundItemList, removes found items from itemIdSearchList
        //void findItemsInEquip(std::list<uint32>& itemIdSearchList, std::list<Item*>& foundItemList) const;
        //// finds items in bots inventory and adds them to foundItemList, removes found items from itemIdSearchList
        //void findItemsInInv(std::list<uint32>& itemIdSearchList, std::list<Item*>& foundItemList) const;
        //// finds nearby game objects that are specified in m_collectObjects then adds them to the m_lootTargets list
        //void findNearbyGO();
        //// finds nearby creatures, whose UNIT_NPC_FLAGS match the flags specified in item list m_itemIds
        //void findNearbyCreature();
        //// finds nearby corpse that is lootable
        //void findNearbyCorpse();

        //void GiveLevel(uint32 level);

        //// Error check the TS DB. Should only be used when admins want to verify their new TS input
        //uint32 TalentSpecDBContainsError();

        //// Get talent specs or counts thereof
        //uint32 GetTalentSpecsAmount();
        //uint32 GetTalentSpecsAmount(uint32 specClass);
        //std::list<TalentSpec> GetTalentSpecs(uint32 specClass);
        //TalentSpec GetTalentSpec(uint32 specClass, uint32 choice);
        //TalentSpec GetActiveTalentSpec() const { return m_activeTalentSpec; }
        //void ClearActiveTalentSpec() { m_activeTalentSpec.specName = ""; m_activeTalentSpec.specClass = 0; m_activeTalentSpec.specPurpose = TSP_NONE; for (int i = 0; i < 71; i++) m_activeTalentSpec.talentId[i] = 0; for (int i = 0; i < 3; i++) { m_activeTalentSpec.glyphIdMajor[i] = 0; m_activeTalentSpec.glyphIdMinor[i] = 0; } }
        //void SetActiveTalentSpec(TalentSpec ts) { m_activeTalentSpec = ts; }
        //bool ApplyActiveTalentSpec();

        //void MakeSpellLink(SpellInfo const* sInfo, std::ostringstream& out);
        //void MakeWeaponSkillLink(SpellInfo const* sInfo, std::ostringstream& out, uint32 skillid);

        //// currently bots only obey commands from the master
        //bool canObeyCommandFrom(Player const& player) const;

        //// get current casting spell (will return NULL if no spell!)

        //bool HasAura(uint32 spellId, const Unit& player) const;
        //bool HasAura(const char* spellName, const Unit& player) const;
        //bool HasAura(const char* spellName) const;

        //bool CanReceiveSpecificSpell(uint8 spec, Unit* target) const;

        //bool HasTool(uint32 TC) const;
        //bool HasSpellReagents(uint32 spellId) const;
        //void ItemCountInInv(uint32 itemid, uint32& count);
        //uint32 GetSpellCharges(uint32 spellId);

        //Item* FindFood() const;
        //Item* FindDrink() const;
        //Item* FindBandage() const;
        //Item* FindPoison() const;
        //Item* FindMount(uint32 matchingRidingSkill) const;
        //Item* FindItem(uint32 ItemId, bool Equipped_too = false);
        //Item* FindItemInBank(uint32 ItemId);
        //Item* FindKeyForLockValue(uint32 reqSkillValue);
        //Item* FindBombForLockValue(uint32 reqSkillValue);
        //Item* FindConsumable(uint32 displayId) const;
        //uint8 _findItemSlot(Item* target);
        //bool CanStore() const;

        //// ******* Actions ****************************************
        //// Your handlers can call these actions to make the bot do things.
        //void TellMaster(std::string const& text) const;
        //void TellMaster(const char* fmt, ...) const;
        //void SendWhisper(std::string const& text, Player& player) const;
        //bool CastSpell(const char* args);
        //bool CastSpell(uint32 spellId);
        //bool CastSpell(uint32 spellId, Unit& target);
        //bool CheckBotCast(SpellInfo const* sInfo);
        //bool CastPetSpell(uint32 spellId, Unit* target = NULL);
        //bool Buff(uint32 spellId, Unit* target, void (*beforeCast)(Player *) = NULL);
        //bool SelfBuff(uint32 spellId);
        //bool IsInRange(Unit* Target, uint32 spellId);

        //void UseItem(Item* item, uint32 targetFlag, uint64 targetGUID);
        //void UseItem(Item* item, uint8 targetInventorySlot);
        //void UseItem(Item* item, Unit* target);
        //void UseItem(Item* item);

        //void PlaySound(uint32 soundid);
        //void Announce(AnnounceFlags msg);

        //void EquipItem(Item* src_Item);
        ////void Stay();
        ////bool Follow(Player& player);
        //void SendNotEquipList(Player& player);

        //uint8  m_DelayAttack;
        //Unit* gPrimtarget;
        //Unit* gSectarget;
        //uint32 gQuestFetch;

        //bool m_AutoEquipToggle;             //switch for autoequip
        //uint32 SellWhite;                   //switch for white item auto sell
        //uint8 DistOverRide;
        //float gDist[2]; //gDist, gTemp vars are used for variable follow distance
        //float gTempDist;
        //float gTempDist2;
        //uint8 m_FollowAutoGo;
        //uint8 IsUpOrDown; //tracks variable follow distance
        //void BotDataRestore();
        //void CombatOrderRestore();
        //void AutoUpgradeEquipment();
        //void AutoEquipComparison(Item* pItem, Item* pItem2);
        //bool ItemStatComparison(ItemTemplate const* pProto, ItemTemplate const* pProto2);
        //void Feast();
        //void InterruptCurrentCastingSpell();
        //void Attack(Unit* forcedTarget = NULL);
        //void GetCombatTarget(Unit* forcedTarget = 0);
        //void GetDuelTarget(Unit* forcedTarget);
        //Unit* GetCurrentTarget() const { return m_targetCombat; }
        //void DoNextCombatManeuver();
        //void DoCombatMovement();
        ////void SetIgnoreUpdateTime(uint8 t = 0) { m_ignoreAIUpdatesUntilTime = time(NULL) + t; };
        //void SetState(BotState state);
        //void SetQuestNeedItems();
        //void SetQuestNeedCreatures();
        //void SendQuestNeedList();
        //bool IsInQuestItemList(uint32 itemid) const { return m_needItemList.find(itemid) != m_needItemList.end(); };
        //bool IsInQuestCreatureList(uint32 id) const { return m_needCreatureOrGOList.find(id) != m_needCreatureOrGOList.end(); };
        //bool IsItemUseful(uint32 itemid);
        //void SendOrders(Player& player);
        //bool DoTeleport(WorldObject& obj);
        //void DoLoot();
        //void DoFlight();
        //void GetTaxi(uint64 guid, BotTaxiNode& nodes);
        //void BeingRolledOn(uint64 target) { m_being_rolled_on.push_back(target); };

        //bool HasCollectFlag(uint16 flag) { return m_collectionFlags & flag; }
        //void SetCollectFlag(uint16 flag)
        //{
        //    if (HasCollectFlag(flag)) m_collectionFlags &= ~flag;
        //    else m_collectionFlags |= flag;
        //}

        //uint32 EstRepairAll();
        //uint32 EstRepair(uint16 pos);

        //void AcceptQuest(Quest const *qInfo, Player *pGiver);
        //void TurnInQuests(WorldObject *questgiver);
        //void ListQuests(WorldObject* questgiver);
        //bool AddQuest(uint32 const entry, WorldObject* questgiver);
        //void MakeQuestLink(Quest const* quest, std::ostringstream &out);

        //bool IsInCombat();
        //bool IsGroupInCombat();
        //Player* GetGroupTank(); // TODO: didn't want to pollute non-playerbot code but this should really go in group.cpp
        //void SetGroupCombatOrder(CombatOrderType co);
        //void ClearGroupCombatOrder(CombatOrderType co);
        //void SetGroupIgnoreUpdateTime(uint8 t);
        //bool GroupHoTOnTank() const;
        //bool CanPull(Player& fromPlayer);
        //bool CastPull();
        //bool GroupTankHoldsAggro();
        //void UpdateAttackerInfo();
        //Unit* FindAttacker(ATTACKERINFOTYPE ait = AIT_NONE, Unit* victim = NULL);
        //uint32 GetAttackerCount() const { return m_attackerInfo.size(); };
        //void SetCombatOrderByStr(std::string str, Unit* target = NULL);
        //void SetCombatOrder(CombatOrderType co, Unit* target = NULL);
        //void ClearCombatOrder(CombatOrderType co);
        //CombatOrderType GetCombatOrder() const { return this->m_combatOrder; }
        //bool IsTank() const { return (m_combatOrder & ORDERS_TANK) ? true : false; }
        //bool IsHealer() const { return (m_combatOrder & ORDERS_HEAL) ? true : false; }
        //bool IsDPS() const { return (m_combatOrder & ORDERS_ASSIST) ? true : false; }
        //void SetMovementOrder(MovementOrderType mo, Unit* followTarget = NULL);
        //MovementOrderType GetMovementOrder() const { return this->m_movementOrder; }
        //void MovementReset();
        //void MovementClear();

    //    void SetInFront(Unit const* obj);

    //    void ItemLocalization(std::string& itemName, uint32 const itemID) const;
    //    void QuestLocalization(std::string& questTitle, uint32 const questID) const;
    //    void CreatureLocalization(std::string& creatureName, uint32 const entry) const;
    //    void GameObjectLocalization(std::string& gameobjectName, uint32 const entry) const;

    //    uint32 GetFreeBagSpace() const;
    //    bool DropGarbage(bool bVerbose);
    //    void SellGarbage(Player& player, bool listNonTrash = true, bool bDetailTrashSold = false, bool verbose = true);
    //    void Sell(uint32 const itemid);
    //    void Buy(Creature* vendor, uint32 const itemid);
    //    std::string DropItem(uint32 const itemid);
    //    void AddAuction(uint32 const itemid, Creature* aCreature);
    //    void ListAuctions();
    //    bool RemoveAuction(uint32 const auctionid);
    //    void Repair(uint32 const itemid, Creature* rCreature);
    //    bool Talent(Creature* tCreature);
    //    void InspectUpdate();
    //    bool Withdraw(uint32 const itemid);
    //    bool Deposit(uint32 const itemid);
    //    void BankBalance();
    //    std::string Cash(uint32 copper);
    //    std::string AuctionResult(std::string subject, std::string body);

    //protected:
    //    bool ValidateTalent(uint16 talent, uint32 charClass);
    //    bool ValidateGlyph(uint16 glyph, uint32 charClass);
    //    bool ValidateMajorGlyph(uint16 glyph, uint32 charClass);
    //    bool ValidateMinorGlyph(uint16 glyph, uint32 charClass);

    //private:
    //    bool ExtractCommand(std::string const sLookingFor, std::string& text, bool bUseShort = false);
    //    // outsource commands for code clarity
    //    void _HandleCommandReset(std::string& text, Player& fromPlayer);
    //    void _HandleCommandOrders(std::string& text, Player& fromPlayer);
    //    void _HandleCommandFollow(std::string& text, Player& fromPlayer);
    //    void _HandleCommandStay(std::string& text, Player& fromPlayer);
    //    void _HandleCommandAttack(std::string& text, Player& fromPlayer);
    //    void _HandleCommandPull(std::string& text, Player& fromPlayer);
    //    void _HandleCommandCast(std::string& text, Player& fromPlayer);
    //    void _HandleCommandSell(std::string& text, Player& fromPlayer);
    //    void _HandleCommandBuy(std::string& text, Player& fromPlayer);
    //    void _HandleCommandDrop(std::string& text, Player& fromPlayer);
    //    void _HandleCommandRepair(std::string& text, Player& fromPlayer);
    //    void _HandleCommandAuction(std::string& text, Player& fromPlayer);
    //    void _HandleCommandMail(std::string& text, Player& fromPlayer);
    //    void _HandleCommandBank(std::string& text, Player& fromPlayer);
    //    void _HandleCommandTalent(std::string& text, Player& fromPlayer);
    //    void _HandleCommandUse(std::string& text, Player& fromPlayer);
    //    void _HandleCommandEquip(std::string& text, Player& fromPlayer);
    //    void _HandleCommandFind(std::string& text, Player& fromPlayer);
    //    void _HandleCommandGet(std::string& text, Player& fromPlayer);
    //    void _HandleCommandCollect(std::string& text, Player& fromPlayer);
    //    void _HandleCommandQuest(std::string& text, Player& fromPlayer);
    //    void _HandleCommandCraft(std::string& text, Player& fromPlayer);
    //    void _HandleCommandEnchant(std::string& text, Player& fromPlayer);
    //    void _HandleCommandProcess(std::string& text, Player& fromPlayer);
    //    void _HandleCommandPet(std::string& text, Player& fromPlayer);
    //    void _HandleCommandSpells(std::string& text, Player& fromPlayer);
    //    void _HandleCommandSurvey(std::string& text, Player& fromPlayer);
    //    void _HandleCommandSkill(std::string& text, Player& fromPlayer);
    //    bool _HandleCommandSkillLearnHelper(TrainerSpell const* tSpell, uint32 spellId, uint32 cost);
    //    void _HandleCommandStats(std::string& text, Player& fromPlayer);
    //    void _HandleCommandHelp(std::string& text, Player& fromPlayer);
    //    void _HandleCommandHelp(const char* szText, Player& fromPlayer) { std::string text = szText; _HandleCommandHelp(text, fromPlayer); }
    //    void _HandleCommandGM(std::string& text, Player& fromPlayer);
    //    std::string _HandleCommandHelpHelper(std::string sCommand, std::string sExplain, HELPERLINKABLES reqLink = HL_NONE, bool bReqLinkMultiples = false, bool bCommandShort = false);

        //// ****** Closed Actions ********************************
        //// These actions may only be called at special times.
        //// Trade methods are only applicable when the trade window is open
        //// and are only called from within HandleCommand.
        //bool TradeItem(Item const& item, int8 slot = -1);
        //bool TradeCopper(uint32 copper);

        //// Helper routines not needed by class AIs.
        //void UpdateAttackersForTarget(Unit* victim);

        //void _doSellItem(Item const* item, std::ostringstream& report, std::ostringstream& canSell, uint32& TotalCost, uint32& TotalSold);
        //void MakeItemLink(Item const* item, std::ostringstream& out, bool IncludeQuantity = true);
        //void MakeItemText(Item const* item, std::ostringstream& out, bool IncludeQuantity = true);
        //void MakeItemLink(ItemTemplate const* item, std::ostringstream& out);

        // it is safe to keep these back reference pointers because m_bot
        // owns the "this" object and m_master owns m_bot. The owner always cleans up.

        // ignores AI updates until time specified
        // no need to waste CPU cycles during casting etc
        //time_t m_ignoreAIUpdatesUntilTime;

        //CombatStyle m_combatStyle;
        //CombatOrderType m_combatOrder;
        //MovementOrderType m_movementOrder;

        //TalentSpec m_activeTalentSpec;

        //ScenarioType m_ScenarioType;

        // defines the state of behaviour of the bot

        //// list of items, creatures or gameobjects needed to fullfill quests
        //BotNeedItem m_needItemList;
        //BotNeedItem m_needCreatureOrGOList;

        //// list of creatures we recently attacked and want to loot
        //BotNPCList m_findNPC;               // list of NPCs
        //BotTaskList m_tasks;                // list of tasks
        //BotObjectList m_lootTargets;        // list of targets
        //BotEntryList m_spellsToLearn;       // list of spells
        //uint64 m_lootCurrent;           // current remains of interest
        //uint64 m_lootPrev;              // previous loot
        //BotEntryList m_collectObjects;      // object entries searched for in findNearbyGO
        //BotTaxiNode m_taxiNodes;            // flight node chain
        //BotEntryList m_noToolList;          // list of required tools
        //BotObjectList m_being_rolled_on;    // list of targets currently involved in item rolls

        //uint16 m_collectionFlags;            // what the bot should look for to loot
        //uint32 m_collectDist;               // distance to collect objects
        //bool m_inventory_full;
        //uint32 m_itemTarget;
        //bool m_dropWhite;

        ////time_t m_TimeDoneEating;
        ////time_t m_TimeDoneDrinking;
        ////uint32 m_CurrentlyCastingSpellId;
        //uint32 m_CraftSpellId;
        ////bool m_IsFollowingMaster;

        //// if master commands bot to do something, store here until updateAI
        //// can do it
        //uint32 m_spellIdCommand;
        //uint64 m_targetGuidCommand;
        //uint64 m_taxiMaster;

        //BotObjectSet m_ignorePlayersChat;  // list of players that the bot will not respond to

        //AttackerInfoList m_attackerInfo;

        //bool m_targetChanged;
        //CombatTargetType m_targetType;

        //Unit* m_targetCombat;       // current combat target
        //Unit* m_targetAssist;       // get new target by checking attacker list of assisted player
        //Unit* m_targetProtect;      // check

        //Unit* m_followTarget;       // whom to follow in non combat situation?

        //uint32 FISHING,
        //    HERB_GATHERING,
        //    MINING,
        //    SKINNING,
        //    ASPECT_OF_THE_MONKEY;

        //float m_destX, m_destY, m_destZ; // latest coordinates for chase and point movement types

        //bool m_bDebugCommandChat;
};

#endif