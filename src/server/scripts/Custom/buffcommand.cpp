/***************************************
*Made by ???                           *
*Edit & Release by Ghostcrawler336     *
****************************************/
#include "ScriptPCH.h"
#include "Chat.h"
 
 
uint32 auras[] = { 48162, 48074, 48170, 43223, 36880, 467, 48469, 23505, 26662, 27680, 41924 };
 
class buffcommand : public CommandScript
{
public:
    buffcommand() : CommandScript("buffcommand") { }
 
        ChatCommand* GetCommands() const
    {
        static ChatCommand IngameCommandTable[] =
        {
        { "buff",           SEC_PLAYER,         true,  &HandleBuffCommand,                "", NULL },
        { NULL,             0,                  false, NULL,                              "", NULL }
        };
                 return IngameCommandTable;
    }
 
        static bool HandleBuffCommand(ChatHandler * handler, const char * args)
    {
        Player * pl = handler->GetSession()->GetPlayer();
                if(pl->InArena())
                {
                        pl->GetSession()->SendNotification("You can't use that item in an arena match!");
                        return false;
                }
       
                pl->RemoveAurasByType(SPELL_AURA_MOUNTED);
                for(int i = 0; i < 11; i++)
                    pl->AddAura(auras[i], pl);
                handler->PSendSysMessage("|cffB400B4You have been buffed, enjoy!");
                return true;
 
    }
};
 
uint32 aurasi[] = { 46917, 68320, 11390, 43223, 21144 };
 
class bufficommand : public CommandScript
{
public:
    bufficommand() : CommandScript("bufficommand") { }
 
        ChatCommand* GetCommands() const
    {
        static ChatCommand IngameCommandTable[] =
        {
        { "buffi",           SEC_PLAYER,         true,  &HandleBuffiCommand,                "", NULL },
        { NULL,             0,                  false, NULL,                              "", NULL }
        };
                 return IngameCommandTable;
    }
 
        static bool HandleBuffiCommand(ChatHandler * handler, const char * args)
    {
        Player * pl = handler->GetSession()->GetPlayer();
                if(pl->InArena())
                {
                        pl->GetSession()->SendNotification("You can't use that item in an arena match!");
                        return false;
                }
       
                pl->RemoveAurasByType(SPELL_AURA_MOUNTED);
                for(int i = 0; i < 11; i++)
                    pl->AddAura(aurasi[i], pl);
                handler->PSendSysMessage("|cffB400B4You have been buffed, enjoy!");
                return true;
 
    }
};
  
uint32 aurasid[] = { 42201, 47591, 38505, 1852, 63991, 47543, 58540, 2647, 41083, 39594 };
 
class usmcommand : public CommandScript
{
public:
    usmcommand() : CommandScript("usmcommand") { }
 
        ChatCommand* GetCommands() const
    {
        static ChatCommand IngameCommandTable[] =
        {
        { "usm",           SEC_GAMEMASTER,         true,  &HandleusmCommand,                "", NULL },
        { NULL,             0,                  false, NULL,                              "", NULL }
        };
                 return IngameCommandTable;
    }
 
        static bool HandleusmCommand(ChatHandler * handler, const char * args)
    {
        Player * pl = handler->GetSession()->GetPlayer();
                if(pl->InArena())
                {
                        pl->GetSession()->SendNotification("You can't use that item in an arena match!");
                        return false;
                }
       
                pl->RemoveAurasByType(SPELL_AURA_MOUNTED);
                for(int i = 0; i < 11; i++)
                    pl->AddAura(aurasid[i], pl);
                handler->PSendSysMessage("|cffB400B4You have been buffed, enjoy!");
                return true;
 
    }
};

void AddSC_buffcommand()
{
    new buffcommand();
	new bufficommand();
	new usmcommand();
}