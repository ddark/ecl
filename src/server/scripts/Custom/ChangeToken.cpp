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
				   // player->ADD_GOSSIP_ITEM( 0, "100 Mark -> [MOUNT]Reins of the Raven Lord"                   , GOSSIP_SENDER_MAIN, 16);// -5
				   // player->ADD_GOSSIP_ITEM( 0, "50 Mark -> [MOUNT]Swift Zhevra"                               , GOSSIP_SENDER_MAIN, 17);
				   // player->ADD_GOSSIP_ITEM( 0, "75 Mark -> [MOUNT]Swift Zulian Tiger"                         , GOSSIP_SENDER_MAIN, 18);
				//	player->ADD_GOSSIP_ITEM( 0, "50761"                                                        , GOSSIP_SENDER_MAIN, 75);
				//	player->ADD_GOSSIP_ITEM( 0, "1"                                                            , GOSSIP_SENDER_MAIN, 72);
				//	player->ADD_GOSSIP_ITEM( 0, "test"                                                         , GOSSIP_SENDER_MAIN, 76);
				//	player->ADD_GOSSIP_ITEM( 0, "plach"                                                         , GOSSIP_SENDER_MAIN, 79);
				//	player->ADD_GOSSIP_ITEM( 0, "rok"                                                         , GOSSIP_SENDER_MAIN, 80);
				//	player->ADD_GOSSIP_ITEM( 0, "beta"                                                         , GOSSIP_SENDER_MAIN, 100);
					player->ADD_GOSSIP_ITEM( 0, "gossipmenu"                   , GOSSIP_SENDER_MAIN, 81);// -5
					player->ADD_GOSSIP_ITEM( 0, "Morph beta"                   , GOSSIP_SENDER_MAIN, 82);// -5
					//player->ADD_GOSSIP_ITEM( 0, "Morph beta"                   , GOSSIP_SENDER_MAIN, 99);// -5
					//player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Exit"                                     , GOSSIP_SENDER_MAIN, 78);
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
					    if (player->HasItemCount(19322, 10, true))
						{
							player->DestroyItemCount(19322, 10, true);
							// Unbind ALL instances
							for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
							{
								Player::BoundInstancesMap &binds = player->GetBoundInstances(Difficulty(i));
								for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
								{
									InstanceSave* save = itr->second.save;
									if (itr->first != player->GetMapId())
										player->UnbindInstance(itr, Difficulty(i));
									else
										++itr;
								}
							}
							_creature->MonsterWhisper("Unbind all Instances complete!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();
						}
						else
						{
							_creature->MonsterWhisper("Missing items", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();
						}
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
						
						
						
						
						
						
				    case 16: // Raven Lord Mount
					    if (player->HasItemCount(19322, 100, true))
						{
						    player->AddItem(32768, 1);
							player->DestroyItemCount(19322, 100, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
						
				    case 17: // Swift Zhevra Mount
					    if (player->HasItemCount(19322, 50, true))
						{
						    player->AddItem(37719, 1);
							player->DestroyItemCount(19322, 50, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
				    case 18: // Swift Zulian tiger Mount
					    if (player->HasItemCount(19322, 75, true))
						{
						    player->AddItem(19902, 1);
							player->DestroyItemCount(19322, 75, true);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
                        break;
						case 75:
					    if (player->HasItemCount(50761, 1, true))
						{

							player->DestroyItemCount(50761, 1, true);								
							player->AddItem(51936, 1);
							_creature->MonsterWhisper("Chance Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

					    }
						else
						{									
							_creature->MonsterWhisper("Missing Items!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();
					    }
                        break;

						case 72:
					    if (player->ModifyMoney(-19322))
						{

							player->ModifyMoney(-19322);								
							player->ModifyArenaPoints(+250);
							_creature->MonsterWhisper("Change Succesful!", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();

						}
						else
						{
							_creature->MonsterWhisper("No money.", player->GetGUID());
							player->CLOSE_GOSSIP_MENU();									
						}
                        break;
						case 76:		
                       #define CONST_HONOR_2  100

                       if (player->GetHonorPoints() < CONST_HONOR_2)
	                   {
		                     _creature->MonsterWhisper("No money.", player->GetGUID());
		                     player->CLOSE_GOSSIP_MENU();
	                   }else{
		                     player->ModifyArenaPoints(+20620);
		                     _creature->MonsterWhisper("Ok.", player->GetGUID());
		                     player->ModifyHonorPoints(-CONST_HONOR_2);
                             player->CLOSE_GOSSIP_MENU();
	                   }
					    break;
						case 79:
							enum MusicBoxs
{
    SOUND_LAMENT_OF_THE_HIGHBORNE1 = 15095,
};

		player->PlayDirectSound(SOUND_LAMENT_OF_THE_HIGHBORNE1, player);
		player->CLOSE_GOSSIP_MENU();
                        break;
						case 80:
							enum MusicBoxs2
{
    SOUND_LAMENT_OF_THE_HIGHBORNE2 = 11803,
};

		player->PlayDirectSound(SOUND_LAMENT_OF_THE_HIGHBORNE2, player);
		player->CLOSE_GOSSIP_MENU();
                        break;
							case 81:
                    player->PlayerTalkClass->ClearMenus();
		            player->ADD_GOSSIP_ITEM( 0, "25 Mark -> [ITEM]Primordial Saronite"                         , GOSSIP_SENDER_MAIN, 11); 
				    player->ADD_GOSSIP_ITEM( 0, "100 Mark -> [MOUNT]Reins of the Raven Lord"                   , GOSSIP_SENDER_MAIN, 16);// -5
				    player->ADD_GOSSIP_ITEM( 0, "50 Mark -> [MOUNT]Swift Zhevra"                               , GOSSIP_SENDER_MAIN, 17);
				    player->ADD_GOSSIP_ITEM( 0, "75 Mark -> [MOUNT]Swift Zulian Tiger"                         , GOSSIP_SENDER_MAIN, 18);
					player->ADD_GOSSIP_ITEM( 0, "50761"                                                        , GOSSIP_SENDER_MAIN, 75);
					player->ADD_GOSSIP_ITEM( 0, "1"                                                            , GOSSIP_SENDER_MAIN, 72);
					player->ADD_GOSSIP_ITEM( 0, "test"                                                         , GOSSIP_SENDER_MAIN, 76);
					player->ADD_GOSSIP_ITEM( 0, "plach"                                                         , GOSSIP_SENDER_MAIN, 79);
					player->ADD_GOSSIP_ITEM( 0, "rok"                                                         , GOSSIP_SENDER_MAIN, 80);
	                player->SEND_GOSSIP_MENU (DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID());
		            break;
					case 82:
		player->SetDisplayId(1418);
		player->CLOSE_GOSSIP_MENU();
                        break;
                    default:
                        break;
                }
                return true;
		}
};

enum Spellsi

{
    SPELL_Empowering_Blood_Orbs                           = 70227,
};

class Empowering_Blood_Orb : public GameObjectScript
{
public:
    Empowering_Blood_Orb() : GameObjectScript("Empowering_Blood_Orb") { } 
    bool OnGossipHello(Player* player, GameObject* /*go*/)
	//bool OnDummyEffect(Unit* caster, uint32 spellId, SpellEffIndex effIndex, GameObject* target); //20037
    {
        if (!player->HasAura(SPELL_Empowering_Blood_Orbs))
            player->AddAura(SPELL_Empowering_Blood_Orbs, player);
        return false;

    }
};
/**/
class npc_lottery : public CreatureScript
{
public: 
	npc_lottery() : CreatureScript("npc_lottery") { }
	
	

bool OnGossipHello(Player* player, Creature* creature)
     {
		  
         player->PlayerTalkClass->ClearMenus();

		     player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_INTERACT_1, "Купить достижение", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2, "Введите ID достижения с вовхэда", 0, true);

		     player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Выход", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);

			 player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());

         return true;
     }	

   bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 action )
   { 
        if (sender != GOSSIP_SENDER_MAIN)
            return false;
			
		switch (action)
		{
		case GOSSIP_ACTION_INFO_DEF+3:
			player->CLOSE_GOSSIP_MENU();
			break;
		}
		return true;
   }

   bool OnGossipSelectCode(Player* player, Creature* creature, uint32 sender, uint32 action, char const* code)
   {
	   uint32 id = atoi(code);
	   AchievementEntry const* achiev = sAchievementStore.LookupEntry(id);
	   player->PlayerTalkClass->ClearMenus();
            if (sender == GOSSIP_SENDER_MAIN)
            {
				if (action == GOSSIP_ACTION_INFO_DEF+2) {
					player->CompletedAchievement(achiev);
                }
			return true;
            }
			return true;
   }    
};
void AddSC_npc_change()
{
    new npc_change();
	new Empowering_Blood_Orb();
	new npc_lottery;
}
