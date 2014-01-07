#include "ScriptPCH.h"
#include "InstanceSaveMgr.h"
#include "InstanceScript.h"
#include "MapManager.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "Item.h"
#include "Config.h"
#include "ItemPrototype.h"
#include "Channel.h"

class npc_change : public CreatureScript
{
    public:
        npc_change() : CreatureScript("npc_change") { }

	       bool OnGossipHello(Player *player, Creature *_creature)
           {
		        if (player->IsInCombat()) 
                {		
				     /// @todo check Combat
                    _creature->MonsterWhisper("You are in Combat", player->GetGUID());
				    player->CLOSE_GOSSIP_MENU();
					return true;
                }
                else
                { 
				    player->ADD_GOSSIP_ITEM( 0, "10 Mark -> Reset Instance"                                    , GOSSIP_SENDER_MAIN, 1);
				    player->ADD_GOSSIP_ITEM( 0, "10 Mark -> 25 Arena Pointu"                                   , GOSSIP_SENDER_MAIN, 2);
				    player->ADD_GOSSIP_ITEM( 0, "10 BOJ -> 1 Mark"                                             , GOSSIP_SENDER_MAIN, 3);
				    player->ADD_GOSSIP_ITEM( 0, "2 Mark -> 1 EoT"                                              , GOSSIP_SENDER_MAIN, 4);
				    player->ADD_GOSSIP_ITEM( 0, "2 Mark -> 5000 Honor"                                         , GOSSIP_SENDER_MAIN, 5);
				    player->ADD_GOSSIP_ITEM( 0, "1 Mark -> 10 BoJ"                                             , GOSSIP_SENDER_MAIN, 6);
				    player->ADD_GOSSIP_ITEM( 0, "1 Mark -> 10 Wood(GH MARK)"                                   , GOSSIP_SENDER_MAIN, 7);
				    player->ADD_GOSSIP_ITEM( 0, "1 Mark -> 1 Metal(GH MARK)"                                   , GOSSIP_SENDER_MAIN, 8);
				    player->ADD_GOSSIP_ITEM( 0, "8 Mark -> 1 EoF"                                              , GOSSIP_SENDER_MAIN, 9);
					player->ADD_GOSSIP_ITEM( 0, "1 EoF -> 1 Mark"                                              , GOSSIP_SENDER_MAIN, 10);
				    player->ADD_GOSSIP_ITEM( 0, "25 Mark -> [ITEM]Primordial Saronite"                         , GOSSIP_SENDER_MAIN, 11); 
		        }	


				player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());         
			    return true;
            }

            bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 uiAction)
            {

                if (sender != GOSSIP_SENDER_MAIN)
				    return true;

                player->PlayerTalkClass->ClearMenus();

                switch(uiAction)
                {

                    case 1:
					    player->LearnSpells
						player->LearnSpells
                        break;
 
                    case 2:
					    if (player->HasItemCount(19322, 10, true))
						{

							player->DestroyItemCount(19322, 10, true);								
							player->ModifyArenaPoints(+25);
							_creature->MonsterWhisper("Change Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

						}
						else
						{
							_creature->MonsterWhisper("Missing Items.", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();									
						}
                        break;


                    case 3:
					    if (player->HasItemCount(29434, 10, true))
						{
						    player->DestroyItemCount(29434, 10, true);								
							player->AddItem(19322, 1);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

						}
						else
						{									
							_creature->MonsterWhisper("You need more Badge of Justice!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();
						}
                        break;

                    case 4:
					    if (player->HasItemCount(19322, 2, true))
						{

							player->DestroyItemCount(19322, 2, true);								
							player->AddItem(47241, 1);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{									
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();
					    }
                        break;

                    case 5:
					    if (player->HasItemCount(19322, 2, true))
						{

							player->ModifyHonorPoints(+5000);							
							player->DestroyItemCount(19322, 2, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
						
                    case 6:
					    if (player->HasItemCount(19322, 1, true))
						{
						    player->AddItem(29434, 10);
							player->DestroyItemCount(19322, 1, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
						
                    case 7: // Wood 
					    if (player->HasItemCount(19322, 1, true))
						{
						    player->AddItem(4470, 10);
							player->DestroyItemCount(19322, 1, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
						
                    case 8: // Metal
					    if (player->HasItemCount(19322, 1, true))
						{
						    player->AddItem(35691, 1);
							player->DestroyItemCount(19322, 1, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
                    case 9: // Mark -> EoF
					    if (player->HasItemCount(19322, 8, true))
						{
						    player->AddItem(49426, 1);
							player->DestroyItemCount(19322, 8, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
                    case 10: // Mark -> EoF
					    if (player->HasItemCount(49426, 1, true))
						{
						    player->AddItem(19322, 1);
							player->DestroyItemCount(49426, 1, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
                    case 11: // Mark -> Primordial Saronite
					    if (player->HasItemCount(19322, 25, true))
						{
						    player->AddItem(49908, 1);
							player->DestroyItemCount(19322, 25, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
                    default:
                        break;
                }
                return true;
		}
};

void AddSC_npc_change()
{
    new npc_schange();
}
