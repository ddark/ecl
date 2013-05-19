//#include "Config/Config.h"
#include "Common.h"
#include "Config.h"
#include "Player.h"
#include "bp_ai.h"
#include "bp_cai.h"
#include "bp_mgr.h"
//#include "WorldPacket.h"
#include "WorldSession.h"
//#include "Chat.h"
//#include "ObjectMgr.h"
#include "GossipDef.h"
//#include "Language.h"
//#include "WaypointMovementGenerator.h"
//#include "Guild.h"
#include "Group.h"
#include "SpellInfo.h"
#include "Opcodes.h"

PlayerbotMgr::PlayerbotMgr(Player* const master) : m_master(master)
{
    // load config variables
    m_confMaxNumBots = ConfigMgr::GetIntDefault("Bot.MaxPlayerbots", 9);
    m_confDebugWhisper = ConfigMgr::GetBoolDefault("Bot.DebugWhisper", false);
    m_confFollowDistance[0] = ConfigMgr::GetFloatDefault("Bot.FollowDistanceMin", 0.5f);
    m_confFollowDistance[1] = ConfigMgr::GetFloatDefault("Bot.FollowDistanceMax", 1.0f);
    m_confCollectCombat = ConfigMgr::GetBoolDefault("Bot.Collect.Combat", true);
    m_confCollectQuest = ConfigMgr::GetBoolDefault("Bot.Collect.Quest", true);
    m_confCollectProfession = ConfigMgr::GetBoolDefault("Bot.Collect.Profession", true);
    m_confCollectLoot = ConfigMgr::GetBoolDefault("Bot.Collect.Loot", true);
    m_confCollectSkin = ConfigMgr::GetBoolDefault("Bot.Collect.Skin", true);
    m_confCollectObjects = ConfigMgr::GetBoolDefault("Bot.Collect.Objects", true);
    m_confCollectDistanceMax = ConfigMgr::GetIntDefault("Bot.Collect.DistanceMax", 50);
    gConfigSellLevelDiff = ConfigMgr::GetIntDefault("Bot.SellAll.LevelDiff", 10);
    if (m_confCollectDistanceMax > 100)
    {
        //TC_LOG_ERROR("Playerbot: Bot.Collect.DistanceMax higher than allowed. Using 100");
        m_confCollectDistanceMax = 100;
    }
    m_confCollectDistance = ConfigMgr::GetIntDefault("Bot.Collect.Distance", 25);
    if (m_confCollectDistance > m_confCollectDistanceMax)
    {
        //sLog.outError("Playerbot: PlayerbotAI.Collect.Distance higher than PlayerbotAI.Collect.DistanceMax. Using DistanceMax value");
        m_confCollectDistance = m_confCollectDistanceMax;
    }
}

PlayerbotMgr::~PlayerbotMgr()
{
    if (!m_playerBots.empty())
        LogoutAllBots();
}

//void PlayerbotMgr::Update(uint32 const /*p_time*/) {}

void PlayerbotMgr::HandleMasterIncomingPacket(WorldPacket const& packet)
{
    switch (packet.GetOpcode())
    {
        case CMSG_TEXT_EMOTE:
        {
            WorldPacket p(packet);
            p.rpos(0); // reset reader
            uint32 emoteNum;
            p >> emoteNum;

            switch (emoteNum)
            {
                case TEXT_EMOTE_BONK:
                {
                    uint64 sel = m_master->GetSelection();
                    if (!sel || !IS_PLAYER_GUID(sel))
                        return;
                    Player* bot = GetPlayerBot(sel);
                    if (!bot)
                        return;
                    PlayerbotAI* botAI = bot->GetPlayerbotAI();
                    if (!botAI)
                        return;

                    botAI->SendDebugInfo();
                    return;
                }
            }
        }
    }
}
//void PlayerbotMgr::HandleMasterIncomingPacket(WorldPacket const& packet)
//{
//    switch (packet.GetOpcode())
//    {
//        //case CMSG_OFFER_PETITION:
//        //{
//        //    WorldPacket p(packet);
//        //    p.rpos(0);    // reset reader
//        //    uint64 petitionGuid;
//        //    uint64 playerGuid;
//        //    uint32 junk;
//
//        //    p >> junk;                                      // this is not petition type!
//        //    p >> petitionGuid;                              // petition guid
//        //    p >> playerGuid;                                // player guid
//
//        //    Player* player = ObjectAccessor::FindPlayer(playerGuid);
//        //    if (!player)
//        //        return;
//
//        //    uint32 petitionLowGuid = GUID_LOPART(petitionGuid);
//
//        //    QueryResult result = CharacterDatabase.PQuery("SELECT * FROM petition_sign WHERE playerguid = '%u' AND petitionguid = '%u'", player->GetGUIDLow(), petitionLowGuid);
//
//        //    if (result)
//        //    {
//        //        ChatHandler(m_master).PSendSysMessage("%s has already signed the petition", player->GetName().c_str());
//        //        delete result;
//        //        return;
//        //    }
//
//        //    CharacterDatabase.PExecute("INSERT INTO petition_sign (ownerguid,petitionguid, playerguid, player_account) VALUES ('%u', '%u', '%u','%u')",
//        //    m_master->GetGUIDLow(), petitionLowGuid, player->GetGUIDLow(), m_master->GetSession()->GetAccountId());
//
//        //    p.Initialize(SMSG_PETITION_SIGN_RESULTS, (8+8+4));
//        //    p << uint64(petitionGuid);
//        //    p << uint64(playerGuid);
//        //    p << uint32(PETITION_SIGN_OK);
//
//        //    // close at signer side
//        //    m_master->GetSession()->SendPacket(&p);
//
//        //    return;
//        //}
//
//        //case CMSG_ACTIVATETAXI:
//        //    {
//        //        WorldPacket p(packet);
//        //        p.rpos(0); // reset reader
//
//        //        uint64 guid;
//        //        std::vector<uint32> nodes;
//        //        nodes.resize(2);
//        //        //uint8 delay = 9;
//        //        p >> guid >> nodes[0] >> nodes[1];
//
//        //        for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//        //        {
//
//        //            //delay = delay + 3;
//        //            Player* bot = it->second;
//        //            if (!bot)
//        //                continue;
//
//        //            Group* group = bot->GetGroup();
//        //            if (!group)
//        //                continue;
//
//        //            Unit* target = sObjectAccessor->GetUnit(*bot, guid);
//
//        //            //bot->GetPlayerbotAI()->SetIgnoreUpdateTime(delay);
//
//        //            bot->GetMotionMaster()->Clear(true);
//        //            bot->GetMotionMaster()->MoveFollow(target, INTERACTION_DISTANCE, bot->GetOrientation());
//        //            bot->GetPlayerbotAI()->GetTaxi(guid, nodes);
//        //        }
//        //        return;
//        //    }
//
//        //case CMSG_ACTIVATETAXIEXPRESS:
//        //    {
//        //        WorldPacket p(packet);
//        //        p.rpos(0); // reset reader
//
//        //        uint64 guid;
//        //        uint32 node_count;
//        //        //uint8 delay = 9;
//        //        p >> guid;
//        //        p.read_skip<uint32>();
//        //        p >> node_count;
//
//        //        std::vector<uint32> nodes;
//        //        for (uint32 i = 0; i < node_count; ++i)
//        //        {
//        //            uint32 node;
//        //            p >> node;
//        //            nodes.push_back(node);
//        //        }
//
//        //        if (nodes.empty())
//        //            return;
//
//
//        //        for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//        //        {
//
//        //            //delay = delay + 3;
//        //            Player* bot = it->second;
//        //            if (!bot)
//        //                return;
//        //            Group* group = bot->GetGroup();
//        //            if (!group)
//        //                continue;
//        //            Unit* target = sObjectAccessor->GetUnit(*bot, guid);
//
//        //            //bot->GetPlayerbotAI()->SetIgnoreUpdateTime(delay);
//
//        //            bot->GetMotionMaster()->Clear(true);
//        //            bot->GetMotionMaster()->MoveFollow(target, INTERACTION_DISTANCE, bot->GetOrientation());
//        //            bot->GetPlayerbotAI()->GetTaxi(guid, nodes);
//        //        }
//        //        return;
//        //    }
//
//        //case CMSG_MOVE_SPLINE_DONE:
//        //    {
//        //        // DEBUG_LOG ("[PlayerbotMgr]: HandleMasterIncomingPacket - Received CMSG_MOVE_SPLINE_DONE");
//
//        //        WorldPacket p(packet);
//        //        p.rpos(0); // reset reader
//
//        //        ObjectGuid guid;                                        // used only for proper packet read
//        //        MovementInfo movementInfo;                              // used only for proper packet read
//
//        //        p >> guid.ReadAsPacked();
//        //        p >> movementInfo;
//        //        p >> Unused<uint32>();                          // unk
//
//        //        for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//        //        {
//
//        //            Player* const bot = it->second;
//        //            if (!bot)
//        //                return;
//
//        //            // in taxi flight packet received in 2 case:
//        //            // 1) end taxi path in far (multi-node) flight
//        //            // 2) switch from one map to other in case multi-map taxi path
//        //            // we need process only (1)
//        //            uint32 curDest = bot->m_taxi.GetTaxiDestination();
//        //            if (!curDest)
//        //                return;
//
//        //            TaxiNodesEntry const* curDestNode = sTaxiNodesStore.LookupEntry(curDest);
//
//        //            // far teleport case
//        //            if (curDestNode && curDestNode->map_id != bot->GetMapId())
//        //            {
//        //                if (bot->GetMotionMaster()->GetCurrentMovementGeneratorType() == FLIGHT_MOTION_TYPE)
//        //                {
//        //                    // short preparations to continue flight
//        //                    FlightPathMovementGenerator* flight = (FlightPathMovementGenerator *) (bot->GetMotionMaster()->top());
//
//        //                    flight->Interrupt(*bot);                // will reset at map landing
//
//        //                    flight->SetCurrentNodeAfterTeleport();
//        //                    TaxiPathNodeEntry const& node = flight->GetPath()[flight->GetCurrentNode()];
//        //                    flight->SkipCurrentNode();
//
//        //                    bot->TeleportTo(curDestNode->map_id, node.x, node.y, node.z, bot->GetOrientation());
//        //                }
//        //                return;
//        //            }
//
//        //            uint32 destinationnode = bot->m_taxi.NextTaxiDestination();
//        //            if (destinationnode > 0)                                // if more destinations to go
//        //            {
//        //                // current source node for next destination
//        //                uint32 sourcenode = bot->m_taxi.GetTaxiSource();
//
//        //                // Add to taximask middle hubs in taxicheat mode (to prevent having player with disabled taxicheat and not having back flight path)
//        //                if (bot->isTaxiCheater())
//        //                    if (bot->m_taxi.SetTaximaskNode(sourcenode))
//        //                    {
//        //                        WorldPacket data(SMSG_NEW_TAXI_PATH, 0);
//        //                        bot->GetSession()->SendPacket(&data);
//        //                    }
//
//        //                    // DEBUG_LOG ("[PlayerbotMgr]: HandleMasterIncomingPacket - Received CMSG_MOVE_SPLINE_DONE Taxi has to go from %u to %u", sourcenode, destinationnode);
//
//        //                    uint32 mountDisplayId = sObjectMgr->GetTaxiMountDisplayId(sourcenode, bot->GetTeam());
//
//        //                    uint32 path, cost;
//        //                    sObjectMgr->GetTaxiPath(sourcenode, destinationnode, path, cost);
//
//        //                    if (path && mountDisplayId)
//        //                        bot->GetSession()->SendDoFlight(mountDisplayId, path, 1);          // skip start fly node
//        //                    else
//        //                        bot->m_taxi.ClearTaxiDestinations();    // clear problematic path and next
//        //            }
//        //            else
//        //                /* std::ostringstream out;
//        //                out << "Destination reached" << bot->GetName();
//        //                ChatHandler ch(m_master);
//        //                ch.SendSysMessage(out.str().c_str()); */
//        //                bot->m_taxi.ClearTaxiDestinations();        // Destination, clear source node
//        //        }
//        //        return;
//        //    }
//
//            // if master is logging out, log out all bots
//        case CMSG_LOGOUT_REQUEST:
//        {
//            LogoutAllBots();
//            return;
//        }
//
//        // If master inspects one of his bots, give the master useful info in chat window
//        // such as inventory that can be equipped
//        //case CMSG_INSPECT:
//        //{
//        //    WorldPacket p(packet);
//        //    p.rpos(0); // reset reader
//        //    uint64 guid;
//        //    p >> guid;
//        //    Player* bot = GetPlayerBot(guid);
//        //    if (bot)
//        //        bot->GetPlayerbotAI()->SendNotEquipList(*bot);
//        //    return;
//        //}
//
//        // handle emotes from the master
//        //case CMSG_EMOTE:
//        case CMSG_TEXT_EMOTE:
//        {
//            WorldPacket p(packet);
//            p.rpos(0); // reset reader
//            uint32 emoteNum;
//            p >> emoteNum;
//
//            /* std::ostringstream out;
//            out << "emote is: " << emoteNum;
//            ChatHandler ch(m_master);
//            ch.SendSysMessage(out.str().c_str()); */
//
//            switch (emoteNum)
//            {
//                case TEXT_EMOTE_BOW:
//                {
//                    // Buff anyone who bows before me. Useful for players not in bot's group
//                    // How do I get correct target???
//                    //Player* const pPlayer = GetPlayerBot(m_master->GetSelection());
//                    //if (pPlayer->GetPlayerbotAI()->GetClassAI())
//                    //    pPlayer->GetPlayerbotAI()->GetClassAI()->BuffPlayer(pPlayer);
//                    return;
//                }
//                /*
//                case TEXT_EMOTE_BONK:
//                {
//                Player* const pPlayer = GetPlayerBot(m_master->GetSelection());
//                if (!pPlayer || !pPlayer->GetPlayerbotAI())
//                return;
//                PlayerbotAI* const pBot = pPlayer->GetPlayerbotAI();
//
//                ChatHandler ch(m_master);
//                {
//                std::ostringstream out;
//                out << "CurrentTime: " << CurrentTime()
//                << " m_ignoreAIUpdatesUntilTime: " << pBot->m_ignoreAIUpdatesUntilTime;
//                ch.SendSysMessage(out.str().c_str());
//                }
//                {
//                std::ostringstream out;
//                out << "m_TimeDoneEating: " << pBot->m_TimeDoneEating
//                << " m_TimeDoneDrinking: " << pBot->m_TimeDoneDrinking;
//                ch.SendSysMessage(out.str().c_str());
//                }
//                {
//                std::ostringstream out;
//                out << "m_CurrentlyCastingSpellId: " << pBot->m_CurrentlyCastingSpellId;
//                ch.SendSysMessage(out.str().c_str());
//                }
//                {
//                std::ostringstream out;
//                out << "IsBeingTeleported() " << pBot->GetPlayer()->IsBeingTeleported();
//                ch.SendSysMessage(out.str().c_str());
//                }
//                {
//                std::ostringstream out;
//                bool tradeActive = (pBot->GetPlayer()->GetTrader()) ? true : false;
//                out << "tradeActive: " << tradeActive;
//                ch.SendSysMessage(out.str().c_str());
//                }
//                {
//                std::ostringstream out;
//                out << "IsCharmed() " << pBot->getPlayer()->isCharmed();
//                ch.SendSysMessage(out.str().c_str());
//                }
//                return;
//                }
//                */
//
//                case TEXT_EMOTE_EAT:
//                case TEXT_EMOTE_DRINK:
//                {
//                    for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//                    {
//                        Player* bot = it->second;
//                        //bot->GetPlayerbotAI()->Feast();
//                    }
//                    return;
//                }
//
//                // emote to attack selected target
//                //case TEXT_EMOTE_POINT:
//                //{
//                //    uint64 attackOnGuid = m_master->GetSelection();
//                //    if (!attackOnGuid)
//                //        return;
//
//                //    Unit* thingToAttack = sObjectAccessor->GetUnit(*m_master, attackOnGuid);
//                //    if (!thingToAttack) return;
//
//                //    Player* bot = 0;
//                //    for (PlayerBotMap::iterator itr = m_playerBots.begin(); itr != m_playerBots.end(); ++itr)
//                //    {
//                //        bot = itr->second;
//                //        if (!bot->IsFriendlyTo(thingToAttack))
//                //        {
//                //            if (!bot->IsWithinLOSInMap(thingToAttack))
//                //                bot->GetPlayerbotAI()->DoTeleport(*m_master);
//                //            if (bot->IsWithinLOSInMap(thingToAttack))
//                //                bot->GetPlayerbotAI()->Attack(thingToAttack);
//                //        }
//                //    }
//                //    return;
//                //}
//
//                // emote to stay
//                case TEXT_EMOTE_STAND:
//                {
//                    uint64 sel = m_master->GetSelection();
//                    if (!sel)
//                    {
//                        for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//                            it->second->GetPlayerbotAI()->SetMovementOrder(PlayerbotAI::MOVEMENT_STAY);
//                    }
//                    else if (Player* bot = GetPlayerBot(sel))
//                            bot->GetPlayerbotAI()->SetMovementOrder(PlayerbotAI::MOVEMENT_STAY);
//                    return;
//                }
//
//                // 324 is the followme emote (not defined in enum)
//                // if master has bot selected then only bot follows, else all bots follow
//                case TEXT_EMOTE_FOLLOW:
//                case TEXT_EMOTE_WAVE:
//                {
//                    uint64 sel = m_master->GetSelection();
//                    if (!sel)
//                    {
//                        for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//                            it->second->GetPlayerbotAI()->SetMovementOrder(PlayerbotAI::MOVEMENT_FOLLOW);
//                    }
//                    else if (Player* bot = GetPlayerBot(sel))
//                            bot->GetPlayerbotAI()->SetMovementOrder(PlayerbotAI::MOVEMENT_FOLLOW);
//                    return;
//                }
//            }
//            return;
//        } /* EMOTE ends here */
//
//        case CMSG_GAMEOBJ_USE: // not sure if we still need this one
//        case CMSG_GAMEOBJ_REPORT_USE:
//        {
//            WorldPacket p(packet);
//            p.rpos(0);     // reset reader
//            uint64 objGUID;
//            p >> objGUID;
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                Player* bot = it->second;
//                GameObject* obj = m_master->GetMap()->GetGameObject(objGUID);
//                if (!obj)
//                    return;
//
//                // add other go types here, i.e.:
//                // GAMEOBJECT_TYPE_CHEST - loot quest items of chest
//                if (obj->GetGoType() == GAMEOBJECT_TYPE_QUESTGIVER)
//                {
//                    bot->GetPlayerbotAI()->TurnInQuests(obj);
//
//                    // auto accept every available quest this NPC has
//                    bot->PrepareQuestMenu(objGUID);
//                    QuestMenu& questMenu = bot->PlayerTalkClass->GetQuestMenu();
//                    for (uint32 iI = 0; iI < questMenu.GetMenuItemCount(); ++iI)
//                    {
//                        QuestMenuItem const& qItem = questMenu.GetItem(iI);
//                        uint32 questID = qItem.QuestId;
//                        if (!bot->GetPlayerbotAI()->AddQuest(questID, obj))
//                            bot->GetPlayerbotAI()->TellMaster("Couldn't take quest");
//                    }
//                }
//            }
//        }
//        break;
//
//        case CMSG_QUESTGIVER_HELLO:
//        {
//            WorldPacket p(packet);
//            p.rpos(0);    // reset reader
//            uint64 npcGUID;
//            p >> npcGUID;
//            WorldObject* pNpc = sObjectAccessor->GetWorldObject(*m_master, npcGUID);
//            if (!pNpc)
//                return;
//
//            // for all master's bots
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                Player* bot = it->second;
//                bot->GetPlayerbotAI()->TurnInQuests(pNpc);
//            }
//
//            return;
//        }
//
//        // if master accepts a quest, bots should also try to accept quest
//        case CMSG_QUESTGIVER_ACCEPT_QUEST:
//        {
//            WorldPacket p(packet);
//            p.rpos(0);    // reset reader
//            uint64 guid;
//            uint32 quest;
//            uint32 unk1;
//            p >> guid >> quest >> unk1;
//
//            Quest const* qInfo = sObjectMgr->GetQuestTemplate(quest);
//            if (qInfo)
//                for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//                {
//                    Player* bot = it->second;
//                    if (bot->GetQuestStatus(quest) == QUEST_STATUS_COMPLETE)
//                        bot->GetPlayerbotAI()->TellMaster("I already completed that quest.");
//                    else if (!bot->CanTakeQuest(qInfo, false))
//                    {
//                        if (!bot->SatisfyQuestStatus(qInfo, false))
//                            bot->GetPlayerbotAI()->TellMaster("I already have that quest.");
//                        else
//                            bot->GetPlayerbotAI()->TellMaster("I can't take that quest.");
//                    }
//                    else if (!bot->SatisfyQuestLog(false))
//                        bot->GetPlayerbotAI()->TellMaster("My quest log is full.");
//                    else if (!bot->CanAddQuest(qInfo, false))
//                        bot->GetPlayerbotAI()->TellMaster("I can't take that quest because it requires that I take items, but my bags are full!");
//                    else
//                    {
//                        p.rpos(0);         // reset reader
//                        bot->GetSession()->HandleQuestgiverAcceptQuestOpcode(p);
//                        bot->GetPlayerbotAI()->TellMaster("Got the quest.");
//
//                        // build needed items if quest contains any
//                        for (uint8 i = 0; i < QUEST_ITEM_OBJECTIVES_COUNT; i++)
//                        {
//                            if (qInfo->RequiredItemCount[i] > 0)
//                            {
//                                bot->GetPlayerbotAI()->SetQuestNeedItems();
//                                break;
//                            }
//
//                            // build needed creatures if quest contains any
//                            for (uint8 i = 0; i < QUEST_OBJECTIVES_COUNT; i++)
//                            {
//                                if (qInfo->RequiredNpcOrGoCount[i] > 0)
//                                {
//                                    bot->GetPlayerbotAI()->SetQuestNeedCreatures();
//                                    break;
//                                }
//                            }
//                        }
//                    }
//                }
//                return;
//        }
//
//        case CMSG_AREATRIGGER:
//        {
//            WorldPacket p(packet);
//
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                Player* bot = it->second;
//                if (!bot)
//                    continue;
//
//                if (bot->IsWithinDistInMap(m_master, 50))
//                {
//                    p.rpos(0);         // reset reader
//                    bot->GetSession()->HandleAreaTriggerOpcode(p);
//                }
//            }
//            return;
//        }
//
//        case CMSG_QUESTGIVER_COMPLETE_QUEST:
//        {
//            WorldPacket p(packet);
//            p.rpos(0);    // reset reader
//            uint32 quest;
//            uint64 npcGUID;
//            p >> npcGUID >> quest;
//
//            // DEBUG_LOG ("[PlayerbotMgr]: HandleMasterIncomingPacket - Received CMSG_QUESTGIVER_COMPLETE_QUEST npc = %s, quest = %u", npcGUID.GetString().c_str(), quest);
//
//            WorldObject* pNpc = sObjectAccessor->GetWorldObject(*m_master, npcGUID);
//            if (!pNpc)
//                return;
//
//            // for all master's bots
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                Player* bot = it->second;
//                bot->GetPlayerbotAI()->TurnInQuests(pNpc);
//            }
//            return;
//        }
//
//        case CMSG_LOOT_ROLL:
//        {
//            WorldPacket p(packet);    //WorldPacket packet for CMSG_LOOT_ROLL, (8+4+1)
//            uint64 Guid;
//            uint32 itemSlot;
//            uint8 rollType;
//            Loot* loot = NULL;
//
//            p.rpos(0);        //reset packet pointer
//            p >> Guid;        //guid of the lootable target
//            p >> itemSlot;    //loot index
//            p >> rollType;    //need,greed or pass on roll
//
//            if (IS_CREATURE_GUID(Guid))
//            {
//                if (Creature* c = m_master->GetMap()->GetCreature(Guid))
//                    loot = &c->loot;
//            }
//            else if (IS_GAMEOBJECT_GUID(Guid))
//            {
//                if (GameObject* go = m_master->GetMap()->GetGameObject(Guid))
//                    loot = &go->loot;
//            }
//
//            if (!loot)
//                return;
//
//            LootItem& lootItem = loot->items[itemSlot];
//            ItemTemplate const* pProto = sObjectMgr->GetItemTemplate(lootItem.itemid);
//            if (!pProto)
//                return;
//
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                uint32 choice = 0;
//
//                Player* bot = it->second;
//                if (!bot)
//                    continue;
//
//                Group* group = bot->GetGroup();
//                if (!group || group != m_master->GetGroup())
//                    continue;
//
//                if (bot->GetPlayerbotAI()->CanStore())
//                {
//                    if (bot->CanUseItem(pProto) == EQUIP_ERR_OK && bot->GetPlayerbotAI()->IsItemUseful(lootItem.itemid))
//                        choice = 1;  // Need
//                    else if (pProto->Quality < ITEM_QUALITY_LEGENDARY && bot->HasSkill(SKILL_ENCHANTING))
//                        choice = 3;  // Disenchant
//                    else
//                        choice = 2;  // Greed
//                }
//                else
//                    choice = 0;  // Pass
//
//                bot->GetPlayerbotAI()->BeingRolledOn(Guid);
//
//                group->CountRollVote(bot->GetGUID(), Guid, RollVote(choice));
//
//                switch (choice)
//                {
//                    case ROLL_NEED:
//                        bot->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_ROLL_NEED, 1);
//                        break;
//                    case ROLL_GREED:
//                    case ROLL_DISENCHANT:
//                        bot->UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_ROLL_GREED, 1);
//                        break;
//                }
//            }
//            return;
//        }
//
//        // Handle GOSSIP activate actions, prior to GOSSIP select menu actions
//        case CMSG_GOSSIP_HELLO:
//        {
//            // DEBUG_LOG ("[PlayerbotMgr]: HandleMasterIncomingPacket - Received CMSG_GOSSIP_HELLO");
//
//            WorldPacket p(packet);    //WorldPacket packet for CMSG_GOSSIP_HELLO, (8)
//            uint64 guid;
//            p.rpos(0);                //reset packet pointer
//            p >> guid;
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                Player* bot = it->second;
//                if (!bot)
//                    continue;
//                Creature* pCreature = bot->GetNPCIfCanInteractWith(guid, UNIT_NPC_FLAG_NONE);
//                if (!pCreature)
//                {
//                    //DEBUG_LOG ("[PlayerbotMgr]: HandleMasterIncomingPacket - Received  CMSG_GOSSIP_HELLO %s not found or you can't interact with him.", guid.GetString().c_str());
//                    continue;
//                }
//
//                GossipMenuItemsMapBounds pMenuItemBounds = sObjectMgr->GetGossipMenuItemsMapBounds(pCreature->GetCreatureTemplate()->GossipMenuId);
//                for (GossipMenuItemsContainer::const_iterator itr = pMenuItemBounds.first; itr != pMenuItemBounds.second; ++itr)
//                {
//                    uint32 npcflags = pCreature->GetUInt32Value(UNIT_NPC_FLAGS);
//
//                    if (!(itr->second.OptionNpcflag & npcflags))
//                        continue;
//
//                    switch (itr->second.OptionType)
//                    {
//                        case GOSSIP_OPTION_TAXIVENDOR:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_TAXIVENDOR");
//                            bot->GetSession()->SendLearnNewTaxiNode(pCreature);
//                            break;
//                        }
//                        case GOSSIP_OPTION_QUESTGIVER:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_QUESTGIVER");
//                            bot->GetPlayerbotAI()->TurnInQuests(pCreature);
//                            break;
//                        }
//                        case GOSSIP_OPTION_VENDOR:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_VENDOR");
//                            if (!ConfigMgr::GetBoolDefault("PlayerbotAI.SellGarbage", true))
//                                continue;
//
//                            // changed the SellGarbage() function to support ch.SendSysMessaage()
//                            bot->GetPlayerbotAI()->SellGarbage(*bot);
//                            break;
//                        }
//                        case GOSSIP_OPTION_STABLEPET:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_STABLEPET");
//                            break;
//                        }
//                        case GOSSIP_OPTION_AUCTIONEER:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_AUCTIONEER");
//                            break;
//                        }
//                        case GOSSIP_OPTION_BANKER:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_BANKER");
//                            break;
//                        }
//                        case GOSSIP_OPTION_INNKEEPER:
//                        {
//                            // bot->GetPlayerbotAI()->TellMaster("PlayerbotMgr:GOSSIP_OPTION_INNKEEPER");
//                            break;
//                        }
//                    }
//                }
//            }
//            return;
//        }
//
//        //case CMSG_SPIRIT_HEALER_ACTIVATE:
//        //{
//        //    for (PlayerBotMap::iterator itr = m_playerBots.begin(); itr != m_playerBots.end(); ++itr)
//        //    {
//        //        if (Group* grp = itr->second->GetGroup())
//        //            grp->RemoveMember(itr->first, 1);
//        //    }
//        //    return;
//        //}
//
//        case CMSG_LIST_INVENTORY:
//        {
//            if (!ConfigMgr::GetBoolDefault("PlayerbotAI.SellGarbage", true))
//                return;
//
//            WorldPacket p(packet);
//            p.rpos(0);  // reset reader
//            uint64 npcGUID;
//            p >> npcGUID;
//            WorldObject* const pNpc = (WorldObject*)sObjectAccessor->GetObjectByTypeMask(*m_master, npcGUID, TYPEMASK_UNIT | TYPEMASK_GAMEOBJECT);
//            if (!pNpc)
//                return;
//
//            // for all master's bots
//            for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); it != GetPlayerBotsEnd(); ++it)
//            {
//                Player* bot = it->second;
//                if (!bot->IsInMap(pNpc))
//                {
//                    bot->GetPlayerbotAI()->TellMaster("I'm too far away to sell items!");
//                    continue;
//                }
//                else
//                {
//                    // changed the SellGarbage() function to support ch.SendSysMessaage()
//                    bot->GetPlayerbotAI()->SellGarbage(*bot);
//                }
//            }
//            return;
//        }
//
//        /*
//        case CMSG_NAME_QUERY:
//        case MSG_MOVE_START_FORWARD:
//        case MSG_MOVE_STOP:
//        case MSG_MOVE_SET_FACING:
//        case MSG_MOVE_START_STRAFE_LEFT:
//        case MSG_MOVE_START_STRAFE_RIGHT:
//        case MSG_MOVE_STOP_STRAFE:
//        case MSG_MOVE_START_BACKWARD:
//        case MSG_MOVE_HEARTBEAT:
//        case CMSG_STANDSTATECHANGE:
//        case CMSG_QUERY_TIME:
//        case CMSG_CREATURE_QUERY:
//        case CMSG_GAMEOBJECT_QUERY:
//        case MSG_MOVE_JUMP:
//        case MSG_MOVE_FALL_LAND:
//        return;
//
//        default:
//        {
//        const char* oc = LookupOpcodeName(packet.GetOpcode());
//        // ChatHandler ch(m_master);
//        // ch.SendSysMessage(oc);
//
//        std::ostringstream out;
//        out << "masterin: " << oc;
//        sLog.outError(out.str().c_str());
//        }
//        */
//    }
//}
//
void PlayerbotMgr::HandleMasterOutgoingPacket(WorldPacket const& /*packet*/)
{
    /*
    switch (packet.GetOpcode())
    {
    // maybe our bots should only start looting after the master loots?
    //case SMSG_LOOT_RELEASE_RESPONSE: {}
    case SMSG_NAME_QUERY_RESPONSE:
    case SMSG_MONSTER_MOVE:
    case SMSG_COMPRESSED_UPDATE_OBJECT:
    case SMSG_DESTROY_OBJECT:
    case SMSG_UPDATE_OBJECT:
    case SMSG_STANDSTATE_UPDATE:
    case MSG_MOVE_HEARTBEAT:
    case SMSG_QUERY_TIME_RESPONSE:
    case SMSG_AURA_UPDATE_ALL:
    case SMSG_CREATURE_QUERY_RESPONSE:
    case SMSG_GAMEOBJECT_QUERY_RESPONSE:
    return;
    default:
    {
    const char* oc = LookupOpcodeName(packet.GetOpcode());

    std::ostringstream out;
    out << "masterout: " << oc;
    sLog.outError(out.str().c_str());
    }
    }
    */
}

void PlayerbotMgr::LogoutAllBots()
{
    RemoveAllBotsFromGroup();
    while (true)
    {
        PlayerBotMap::const_iterator itr = GetPlayerBotsBegin();
        if (itr == GetPlayerBotsEnd()) break;
        Player* bot = itr->second;
        LogoutPlayerBot(bot->GetGUID());
    }
}

void PlayerbotMgr::Stay()
{
    for (PlayerBotMap::const_iterator itr = GetPlayerBotsBegin(); itr != GetPlayerBotsEnd(); ++itr)
    {
        itr->second->GetMotionMaster()->Clear();
    }
}

// Playerbot mod: logs out a Playerbot.
void PlayerbotMgr::LogoutPlayerBot(uint64 guid, bool uninvite)
{
    if (Player* bot = GetPlayerBot(guid))
    {
        if (uninvite)
            if (Group* group = bot->GetGroup())
                group->RemoveMember(guid);

        WorldSession* botWorldSession = bot->GetSession();
        botWorldSession->m_master = NULL;
        m_playerBots.erase(guid);               //deletes bot player ptr inside this WorldSession PlayerBotMap
        botWorldSession->LogoutPlayer(true);    //this will delete the bot Player object and PlayerbotAI (along with class AI) object
        delete botWorldSession;                 //finally delete the bot's WorldSession
        botWorldSession = NULL;
        return;
    }
    std::string name;
    sObjectMgr->GetPlayerNameByGUID(guid, name);
    TC_LOG_FATAL(LOG_FILTER_PLAYER, "PlayerbotMgr:: Trying to logout playerbot (%s, guid %u) which does not exist!!!", name.c_str(), GUID_LOPART(guid));
}

// Playerbot mod: Gets a player bot Player object for this WorldSession master
Player* PlayerbotMgr::GetPlayerBot(uint64 playerGuid) const
{
    PlayerBotMap::const_iterator it = m_playerBots.find(playerGuid);
    return (it == m_playerBots.end()) ? NULL : it->second;
}

void PlayerbotMgr::OnBotLogin(Player* const bot)
{
    if (!bot)
        return;

    // tell the world session that they now manage this new bot
    m_playerBots[bot->GetGUID()] = bot;

    // if bot is in a group and master is not in group then
    // have bot leave their group
    if (bot->GetGroup() && (!m_master->GetGroup() || !m_master->GetGroup()->IsMember(bot->GetGUID())))
        bot->RemoveFromGroup();

    // sometimes master can lose leadership, pass leadership to master check
    uint64 masterGuid = m_master->GetGUID();
    if (m_master->GetGroup() && !m_master->GetGroup()->IsLeader(masterGuid))
    {
        // But only do so if one of the master's bots is leader
        for (PlayerBotMap::const_iterator itr = GetPlayerBotsBegin(); itr != GetPlayerBotsEnd(); itr++)
        {
            Player* bot = itr->second;
            if (m_master->GetGroup()->IsLeader(bot->GetGUID()))
            {
                m_master->GetGroup()->ChangeLeader(masterGuid);
                break;
            }
        }
    }
    // Finally, give the bot some AI, object is owned by the player class
    PlayerbotAI* ai = new PlayerbotAI(this, bot);
    bot->SetPlayerbotAI(ai);
}

void PlayerbotMgr::RemoveAllBotsFromGroup(bool force)
{
    Group* gr = m_master->GetGroup();
    if (gr || force)
        for (PlayerBotMap::const_iterator it = GetPlayerBotsBegin(); m_master->GetGroup() && it != GetPlayerBotsEnd(); ++it)
            if (force || gr == it->second->GetGroup())
                gr->RemoveMember(it->first);
}

void Player::GetSkills(std::list<uint32>& m_spellsToLearn)
{
    for (SkillStatusMap::const_iterator itr = mSkillStatus.begin(); itr != mSkillStatus.end(); ++itr)
    {
        if (itr->second.uState == SKILL_DELETED)
            continue;

        m_spellsToLearn.push_back(itr->first);
    }
}

void Player::MakeTalentGlyphLink(std::ostringstream &out)
{
    // |cff4e96f7|Htalent:1396:4|h[Unleashed Fury]|h|r
    // |cff66bbff|Hglyph:23:460|h[Glyph of Fortitude]|h|r

    if (m_specsCount)
        // loop through all specs (only 1 for now)
        for (uint32 specIdx = 0; specIdx < m_specsCount; ++specIdx)
        {
            // find class talent tabs (all players have 3 talent tabs)
            uint32 const* talentTabIds = GetTalentTabPages(getClass());

            out << "\n" << "Active Talents ";

            for (uint32 i = 0; i < 3; ++i)
            {
                uint32 talentTabId = talentTabIds[i];
                for (PlayerTalentMap::iterator iter = m_talents[specIdx]->begin(); iter != m_talents[specIdx]->end(); ++iter)
                {
                    PlayerTalent *talent = (*iter).second;

                    if (talent->state == PLAYERSPELL_REMOVED)
                        continue;

                    TalentSpellPos const* talentPos = GetTalentSpellPos((*iter).first);
                    if (!talentPos)
                        continue;
                    TalentEntry const* talentInfo = sTalentStore.LookupEntry(talentPos->talent_id);
                    if (!talentInfo)
                        continue;
                    // skip another tab talents
                    if (talentInfo->TalentTab != talentTabId)
                        continue;

                    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo((*iter).first);
                    if (!spellInfo)
                        continue;

                    out << "|cff4e96f7|Htalent:" << talentInfo->TalentID << ":" << talentInfo->RankID[spellInfo->GetRank()]
                        << " |h[" << spellInfo->SpellName[GetSession()->GetSessionDbcLocale()] << "]|h|r";
                }
            }

            uint32 freepoints = 0;

            out << " Unspent points : ";

            if ((freepoints = GetFreeTalentPoints()) > 0)
                out << "|h|cff00ff00" << freepoints << "|h|r";
            else
                out << "|h|cffff0000" << freepoints << "|h|r";

            out << "\n" << "Active Glyphs ";
            // GlyphProperties.dbc
            for (uint8 i = 0; i < MAX_GLYPH_SLOT_INDEX; ++i)
            {
                GlyphPropertiesEntry const* glyph = sGlyphPropertiesStore.LookupEntry(m_Glyphs[specIdx][i]);
                if (!glyph)
                    continue;

                SpellEntry const* spell_entry = sSpellStore.LookupEntry(glyph->SpellId);

                out << "|cff66bbff|Hglyph:" << GetGlyphSlot(i) << ":" << m_Glyphs[specIdx][i]
                    << " |h[" << spell_entry->SpellName[GetSession()->GetSessionDbcLocale()] << "]|h|r";

            }
        }
}

void Player::chompAndTrim(std::string& str)
{
    while (str.length() > 0)
    {
        char lc = str[str.length() - 1];
        if (lc == '\r' || lc == '\n' || lc == ' ' || lc == '"' || lc == '\'')
            str = str.substr(0, str.length() - 1);
        else
            break;
    }

    while (str.length() > 0)
    {
        char lc = str[0];
        if (lc == ' ' || lc == '"' || lc == '\'')
            str = str.substr(1, str.length() - 1);
        else
            break;
    }
}

bool Player::getNextQuestId(std::string const& pString, uint32& pStartPos, uint32& pId)
{
    bool result = false;
    uint32 i;
    for (i = pStartPos; i < pString.size(); ++i)
    {
        if (pString[i] == ',')
            break;
    }
    if (i > pStartPos)
    {
        std::string idString = pString.substr(pStartPos, i - pStartPos);
        pStartPos = i + 1;
        chompAndTrim(idString);
        pId = atoi(idString.c_str());
        result = true;
    }
    return result;
}

void Player::UpdateMail()
{
    // save money,items and mail to prevent cheating
    SQLTransaction trans = CharacterDatabase.BeginTransaction();
    SaveGoldToDB(trans);
    SaveInventoryAndGoldToDB(trans);
    _SaveMail(trans);
    CharacterDatabase.CommitTransaction(trans);
}

uint32 PlayerbotMgr::GetSpec(Player* player)
{
    uint32 row = 0;
    uint32 spec = 0;
    uint8 rank = 0;
    uint32 m_activeSpec = player->GetActiveSpec();
    PlayerTalentMap* m_talents = player->GetTalents(m_activeSpec);

    for (PlayerTalentMap::iterator iter = m_talents->begin(); iter != m_talents->end(); ++iter)
    {
        PlayerTalent* talent = (*iter).second;
        if (talent->state == PLAYERSPELL_REMOVED)
            continue;
        TalentSpellPos const* talentPos = GetTalentSpellPos((*iter).first);
        if (!talentPos)
            continue;
        TalentEntry const* talentInfo = sTalentStore.LookupEntry(talentPos->talent_id);
        if (!talentInfo)
            continue;

        //spec is set with 3 rules
        //a) there is no spec set yet
        //b) found talent deeper in talent tree
        //c) found talent with same depth, but with higher rank
        if (spec == 0 || talentInfo->Row > row || (talentInfo->Row == row && talentPos->rank > rank))
        {
            row = talentInfo->Row;
            spec = talentInfo->TalentTab;
        }
    }

    //Return the tree with the deepest talent
    return spec;
}

bool Player::HavePBot() const
{
    return m_playerbotMgr != NULL && !m_playerbotMgr->getPlayerbots().empty();
}

uint16 PlayerbotMgr::Rand() const
{
    return urand(0, 100 + m_playerBots.empty() ? 0 : (m_playerBots.size() - 1) * 10);
}
