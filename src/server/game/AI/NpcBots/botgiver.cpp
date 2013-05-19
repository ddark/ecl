#include "bp_mgr.h"
#include "Config.h"
#include "Group.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptedGossip.h"
#include "ScriptMgr.h"
#include "WorldSession.h"
/*
script_bot_giver by Graff (onlysuffering@mail.ru)
Complete - ???
Category - creature_cripts/custom/bots/
*/
const uint8 GroupIcons[TARGETICONCOUNT] =
{
    /*STAR        = */0x001,
    /*CIRCLE      = */0x002,
    /*DIAMOND     = */0x004,
    /*TRIANGLE    = */0x008,
    /*MOON        = */0x010,
    /*SQUARE      = */0x020,
    /*CROSS       = */0x040,
    /*SKULL       = */0x080,
};

enum GossipActions
{
    CREATE_NBOT_MENU        = 1,
    CREATE_NBOT             = 2,
    CREATE_PBOT_MENU        = 3,
    CREATE_PBOT             = 4,

    REMOVE_PBOT_MENU        = 5,
    REMOVE_PBOT             = 6,
    REMOVE_NBOT_MENU        = 7,
    REMOVE_NBOT             = 8,

    INFO_WHISPER            = 9
};

enum BotgiverTexIDs
{
    ABANDON_PLAYER          = 1,
    RECRUIT_PLAYER          = 2,
    ABANDON_MINION          = 3,
    RECRUIT_MINION          = 4,
    ABOUT_STR               = 5,
    ADD_ALL                 = 6,
    REMOVE_ALL              = 7,
    RECRUIT_WARRIOR         = 8,
    RECRUIT_HUNTER          = 9,
    RECRUIT_PALADIN         = 10,
    RECRUIT_SHAMAN          = 11,
    RECRUIT_ROGUE           = 12,
    RECRUIT_DRUID           = 13,
    RECRUIT_MAGE            = 14,
    RECRUIT_PRIEST          = 15,
    RECRUIT_WARLOCK         = 16,
    RECRUIT_DEATH_KNIGHT    = 17,
    ABOUT_BASIC_STR1        = 18,
    ABOUT_BASIC_STR2        = 19,
    ABOUT_BASIC_STR3        = 20,
    ABOUT_ICONS_STR1        = 21,
    ABOUT_ICONS_STR2        = 22,
    ICON_STRING_STAR        = 23,
    ICON_STRING_CIRCLE      = 24,
    ICON_STRING_DIAMOND     = 25,
    ICON_STRING_TRIANGLE    = 26,
    ICON_STRING_MOON        = 27,
    ICON_STRING_SQUARE      = 28,
    ICON_STRING_CROSS       = 29,
    ICON_STRING_SKULL       = 30,
    ICON_STRING_UNKNOWN     = 31,
    NO_MORE_AVAILABLE       = 32,
    ONE_MORE_AVAILABLE      = 33,
    SOME_MORE_AVAILABLE     = 34,
    ONE_AVAILABLE           = 35,
    SOME_AVAILABLE          = 36,
    MAX_STRINGS
};

class script_bot_giver : public CreatureScript
{
    uint8 maxPBcount;
    uint8 maxNBcount;

    bool allowPBots;
    bool allowNBots;

public:
    script_bot_giver() : CreatureScript("script_bot_giver") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
        switch (sender)
        {
            case CREATE_NBOT_MENU:  SendCreateNPCBotMenu(player, creature, action);     break;
            case CREATE_NBOT:       SendCreateNPCBot(player, creature, action);         break;
            case CREATE_PBOT_MENU:  SendCreatePlayerBotMenu(player, creature, action);  break;
            case CREATE_PBOT:       SendCreatePlayerBot(player, creature, action);      break;

            case REMOVE_PBOT_MENU:  SendRemovePlayerBotMenu(player, creature, action);  break;
            case REMOVE_PBOT:       SendRemovePlayerBot(player, creature, action);      break;
            case REMOVE_NBOT_MENU:  SendRemoveNPCBotMenu(player, creature, action);     break;
            case REMOVE_NBOT:       SendRemoveNPCBot(player, creature, action);         break;

            case INFO_WHISPER:      SendBotHelpWhisper(player, creature, action);       break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        uint8 count = 0;

        maxPBcount = ConfigMgr::GetIntDefault("Bot.MaxPlayerbots", 9);
        maxNBcount = player->GetMaxNpcBots();

        allowPBots = ConfigMgr::GetBoolDefault("Bot.EnablePlayerBots", false);
        allowNBots = ConfigMgr::GetBoolDefault("Bot.EnableNpcBots", true) && !player->RestrictBots();

        std::string tempstr;

        if (PlayerbotMgr* mgr = player->GetPlayerbotMgr())
        {
            for (PlayerBotMap::const_iterator itr = mgr->GetPlayerBotsBegin(); itr != mgr->GetPlayerBotsEnd(); ++itr)
            {
                if (count == 0)
                {
                    tempstr = "Abandon my Player";
                    player->ADD_GOSSIP_ITEM(0, GetLocaleStringForTextID(tempstr, ABANDON_PLAYER, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), REMOVE_PBOT_MENU, GOSSIP_ACTION_INFO_DEF + 100);
                }
                ++count;
            }
        }
        if (count < maxPBcount && allowPBots)
        {
            tempstr = "Recruit a Player";
            player->ADD_GOSSIP_ITEM(0, GetLocaleStringForTextID(tempstr, RECRUIT_PLAYER, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), CREATE_PBOT_MENU, GOSSIP_ACTION_INFO_DEF + 1);
        }

        if (player->HaveBot())
        {
            count = player->GetNpcBotsCount();
            if (count > 0)
            {
                tempstr = "Abandon my Minion";
                player->ADD_GOSSIP_ITEM(0, GetLocaleStringForTextID(tempstr, ABANDON_MINION, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), REMOVE_NBOT_MENU, GOSSIP_ACTION_INFO_DEF + 101);
            }
            if (count < maxNBcount && allowNBots)
            {
                tempstr = "Recruit a Minion";
                player->ADD_GOSSIP_ITEM(0, GetLocaleStringForTextID(tempstr, RECRUIT_MINION, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), CREATE_NBOT_MENU, GOSSIP_ACTION_INFO_DEF + 2);
            }
        }
        else if (allowNBots && maxNBcount != 0)
        {
            tempstr = "Recruit a Minion";
            player->ADD_GOSSIP_ITEM(0, GetLocaleStringForTextID(tempstr, RECRUIT_MINION, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), CREATE_NBOT_MENU, GOSSIP_ACTION_INFO_DEF + 2);
        }

        tempstr = "Tell me about these bots";
        player->ADD_GOSSIP_ITEM(0, GetLocaleStringForTextID(tempstr, ABOUT_STR, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), INFO_WHISPER, GOSSIP_ACTION_INFO_DEF + 200);

        player->PlayerTalkClass->SendGossipMenu(8446, creature->GetGUID());
        return true;
    }

private:
    static void SendCreatePlayerBot(Player* player, Creature* /*creature*/, uint32 action)
    {
        std::string plName;
        std::list<std::string>* names = new std::list<std::string>;
        uint32 accId = player->GetSession()->GetAccountId();
        PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_PLAYERBOTS);
        stmt->setUInt32(0, accId);
        stmt->setUInt32(1, player->GetGUIDLow());
        PreparedQueryResult results = CharacterDatabase.Query(stmt);
        //QueryResult results = CharacterDatabase.PQuery("SELECT name FROM characters WHERE account = '%u' AND guid != '%u'", accId, player->GetGUIDLow());
        if (results)
        {
            do
            {
                Field* fields = results->Fetch();
                plName = fields[0].GetString();
                if (ObjectAccessor::FindPlayerByName(plName))
                    continue;
                names->insert(names->end(), plName);
            } while (results->NextRow());
        }

        if (names->empty())
        {
            delete names;
            player->CLOSE_GOSSIP_MENU();
            return;
        }

        PlayerbotMgr* mgr = player->GetPlayerbotMgr();
        if (!mgr)
        {
            mgr = new PlayerbotMgr(player);
            player->SetPlayerbotMgr(mgr);
        }

        int8 x = action - GOSSIP_ACTION_INFO_DEF - 1;

        for (std::list<std::string>::iterator iter = names->begin(); iter != names->end(); iter++)
        {
            if (x == 0)
            {
                uint64 guid = sObjectMgr->GetPlayerGUIDByName((*iter).c_str());
                if (mgr->GetPlayerBot(guid) != NULL)
                    continue;
                mgr->AddPlayerBot(guid);
            }
            else
            {
                if (x == 1)
                {
                    uint64 guid = sObjectMgr->GetPlayerGUIDByName((*iter).c_str());
                    if (mgr->GetPlayerBot(guid) != NULL)
                        break;
                    mgr->AddPlayerBot(guid);
                    break;
                }
                --x;
            }
        }
        player->CLOSE_GOSSIP_MENU();
        delete names;
    }

    void SendCreatePlayerBotMenu(Player* player, Creature* creature, uint32 /*action*/)
    {
        std::string plName;
        std::list<std::string>* names = new std::list<std::string>;
        uint32 accId = player->GetSession()->GetAccountId();
        PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_PLAYERBOTS);
        stmt->setUInt32(0, accId);
        stmt->setUInt32(1, player->GetGUIDLow());
        PreparedQueryResult results = CharacterDatabase.Query(stmt);
        //QueryResult results = CharacterDatabase.PQuery("SELECT name FROM characters WHERE account = '%u' AND guid != '%u'", accId, player->GetGUIDLow());
        if (results)
        {
            do
            {
                Field* fields = results->Fetch();
                plName = fields[0].GetString();
                if (sObjectAccessor->FindPlayerByName(plName))
                    continue;
                names->insert(names->end(), plName);
            } while (results->NextRow());
        }

        if (names->empty())
        {
            delete names;
            player->CLOSE_GOSSIP_MENU();
            return;
        }

        player->PlayerTalkClass->ClearMenus();
        std::string tempstr;
        PlayerbotMgr* mgr = player->GetPlayerbotMgr();
        uint8 bots = !mgr ? 0 : mgr->GetPlayerBotsCount();
        uint32 freePBSlots = maxPBcount - bots;
        if (freePBSlots != 1 && freePBSlots >= names->size())
        {
            tempstr = "ADD ALL";
            player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, ADD_ALL, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), CREATE_PBOT, GOSSIP_ACTION_INFO_DEF + 1);
        }

        int8 x = 2;
        for (std::list<std::string>::iterator iter = names->begin(); iter != names->end(); iter++)
        {
            player->ADD_GOSSIP_ITEM(9, (*iter).c_str() , CREATE_PBOT, GOSSIP_ACTION_INFO_DEF + x);
            ++x;
        }

        std::ostringstream buff;
        if (freePBSlots == 0)
        {
            tempstr = "no more bots available";
            buff << GetLocaleStringForTextID(tempstr, NO_MORE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
        }
        else
        {
            buff << freePBSlots;
            buff << ' ';
            if (freePBSlots == 1)
            {
                if (bots == 0)
                {
                    tempstr = "bot available";
                    buff << GetLocaleStringForTextID(tempstr, ONE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
                else
                {
                    tempstr = "more bot available";
                    buff << GetLocaleStringForTextID(tempstr, ONE_MORE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
            }
            else
            {
                if (bots == 0)
                {
                    tempstr = "bots available";
                    buff << GetLocaleStringForTextID(tempstr, SOME_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
                else
                {
                    tempstr = "more bots available";
                    buff << GetLocaleStringForTextID(tempstr, SOME_MORE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
            }
        }

        player->ADD_GOSSIP_ITEM(0, buff.str(), CREATE_PBOT_MENU, GOSSIP_ACTION_INFO_DEF + 1);

        player->PlayerTalkClass->SendGossipMenu(8446, creature->GetGUID());

        delete names;
    } //end SendCreatePlayerBotMenu

    static void SendRemovePlayerBotAll(Player* player, Creature* creature)
    {
        for (int8 x = 2; x<=10; x++ )
            SendRemovePlayerBot(player, creature, GOSSIP_ACTION_INFO_DEF + 2);
    }

    static void SendRemovePlayerBot(Player* player, Creature* creature, uint32 action)
    {
        int8 x = action - GOSSIP_ACTION_INFO_DEF - 1;

        if (x == 0)
        {
            SendRemovePlayerBotAll(player, creature);
            return;
        }

        if (PlayerbotMgr* mgr = player->GetPlayerbotMgr())
        {
            for (PlayerBotMap::const_iterator itr = mgr->GetPlayerBotsBegin(); itr != mgr->GetPlayerBotsEnd(); ++itr)
            {
                if (x == 1 && itr->second)
                {
                    mgr->LogoutPlayerBot(itr->second->GetGUID());
                    break;
                }
                --x;
            }
        }
        player->CLOSE_GOSSIP_MENU();
    } //end SendRemovePlayerBot

    static void SendRemovePlayerBotMenu(Player* player, Creature* creature, uint32 /*action*/)
    {
        player->PlayerTalkClass->ClearMenus();
        PlayerbotMgr* mgr = player->GetPlayerbotMgr();
        if (mgr->GetPlayerBotsCount() != 1)
        {
            std::string tempstr = "REMOVE ALL";
            player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, REMOVE_ALL, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), REMOVE_PBOT, GOSSIP_ACTION_INFO_DEF + 1);
        }

        uint8 x = 2;
        for (PlayerBotMap::const_iterator itr = mgr->GetPlayerBotsBegin(); itr != mgr->GetPlayerBotsEnd(); ++itr)
        {
            Player* bot = itr->second;
            player->ADD_GOSSIP_ITEM(9, bot->GetName(), REMOVE_PBOT, GOSSIP_ACTION_INFO_DEF + x);
            ++x;
        }
        player->PlayerTalkClass->SendGossipMenu(8446, creature->GetGUID());
    } //end SendRemovePlayerBotMenu

    static void SendRemoveNPCBot(Player* player, Creature*  /*creature*/, uint32 action)
    {
        int8 x = action - GOSSIP_ACTION_INFO_DEF;
        if (x == 1)
        {
            player->CLOSE_GOSSIP_MENU();
            for (uint8 i = 0; i != player->GetMaxNpcBots(); ++i)
                player->RemoveBot(player->GetBotMap(i)->_Guid(), true);
            return;
        }
        for (uint8 i = 0; i != player->GetMaxNpcBots(); ++i)
        {
            if (!player->GetBotMap(i)->_Cre())
                continue;
            if (x == 2)
            {
                player->RemoveBot(player->GetBotMap(i)->_Guid(), true);
                break;
            }
            --x;
        }
        player->CLOSE_GOSSIP_MENU();
    }

    static void SendRemoveNPCBotMenu(Player* player, Creature* creature, uint32 /*action*/)
    {
        player->PlayerTalkClass->ClearMenus();
        if (player->GetNpcBotsCount() == 1)
        {
            for (uint8 i = 0; i != player->GetMaxNpcBots(); ++i)
                player->RemoveBot(player->GetBotMap(i)->_Guid(), true);
            player->CLOSE_GOSSIP_MENU();
            return;
        }
        std::string tempstr = "REMOVE ALL";
        player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, REMOVE_ALL, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()), REMOVE_NBOT, GOSSIP_ACTION_INFO_DEF + 1);

        uint8 x = 2;
        for (uint8 i = 0; i != player->GetMaxNpcBots(); ++i)
        {
            Creature* bot = player->GetBotMap(i)->_Cre();
            if (!bot) continue;
            player->ADD_GOSSIP_ITEM(9, bot->GetName(), REMOVE_NBOT, GOSSIP_ACTION_INFO_DEF + x);
            ++x;
        }
        player->PlayerTalkClass->SendGossipMenu(8446, creature->GetGUID());
    }

    static void SendCreateNPCBot(Player* player, Creature* /*creature*/, uint32 action)
    {
        uint8 bot_class = 0;
        if (action == GOSSIP_ACTION_INFO_DEF + 1)//"Back"
        {
            player->CLOSE_GOSSIP_MENU();
            return;
        }
        else if (action == GOSSIP_ACTION_INFO_DEF + 2)
            bot_class = CLASS_WARRIOR;
        //else if (action == GOSSIP_ACTION_INFO_DEF + 3)
        //    bot_class = CLASS_HUNTER;
        else if (action == GOSSIP_ACTION_INFO_DEF + 4)
            bot_class = CLASS_PALADIN;
        //else if (action == GOSSIP_ACTION_INFO_DEF + 5)
        //    bot_class = CLASS_SHAMAN;
        else if (action == GOSSIP_ACTION_INFO_DEF + 6)
            bot_class = CLASS_ROGUE;
        else if (action == GOSSIP_ACTION_INFO_DEF + 7)
            bot_class = CLASS_DRUID;
        else if (action == GOSSIP_ACTION_INFO_DEF + 8)
            bot_class = CLASS_MAGE;
        else if (action == GOSSIP_ACTION_INFO_DEF + 9)
            bot_class = CLASS_PRIEST;
        else if (action == GOSSIP_ACTION_INFO_DEF + 10)
            bot_class = CLASS_WARLOCK;
        //else if (action == GOSSIP_ACTION_INFO_DEF + 11)
        //    bot_class = CLASS_DEATH_KNIGHT;

        if (bot_class != 0)
            player->CreateNPCBot(bot_class);
        player->CLOSE_GOSSIP_MENU();
        return;
    }

    void SendCreateNPCBotMenu(Player* player, Creature* creature, uint32 /*action*/)
    {
        std::string cost = player->GetNpcBotCostStr();
        player->PlayerTalkClass->ClearMenus();

        std::string tempstr = "Recruit a Warrior ";
        player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, RECRUIT_WARRIOR, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 2);
        //tempstr = "Recruit a Hunter ";
        //player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, RECRUIT_HUNTER, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 3);
        tempstr = "Recruit a Paladin ";
        player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, RECRUIT_PALADIN, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 4);
        //tempstr = "Recruit a Shaman ";
        //player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, RECRUIT_SHAMAN, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 5);
        tempstr = "Recruit a Rogue ";
        player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, RECRUIT_ROGUE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 6);
        tempstr = "Recruit a Druid ";
        player->ADD_GOSSIP_ITEM(3, GetLocaleStringForTextID(tempstr, RECRUIT_DRUID, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 7);
        tempstr = "Recruit a Mage ";
        player->ADD_GOSSIP_ITEM(3, GetLocaleStringForTextID(tempstr, RECRUIT_MAGE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 8);
        tempstr = "Recruit a Priest ";
        player->ADD_GOSSIP_ITEM(3, GetLocaleStringForTextID(tempstr, RECRUIT_PRIEST, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 9);
        tempstr = "Recruit a Warlock ";
        player->ADD_GOSSIP_ITEM(3, GetLocaleStringForTextID(tempstr, RECRUIT_WARLOCK, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 10);
        //tempstr = "Recruit a Death Knight ";
        //player->ADD_GOSSIP_ITEM(9, GetLocaleStringForTextID(tempstr, RECRUIT_DEATH_KNIGHT, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex()) + cost, CREATE_NBOT, GOSSIP_ACTION_INFO_DEF + 11);

        std::ostringstream buff;
        uint8 bots = player->GetNpcBotsCount();
        uint32 freeNBSlots = maxNBcount - bots;

        if (freeNBSlots == 0)
        {
            tempstr = "no more bots available";
            buff << GetLocaleStringForTextID(tempstr, NO_MORE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
        }
        else
        {
            buff << freeNBSlots;
            buff << ' ';
            if (freeNBSlots == 1)
            {
                if (bots == 0)
                {
                    tempstr = "bot available";
                    buff << GetLocaleStringForTextID(tempstr, ONE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
                else
                {
                    tempstr = "more bot available";
                    buff << GetLocaleStringForTextID(tempstr, ONE_MORE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
            }
            else
            {
                if (bots == 0)
                {
                    tempstr = "bots available";
                    buff << GetLocaleStringForTextID(tempstr, SOME_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
                else
                {
                    tempstr = "more bots available";
                    buff << GetLocaleStringForTextID(tempstr, SOME_MORE_AVAILABLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                }
            }
        }
        player->ADD_GOSSIP_ITEM(0, buff.str(), CREATE_NBOT_MENU, GOSSIP_ACTION_INFO_DEF + 2);

        player->PlayerTalkClass->SendGossipMenu(8446, creature->GetGUID());
    }

    static void SendBotHelpWhisper(Player* player, Creature* creature, uint32 /*action*/)
    {
        player->CLOSE_GOSSIP_MENU();
        //Basic
        std::string tempstr = "To see list of Playerbot commands whisper 'help' to one of your playerbots";
        std::string msg1 = GetLocaleStringForTextID(tempstr, ABOUT_BASIC_STR1, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
        tempstr = "To see list of available npcbot commands type .npcbot or .npcb";
        std::string msg2 = GetLocaleStringForTextID(tempstr, ABOUT_BASIC_STR2, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
        tempstr = "You can also use .maintank (or .mt or .main) command on any party member (even npcbot) so your bots will stick to your plan";
        std::string msg3 = GetLocaleStringForTextID(tempstr, ABOUT_BASIC_STR3, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
        creature->MonsterWhisper(msg1.c_str(), player->GetGUID());
        creature->MonsterWhisper(msg2.c_str(), player->GetGUID());
        creature->MonsterWhisper(msg3.c_str(), player->GetGUID());
        //Heal Icons
        uint8 mask = ConfigMgr::GetIntDefault("Bot.HealTargetIconsMask", 8);
        std::string msg4 = "";
        if (mask == 255)
        {
            tempstr = "If you want your npcbots to heal someone out of your party set any raid target icon on them";
            msg4 = GetLocaleStringForTextID(tempstr, ABOUT_ICONS_STR1, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
            creature->MonsterWhisper(msg4.c_str(), player->GetGUID());
        }
        else if (mask != 0)
        {
            tempstr = "If you want your npcbots to heal someone out of your party set proper raid target icon on them, one of these: ";
            msg4 = GetLocaleStringForTextID(tempstr, ABOUT_ICONS_STR2, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
            std::string iconrow = "";
            uint8 count = 0;
            for (uint8 i = 0; i != TARGETICONCOUNT; ++i)
            {
                if (mask & GroupIcons[i])
                {
                    if (count != 0)
                        iconrow += ", ";
                    ++count;
                    switch (i)
                    {
                        case 0:
                            tempstr = "star";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_STAR, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 1:
                            tempstr = "circle";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_CIRCLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 2:
                            tempstr = "diamond";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_DIAMOND, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 3:
                            tempstr = "triangle";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_TRIANGLE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 4:
                            tempstr = "moon";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_MOON, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 5:
                            tempstr = "square";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_SQUARE, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 6:
                            tempstr = "cross";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_CROSS, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        case 7:
                            tempstr = "skull";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_SKULL, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                        default:
                            tempstr = "unknown icon";
                            iconrow += GetLocaleStringForTextID(tempstr, ICON_STRING_UNKNOWN, creature->GetEntry(), player->GetSession()->GetSessionDbLocaleIndex());
                            break;
                    }
                }
            }
            msg4 += iconrow;
            creature->MonsterWhisper(msg4.c_str(), player->GetGUID());
        }
    }

    static std::string GetLocaleStringForTextID(std::string& textValue, uint32 textId, uint32 botgiverEntry, int32 localeIdx)
    {
        if (textId >= MAX_STRINGS)
        {
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "botgiver:GetLocaleStringForTextID:: unknown text id: %u!", uint32(textId));
            return textValue;
        }

        if (localeIdx == DEFAULT_LOCALE)
            return textValue; //use default

        if (localeIdx < 0)
        {
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "botgiver:GetLocaleStringForTextID:: unknown locale: %i! Sending default locale text...", localeIdx);
            return textValue;
        }

        uint32 idxEntry = MAKE_PAIR32(botgiverEntry, textId);
        if (GossipMenuItemsLocale const* no = sObjectMgr->GetGossipMenuItemsLocale(idxEntry))
        {
            ObjectMgr::GetLocaleString(no->OptionText, localeIdx, textValue);
            //ObjectMgr::GetLocaleString(no->BoxText, locale, strBoxText);
        }
        return textValue;
    }
};

//This function is called when the player clicks an option on the gossip menu
void AddSC_script_bot_giver()
{
    new script_bot_giver();
}
