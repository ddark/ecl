#include "ScriptPCH.h"
#include "Config.h"
 
#define EMOTE_NO_TOKEN "Vous ne possedez pas asser de Token Agoror!"        // Modifier le texte a votre guise (surtout "embleme de triomphe" par la monnaie de votre serveur)
 
#define MESSAGE_SPELL_POSSEDER "Vous posseder deja ce sort!"
#define MESSAGE_SPELL_AJOUTE "Vous avez apprit un nouveau sort."
#define MESSAGE_PERSONNAGE_SAVE "Votre personnage a ete sauvegarder."
 
enum MenuStructure
{
    MAIN_MENU            = 0,
    GUERRIER_MENU        = 1,
    PALADIN_MENU        = 2,
    CHASSEUR_MENU        = 3,
    VOLEUR_MENU            = 4,
    PRETRE_MENU            = 5,
    DK_MENU                = 6,
    CHAMAN_MENU            = 7,
    MAGE_MENU            = 8,
    DEMONISTE_MENU        = 9,
    DRUIDE_MENU            = 10,
    PNJ_MENU            = 11,
    SAVE_MENU            = 12,
};
 
enum Consts
{
    TOKEN_ID        = 200000,    // Votre ID de monnaie
    PRIX_SPELL_1    = 10,        // Votre prix pour les spell "classique"
    PRIX_SPELL_2    = 15,        // Votre prix pour les spell "supérieur"
    PRIX_SPELL_3    = 50,        // Votre prix pour le spell forme du sacré
};
 
enum Actions
{
    // Spell guerrier
    ACTION_GUERRIER_1            = 300,
    ACTION_GUERRIER_2            = 301,
    ACTION_GUERRIER_3            = 302,
    ACTION_GUERRIER_4            = 303,
    ACTION_GUERRIER_5            = 304,
        ACTION_GUERRIER_6            = 305,
    // Spell paladin
    ACTION_PALADIN_1            = 310,
    ACTION_PALADIN_2            = 311,
    ACTION_PALADIN_3            = 312,
    ACTION_PALADIN_4            = 313,
    ACTION_PALADIN_5            = 314,
    // Spell chasseur
    ACTION_CHASSEUR_1            = 320,
    ACTION_CHASSEUR_2            = 321,
    ACTION_CHASSEUR_3            = 322,
    // Spell voleur
    ACTION_VOLEUR_1                = 330,
    ACTION_VOLEUR_2                = 331,
    ACTION_VOLEUR_3                = 332,
    ACTION_VOLEUR_4                = 333,
    ACTION_VOLEUR_5                = 334,
    // Spell pretre
    ACTION_PRETRE_1                = 340,
    ACTION_PRETRE_2                = 341,
    ACTION_PRETRE_3                = 342,
    ACTION_PRETRE_4                = 343,
    ACTION_PRETRE_5                = 344,
    // Spell chevalier de la mort
    ACTION_DK_1                    = 350,
    ACTION_DK_2                    = 351,
    ACTION_DK_3                    = 352,
    ACTION_DK_4                    = 353,
    ACTION_DK_5                    = 354,
    // Spell chaman
    ACTION_CHAMAN_1                = 360,
    ACTION_CHAMAN_2                = 361,
    ACTION_CHAMAN_3                = 362,
    ACTION_CHAMAN_4                = 363,
    ACTION_CHAMAN_5                = 364,
    // Spell mage
    ACTION_MAGE_1                = 370,
    ACTION_MAGE_2                = 371,
    ACTION_MAGE_3                = 372,
    ACTION_MAGE_4                = 373,
    ACTION_MAGE_5                = 374,
    // Spell demoniste
    ACTION_DEMONISTE_1            = 380,
    ACTION_DEMONISTE_2            = 381,
    ACTION_DEMONISTE_3            = 382,
    ACTION_DEMONISTE_4            = 383,
    ACTION_DEMONISTE_5            = 384,
    // Spell druide
    ACTION_DRUIDE_1                = 390,
    ACTION_DRUIDE_2                = 391,
    ACTION_DRUIDE_3                = 392,
    ACTION_DRUIDE_4                = 393,
    ACTION_DRUIDE_5                = 394,
    // Spell capacité de pnj
    ACTION_FORME_SACRE            = 400,
    // Menu sauvegarde du personnage
    ACTION_SAVE                    = 410,
};
 
 
class mr_spell : public CreatureScript
{
public:
    mr_spell() : CreatureScript("mr_spell") { }
 
    bool OnGossipHello(Player* player, Creature* creature)
    {
        player->PlayerTalkClass->ClearMenus();
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Guerrier", GOSSIP_SENDER_MAIN, GUERRIER_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Paladin", GOSSIP_SENDER_MAIN, PALADIN_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Chasseur", GOSSIP_SENDER_MAIN, CHASSEUR_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Voleur", GOSSIP_SENDER_MAIN, VOLEUR_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Pretre", GOSSIP_SENDER_MAIN, PRETRE_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Chevalier de la mort", GOSSIP_SENDER_MAIN, DK_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Chaman", GOSSIP_SENDER_MAIN, CHAMAN_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Mage", GOSSIP_SENDER_MAIN, MAGE_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Demoniste", GOSSIP_SENDER_MAIN, DEMONISTE_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Druide", GOSSIP_SENDER_MAIN, DRUIDE_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Competence de pnj.", GOSSIP_SENDER_MAIN, PNJ_MENU);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Sauvegarder mes achats.", GOSSIP_SENDER_MAIN, ACTION_SAVE);
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
        return true;
    }
   
    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
       
        switch (action)
        {
        case GUERRIER_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Poigne du titan [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_GUERRIER_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Rafale [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_GUERRIER_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Second souffle [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_GUERRIER_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Blessures profondes [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_GUERRIER_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Arme jusqu'aux dents [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_GUERRIER_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_GUERRIER_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(46917))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(46917, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_GUERRIER_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(12974))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(12974, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_GUERRIER_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(29838))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(29838, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_GUERRIER_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(12867))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(12867, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_GUERRIER_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(61222))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(61222, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case PALADIN_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Bouclier divin [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PALADIN_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Fourreau de lumiere [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PALADIN_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Courroux vengeur [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PALADIN_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Sceau d'autorité [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PALADIN_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Touche par la lumiere [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PALADIN_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_PALADIN_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(642))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(642, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PALADIN_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(53503))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(53503, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PALADIN_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(31884))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(31884, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PALADIN_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(20375))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(20375, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PALADIN_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(53592))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(53592, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case CHASSEUR_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Aspect de la bete [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHASSEUR_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Aspect du faucon-dragon [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHASSEUR_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Aura de precision [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHASSEUR_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_CHASSEUR_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(13161))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(13161, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_CHASSEUR_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(61847))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(61847, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_CHASSEUR_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(19506))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(19506, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case VOLEUR_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Pas de l'ombre [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_VOLEUR_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Hemorragie [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_VOLEUR_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Meurtrier [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_VOLEUR_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Attaquer les faibles [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_VOLEUR_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Serie meurtriere [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_VOLEUR_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_VOLEUR_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(36554))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(36554, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_VOLEUR_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(48660))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(48660, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_VOLEUR_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(30906))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(30906, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_VOLEUR_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(51689))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(51689, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_VOLEUR_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(51690))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(51690, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case PRETRE_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Dispersion [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PRETRE_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Egide divine [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PRETRE_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Forme d'ombre [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PRETRE_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Resilience benie [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PRETRE_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Cri psychique [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_PRETRE_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_PRETRE_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(47585))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(47585, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PRETRE_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(47515))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(47515, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PRETRE_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(15473))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(15473, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PRETRE_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(33146))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(33146, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_PRETRE_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(10890))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(10890, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case DK_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Presence de sang [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DK_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Presence de givre [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DK_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Hysterie [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DK_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Gorge de sang [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DK_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Armure tranchante [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DK_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_DK_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(48266))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(48266, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DK_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(48263))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(48263, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DK_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(49016))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(49016, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DK_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(61278))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(61278, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DK_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(49393))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(49393, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case CHAMAN_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Ambidextrie [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHAMAN_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Arme furie-des-vents [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHAMAN_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Bouclier de terre [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHAMAN_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Rafale [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHAMAN_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Orage [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_CHAMAN_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_CHAMAN_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(674))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(674, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_CHAMAN_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(58804))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(58804, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_CHAMAN_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(49284))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(49284, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_CHAMAN_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(16284))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(16284, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_CHAMAN_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(59159))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(59159, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case MAGE_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Armure de la fournaise [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_MAGE_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Vitesse flamboyante [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_MAGE_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Transfert [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_MAGE_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Vol de sort [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_MAGE_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Metamorphose  [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_MAGE_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_MAGE_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(43046))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(43046, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_MAGE_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(31642))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(31642, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_MAGE_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(1953))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(1953, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_MAGE_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(30449))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(30449, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_MAGE_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(28272))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(28272, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case DEMONISTE_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Gangrarmure [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DEMONISTE_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Peur [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DEMONISTE_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Furie de l'ombre [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DEMONISTE_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Frenesie demoniaque [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DEMONISTE_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Malediction des elements [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DEMONISTE_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_DEMONISTE_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(47893))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(47893, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DEMONISTE_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(6215))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(6215, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DEMONISTE_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(47847))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(47847, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DEMONISTE_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(32850))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(32850, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DEMONISTE_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(47865))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(47865, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case DRUIDE_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Forme de selenien [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DRUIDE_1);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Soutien lunaire [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DRUIDE_2);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Typhon [10 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DRUIDE_3);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Perfection naturelle [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DRUIDE_4);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Ecorce [15 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_DRUIDE_5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_DRUIDE_1:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(24858))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(24858, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DRUIDE_2:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(33591))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(33591, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DRUIDE_3:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_1, true))
            {
                if(player->HasSpell(61384))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(61384, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_1, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DRUIDE_4:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(33883))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(33883, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_DRUIDE_5:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_2, true))
            {
                if(player->HasSpell(22812))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(22812, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_2, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case PNJ_MENU:
            player->PlayerTalkClass->ClearMenus();
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Forme du sacre [50 Token Agoror]", GOSSIP_SENDER_MAIN, ACTION_FORME_SACRE);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "<- [Main Menu]", GOSSIP_SENDER_MAIN, MAIN_MENU);
            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
            return true;
            break;
        case ACTION_FORME_SACRE:
            if (player->HasItemCount(TOKEN_ID, PRIX_SPELL_3, true))
            {
                if(player->HasSpell(46565))
                {
                    creature->MonsterWhisper(MESSAGE_SPELL_POSSEDER, player->GetGUID());
                    player->CLOSE_GOSSIP_MENU();
                }
                else
                {
                    player->CLOSE_GOSSIP_MENU();
                    player->learnSpell(46565, false);
                    player->DestroyItemCount(TOKEN_ID, PRIX_SPELL_3, true);
                    player->SaveToDB();
                    creature->MonsterWhisper(MESSAGE_SPELL_AJOUTE, player->GetGUID());
                }
            }
            else
            {
                player->CLOSE_GOSSIP_MENU();
                creature->MonsterTextEmote(EMOTE_NO_TOKEN, 0, true);
            }
            break;
        case ACTION_SAVE:
            player->CLOSE_GOSSIP_MENU();
            player->SaveToDB();
            creature->MonsterWhisper(MESSAGE_PERSONNAGE_SAVE, player->GetGUID());
            break;
        }
        return true;
    }
};
           
void AddSC_mr_spell()
{
    new mr_spell();
}