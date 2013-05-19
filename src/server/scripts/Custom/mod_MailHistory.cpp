#include "ScriptPCH.h"
#include "Config.h"
#include <math.h>

#define SQL_HISTORY "INSERT INTO `world_mail` (`id`, `message_type`, `stationery`, `template_id`, `sender`, `receiver`, `subject`, `body`, `money`, `cod`) VALUES ('%u', '%u', '%u', '%u', '%u', '%u', '%s', '%s', '%u', '%u')"

bool mailHistoryEnable = false;
uint8 mailHistoryMask = 0;

enum MailHistoryMask
{
    MAIL_HISTORY_NORMAL     = 1,
    MAIL_HISTORY_AUCTION    = 2,
    MAIL_HISTORY_CREATURE   = 4,
    MAIL_HISTORY_GAMEOBJECT = 8,
    MAIL_HISTORY_ITEM       = 16
};

class Mod_MailHistory_WorldScript : public WorldScript
{
    public:
        Mod_MailHistory_WorldScript() : WorldScript("Mod_MailHistory_WorldScript") { }

    // Called after the world configuration is (re)loaded.
    void OnConfigLoad(bool /*reload*/)
    {
        mailHistoryEnable = ConfigMgr::GetBoolDefault("MailHistory.Enable", false);
        mailHistoryMask = 0;

        if (!mailHistoryEnable)
            return;

        if (ConfigMgr::GetBoolDefault("MailHistory.Normal", false))
            mailHistoryMask += MAIL_HISTORY_NORMAL;
        if (ConfigMgr::GetBoolDefault("MailHistory.Auction", false))
            mailHistoryMask += MAIL_HISTORY_AUCTION;
        if (ConfigMgr::GetBoolDefault("MailHistory.Creature", false))
            mailHistoryMask += MAIL_HISTORY_CREATURE;
        if (ConfigMgr::GetBoolDefault("MailHistory.Gameobject", false))
            mailHistoryMask += MAIL_HISTORY_GAMEOBJECT;
        if (ConfigMgr::GetBoolDefault("MailHistory.Item", false))
            mailHistoryMask += MAIL_HISTORY_ITEM;
    }
};

class Mod_MailHistory_MailScript : public MailScript
{
    public:
        Mod_MailHistory_MailScript() : MailScript("Mod_MailHistory_MailScript") { }

    void OnSendMail(MailDraft* const draft, MailReceiver const& receiver, MailSender const& sender, uint32 mailId, bool& needDelete)
    {
        if (!mailHistoryEnable || needDelete)
            return;

        if (!(uint8(pow(sender.GetMailMessageType(), 2.0f)) & mailHistoryMask))
            return;

        CharacterDatabase.PExecute(SQL_HISTORY,
            mailId,
            uint8(sender.GetMailMessageType()),
            int8(sender.GetStationery()),
            draft->GetMailTemplateId(),
            sender.GetSenderId(),
            receiver.GetPlayerGUIDLow(),
            draft->GetSubject().c_str(),
            draft->GetBody().c_str(),
            draft->GetMoney(),
            draft->GetCOD()
        );
    }
};

void AddSC_Mod_MailHistory()
{
    new Mod_MailHistory_WorldScript();
    new Mod_MailHistory_MailScript();
}