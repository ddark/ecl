#include "ScriptPCH.h"
#include "Config.h"

#define CHAR_GET_EXTERNAL_MAIL "SELECT id, receiver, subject, message, money, item, item_count FROM mail_external ORDER BY id ASC"
#define CHAR_DEL_EXTERNAL_MAIL "DELETE FROM mail_external WHERE id = '%u'"

bool    ExternalMail            = false;
int     ExternalMailInterval    = 1;

IntervalTimer extmail_timer;

class Mod_ExternalMail_WorldScript : public WorldScript
{
    public:
        Mod_ExternalMail_WorldScript()
            : WorldScript("Mod_ExternalMail_WorldScript")
        {
        }

    void OnConfigLoad(bool /*reload*/)
    {
        ExternalMail            = sConfigMgr->GetBoolDefault("ExternalMail", false);

        if (!ExternalMail)
            return;

        ExternalMailInterval    = sConfigMgr->GetIntDefault("ExternalMailInterval", 1);

        extmail_timer.SetInterval(ExternalMailInterval * MINUTE * IN_MILLISECONDS);
        extmail_timer.Reset();
    }

    void OnUpdate(uint32 diff)
    {
        if (!ExternalMail)
            return;

        if (extmail_timer.GetCurrent() >= 0)
            extmail_timer.Update(diff);
        else
            extmail_timer.SetCurrent(0);

        if (extmail_timer.Passed())
        {
            extmail_timer.Reset();
            SendExternalMails();
        }
    }

    void SendExternalMails()
    {
        QueryResult result = CharacterDatabase.PQuery(CHAR_GET_EXTERNAL_MAIL);
        if (!result)
            return;

        SQLTransaction trans = CharacterDatabase.BeginTransaction();

        MailDraft* mail = NULL;

        do
        {
            Field *fields = result->Fetch();
            uint32 id = fields[0].GetUInt32();
            uint32 receiver_guid = fields[1].GetUInt32();
            std::string subject = fields[2].GetString();
            std::string body = fields[3].GetString();
            uint32 money = fields[4].GetUInt32();
            uint32 itemId = fields[5].GetUInt32();
            uint32 itemCount = fields[6].GetUInt32();

            Player* receiver = ObjectAccessor::FindPlayer(receiver_guid);

            mail = new MailDraft(subject, body);

            if (money)
                mail->AddMoney(money);

            if (itemId)
            {
                ItemTemplate const* pProto = sObjectMgr->GetItemTemplate(itemId);
                if (pProto)
                {
                    Item* mailItem = Item::CreateItem(itemId, itemCount);
                    mailItem->SaveToDB(trans);
                    mail->AddItem(mailItem);
                }
                else
                    TC_LOG_ERROR(LOG_FILTER_GENERAL, "EXTERNAL MAIL> Tried to add non-existing item with id %u, aborted", itemId);
            }

            mail->SendMailTo(trans, receiver ? receiver : MailReceiver(receiver_guid), MailSender(MAIL_NORMAL, 0, MAIL_STATIONERY_GM), MAIL_CHECK_MASK_RETURNED);
            delete mail;

            CharacterDatabase.PExecute(CHAR_DEL_EXTERNAL_MAIL, id);
        }
        while (result->NextRow());

        CharacterDatabase.CommitTransaction(trans);
    }
};

void AddSC_Mod_ExternalMail()
{
    new Mod_ExternalMail_WorldScript();
}