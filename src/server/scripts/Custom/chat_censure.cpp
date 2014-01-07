#include "ScriptPCH.h"
#include "Channel.h"

class System_Censure : public PlayerScript
{
public:
        System_Censure() : PlayerScript("System_Censure") {}

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Player* receiver)
        {
                CheckMessage(player, msg, lang, receiver, NULL, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Group* group)
        {
                CheckMessage(player, msg, lang, NULL, group, NULL, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Guild* guild)
        {
                CheckMessage(player, msg, lang, NULL, NULL, guild, NULL);
        }

        void OnChat(Player* player, uint32 /*type*/, uint32 lang, std::string& msg, Channel* channel)
        {
                CheckMessage(player, msg, lang, NULL, NULL, NULL, channel);
        }

void CheckMessage(Player* player, std::string& msg, uint32 lang, Player* /*receiver*/, Group* /*group*/, Guild* /*guild*/, Channel* channel)
{
    //if (player->IsGameMaster() || lang == LANG_ADDON)
            //return;

    // transform to lowercase (for simpler checking)
    std::string lower = msg;
    std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);

    uint8 cheksSize = 47;
    std::string checks[47];
    // Strony (Sites)
    checks[0] ="http://";
    checks[1] ="www";
    checks[2] ="wow-";
    checks[3] ="-wow";
    checks[4] ="ru";
    checks[5] ="net";
    checks[6] ="org";
    checks[7] ="com";
    checks[8] ="biz";
    checks[9] ="zapto";
    checks[10] ="no-ip";
    checks[11] =".lt";
    checks[12] ="loh";
    checks[13] ="jeba";
    checks[14] ="cip";
    checks[15] ="gej";
    checks[16] ="cwel";
    checks[17] ="pizd";
    checks[18] ="pierdo";
    checks[19] ="wowstars";
    checks[20] ="carfagen";
    checks[21] ="revolution";
    checks[22] ="arena-wow";
    checks[23] ="wowflag";
    checks[24] ="uwow";
    checks[25] ="RiverRise";
    checks[26] ="isengard";
    checks[27] ="wowcircle";
    checks[28] ="jet-wow";
    checks[29] ="wow-cool";
    checks[30] ="fakewow";
    checks[31] ="spzone";
    checks[32] ="wowgear";
    checks[33] ="izbooshka";
    checks[34] ="sirus";
    checks[35] ="elgracia";
	checks[36] ="anal";
	checks[37] ="анал";
	checks[38] ="лох";
	checks[39] ="сука";
    checks[40] ="бля";
	checks[41] ="блять";
	checks[42] ="ебу";
	checks[43] ="еб";
	checks[44] ="ебул";
	checks[45] ="warcraft";
	checks[46] ="by";
    for (int i = 0; i < cheksSize; ++i)
        if (lower.find(checks[i]) != std::string::npos)
        {
            msg = "";
            ChatHandler(player->GetSession()).PSendSysMessage("Advertising and vulgar behavior is not allowed!");
            return;
        }
}
};

void AddSC_System_Censure()
{
    new System_Censure();
}