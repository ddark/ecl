#include "ScriptPCH.h"

class npc_enchant : public CreatureScript
{
public:
    npc_enchant() : CreatureScript("npc_enchant") { }

    bool isEquiped(Player* player, uint8 slot, uint8 &count)
    {
        Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);
        if (!item)
            return false;
        if ((slot == EQUIPMENT_SLOT_RANGED || slot == EQUIPMENT_SLOT_OFFHAND || slot == EQUIPMENT_SLOT_MAINHAND) && !requiredItem(slot, item))
            return false;

        ++count;

        return true;
    }

    bool validItem(uint8 type, Item* item)
    {
        ItemTemplate const* pProto = item->GetTemplate();

        // one handed
        if (type == 1 && (pProto->Class == 2 && (pProto->SubClass == 0 || pProto->SubClass == 1 || pProto->SubClass == 4 || pProto->SubClass == 5 || pProto->SubClass == 6 || pProto->SubClass == 7 || pProto->SubClass == 8 || pProto->SubClass == 10 || pProto->SubClass == 13 || pProto->SubClass == 15)))
            return true;
        // two handed
        if (type == 2 && (pProto->Class == 2 && (pProto->SubClass == 1 || pProto->SubClass == 5 || pProto->SubClass == 6 || pProto->SubClass == 8 || pProto->SubClass == 10)))
            return true;
        // staff
        if (type == 3 && (pProto->Class == 2 && pProto->SubClass == 10))
            return true;
        // shield
        if (type == 4 && pProto->Class == 4 && pProto->SubClass == 6)
            return true;

        return false;
    }

    bool requiredItem(uint8 slot, Item* item)
    {
        ItemTemplate const* pProto = item->GetTemplate();

        if (slot == EQUIPMENT_SLOT_RANGED)
            if (pProto->Class == 2 && (pProto->SubClass == 2 || pProto->SubClass == 3 || pProto->SubClass == 18 || pProto->SubClass == 19))
                return true;
        if (slot == EQUIPMENT_SLOT_OFFHAND)
            if ((pProto->Class == 2 && (pProto->SubClass == 0 || pProto->SubClass == 4 || pProto->SubClass == 7 || pProto->SubClass == 13 || pProto->SubClass == 15)) || (pProto->Class == 4 && pProto->SubClass == 6))
                return true;
        if (slot == EQUIPMENT_SLOT_MAINHAND)
            if (pProto->Class == 2 && (pProto->SubClass == 0 || pProto->SubClass == 1 || pProto->SubClass == 4 || pProto->SubClass == 5 || pProto->SubClass == 6 || pProto->SubClass == 7 || pProto->SubClass == 8 || pProto->SubClass == 10 || pProto->SubClass == 13 || pProto->SubClass == 15))
                return true;

        return false;
    }

    void Enchant(Player* player, Creature* creature, uint8 slot, uint32 enchant, uint8 type = 0)
    {
        Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, slot);

        if (!item || (type != 0 && !validItem(type, item)))
        {
            player->CLOSE_GOSSIP_MENU();
            ChatHandler(player->GetSession()).PSendSysMessage("|cfff4b25eМастер наложения чар шепчет:|r |cfffcedbbЗачем вы сняли предмет? Я же не буду рыться в вашей сумке чтобы зачаровать его.|r");
            return;
        }

        SpellItemEnchantmentEntry const* enchantid = sSpellItemEnchantmentStore.LookupEntry(enchant);
        if (!enchantid)
            return;

        player->ApplyEnchantment(item, PERM_ENCHANTMENT_SLOT, false);
        item->SetEnchantment(PERM_ENCHANTMENT_SLOT, enchant, 0, 0);
        player->ApplyEnchantment(item, PERM_ENCHANTMENT_SLOT, true);

        player->CastSpell(player, 76706, true);

        OnGossipHello(player, creature);
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        uint8 count = 0;

        if (isEquiped(player, EQUIPMENT_SLOT_HEAD, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Голова", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        if (isEquiped(player, EQUIPMENT_SLOT_SHOULDERS, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Плечо", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
        if (isEquiped(player, EQUIPMENT_SLOT_BACK, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Спина", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
        if (isEquiped(player, EQUIPMENT_SLOT_CHEST, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Грудь", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
        if (isEquiped(player, EQUIPMENT_SLOT_WRISTS, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Запястья", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
        if (isEquiped(player, EQUIPMENT_SLOT_HANDS, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Кисти рук", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7);
        if (isEquiped(player, EQUIPMENT_SLOT_LEGS, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Ноги", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8);
        if (isEquiped(player, EQUIPMENT_SLOT_FEET, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Ступни", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9);
        if (isEquiped(player, EQUIPMENT_SLOT_FINGER1, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Палец", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+10);
        if (isEquiped(player, EQUIPMENT_SLOT_FINGER2, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Палец", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+11);
        if (isEquiped(player, EQUIPMENT_SLOT_MAINHAND, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Правая рука", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+12);
        if (isEquiped(player, EQUIPMENT_SLOT_OFFHAND, count))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Левая рука", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+13);

        if (count > 0)
            player->SEND_GOSSIP_MENU(55001, creature->GetGUID());
        else
            ChatHandler(player->GetSession()).PSendSysMessage("|cfff4b25eМастер наложения чар шепчет:|r |cfffcedbbНа вас не экипировано ни одного предмета который я смогла бы зачаровать.|r");

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();

        if (sender != GOSSIP_SENDER_MAIN)
            return false;

        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                OnGossipHello(player, creature);
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 50, крит 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+21);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 50, устойчивость 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+16);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 30, 10 маны в 5 сек", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+19);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 30, крит 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+20);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 29, устойчивость 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+17);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, сопр. тайной 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+23);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, сопр. огню 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+24);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, сопр. тьме 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+25);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, сопр. льду 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+26);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, сопр. природе 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+27);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, устойчивость 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+18);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 37, рейтинг защиты 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+22);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+16:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3795);
                break;
            case GOSSIP_ACTION_INFO_DEF+17:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3797);
                break;
            case GOSSIP_ACTION_INFO_DEF+18:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3842);
                break;
            case GOSSIP_ACTION_INFO_DEF+19:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3819);
                break;
            case GOSSIP_ACTION_INFO_DEF+20:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3820);
                break;
            case GOSSIP_ACTION_INFO_DEF+21:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3817);
                break;
            case GOSSIP_ACTION_INFO_DEF+22:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3818);
                break;
            case GOSSIP_ACTION_INFO_DEF+23:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3815);
                break;
            case GOSSIP_ACTION_INFO_DEF+24:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3816);
                break;
            case GOSSIP_ACTION_INFO_DEF+25:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3814);
                break;
            case GOSSIP_ACTION_INFO_DEF+26:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3812);
                break;
            case GOSSIP_ACTION_INFO_DEF+27:
                Enchant(player, creature, EQUIPMENT_SLOT_HEAD, 3813);
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 120, крит 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+31);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 40, устойчивость 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+29);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 70, 8 маны в 5 сек", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+32);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 70, крит 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+34);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 23, устойчивость 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+30);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30, устойчивость 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+28);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "рейтинг уклонения 60, защиты 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+33);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+28:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3852);
                break;
            case GOSSIP_ACTION_INFO_DEF+29:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3793);
                break;
            case GOSSIP_ACTION_INFO_DEF+30:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3794);
                break;
            case GOSSIP_ACTION_INFO_DEF+31:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3835);
                break;
            case GOSSIP_ACTION_INFO_DEF+32:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3836);
                break;
            case GOSSIP_ACTION_INFO_DEF+33:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3837);
                break;
            case GOSSIP_ACTION_INFO_DEF+34:
                Enchant(player, creature, EQUIPMENT_SLOT_SHOULDERS, 3838);
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ловкость 10, лучше незаметность", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+35);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ловкость 22", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+40);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "скорость 23", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+38);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "проникание заклинаний 35", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+41);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "снижение угрозы, дух 10", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+36);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "броня 225", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+39);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "рейтинг защиты 16", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+37);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* восстановить 400 маны при касте", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+42);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* сила заклинаний 295 при касте", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+43);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* сила атаки 400 при атаке", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+44);
                player->SEND_GOSSIP_MENU(55004, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+35:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3256);
                break;
            case GOSSIP_ACTION_INFO_DEF+36:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3296);
                break;
            case GOSSIP_ACTION_INFO_DEF+37:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 1951);
                break;
            case GOSSIP_ACTION_INFO_DEF+38:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3831);
                break;
            case GOSSIP_ACTION_INFO_DEF+39:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3294);
                break;
            case GOSSIP_ACTION_INFO_DEF+40:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 1099);
                break;
            case GOSSIP_ACTION_INFO_DEF+41:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3243);
                break;
            case GOSSIP_ACTION_INFO_DEF+42:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3728);
                break;
            case GOSSIP_ACTION_INFO_DEF+43:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3722);
                break;
            case GOSSIP_ACTION_INFO_DEF+44:
                Enchant(player, creature, EQUIPMENT_SLOT_BACK, 3730);
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "все характеристики 10", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+47);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "здоровье 275", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+48);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "10 маны в 5 сек.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+49);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "устойчивость 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+50);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "рейтинг защиты 22", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+51);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+47:
                Enchant(player, creature, EQUIPMENT_SLOT_CHEST, 3832);
                break;
            case GOSSIP_ACTION_INFO_DEF+48:
                Enchant(player, creature, EQUIPMENT_SLOT_CHEST, 3297);
                break;
            case GOSSIP_ACTION_INFO_DEF+49:
                Enchant(player, creature, EQUIPMENT_SLOT_CHEST, 2381);
                break;
            case GOSSIP_ACTION_INFO_DEF+50:
                Enchant(player, creature, EQUIPMENT_SLOT_CHEST, 3245);
                break;
            case GOSSIP_ACTION_INFO_DEF+51:
                Enchant(player, creature, EQUIPMENT_SLOT_CHEST, 1953);
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 102", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+52);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 76", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+53);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 130", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+54);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "дух 18", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+55);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "рейтинг мастерства 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+56);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "все характеристики 6", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+57);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "интелект 16", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+58);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+52:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 3757);
                break;
            case GOSSIP_ACTION_INFO_DEF+53:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 3758);
                break;
            case GOSSIP_ACTION_INFO_DEF+54:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 3756);
                break;
            case GOSSIP_ACTION_INFO_DEF+55:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 1147);
                break;
            case GOSSIP_ACTION_INFO_DEF+56:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 3231);
                break;
            case GOSSIP_ACTION_INFO_DEF+57:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 2661);
                break;
            case GOSSIP_ACTION_INFO_DEF+58:
                Enchant(player, creature, EQUIPMENT_SLOT_WRISTS, 1119);
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "крит 16", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+59);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "угроза +2%, парирование 10", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+60);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 44", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+61);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 28", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+120);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ловкость 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+62);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "меткость 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+63);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "мастерство 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+64);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ракетница", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+121);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+59:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3249);
                break;
            case GOSSIP_ACTION_INFO_DEF+60:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3253);
                break;
            case GOSSIP_ACTION_INFO_DEF+61:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 1603);
                break;
            case GOSSIP_ACTION_INFO_DEF+62:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3222);
                break;
            case GOSSIP_ACTION_INFO_DEF+63:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3234);
                break;
            case GOSSIP_ACTION_INFO_DEF+64:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3231);
                break;
            case GOSSIP_ACTION_INFO_DEF+120:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3246);
                break;
            case GOSSIP_ACTION_INFO_DEF+121:
                Enchant(player, creature, EQUIPMENT_SLOT_HANDS, 3603);
                break;
            case GOSSIP_ACTION_INFO_DEF+8:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "устойчивость 40, выносливость 28", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+65);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 72, ловкость 35", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+66);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 100, крит 36", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+67);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 50, дух 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+68);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 50, выносливость 30", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+69);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+65:
                Enchant(player, creature, EQUIPMENT_SLOT_LEGS, 3853);
                break;
            case GOSSIP_ACTION_INFO_DEF+66:
                Enchant(player, creature, EQUIPMENT_SLOT_LEGS, 3331);
                break;
            case GOSSIP_ACTION_INFO_DEF+67:
                Enchant(player, creature, EQUIPMENT_SLOT_LEGS, 3332);
                break;
            case GOSSIP_ACTION_INFO_DEF+68:
                Enchant(player, creature, EQUIPMENT_SLOT_LEGS, 3719);
                break;
            case GOSSIP_ACTION_INFO_DEF+69:
                Enchant(player, creature, EQUIPMENT_SLOT_LEGS, 3721);
                break;
            case GOSSIP_ACTION_INFO_DEF+9:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 32", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+70);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "скорость бега, выносливость 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+71);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ловкость 16", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+72);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "дух 18", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+73);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "7 хп и маны в 5 сек.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+74);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "крит и меткость 12", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+75);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 22", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+76);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "нитроускорители", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+77);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+70:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 1597);
                break;
            case GOSSIP_ACTION_INFO_DEF+71:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 3232);
                break;
            case GOSSIP_ACTION_INFO_DEF+72:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 983);
                break;
            case GOSSIP_ACTION_INFO_DEF+73:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 1147);
                break;
            case GOSSIP_ACTION_INFO_DEF+74:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 3244);
                break;
            case GOSSIP_ACTION_INFO_DEF+75:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 3826);
                break;
            case GOSSIP_ACTION_INFO_DEF+76:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 1075);
                break;
            case GOSSIP_ACTION_INFO_DEF+77:
                Enchant(player, creature, EQUIPMENT_SLOT_FEET, 3606);
                break;
            case GOSSIP_ACTION_INFO_DEF+10:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 40", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+78);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 23", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+79);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+80);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+78:
                Enchant(player, creature, EQUIPMENT_SLOT_FINGER1, 3839);
                break;
            case GOSSIP_ACTION_INFO_DEF+79:
                Enchant(player, creature, EQUIPMENT_SLOT_FINGER1, 3840);
                break;
            case GOSSIP_ACTION_INFO_DEF+80:
                Enchant(player, creature, EQUIPMENT_SLOT_FINGER1, 3791);
                break;
            case GOSSIP_ACTION_INFO_DEF+11:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 40", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+81);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 23", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+82);
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 30", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+83);
                player->SEND_GOSSIP_MENU(55003, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+81:
                Enchant(player, creature, EQUIPMENT_SLOT_FINGER2, 3839);
                break;
            case GOSSIP_ACTION_INFO_DEF+82:
                Enchant(player, creature, EQUIPMENT_SLOT_FINGER2, 3840);
                break;
            case GOSSIP_ACTION_INFO_DEF+83:
                Enchant(player, creature, EQUIPMENT_SLOT_FINGER2, 3791);
                break;
            case GOSSIP_ACTION_INFO_DEF+12:
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                if (!item)
                    return true;

                if (validItem(2, item))
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 110", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+98);
                if (validItem(3, item))
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 81", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+99);
                if (validItem(1, item))
                {
                    if (!validItem(2, item))
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 65", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+89);
                    if (!validItem(3, item))
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 63", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+88);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "меткость и крит 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+85);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ловкость 26", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+94);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "дух 45", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+95);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 50", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+84);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* 400 силы атаки, -5% брони", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+86);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* рейтинг скорости 250", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+87);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* пробивание брони 120", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+96);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* ловкость 120, скорость атаки", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+97);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* урон от огня", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+90);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* исцеление при ударе в ближнем бою", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+91);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* 360-440 хп при менее 35% хп", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+92);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* парирование 200 и урон 600-800", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+93);
                }

                player->SEND_GOSSIP_MENU(55004, creature->GetGUID());
            }   break;
            case GOSSIP_ACTION_INFO_DEF+84:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3851, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+85:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3788, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+86:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3789, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+87:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3790, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+88:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3834, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+89:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3833, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+90:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3239, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+91:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3241, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+92:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3870, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+93:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3869, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+94:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 1103, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+95:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3844, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+96:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3225, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+97:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 2673, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+98:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3827, 2);
                break;
            case GOSSIP_ACTION_INFO_DEF+99:
                Enchant(player, creature, EQUIPMENT_SLOT_MAINHAND, 3854, 3);
                break;
            case GOSSIP_ACTION_INFO_DEF+13:
            {
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "<- Назад", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

                Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
                if (!item)
                    return true;

                if (validItem(1, item))
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила атаки 65", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+111);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "сила заклинаний 63", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+110);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "меткость и крит 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+107);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "ловкость 26", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+116);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "дух 45", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+117);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 50", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+106);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* 400 силы атаки, -5% брони", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+108);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* рейтинг скорости 250", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+109);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* пробивание брони 120", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+118);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* ловкость 120, скорость атаки", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+119);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* урон от огня", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+112);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* исцеление при ударе в ближнем бою", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+113);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* 360-440 хп при менее 35% хп", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+114);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "* парирование 200 и урон 600-800", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+115);
                }
                if (validItem(4, item))
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "интелект 25", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+101);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "рейтинг блокирования 15", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+102);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "показатель блокирования 36", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+105);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "рейтинг защиты 20", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+100);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "выносливость 18", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+104);
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "устойчивость 12", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+103);
                }

                player->SEND_GOSSIP_MENU(55004, creature->GetGUID());
            }   break;
            case GOSSIP_ACTION_INFO_DEF+100:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 1952, 4);
                break;
            case GOSSIP_ACTION_INFO_DEF+101:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 1128, 4);
                break;
            case GOSSIP_ACTION_INFO_DEF+102:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 2655, 4);
                break;
            case GOSSIP_ACTION_INFO_DEF+103:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3229, 4);
                break;
            case GOSSIP_ACTION_INFO_DEF+104:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 1071, 4);
                break;
            case GOSSIP_ACTION_INFO_DEF+105:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 2653, 4);
                break;
            case GOSSIP_ACTION_INFO_DEF+106:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3851, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+107:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3788, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+108:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3789, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+109:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3790, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+110:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3834, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+111:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3833, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+112:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3239, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+113:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3241, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+114:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3870, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+115:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3869, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+116:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 1103, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+117:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3844, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+118:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 3225, 1);
                break;
            case GOSSIP_ACTION_INFO_DEF+119:
                Enchant(player, creature, EQUIPMENT_SLOT_OFFHAND, 2673, 1);
                break;
        }

        return true;
    }
};

void AddSC_npc_enchant()
{
    new npc_enchant;
}
