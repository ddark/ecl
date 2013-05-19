#include "ScriptPCH.h"
#include "ScriptMgr.h"
#include "Language.h"

#define MSG_GOSSIP_TEXT_GETTING_STARTED	"Приветствуем вас на сервере wow-syros !"

#define MSG_ERR_HONOR "У вас не достаточно хонора для совершения покупки!"
#define MSG_ERR_ARENA_POINT_1 "У вас не достаточно Апа!"
#define MSG_ERR_TITLE "У данного персонажа уже есть такое звание!"
#define MSG_ERR_INCOMBAT "Вы находитесь в бою. Чтобы использовать данного Npc выйдите из него."
#define MSG_COMPLETE_RENAME "Оплата Успешно Произведена Сделайте Логаут и Введите Новое Имя Персонажа.Не Забудьте После Смены Имени,Выйти Из Игры и Удалить Из Клиента Папку Cache!"
#define MSG_CUSTOMIZE_COMPLETE "Оплата Успешно Произведена Сделайте Логаут и Измените Внешность Персонажа.Не Забудьте После Смены Внешности,Выйти Из Игры и Удалить Из Клиента Папку Cache!"
#define MSG_CHANGE_FACTION_COMPLETE "Оплата Успешно Произведена Сделайте Логаут и Измените Фракцию Персонажа.Не Забудьте После Смены Внешности,Выйти Из Игры и Удалить Из Клиента Папку Cache!" 

#define MSG_GOSSIP_TEXT_MAX_HEALTH "Вылечи меня!"
#define MSG_GOSSIP_TEXT_MAX_SKILL "Выучить все навыки оружия и защиты."

#define MSG_GOSSIP_TEXT_BUFF_POWER_WORD "[Бафнуть] Слово силы: Стойкость"
#define MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_KINGS "[Бафнуть] Благословение Королей"
#define MSG_GOSSIP_TEXT_BUFF_MARK_OF_THE_WILD "[Бафнуть] Знак дикой природы"
#define MSG_GOSSIP_TEXT_BUFF_ARCANE_BRILLIANCE "[Бафнуть] Чародейская гениальность Даларана"
#define MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_MIGHT "[Бафнуть] Великое Благословение могущества"
#define MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_WISDOM "[Бафнуть] Благословение мудрости"
#define MSG_GOSSIP_TEXT_BUFF_THORNS "[Бафнуть] Шипы"
#define MSG_GOSSIP_TEXT_BUFF_DIVINE_SPIRIT "[Бафнуть] Божественный дух"
#define MSG_GOSSIP_TEXT_BUFF_SHADOW_PROTECTION "[Бафнуть] Защита от темной магии"
#define MSG_GOSSIP_TEXT_BUFF_STAMINA "[Бафнуть] Выносливость"

#define MSG_GOSSIP_TEXT_BUFF_MENU "[Меню бафов] ->"
#define MSG_GOSSIP_TEXT_MAIN_MENU "<- [Вернутся в Главное меню]"
#define MSG_GOSSIP_TEXT_PROFFESION_MENU "[Меню Профессий] ->"
#define MSG_GOSSIP_TEXT_PROFFESION_SECON_MENU "[Меню Второстепенных профессий] ->"

#define MSG_GOSSIP_TEXT_RENAME "Сменить Имя персонажа за 3 тысячи Апа."    // Thank Crispi
#define MSG_GOSSIP_TEXT_CUSTOM "Сменить Внешность персонажа за 3 тысячи Апа." // Thank Crispi
#define MSG_GOSSIP_TEXT_CHANGE_FACTION "Сменить Фракцию персонажа за 5 тысяч Апа."

#define MSG_GOSSIP_TEXT_SUPPER_BUFF_BERSERK "[Бафнуть] Берсерк. Стоимость 1 миллион хонора."
#define MSG_GOSSIP_TEXT_SUPPER_BUFF_AEGIS_OF_RAGNAROS "[Бафнуть] Эгида Рагнароса. Стоимость 1 миллион хонора."
#define MSG_GOSSIP_TEXT_SUPPER_BUFF_AEGIS_OF_NELTHARION "[Бафнуть] Защита Нелтариона. Стоимость 100 тысяч хонора"
#define MSG_GOSSIP_TEXT_SUPPER_BUFF_BLESSING_ADALS "[Бафнуть] Благословение А'далла. Стоимость 100 тысяч хонора."
#define MSG_GOSSIP_TEXT_SUPPER_BUFF_CRIT_SPELLS "[Бафнуть] Критическое срабатывание. Стоимость 100 тысяч хонора."
#define MSG_GOSSIP_TEXT_SUPPER_BUFF_BLESSING_PINCHI "[Бафнуть] Благословение мистера Пинчи. Стоимость 100 тысяч хонора."
#define MSG_GOSSIP_TEXT_SUPPER_BUFF_TRANSPARENCY "[Бафнуть] Прозрачность. Стоимость 100 тысяч хонора."

#define MSG_GOSSIP_TEXT_TITLES_JENKINS "Получить звание Дженкинс за 500 Апа."
#define MSG_GOSSIP_TEXT_TITLES_THE_LOVE_FOOL "Получить звание Безумно Влюбленный за 500 Апа."
#define MSG_GOSSIP_TEXT_TITLES_MERRYMAKER "Получить звание Весельчак за 500 Апа." 
#define MSG_GOSSIP_TEXT_TITLES_SCARAB_LORD "Получить звание Повелитель Скоробеев за 500 Апа."
#define MSG_GOSSIP_TEXT_TITLES_THE_NOBLE "Получить звание Чудесный за 500 Апа."
#define MSG_GOSSIP_TEXT_TITLES_OBSIDIAN_SLAYER "Получить звание Покоритель Обсидианового святилища за 1 тыс. Апа."

#define MSG_GOSSIP_TEXT_MORTH_GNOME_MALE "[Превратить] Гном, мужчина."
#define MSG_GOSSIP_TEXT_MORTH_GNOME_FEMALE "[Превратить] Гном, женщина."
#define MSG_GOSSIP_TEXT_MORTH_HUMAN_FEMALE "[Превратить] Человек, женщина."
#define MSG_GOSSIP_TEXT_MORTH_HUMAN_MALE "[Превратить] Человек, мужчина."
#define MSG_GOSSIP_TEXT_MORTH_BLOOD_ELF_MALE "[Превратить] Эльф Крови, мужчина."
#define MSG_GOSSIP_TEXT_MORTH_BLOOD_ELF_FEMALE "[Превратить] Эльф Крови, женщина."
#define MSG_GOSSIP_TEXT_MORTH_TAUREN_MALE "[Превратить] Таурен, мужчина."
#define MSG_GOSSIP_TEXT_MORTH_TAUREN_FEMALE "[Превратить] Таурен, женщина."

#define MSG_GOSSIP_TEXT_ALCHEMY "Изучить Алхимию."
#define MSG_GOSSIP_TEXT_BLACKSMITHING "Изучить Кузнечное Дело."
#define MSG_GOSSIP_TEXT_ENCNANTING "Изучить Наложение Чар."
#define MSG_GOSSIP_TEXT_ENGINEERING "Изучить Инженерное дело."
#define MSG_GOSSIP_TEXT_HERBALISM "Изучить Травничество."
#define MSG_GOSSIP_TEXT_INSCRIPTION "Изучить Начертание."
#define MSG_GOSSIP_TEXT_JEWELCRAFTING "Изучить Ювелирное дело."
#define MSG_GOSSIP_TEXT_LEATHERWORKING "Изучить Кожевничество."
#define MSG_GOSSIP_TEXT_MINING "Изучить Горное дело."
#define MSG_GOSSIP_TEXT_SKINNING "Изучить Снятие шкур."
#define MSG_GOSSIP_TEXT_TAILORING "Изучить Портное дело."

#define MSG_GOSSIP_TEXT_RIDING "Изучить Верховую Езду."
#define MSG_GOSSIP_TEXT_COOKING	"Изучить Кулинарию."
#define MSG_GOSSIP_TEXT_FIRST_AID "Изучить Первую помощь."
#define MSG_GOSSIP_TEXT_FISHING	"Изучить Рыбную ловлю."

#define CONST_HONOR_1  1000000
#define CONST_HONOR_2  100000
#define CONST_ARENA_POINT_1  500
#define CONST_ARENA_POINT_2  1000
#define CONST_ARENA_POINT_3  3000
#define CONST_ARENA_POINT_4  5000


class npc_buffer : public CreatureScript
{
    public: 
    npc_buffer() : CreatureScript("npc_buffer") { }

	
	void CompleteLearnProfession(Player *player, Creature * _creature, SkillType skill) 
     { 
         if (PlayerAlreadyHasNineProfessions(player) && !IsSecondarySkill(skill)) 
            _creature->MonsterWhisper("Вы уже выучили 11 професии!", player->GetGUID()); 
         else 
         { 
             if (!LearnAllRecipesInProfession(player, skill)) 
                 _creature->MonsterWhisper("Ошибка!", player->GetGUID()); 
         } 
     } 
   
   bool IsSecondarySkill(SkillType skill) const 
     { 
         return skill == SKILL_COOKING || skill == SKILL_FIRST_AID; 
     } 
   
   bool PlayerAlreadyHasNineProfessions(const Player *pPlayer) const 
     { 
         uint32 skillCount = 0; 

         if (pPlayer->HasSkill(SKILL_MINING)) 
             skillCount++; 
         if (pPlayer->HasSkill(SKILL_SKINNING)) 
             skillCount++; 
         if (pPlayer->HasSkill(SKILL_HERBALISM)) 
             skillCount++; 

         if (skillCount >= 11) 
             return true; 

         for (uint32 i = 0; i < sSkillLineStore.GetNumRows(); ++i) 
         { 
             SkillLineEntry const *SkillInfo = sSkillLineStore.LookupEntry(i); 
             if (!SkillInfo) 
                 continue; 

             if (SkillInfo->categoryId == SKILL_CATEGORY_SECONDARY) 
                 continue; 

             if ((SkillInfo->categoryId != SKILL_CATEGORY_PROFESSION) || !SkillInfo->canLink) 
                 continue; 

             const uint32 skillID = SkillInfo->id; 
             if (pPlayer->HasSkill(skillID)) 
                 skillCount++; 

             if (skillCount >= 11) 
                 return true; 
         } 

         return false; 
     } 

     bool LearnAllRecipesInProfession(Player *player, SkillType skill) 
     { 
         ChatHandler handler(player->GetSession()); 
         char* skill_name; 

         SkillLineEntry const *SkillInfo = sSkillLineStore.LookupEntry(skill); 
         skill_name = SkillInfo->name[handler.GetSessionDbcLocale()]; 

         if (!SkillInfo) 
         { 
             TC_LOG_ERROR(LOG_FILTER_GENERAL, "Teleport NPC: received non-valid skill ID (LearnAllRecipesInProfession)"); 
             return false; 
         } 

         LearnSkillRecipesHelper(player, SkillInfo->id); 

         uint16 maxLevel = player->GetPureMaxSkillValue(SkillInfo->id); 
         player->SetSkill(SkillInfo->id, player->GetSkillStep(SkillInfo->id), maxLevel, maxLevel); 
         handler.PSendSysMessage(LANG_COMMAND_LEARN_ALL_RECIPES, skill_name); 
          
         return true; 
     } 
     // See "static void HandleLearnSkillRecipesHelper(Player* player,uint32 skill_id)" from cs_learn.cpp  
     void LearnSkillRecipesHelper(Player *player, uint32 skill_id) 
     { 
         uint32 classmask = player->getClassMask(); 

         for (uint32 j = 0; j < sSkillLineAbilityStore.GetNumRows(); ++j) 
         { 
             SkillLineAbilityEntry const *skillLine = sSkillLineAbilityStore.LookupEntry(j); 
             if (!skillLine) 
                 continue; 

             // wrong skill 
             if (skillLine->skillId != skill_id) 
                 continue; 

             // not high rank 
             if (skillLine->forward_spellid) 
                 continue; 

             // skip racial skills 
             if (skillLine->racemask != 0) 
                 continue; 

             // skip wrong class skills 
             if (skillLine->classmask && (skillLine->classmask & classmask) == 0) 
                 continue; 

             SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(skillLine->spellId);
            if (!spellInfo || !SpellMgr::IsSpellValid(spellInfo, player, false))
                continue; 

             player->learnSpell(skillLine->spellId, false); 
         } 
     } 
	
	bool OnGossipHello(Player *player, Creature *_creature)
		{ 
        _creature->MonsterWhisper(MSG_GOSSIP_TEXT_GETTING_STARTED, player->GetGUID());
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_RIDING, GOSSIP_SENDER_MAIN, 35);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_HEALTH, GOSSIP_SENDER_MAIN, 33);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_SKILL, GOSSIP_SENDER_MAIN, 34);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENU, GOSSIP_SENDER_MAIN, 2);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_PROFFESION_MENU, GOSSIP_SENDER_MAIN, 36);
        player->SEND_GOSSIP_MENU (DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID()); 
        return true;
	}
             
	bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 action )
		{
		  if (!player->getAttackers().empty())
	{
		_creature->MonsterWhisper(MSG_ERR_INCOMBAT, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
        return false;
		  }
    switch (action)
	{
	case 2:
        player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_POWER_WORD, GOSSIP_SENDER_MAIN, 3);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_KINGS, GOSSIP_SENDER_MAIN, 4);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_MARK_OF_THE_WILD, GOSSIP_SENDER_MAIN, 5);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_ARCANE_BRILLIANCE, GOSSIP_SENDER_MAIN, 6);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_MIGHT, GOSSIP_SENDER_MAIN, 7);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_WISDOM, GOSSIP_SENDER_MAIN, 8);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_THORNS, GOSSIP_SENDER_MAIN, 9);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_DIVINE_SPIRIT, GOSSIP_SENDER_MAIN, 10);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_SHADOW_PROTECTION, GOSSIP_SENDER_MAIN, 11);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_STAMINA, GOSSIP_SENDER_MAIN, 12);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
	    player->SEND_GOSSIP_MENU (DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID());
		break;
	case 3:
		// Наложение стойкости (Исправлено)
	    player->CastSpell(player, 69377, true);
		player->CLOSE_GOSSIP_MENU();
	    break;
    case 4:
		 // Наложение Благословение Королей (Исправлено)
		player->CastSpell(player, 56525, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 5:
		 // Наложение Знак дикой природы
		player->CastSpell(player, 1126, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 6:
		 // Наложение Чародейской гениальности Даларана (Исправлено)
		player->CastSpell(player, 61316, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 7:
         // Наложение Благословение могущества (Исправлено)
		player->CastSpell(player, 29381, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 8:
		 // Наложение Благословение мудрости (Исправлено)
		player->CastSpell(player, 56521, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 9:
		 // Наложение Шипов (Исправлено)
		player->CastSpell(player, 53307, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 10:
		 // Наложение Божественный духа (Исправлено)
		player->CastSpell(player, 48074, true);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 11:
		 // Наложение Защиты от темной магии (Исправлено)
		player->CastSpell(player, 48170, true);
	    player->CLOSE_GOSSIP_MENU();
		break;
	case 12:
		player->CastSpell(player, 48102, true);
		player->CLOSE_GOSSIP_MENU();
		break;
    case 13:
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_BERSERK, GOSSIP_SENDER_MAIN, 14);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_AEGIS_OF_RAGNAROS, GOSSIP_SENDER_MAIN, 15);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_AEGIS_OF_NELTHARION, GOSSIP_SENDER_MAIN, 16);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_BLESSING_ADALS, GOSSIP_SENDER_MAIN, 17);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_CRIT_SPELLS, GOSSIP_SENDER_MAIN, 18);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_BLESSING_PINCHI, GOSSIP_SENDER_MAIN, 19);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_TRANSPARENCY, GOSSIP_SENDER_MAIN, 20);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID()); 
        break;
	case 14:
	if (player->GetHonorPoints() < CONST_HONOR_1)
	    {
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение берсерка и отнятие 1 ляма хонора (Доработано)
		player->CastSpell(player, 41924, true);
		player->ModifyHonorPoints(-CONST_HONOR_1);
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 15:
    if (player->GetHonorPoints() < CONST_HONOR_2)
	    {
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение Эгиды Рагнароса(Доработано)
		player->CastSpell(player, 20620, true);
		player->ModifyHonorPoints(-CONST_HONOR_2);
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 16:
    if (player->GetHonorPoints() < CONST_HONOR_2)
	    {
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение Защита Нелтариона(Доработано)
		player->CastSpell(player, 51512, true);
		player->ModifyHonorPoints(-CONST_HONOR_2);
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 17:
	if (player->GetHonorPoints() < CONST_HONOR_2)
		{
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение Благословение А'дала
		player->CastSpell(player, 35076, true);
		player->ModifyHonorPoints(-CONST_HONOR_2);
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 18:
	if (player->GetHonorPoints() < CONST_HONOR_2)
		{
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение Критического срабатывания положительных эффектов
		player->CastSpell(player, 31305, true);
		player->ModifyHonorPoints(-CONST_HONOR_2);
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 19:
	if (player->GetHonorPoints() < CONST_HONOR_2)
		{
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
	    player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение Благословения мистера Пинчи
		player->CastSpell(player, 33053, true);
		player->ModifyHonorPoints(-CONST_HONOR_2);
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 20:
        if (player->GetHonorPoints() < CONST_HONOR_2)
		{
		_creature->MonsterWhisper(MSG_ERR_HONOR, player->GetGUID());
	    player->CLOSE_GOSSIP_MENU();
	}else{
		// Наложение Прозрачности
		player->CastSpell(player, 37802, true);
		player->ModifyHonorPoints(-CONST_HONOR_2);
        player->CLOSE_GOSSIP_MENU();
	case 21:
		player->PlayerTalkClass->ClearMenus();
      player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_RIDING, GOSSIP_SENDER_MAIN, 35);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_HEALTH, GOSSIP_SENDER_MAIN, 33);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_SKILL, GOSSIP_SENDER_MAIN, 34);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENU, GOSSIP_SENDER_MAIN, 2);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_PROFFESION_MENU, GOSSIP_SENDER_MAIN, 36);
        player->SEND_GOSSIP_MENU (DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID()); 
		break; 
	case 22:
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_JENKINS, GOSSIP_SENDER_MAIN, 23);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_THE_LOVE_FOOL, GOSSIP_SENDER_MAIN, 24);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_MERRYMAKER, GOSSIP_SENDER_MAIN, 25);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_SCARAB_LORD, GOSSIP_SENDER_MAIN, 26);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_THE_NOBLE, GOSSIP_SENDER_MAIN, 27);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_OBSIDIAN_SLAYER, GOSSIP_SENDER_MAIN, 28);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
		player->SEND_GOSSIP_MENU (DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID()); 
		break;
	case 23:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(143);
		if (player->HasTitle(titleInfo))  
		{  
        _creature->MonsterWhisper(MSG_ERR_TITLE, player->GetGUID());   
        player->CLOSE_GOSSIP_MENU();
	    return false;
	}
	if (player->GetArenaPoints() < CONST_ARENA_POINT_1)
		{
         _creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID()); 
		 player->CLOSE_GOSSIP_MENU();
	}else{
        // Даем звание Дженкинс 
		player->SetTitle(titleInfo);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
        player->CLOSE_GOSSIP_MENU();
	}
		}
		break;
	case 24: 
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(135); 
    if (player->HasTitle(titleInfo))   
      {   
       _creature->MonsterWhisper(MSG_ERR_TITLE, player->GetGUID());   
       player->CLOSE_GOSSIP_MENU();
	   return false;
	} 
    if (player->GetArenaPoints() < CONST_ARENA_POINT_1) 
	 {
	    _creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID()); 
		player->CLOSE_GOSSIP_MENU();
	}else{
        // Даем звание Безумно Влюбленный
		player->SetTitle(titleInfo);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
        player->CLOSE_GOSSIP_MENU();
	}
		   }
				break;
	case 25:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(134); 
	if (player->HasTitle(titleInfo))   
      {   
        _creature->MonsterWhisper(MSG_ERR_TITLE, player->GetGUID());   
        player->CLOSE_GOSSIP_MENU();   
	    return false;
	} 
    if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
		_creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID()); 
		player->CLOSE_GOSSIP_MENU();
	}else{
        // Даем звание Весельчак
		player->SetTitle(titleInfo);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
        player->CLOSE_GOSSIP_MENU();
	}
		 }
				break;
	case 26:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(46); 
    if (player->HasTitle(titleInfo))   
      {   
        _creature->MonsterWhisper(MSG_ERR_TITLE, player->GetGUID());   
        player->CLOSE_GOSSIP_MENU();   
	    return false;
	}  
    if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
        _creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID()); 
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Даем звание Повелитель Скоробеев
		player->SetTitle(titleInfo);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
        player->CLOSE_GOSSIP_MENU();
	}
		 }
				break;
	case 27:
	    {CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(155);
	if (player->HasTitle(titleInfo))   
      {   
        _creature->MonsterWhisper(MSG_ERR_TITLE, player->GetGUID());   
        player->CLOSE_GOSSIP_MENU();   
	    return false;
	}  
    if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
	    _creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID()); 
	    player->CLOSE_GOSSIP_MENU();
	}else{
	     // Даем звание Чудесный 
		 player->SetTitle(titleInfo);
		 player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
         player->CLOSE_GOSSIP_MENU();
	}
		  }
				break;
	case 28:
	    {CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(139);
	if (player->HasTitle(titleInfo))   
      {   
        _creature->MonsterWhisper(MSG_ERR_TITLE, player->GetGUID());   
        player->CLOSE_GOSSIP_MENU();   
	    return false;
	} 
	if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
	    _creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID()); 
	    player->CLOSE_GOSSIP_MENU();
	}else{
		// Даем звание Покоритель Обсидианового святилища 
		player->SetTitle(titleInfo);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_2);
        player->CLOSE_GOSSIP_MENU();
	}
		}
				break;
	case 29:
    player->PlayerTalkClass->ClearMenus();
	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_RENAME, GOSSIP_SENDER_MAIN, 30);
	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_CUSTOM, GOSSIP_SENDER_MAIN, 31);
	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_CHANGE_FACTION, GOSSIP_SENDER_MAIN, 32);
	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
    player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID());
	            break;
	case 30:
	if (player->GetArenaPoints() < CONST_ARENA_POINT_3)
	  {
	    _creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID());
	    player->CLOSE_GOSSIP_MENU();
	}else{
		// Делаем Ренейм
		player->SetAtLoginFlag(AT_LOGIN_RENAME);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_3);
        _creature->MonsterWhisper(MSG_COMPLETE_RENAME, player->GetGUID());
        player->CLOSE_GOSSIP_MENU();
	}
				break;
	case 31:
	if (player->GetArenaPoints() < CONST_ARENA_POINT_3)
	  {
		_creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Делаем Смену внешности
		player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_3);
        _creature->MonsterWhisper(MSG_CUSTOMIZE_COMPLETE, player->GetGUID());
        player->CLOSE_GOSSIP_MENU();
	}
	           break;
	case 32:
		if (player->GetArenaPoints() < CONST_ARENA_POINT_4)
	  {
		_creature->MonsterWhisper(MSG_ERR_ARENA_POINT_1, player->GetGUID());
		player->CLOSE_GOSSIP_MENU();
	}else{
		// Делаем Смену внешности
		player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
		player->ModifyArenaPoints(-CONST_ARENA_POINT_4);
        _creature->MonsterWhisper(MSG_CHANGE_FACTION_COMPLETE, player->GetGUID());
        player->CLOSE_GOSSIP_MENU();
	}
		       break; 
	case 33:
		player->SetHealth(player->GetMaxHealth());
		player->CLOSE_GOSSIP_MENU();
      
	           break;
    case 34:
		player->UpdateSkillsToMaxSkillsForLevel();
		player->CLOSE_GOSSIP_MENU();
		break;
    case 35:
	    player->learnSpell(90265, true);
		player->SetSkill(762, 6, 450, 450);
		player->learnSpell(54197, true);
		player->CLOSE_GOSSIP_MENU();
		       break;
	case 36:
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_ALCHEMY, GOSSIP_SENDER_MAIN, 37);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BLACKSMITHING, GOSSIP_SENDER_MAIN, 38);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_ENCNANTING, GOSSIP_SENDER_MAIN, 39);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_ENGINEERING, GOSSIP_SENDER_MAIN, 40);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_HERBALISM, GOSSIP_SENDER_MAIN, 41);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_INSCRIPTION, GOSSIP_SENDER_MAIN, 42);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_JEWELCRAFTING, GOSSIP_SENDER_MAIN, 43);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_LEATHERWORKING, GOSSIP_SENDER_MAIN, 44);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_MINING, GOSSIP_SENDER_MAIN, 45);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_SKINNING, GOSSIP_SENDER_MAIN, 46);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_TAILORING, GOSSIP_SENDER_MAIN, 47);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_PROFFESION_SECON_MENU, GOSSIP_SENDER_MAIN, 48);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
	    player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID());
		       break;
	case 37:
		CompleteLearnProfession(player, _creature, SKILL_ALCHEMY); 
		player->CLOSE_GOSSIP_MENU();
		       break;
	case 38:
		CompleteLearnProfession(player, _creature, SKILL_BLACKSMITHING); 
		player->CLOSE_GOSSIP_MENU();
		break;
	case 39:
		CompleteLearnProfession(player, _creature,  SKILL_ENCHANTING); 
		player->CLOSE_GOSSIP_MENU();
			   break;
	case 40:
		CompleteLearnProfession(player, _creature, SKILL_ENGINEERING); 
		player->CLOSE_GOSSIP_MENU();
		       break;
	case 41:
		CompleteLearnProfession(player, _creature, SKILL_HERBALISM); 
		player->CLOSE_GOSSIP_MENU();
	case 42:
		CompleteLearnProfession(player, _creature, SKILL_INSCRIPTION); 
		player->CLOSE_GOSSIP_MENU();
		       break;
	case 43:
		CompleteLearnProfession(player, _creature, SKILL_JEWELCRAFTING);
		player->CLOSE_GOSSIP_MENU();
			   break;
	case 44:
		CompleteLearnProfession(player, _creature, SKILL_LEATHERWORKING);
		player->CLOSE_GOSSIP_MENU();
		       break;
	case 45:
		CompleteLearnProfession(player, _creature, SKILL_MINING);
		player->CLOSE_GOSSIP_MENU();
			   break;
	case 46:
		CompleteLearnProfession(player, _creature, SKILL_SKINNING);
		player->CLOSE_GOSSIP_MENU();
			   break;
	case 47:
		CompleteLearnProfession(player, _creature, SKILL_TAILORING);
		player->CLOSE_GOSSIP_MENU();
		       break;
	case 48:
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_COOKING, GOSSIP_SENDER_MAIN, 49);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_FIRST_AID, GOSSIP_SENDER_MAIN, 50);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_FISHING, GOSSIP_SENDER_MAIN, 51);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID());
		       break;
	case 49:
		CompleteLearnProfession(player, _creature, SKILL_COOKING);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 50:
		CompleteLearnProfession(player, _creature, SKILL_FIRST_AID); 
		player->CLOSE_GOSSIP_MENU();
	    break;
	case 51:
		CompleteLearnProfession(player, _creature, SKILL_FISHING); 
		player->CLOSE_GOSSIP_MENU();
	    break;
	case 52:
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_GNOME_MALE, GOSSIP_SENDER_MAIN, 53);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_GNOME_FEMALE, GOSSIP_SENDER_MAIN, 54);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_HUMAN_MALE, GOSSIP_SENDER_MAIN, 55);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_HUMAN_FEMALE, GOSSIP_SENDER_MAIN, 56);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_BLOOD_ELF_MALE, GOSSIP_SENDER_MAIN, 57);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_BLOOD_ELF_MALE, GOSSIP_SENDER_MAIN, 58);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_TAUREN_MALE, GOSSIP_SENDER_MAIN, 59);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_TAUREN_FEMALE, GOSSIP_SENDER_MAIN, 50);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,_creature->GetGUID());
		break;
	case 53:
		player->CastSpell(player, 37808, true);
        player->CLOSE_GOSSIP_MENU();
		break;
	case 54:
		player->CastSpell(player, 37809, true);
        player->CLOSE_GOSSIP_MENU();
		break;
	case 55:
		player->CastSpell(player, 35466, true);
        player->CLOSE_GOSSIP_MENU();
		break;
	case 56:
		player->CastSpell(player, 37805, true);
        player->CLOSE_GOSSIP_MENU();
		break;
	case 57:
		player->CastSpell(player, 37807, true);
        player->CLOSE_GOSSIP_MENU();
        break;
	case 58:
		player->CastSpell(player, 37806, true);
        player->CLOSE_GOSSIP_MENU();
        break;
	case 59:
		player->CastSpell(player, 37810, true);
        player->CLOSE_GOSSIP_MENU();
		break;
	case 60:
		player->CastSpell(player, 37811, true);
        player->CLOSE_GOSSIP_MENU();
		break;
	case 61:
		player->RemoveAllAuras();
		player->CLOSE_GOSSIP_MENU();
            }
			}
				return true;
}

   };
void AddSC_npc_buffer()
{
    new npc_buffer;
}

