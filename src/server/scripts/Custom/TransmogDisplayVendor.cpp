/*
Transmog display vendor
Code by Rochet2
Ideas LilleCarl

ScriptName for NPC:
NPC_TransmogDisplayVendor

Compatible with Transmogrification 4.0+ by Rochet2
*/

#include "ScriptPCH.h"
#include "TransmogDisplayVendorConf.h"

// Selection store
struct selDataStruct { uint8 slot; uint32 offset; uint32 quality; };
typedef UNORDERED_MAP<uint32, selDataStruct> selDataType;
static selDataType selData; // selData[lowGUID] = slot

// Vendor data store
// optionMap[Class? + SubClass][invtype][Quality] = std::list<entry>
typedef std::list<uint32> optionDataList;
typedef std::map<uint32, optionDataList> optionData; // invtype, item entry list
typedef std::map<uint32, optionData> optionDataMap; // Class? + SubClass -> data
static std::map<uint32, optionDataMap> optionMap; // Class -> data

// Transmog store
typedef UNORDERED_MAP<uint32, uint32> transmogData;
typedef UNORDERED_MAP<uint32, transmogData> transmogMap;
static transmogMap entryMap; // entryMap[pGUID][iGUID] = entry
static transmogData dataMap; // dataMap[iGUID] = pGUID

uint32 TransmogDisplayVendorMgr::GetFakeEntry(uint32 itemGUID)
{
    transmogData::iterator itr = dataMap.find(itemGUID);
    if (itr == dataMap.end()) return 0;
    transmogMap::iterator itr2 = entryMap.find(itr->second);
    if (itr2 == entryMap.end()) return 0;
    transmogData::iterator itr3 = itr2->second.find(itemGUID);
    if (itr3 == itr2->second.end()) return 0;
    return itr3->second;
}
void TransmogDisplayVendorMgr::DeleteFakeFromDB(uint32 itemGUID)
{
    if (dataMap.find(itemGUID) != dataMap.end())
    {
        if (entryMap.find(dataMap[itemGUID]) != entryMap.end())
            entryMap[dataMap[itemGUID]].erase(itemGUID);
        dataMap.erase(itemGUID);
    }
    CharacterDatabase.PExecute("DELETE FROM custom_transmogrifications WHERE GUID = %u", itemGUID);
}
bool TransmogDisplayVendorMgr::DeleteFakeEntry(Item* item)
{
    if (!GetFakeEntry(item->GetGUIDLow()))
        return false;
    item->GetOwner()->UpdateUInt32Value(PLAYER_VISIBLE_ITEM_1_ENTRYID + (item->GetSlot() * 2), item->GetEntry());
    DeleteFakeFromDB(item->GetGUIDLow());
    return true;
}
void TransmogDisplayVendorMgr::SetFakeEntry(Item* item, uint32 entry)
{
    if (Player* player = item->GetOwner())
    {
        uint32 pGUID = player->GetGUIDLow();
        uint32 iGUID = item->GetGUIDLow();
        player->UpdateUInt32Value(PLAYER_VISIBLE_ITEM_1_ENTRYID + (item->GetSlot() * 2), entry);
        entryMap[pGUID][iGUID] = entry;
        dataMap[iGUID] = pGUID;
        CharacterDatabase.PExecute("REPLACE INTO custom_transmogrifications (GUID, FakeEntry, Owner) VALUES (%u, %u, %u)", iGUID, entry, pGUID);
    }
}

const char * getSlotName(uint8 slot)
{
    switch (slot)
    {
    case EQUIPMENT_SLOT_HEAD      : return "Head";
    case EQUIPMENT_SLOT_SHOULDERS : return "Shoulders";
    case EQUIPMENT_SLOT_BODY      : return "Shirt";
    case EQUIPMENT_SLOT_CHEST     : return "Chest";
    case EQUIPMENT_SLOT_WAIST     : return "Waist";
    case EQUIPMENT_SLOT_LEGS      : return "Legs";
    case EQUIPMENT_SLOT_FEET      : return "Feet";
    case EQUIPMENT_SLOT_WRISTS    : return "Wrists";
    case EQUIPMENT_SLOT_HANDS     : return "Hands";
    case EQUIPMENT_SLOT_BACK      : return "Back";
    case EQUIPMENT_SLOT_MAINHAND  : return "Main hand";
    case EQUIPMENT_SLOT_OFFHAND   : return "Off hand";
    case EQUIPMENT_SLOT_RANGED    : return "Ranged";
    case EQUIPMENT_SLOT_TABARD    : return "Tabard";
    default: return NULL;
    }
}

const char* getQualityName(uint32 quality)
{
    switch(quality)
    {
    case ITEM_QUALITY_POOR: return "|CFF9d9d9d[Poor]";
    case ITEM_QUALITY_NORMAL: return "|CFFffffff[Common]";
    case ITEM_QUALITY_UNCOMMON: return "|CFF1eff00[Uncommon]";
    case ITEM_QUALITY_RARE: return "|CFF0070dd[Rare]";
    case ITEM_QUALITY_EPIC: return "|CFFa335ee[Epic]";
    case ITEM_QUALITY_LEGENDARY: return "|CFFff8000[Legendary]";
    case ITEM_QUALITY_ARTIFACT: return "|CFFe6cc80[Artifact]";
    case ITEM_QUALITY_HEIRLOOM: return "|CFFe5cc80[Heirloom]";
    default: return "[Unknown]";
    }
}

std::string getItemName(const ItemTemplate* itemTemplate, WorldSession* session)
{
    std::string name = itemTemplate->Name1;
    int loc_idx = session->GetSessionDbLocaleIndex();
    if (loc_idx >= 0)
        if (ItemLocale const* il = sObjectMgr->GetItemLocale(itemTemplate->ItemId))
            sObjectMgr->GetLocaleString(il->Name, loc_idx, name);
    return name;
}

uint32 getFakePrice(const ItemTemplate* proto)
{
    const uint32 minP = 10000;
    uint32 sellP = proto->SellPrice;
    return sellP < minP ? minP : sellP;
}

uint32 getCorrectInvType(uint32 inventorytype)
{
    switch(inventorytype)
    {
    case INVTYPE_WEAPONMAINHAND:
    case INVTYPE_WEAPONOFFHAND:
        return INVTYPE_WEAPON;
    case INVTYPE_ROBE:
        return INVTYPE_CHEST;
    default:
        return inventorytype;
    }
}

bool CanTransmogrify(const ItemTemplate* proto)
{
    if (proto->Class == ITEM_CLASS_WEAPON && proto->SubClass == ITEM_SUBCLASS_WEAPON_FISHING_POLE)
        return false;
    /* What if reload config?
    if (!sTransmogDisplayVendorMgr->AllowedQuality(proto->Quality)) // skip not allowed qualities
    return false;
    */
    return true;
}

bool TransmogDisplayVendorMgr::CanTransmogrify(const ItemTemplate* tarTemplate, const ItemTemplate* srcTemplate)
{
    if (!srcTemplate || !tarTemplate)
        return false;
    if (!TransmogDisplayVendorMgr::AllowedQuality(srcTemplate->Quality))
        return false;
    if (!TransmogDisplayVendorMgr::AllowedQuality(tarTemplate->Quality))
        return false;

    if (tarTemplate->DisplayInfoID == srcTemplate->DisplayInfoID)
        return false;

    if (srcTemplate->Class != tarTemplate->Class)
        return false;
    if (getCorrectInvType(tarTemplate->InventoryType) != getCorrectInvType(srcTemplate->InventoryType))
        return false;

    uint32 newSubClass = srcTemplate->SubClass;
    uint32 oldSubClass = tarTemplate->SubClass;
    if (tarTemplate->Class == ITEM_CLASS_WEAPON)
    {
        if (tarTemplate->SubClass == ITEM_SUBCLASS_WEAPON_FISHING_POLE)
            return false;
        if (newSubClass == oldSubClass
            || ((newSubClass == ITEM_SUBCLASS_WEAPON_BOW || newSubClass == ITEM_SUBCLASS_WEAPON_GUN || newSubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW)
            && (oldSubClass == ITEM_SUBCLASS_WEAPON_BOW || oldSubClass == ITEM_SUBCLASS_WEAPON_GUN || oldSubClass == ITEM_SUBCLASS_WEAPON_CROSSBOW)))
            return true;
    }
    else if (tarTemplate->Class == ITEM_CLASS_ARMOR)
        if (newSubClass == oldSubClass)
            return true;

    return false;
}

void TransmogDisplayVendorMgr::HandleTransmogrify(Player* player, Creature* creature, uint32 vendorslot, uint32 itemEntry)
{
    selDataType::iterator data = selData.find(player->GetGUIDLow());
    if (data == selData.end())
        return; // cheat, no slot selected

    const char* slotname = getSlotName(data->second.slot);
    if (!slotname)
        return;

    WorldSession* session = player->GetSession();
    Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, data->second.slot);
    if (!item)
    {
        session->SendNotification("Equipment slot is empty");
        return;
    }
    if (item->GetOwnerGUID() != player->GetGUID())
        return;

    ItemTemplate const * srcTemplate = sObjectMgr->GetItemTemplate(itemEntry);
    ItemTemplate const * tarTemplate = item->GetTemplate();

    optionDataList oM = optionMap[(tarTemplate->Class == ITEM_CLASS_WEAPON ? MAX_ITEM_SUBCLASS_WEAPON : 0)+tarTemplate->SubClass][getCorrectInvType(tarTemplate->InventoryType)][data->second.quality];
    optionDataList::iterator it = oM.begin();
    std::advance(it, data->second.offset + vendorslot);
    if (it == oM.end() || (*it) != itemEntry)
    {
        session->SendNotification("Items do not match");
        return; // either cheat or changed items (not found in correct place in transmog vendor view)
    }

    if (!TransmogDisplayVendorMgr::CanTransmogrify(tarTemplate, srcTemplate))
    {
        session->SendNotification("Items do not match");
        return;
    }

    if (uint32 fakeEntry = GetFakeEntry(item->GetGUIDLow()))
    {
        if (const ItemTemplate* fakeItemTemplate = sObjectMgr->GetItemTemplate(fakeEntry))
        {
            if (fakeItemTemplate->DisplayInfoID == srcTemplate->DisplayInfoID)
            {
                session->SendAreaTriggerMessage("%s already transmogrified with %s", slotname, getItemName(tarTemplate, session).c_str());
                return;
            }
        }
    }

    if (TransmogDisplayVendorMgr::RequireToken && player->GetItemCount(TransmogDisplayVendorMgr::TokenEntry) < TransmogDisplayVendorMgr::TokenAmount)
    {
        session->SendNotification("You don't have enough %ss", getItemName(sObjectMgr->GetItemTemplate(TransmogDisplayVendorMgr::TokenEntry), session).c_str());
        return;
    }
    int32 price = 0;
    if (TransmogDisplayVendorMgr::RequireGold)
        price = getFakePrice(tarTemplate);
    if (player->HasEnoughMoney(price))
        player->ModifyMoney(-price);
    else
    {
        session->SendNotification("You don't have enough money");
        return;
    }
    if (TransmogDisplayVendorMgr::RequireToken)
        player->DestroyItemCount(TransmogDisplayVendorMgr::TokenEntry, TransmogDisplayVendorMgr::TokenAmount, true);

    TransmogDisplayVendorMgr::SetFakeEntry(item, itemEntry);
    player->PlayDirectSound(3337);
    session->SendAreaTriggerMessage("%s transmogrified", slotname);
}

class NPC_TransmogDisplayVendor : public CreatureScript
{
public:
    NPC_TransmogDisplayVendor() : CreatureScript("NPC_TransmogDisplayVendor") { } // Also set in Player.cpp: if (creature->GetScriptName() == "NPC_TransmogDisplayVendor")

    bool OnGossipHello(Player* player, Creature* creature)
    {
        selData.erase(player->GetGUIDLow());
        WorldSession* session = player->GetSession();
        for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; slot++)
        {
            // if (player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
            if (const char* slotName = getSlotName(slot))
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, slotName, SENDER_SELECT_VENDOR, slot);
        }
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Remove transmogrifications", SENDER_REMOVE_MENU, 0);
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
        WorldSession* session = player->GetSession();
        player->PlayerTalkClass->ClearMenus();
        switch(sender)
        {
        case SENDER_SELECT_VENDOR: // action = slot
            {
                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, action);
                if (!item)
                {
                    if (const char* slotname = getSlotName(action))
                        session->SendNotification("No item equipped in %s slot", slotname);
                    OnGossipHello(player, creature);
                    return true;
                }
                const ItemTemplate * itemTemplate = item->GetTemplate();
                optionData* oM = &optionMap[(itemTemplate->Class == ITEM_CLASS_WEAPON ? MAX_ITEM_SUBCLASS_WEAPON : 0)+itemTemplate->SubClass][getCorrectInvType(itemTemplate->InventoryType)];
                if (!oM->size())
                {
                    if (const char* slotname = getSlotName(action))
                        session->SendNotification("No transmogrifications available for %s", slotname);
                    OnGossipHello(player, creature);
                    return true;
                }
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, (std::string)"Update selected; "+getItemName(itemTemplate, session), sender, action);
                for(optionData::iterator it = oM->begin(); it != oM->end(); ++it)
                {
                    if (!TransmogDisplayVendorMgr::AllowedQuality(it->first)) // skip not allowed qualities
                        continue;
                    for(uint32 count = 0; count*MAX_VENDOR_ITEMS < it->second.size(); ++count)
                    {
                        std::ostringstream ss;
                        ss << getQualityName(it->first);
                        if (count)
                            ss << " [" << count << "]";
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, ss.str().c_str(), it->first, count*MAX_VENDOR_ITEMS);
                    }
                }
                if (player->PlayerTalkClass->GetGossipMenu().GetMenuItemCount() <= 1)
                {
                    if (const char* slotname = getSlotName(action))
                        session->SendNotification("No transmogrifications available for %s", slotname);
                    player->PlayerTalkClass->ClearMenus();
                    OnGossipHello(player, creature);
                    return true;
                }
                selDataStruct temp = {action, 0, 0}; // slot, offset, quality
                selData[player->GetGUIDLow()] = temp;
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", SENDER_BACK, 0);
                player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            } break;
        case SENDER_BACK: // Back
            {
                OnGossipHello(player, creature);
            } break;
        case SENDER_REMOVE_ALL: // Remove TransmogDisplayVendorMgrs
            {
                bool removed = false;
                for (uint8 Slot = EQUIPMENT_SLOT_START; Slot < EQUIPMENT_SLOT_END; Slot++)
                {
                    if (Item* newItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, Slot))
                    {
                        if (TransmogDisplayVendorMgr::DeleteFakeEntry(newItem) && !removed)
                            removed = true;
                    }
                }
                if (removed)
                {
                    session->SendAreaTriggerMessage("Transmogrifications removed from equipped items");
                    player->PlayDirectSound(3337);
                }
                else
                    session->SendNotification("You have no transmogrified items equipped");
                OnGossipSelect(player, creature, SENDER_REMOVE_MENU, 0);
            } break;
        case SENDER_REMOVE_ONE: // Remove TransmogDisplayVendorMgr from single item
            {
                const char* slotname = getSlotName(action);
                if (Item* newItem = player->GetItemByPos(INVENTORY_SLOT_BAG_0, action))
                {
                    if (TransmogDisplayVendorMgr::DeleteFakeEntry(newItem))
                    {
                        if (slotname)
                            session->SendAreaTriggerMessage("%s transmogrification removed", slotname);
                        player->PlayDirectSound(3337);
                    }
                    else if (slotname)
                        session->SendNotification("No transmogrification on %s slot", slotname);
                }
                else if (slotname)
                    session->SendNotification("No item equipped in %s slot", slotname);
                OnGossipSelect(player, creature, SENDER_REMOVE_MENU, 0);
            } break;
        case SENDER_REMOVE_MENU:
            {
                for (uint8 slot = EQUIPMENT_SLOT_START; slot < EQUIPMENT_SLOT_END; slot++)
                {
                    const char* slotname = getSlotName(slot);
                    if (!slotname)
                        continue;
                    std::ostringstream ss;
                    ss << "Remove transmogrification from " << slotname << "?";
                    player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, (std::string)"Remove from "+slotname, SENDER_REMOVE_ONE, slot, ss.str().c_str(), 0, false);
                }
                player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, "Remove all transmogrifications", SENDER_REMOVE_ALL, 0, "Are you sure you want to remove all transmogrifications?", 0, false);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Back..", SENDER_BACK, 0);
                player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            } break;
        default: // Show items you can use
            {
                if (sender >= MAX_ITEM_QUALITY) // sender = quality, action = iterator
                    return false; // cheat
                if (selData.find(player->GetGUIDLow()) == selData.end())
                    return false; // cheat
                if (selData[player->GetGUIDLow()].offset != 0 || selData[player->GetGUIDLow()].quality != 0)
                    return false; // cheat (something is off)
                selData[player->GetGUIDLow()].offset = action;
                selData[player->GetGUIDLow()].quality = sender;
                uint32 slot = selData[player->GetGUIDLow()].slot; // slot
                if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                {
                    if (!TransmogDisplayVendorMgr::AllowedQuality(item->GetTemplate()->Quality))
                    {
                        session->SendNotification("Equipped item has wrong quality");
                        OnGossipSelect(player, creature, SENDER_SELECT_VENDOR, slot);
                        return true;
                    }
                    optionDataList oM = optionMap[(item->GetTemplate()->Class == ITEM_CLASS_WEAPON ? MAX_ITEM_SUBCLASS_WEAPON : 0)+item->GetTemplate()->SubClass][getCorrectInvType(item->GetTemplate()->InventoryType)][sender];
                    uint32 itemCount = (oM.size()-action);
                    if (itemCount > MAX_VENDOR_ITEMS)
                        itemCount = MAX_VENDOR_ITEMS;
                    if (!itemCount)
                    {
                        session->SendAreaTriggerMessage("No items found");
                        OnGossipSelect(player, creature, SENDER_SELECT_VENDOR, slot);
                        return true;
                    }
                    player->CLOSE_GOSSIP_MENU();

                    TC_LOG_DEBUG(LOG_FILTER_NETWORKIO, "WORLD: Sent SMSG_LIST_INVENTORY");

                    Creature* vendor = player->GetNPCIfCanInteractWith(creature->GetGUID(), UNIT_NPC_FLAG_VENDOR);
                    if (!vendor)
                    {
                        TC_LOG_DEBUG(LOG_FILTER_NETWORKIO, "WORLD: SendListInventory - Unit (GUID: %u) not found or you can not interact with him.", creature->GetGUIDLow());
                        player->SendSellError(SELL_ERR_CANT_FIND_VENDOR, NULL, 0, 0);
                        return true;
                    }

                    if (player->HasUnitState(UNIT_STATE_DIED))
                        player->RemoveAurasByType(SPELL_AURA_FEIGN_DEATH);

                    if (vendor->HasUnitState(UNIT_STATE_MOVING))
                        vendor->StopMoving();
                    uint8 count = 0;

                    WorldPacket data(SMSG_LIST_INVENTORY, 8 + 1 + itemCount * 8 * 4);
                    data << uint64(creature->GetGUID());

                    size_t countPos = data.wpos();
                    data << uint8(count);

                    bool added = false;
                    optionDataList::iterator it = oM.begin();
                    std::advance(it, action);
                    for (; it != oM.end() && count < itemCount; ++it, ++count)
                    {
                        if (ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(*it))
                        {
                            data << uint32(count + 1);
                            data << uint32(itemTemplate->ItemId);
                            data << uint32(itemTemplate->DisplayInfoID);
                            data << int32(0xFFFFFFFF);
                            data << uint32(0);
                            data << uint32(itemTemplate->MaxDurability);
                            data << uint32(itemTemplate->BuyCount);
                            data << uint32(0);
                            added = true;
                        }
                    }

                    if (!added)
                    {
                        data << uint8(0);
                        session->SendPacket(&data);
                    }
                    else
                    {
                        data.put<uint8>(countPos, count);
                        session->SendPacket(&data);
                    }
                }
                else
                {
                    session->SendNotification("No item equipped");
                    OnGossipSelect(player, creature, SENDER_SELECT_VENDOR, slot);
                    return true;
                }
            } break;
        }
        return true;
    }
};

#if !TRANSMOGRIFICATION_ALREADY_INSTALLED
class Player_Transmogrify : public PlayerScript
{
public:
    Player_Transmogrify() : PlayerScript("Player_Transmogrify") { }

    void OnLogin(Player* player)
    {
        uint32 playerGUID = player->GetGUIDLow();
        entryMap.erase(playerGUID);
        QueryResult result = CharacterDatabase.PQuery("SELECT GUID, FakeEntry FROM custom_transmogrifications WHERE Owner = %u", playerGUID);
        if (result)
        {
            do
            {
                uint32 itemGUID = (*result)[0].GetUInt32();
                uint32 fakeEntry = (*result)[1].GetUInt32();
                if (sObjectMgr->GetItemTemplate(fakeEntry))
                {
                    dataMap[itemGUID] = playerGUID;
                    entryMap[playerGUID][itemGUID] = fakeEntry;
                }
                else
                {
                    TC_LOG_ERROR(LOG_FILTER_SQL, "Item entry (Entry: %u, itemGUID: %u, playerGUID: %u) does not exist, deleting.", fakeEntry, itemGUID, playerGUID);
                    TransmogDisplayVendorMgr::DeleteFakeFromDB(itemGUID);
                }
            } while (result->NextRow());

            for (uint8 Slot = EQUIPMENT_SLOT_START; Slot < EQUIPMENT_SLOT_END; Slot++)
            {
                if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, Slot))
                    if (entryMap.find(playerGUID) != entryMap.end())
                        if (entryMap[playerGUID].find(item->GetGUIDLow()) != entryMap[playerGUID].end())
                            player->UpdateUInt32Value(PLAYER_VISIBLE_ITEM_1_ENTRYID + (item->GetSlot() * 2), entryMap[playerGUID][item->GetGUIDLow()]);
            }
        }
    }

    void OnLogout(Player* player)
    {
        uint32 pGUID = player->GetGUIDLow();
        if (entryMap.find(pGUID) == entryMap.end())
            return;
        for(transmogData::iterator it = entryMap[pGUID].begin(); it != entryMap[pGUID].end(); ++it)
        {
            dataMap.erase(it->first);
        }
        entryMap.erase(pGUID);
    }
};
#endif

class PREP_TransmogDisplayVendor : public WorldScript
{
public:
    PREP_TransmogDisplayVendor() : WorldScript("PREP_TransmogDisplayVendor") { }

    void OnStartup()
    {
        TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, "Creating a list of usable transmogrification entries...");
        optionMap.clear();
        std::set<uint32> displays;
        ItemTemplateContainer const* its = sObjectMgr->GetItemTemplateStore();
        for (ItemTemplateContainer::const_iterator itr = its->begin(); itr != its->end(); ++itr)
        {
            if (itr->second.Class == ITEM_CLASS_WEAPON || itr->second.Class == ITEM_CLASS_ARMOR)
            {
                if (!CanTransmogrify(&itr->second))
                    continue;
                if (displays.find(itr->second.DisplayInfoID) != displays.end()) // skip duplicate item displays
                    continue;
                optionDataList* oM = &optionMap[(itr->second.Class == ITEM_CLASS_WEAPON ? MAX_ITEM_SUBCLASS_WEAPON : 0)+itr->second.SubClass][getCorrectInvType(itr->second.InventoryType)][itr->second.Quality];
                if (oM->size() < MAX_VENDOR_ITEMS*3)
                {
                    oM->push_back(itr->second.ItemId);
                    displays.insert(itr->second.DisplayInfoID);
                }
                else
                    TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, "Too many items for transmogrification: Class: %u SubClass: %u InventoryType: %u Quality: %u", itr->second.Class, itr->second.SubClass, getCorrectInvType(itr->second.InventoryType), itr->second.Quality);
            }
        }
#if !TRANSMOGRIFICATION_ALREADY_INSTALLED
        TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, "Deleting non-existing transmogrification entries...");
        CharacterDatabase.Execute("DELETE FROM custom_transmogrifications WHERE NOT EXISTS (SELECT 1 FROM item_instance WHERE item_instance.guid = custom_transmogrifications.GUID)");
#endif
    }
};

void AddSC_NPC_TransmogDisplayVendor()
{
    new NPC_TransmogDisplayVendor();
    new PREP_TransmogDisplayVendor();

#if !TRANSMOGRIFICATION_ALREADY_INSTALLED
    new Player_Transmogrify();
#endif
}
