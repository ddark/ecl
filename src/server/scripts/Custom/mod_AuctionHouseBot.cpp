#include "ScriptPCH.h"
#include "Config.h"
#include "AuctionHouseMgr.h"

#define AUCTIONEER_GUID 23442
#define AUCTION_TIME 172800
#define AUNCTION_FID 120

struct AHItemInfo
{
    AHItemInfo(uint32 _id, uint32 _max, uint32 _count, uint32 _stack, uint32 _bind, uint32 _buy) :
        id(_id), max(_max), count(_count), stack(_stack), bind(_bind), buy(_buy) { }
    uint32  id;
    uint32  max;
    uint32  count;
    uint32  stack;
    uint32  bind;
    uint32  buy;
};

bool AHEnable = false;
int AHInterval = 5;
uint32 AHPlayerGuid = 0;
uint32 AHItemsPerCycle = 100;
uint32 AHItemCountCheck = 0;
IntervalTimer AuctionHouseTimer;
std::vector<AHItemInfo> AHItems;

AuctionHouseEntry const* AHEntry = NULL;
AuctionHouseObject* AuctionHouse = NULL;

std::map<uint32, uint32> AHItemList;

void AHLoadFromDB()
{
    AHItems.clear();

    TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, "Loading AuctionBot...");
    uint32 oldMSTime = getMSTime();

    QueryResult result = CharacterDatabase.PQuery("SELECT `i`.`itemEntry`, COUNT(*) FROM `auctionhouse` `a`, `item_instance` `i` WHERE `a`.`itemguid` = `i`.`guid` GROUP BY `i`.`itemEntry`");
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            AHItemList[fields[0].GetUInt32()] = fields[1].GetUInt32();
        }
        while (result->NextRow());
    }


    result = WorldDatabase.PQuery("SELECT `ItemId`, `ItemCount`, `ItemStack`, `StartBind`, `BuyOut` FROM `world_auction`");

    if (!result)
        return;

    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();

        AHItemInfo info(fields[0].GetUInt32(), fields[1].GetUInt32(), AHItemList[fields[0].GetUInt32()], fields[2].GetUInt32(), fields[3].GetUInt32(), fields[4].GetUInt32());

        ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(info.id);
        if (!itemTemplate)
        {
            TC_LOG_ERROR(LOG_FILTER_GENERAL, "MOD: AHBot item proto not found for item %u", info.id);
            continue;
        }

        if (info.stack > itemTemplate->GetMaxStackSize())
        {
            TC_LOG_ERROR(LOG_FILTER_GENERAL, "MOD: AHBot item stack %u > max stack %u for item %u", info.stack, itemTemplate->GetMaxStackSize(), info.id);
            info.stack = itemTemplate->GetMaxStackSize();
        }

        if (info.stack == 0)
        {
            TC_LOG_ERROR(LOG_FILTER_GENERAL, "MOD: AHBot item stack 0 for item %u", info.id);
            continue;
        }

        AHItems.push_back(info);
        ++count;
    }
    while (result->NextRow());

    TC_LOG_INFO(LOG_FILTER_SERVER_LOADING, ">> Loaded %u items for AuctionBot in %u ms", count, GetMSTimeDiffToNow(oldMSTime));
}

void AHAddItem(AHItemInfo& info)
{
    if (!AHEntry || !AuctionHouse)
        return;

    Item* item = Item::CreateItem(info.id, 1, NULL);

    if (!item)
    {
        TC_LOG_ERROR(LOG_FILTER_GENERAL, "MOD: AHAddItem() returned NULL");
        return;
    }

    uint32 randomPropertyId = Item::GenerateItemRandomPropertyId(info.id);
    if (randomPropertyId != 0)
        item->SetItemRandomProperties(randomPropertyId);

    item->SetCount(info.stack);
    uint32 deposit =  sAuctionMgr->GetAuctionDeposit(AHEntry, AUCTION_TIME, item, info.stack);

    SQLTransaction trans = CharacterDatabase.BeginTransaction();
    AuctionEntry* auctionEntry = new AuctionEntry;
    auctionEntry->Id = sObjectMgr->GenerateAuctionID();
    auctionEntry->auctioneer = AUCTIONEER_GUID;
    auctionEntry->itemGUIDLow = item->GetGUIDLow();
    auctionEntry->itemEntry = item->GetEntry();
    auctionEntry->owner = AHPlayerGuid;
    auctionEntry->startbid = info.bind;
    auctionEntry->buyout = info.buy;
    auctionEntry->bidder = 0;
    auctionEntry->bid = 0;
    auctionEntry->deposit = deposit;
    auctionEntry->expire_time = (time_t) AUCTION_TIME + time(NULL);
    auctionEntry->auctionHouseEntry = AHEntry;
    item->SaveToDB(trans);
    sAuctionMgr->AddAItem(item);
    AuctionHouse->AddAuction(auctionEntry);
    auctionEntry->SaveToDB(trans);
    CharacterDatabase.CommitTransaction(trans);
    return;
}

void AuctionHouseCheck()
{
    if (!AHEnable || AHItems.empty())
        return;

    AuctionHouseTimer.Reset();
    AHItemCountCheck = 0;

    for (uint32 i = 0; i < AHItems.size(); ++i)
        if (AHItems[i].count < AHItems[i].max)
            for (uint32 j = AHItems[i].count; j < AHItems[i].max; ++j)
            {
                AHAddItem(AHItems[i]);

                if (++AHItemCountCheck > AHItemsPerCycle)
                    return;
            }
}

class Mod_AuctionHouseBot_AuctionHouseScript : public AuctionHouseScript
{
    public:
        Mod_AuctionHouseBot_AuctionHouseScript() : AuctionHouseScript("Mod_AuctionHouseBot_AuctionHouseScript") { }

        // Called when an auction is added to an auction house.
        void OnAuctionAdd(AuctionHouseObject* /*ah*/, AuctionEntry* entry)
        {
            if (!AHEnable || AHItems.empty())
                return;

            for (uint32 i = 0; i < AHItems.size(); ++i)
                if (AHItems[i].id == entry->itemEntry)
                {
                    ++AHItems[i].count;
                    return;
                }
        }

        // Called when an auction is removed from an auction house.
        void OnAuctionRemove(AuctionHouseObject* /*ah*/, AuctionEntry* entry)
        {
            if (!AHEnable || AHItems.empty())
                return;

            for (uint32 i = 0; i < AHItems.size(); ++i)
                if (AHItems[i].id == entry->itemEntry)
                {
                    if (AHItems[i].count > 0)
                        --AHItems[i].count;
                    return;
                }
        }
};

class Mod_AuctionHouseBot_WorldScript : public WorldScript
{
    public:
        Mod_AuctionHouseBot_WorldScript() : WorldScript("Mod_AuctionHouseBot_WorldScript") { }

    // Called after the world configuration is (re)loaded.
    void OnConfigLoad(bool reload)
    {
        AHEnable        = ConfigMgr::GetBoolDefault("AuctionHouseBot.Enable", false);
        if (!AHEnable)
            return;

        AHInterval      = ConfigMgr::GetIntDefault("AuctionHouseBot.Interval", 5);
        AHPlayerGuid    = ConfigMgr::GetIntDefault("AuctionHouseBot.PlayerGuid", 0);
        AHItemsPerCycle = ConfigMgr::GetIntDefault("AuctionHouseBot.ItemsPerCycle", 100);

        AuctionHouseTimer.SetInterval(AHInterval * MINUTE * IN_MILLISECONDS);
        AuctionHouseTimer.Reset();

        if (!AHEntry)
        {
            AHEntry = sAuctionMgr->GetAuctionHouseEntry(AUNCTION_FID);
            if (!AHEntry)
            {
                AHEnable = false;
                return;
            }
        }

        if (!AuctionHouse)
        {
            AuctionHouse =  sAuctionMgr->GetAuctionsMap(AUNCTION_FID);
            if (!AuctionHouse)
            {
                AHEnable = false;
                return;
            }
        }

        if (!reload)
            AHLoadFromDB();

        if (AHItems.empty())
        {
            AHEnable = false;
            return;
        }

        AuctionHouseCheck();
    }

    void OnUpdate(uint32 diff)
    {
        if (!AHEnable)
            return;

        if (AuctionHouseTimer.GetCurrent() >= 0)
            AuctionHouseTimer.Update(diff);
        else
            AuctionHouseTimer.SetCurrent(0);

        if (AuctionHouseTimer.Passed())
            AuctionHouseCheck();
    }
};

class Mod_AuctionHouseBot_MailScript : public MailScript
{
    public:
        Mod_AuctionHouseBot_MailScript() : MailScript("Mod_AuctionHouseBot_MailScript") { }

    void OnSendMail(MailDraft* const /*draft*/, MailReceiver const& receiver, MailSender const& /*sender*/, uint32 /*mailId*/, bool& needDelete)
    {
        if (receiver.GetPlayerGUIDLow() == AHPlayerGuid)
            needDelete = true;
    }
};

void AddSC_Mod_AuctionHouseBot()
{
    new Mod_AuctionHouseBot_WorldScript();
    new Mod_AuctionHouseBot_AuctionHouseScript();
    new Mod_AuctionHouseBot_MailScript();
}