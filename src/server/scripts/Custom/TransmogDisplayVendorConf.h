#ifndef DEF_TRANSMOGRIFICATION_DISPLAY_H
#define DEF_TRANSMOGRIFICATION_DISPLAY_H

/*
TransmogDisplayVendorMgr display vendor
Code by Rochet2
Ideas LilleCarl

ScriptName for NPC:
NPC_TransmogDisplayVendor

Compatible with Transmogrification 4.0+ by Rochet2
*/

#define TRANSMOGRIFICATION_ALREADY_INSTALLED    0   // 1 = true, 0 = false

enum TransmogDisplayVendorSenders
{
    SENDER_START    = MAX_ITEM_QUALITY,
    SENDER_BACK,
    SENDER_SELECT_VENDOR,
    SENDER_REMOVE_ALL,
    SENDER_REMOVE_ONE,
    SENDER_REMOVE_MENU,
    SENDER_END,
};

class TransmogDisplayVendorMgr
{
public:
    static const bool RequireGold      = false;
    static const bool RequireToken     = false;
    static const uint32 TokenEntry     = 49426;
    static const uint32 TokenAmount    = 1;

    static const bool AllowPoor        = true;
    static const bool AllowCommon      = true;
    static const bool AllowUncommon    = true;
    static const bool AllowRare        = true;
    static const bool AllowEpic        = true;
    static const bool AllowLegendary   = true;
    static const bool AllowArtifact    = true;
    static const bool AllowHeirloom    = true;

    static uint32 GetFakeEntry(uint32 itemGUID);
    static void DeleteFakeFromDB(uint32 lowGUID);
    static bool DeleteFakeEntry(Item* item);
    static void SetFakeEntry(Item* item, uint32 entry);
    static bool CanTransmogrify(const ItemTemplate* tarTemplate, const ItemTemplate* srcTemplate);
    static void HandleTransmogrify(Player* player, Creature* creature, uint32 vendorslot, uint32 itemEntry);

    static bool AllowedQuality(uint32 quality)
    {
        switch(quality)
        {
        case ITEM_QUALITY_POOR: return AllowPoor;
        case ITEM_QUALITY_NORMAL: return AllowCommon;
        case ITEM_QUALITY_UNCOMMON: return AllowUncommon;
        case ITEM_QUALITY_RARE: return AllowRare;
        case ITEM_QUALITY_EPIC: return AllowEpic;
        case ITEM_QUALITY_LEGENDARY: return AllowLegendary;
        case ITEM_QUALITY_ARTIFACT: return AllowArtifact;
        case ITEM_QUALITY_HEIRLOOM: return AllowHeirloom;
        default: return false;
        }
    }
};

#endif
