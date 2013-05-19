#ifndef _PLAYERBOTMGR_H
#define _PLAYERBOTMGR_H

#include "Common.h"

class Player;
class WorldPacket;

typedef UNORDERED_MAP<uint64, Player*> PlayerBotMap;

class PlayerbotMgr
{
    public:
        PlayerbotMgr(Player* const master);
        virtual ~PlayerbotMgr();

        //void Update(uint32 const p_time);

        //Packets
        void HandleMasterIncomingPacket(WorldPacket const& packet);
        void HandleMasterOutgoingPacket(WorldPacket const& packet);

        void AddPlayerBot(uint64 guid);
        void LogoutPlayerBot(uint64 guid, bool uninvite = true);
        Player* GetPlayerBot(uint64 guid) const;
        Player* GetMaster() const { return m_master; }

        PlayerBotMap::const_iterator GetPlayerBotsBegin() const { return m_playerBots.begin(); }
        PlayerBotMap::const_iterator GetPlayerBotsEnd()   const { return m_playerBots.end();   }
        PlayerBotMap const& getPlayerbots() const { return m_playerBots; }
        uint8 GetPlayerBotsCount() const { return uint8(m_playerBots.size()); }

        void LogoutAllBots();
        void RemoveAllBotsFromGroup(bool force = false);
        void OnBotLogin(Player* const bot);
        void Stay();

        uint16 Rand() const;
        static uint32 GetSpec(Player* player);

    public:
        //config variables (needs review)
        uint32 m_confRestrictBotLevel;
        uint32 m_confDisableBotsInRealm;
        uint32 m_confMaxNumBots;
        bool m_confDisableBots;
        bool m_confDebugWhisper;
        float m_confFollowDistance[2];
        uint32 gConfigSellLevelDiff;
        bool m_confCollectCombat;
        bool m_confCollectQuest;
        bool m_confCollectProfession;
        bool m_confCollectLoot;
        bool m_confCollectSkin;
        bool m_confCollectObjects;
        uint32 m_confCollectDistance;
        uint32 m_confCollectDistanceMax;

    private:
        Player* const m_master;
        PlayerBotMap m_playerBots;
};

#endif
