//    _      ______ _      _____  ___                
//   | | /| / / __ \ | /| / / _ )/ _ ) ___  _______ _
//   | |/ |/ / /_/ / |/ |/ / _  / _  |/ _ \/ __/ _ `/
//   |__/|__/\____/|__/|__/____/____(_)___/_/  \_, /
//                                            /___/  
//   Script shared from WoWBB.org

    // Deluxe-WoW � 2014
    // Made by AlexeWarr
     
    #include "ScriptMgr.h"
    #include "ScriptedCreature.h"
    #include "ScriptedGossip.h"
    #include "Player.h"
    #include <cstring>
    #include "Config.h"
     
    #define COOLDOWN 120 // in seconds (this is the spawntime and cooldown)
   // uint32 COOLDOWN = sConfigMgr->GetIntDefault("testus", 0);
     
    namespace Generator
    {
        uint32 GetCooldown()
        {
            if (QueryResult cd_query = WorldDatabase.PQuery("SELECT `date` FROM `gmi_logs` ORDER BY `id` DESC LIMIT 1"))
                return cd_query ? (time(NULL) - cd_query->Fetch()[0].GetUInt32()) : 0;
            else
                return 0;
        }
     
        void SendAnnounceToGMs(const char* text, WorldSession* self)
        {
            std::map<uint32, WorldPacket> localizedPackets;
            SessionMap const& smap = sWorld->GetAllSessions();
            for (SessionMap::const_iterator iter = smap.begin(); iter != smap.end(); ++iter)
            {
                if (Player* player = iter->second->GetPlayer())
                {
                    AccountTypes gmLevel = player->GetSession()->GetSecurity();
     
                    if (uint32(gmLevel) != 0)
                    {
                        if (localizedPackets.find(player->GetSession()->GetSessionDbLocaleIndex()) == localizedPackets.end())
                            ChatHandler::BuildChatPacket(localizedPackets[player->GetSession()->GetSessionDbLocaleIndex()], CHAT_MSG_RAID_BOSS_EMOTE, LANG_UNIVERSAL, NULL, NULL, text);
     
                        player->SendDirectMessage(&localizedPackets[player->GetSession()->GetSessionDbLocaleIndex()]);
                    }
                }
            }
        }
    }; using namespace Generator;
     
    class GMIsland_Theme_Generator : public CreatureScript
    {
    public:
        GMIsland_Theme_Generator() : CreatureScript("GMIsland_Theme_Generator") { }
     
        bool OnGossipHello(Player* player, Creature* creature) override
        {
            if (creature->GetZoneId() != 33)
            {
                creature->Whisper("You can't use this outside the Arena!", LANG_UNIVERSAL, player);
            }
            else
            {
                if (GetCooldown() >= COOLDOWN || GetCooldown() == 0)
                {
                    if (QueryResult t_query = WorldDatabase.PQuery("SELECT `id`, `name` FROM `gmi_themes` WHERE `id` > 0 AND `available` = 1"))
                    {
                        do
                        {
                            Field * t_fields = t_query->Fetch();
                            AddGossipItemFor(player, 0, t_fields[1].GetString().c_str(), GOSSIP_SENDER_MAIN, t_fields[0].GetUInt32());
                        } while (t_query->NextRow());
                    }
                }
                else
                {
                    char message[255];
     
                    sprintf(message, "You need to wait %u seconds!", (COOLDOWN - GetCooldown()));
     
                    AddGossipItemFor(player, 0, message, GOSSIP_SENDER_MAIN, 0);
                }
     
                player->PlayerTalkClass->SendGossipMenu(907, creature->GetGUID());
            }
            return true;
        }
     
        bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action) override
        {
            switch (action)
            {
                case 0: {
                    CloseGossipMenuFor(player);
                } break;
                default: {
                    if (QueryResult ts_query = WorldDatabase.PQuery("SELECT `entry`, `pos_x`,`pos_y`,`pos_z`,`pos_o` FROM `gmi_templates` WHERE `id` = %u", action))
                    {
                        WorldDatabase.PQuery("INSERT INTO `gmi_logs` (`theme_id`, `date`) VALUES (%u, UNIX_TIMESTAMP())", action);
                        do
                        {
                            Field * ts_fields = ts_query->Fetch();
     
                            float ang = ts_fields[4].GetFloat();
     
                            float rot2 = std::sin(ang / 2);
                            float rot3 = std::cos(ang / 2);
     
                           // creature->SummonGameObject(ts_fields[0].GetUInt32(), ts_fields[1].GetFloat(), ts_fields[2].GetFloat(), ts_fields[3].GetFloat(), ang, 0, 0, rot2, rot3, COOLDOWN);
							creature->SummonGameObject(ts_fields[0].GetUInt32(), ts_fields[1].GetFloat(), ts_fields[2].GetFloat(), ts_fields[3].GetFloat(), ang, G3D::Quat(0, 0, rot2, rot3), COOLDOWN);
                        } while (ts_query->NextRow());
     
                        if (QueryResult tn_query = WorldDatabase.PQuery("SELECT `name` FROM `gmi_themes` WHERE `id` = %u LIMIT 1", action))
                        {
                            Field * tn_fields = tn_query->Fetch();
     
                            std::ostringstream message;
     
                            message << "|cffFF0000[Battle Ring]|r |cff00ccff" << player->GetName().c_str() << "|r changed theme to |cff00FF00" << tn_fields[0].GetString() << "|r.";
     
                            SendAnnounceToGMs(message.str().c_str(), NULL);
     
                            creature->Whisper("New Theme Generated!", LANG_UNIVERSAL, player);
                        }
                    }
                } break;
            }
            CloseGossipMenuFor(player);
     
            return true;
        }
    };
     
    void AddSC_GMIsland_Theminator()
    {
        new GMIsland_Theme_Generator();
    }
