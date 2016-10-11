#include "Config.h"
#include "GuildMgr.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Battleground.h"
#include "BattlegroundMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "ArenaTeam.h"
#include "ArenaTeamMgr.h"
#include "World.h"
#include "WorldSession.h"
#include "Group.h"
#include "AchievementMgr.h"
#include "ObjectAccessor.h"
#include "Unit.h"
#include "SharedDefines.h"
#include "Creature.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "Language.h"
#include "Chat.h"
#include <sstream>
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
		if (player->IsGameMaster() || lang == LANG_ADDON)
			return;

		// transform to lowercase (for simpler checking)
		std::string lower = msg;
		std::transform(lower.begin(), lower.end(), lower.begin(), ::tolower);

		const uint8 cheksSize = 38;
		std::string checks[cheksSize];
		// Strony (Sites)
		checks[0] = "http://";
		checks[1] = ".com";
		checks[2] = ".www";
		checks[3] = ".net";
		checks[4] = ".org";
		checks[5] = ".ru";
		checks[6] = "www.";
		checks[7] = "wow-";
		checks[8] = "-wow";
		checks[9] = ".pl";
		// Polskie przekleсstwa (Polish curses)
		checks[10] = "chuj";
		checks[11] = "huj";
		checks[12] = "kurw";
		checks[13] = "jeba";
		checks[14] = "cipa";
		checks[15] = "gej";
		checks[16] = "cwel";
		checks[17] = "pizd";
		checks[18] = "pierdo";
		checks[19] = "spierd";
		checks[20] = "zjeb";
		checks[21] = "wypierdalaj";
		checks[22] = "kutas";
		// English curses
		checks[23] = "bitch";
		checks[24] = "clit";
		checks[25] = "cock";
		checks[26] = "cum";
		checks[27] = "cunt";
		checks[28] = "dick";
		checks[29] = "faggot";
		checks[30] = "fuck";
		checks[31] = "gay";
		checks[32] = "lesbian";
		checks[33] = "penis";
		checks[34] = "prick";
		checks[35] = "slut";
		checks[36] = "twat";
		checks[37] = "whore";

		for (int i = 0; i < cheksSize; ++i)
			if (lower.find(checks[i]) != std::string::npos)
			{
				msg = "";
				ChatHandler(player->GetSession()).PSendSysMessage("Advertising and vulgar behavior is not allowed!");
				return;
			}
	}
};

class fast_arena_start : public GameObjectScript
{
public:

	fast_arena_start() : GameObjectScript("fast_arena_start")
	{ }

	bool OnGossipHello(Player* player, GameObject* go)
	{
		if (Battleground *bg = player->GetBattleground())
			if (bg->isArena())
				ChatHandler(player->GetSession()).PSendSysMessage("Players clicked: %u", bg->ClickFastStart(player, go));

		return false;
	}
};


#define MSG_GOSSIP_TEXT_GETTING_STARTED	"Приветствуем вас на сервере OneGo - World of Warcraft !"
 
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
#define MSG_GOSSIP_TEXT_BUFF_MENUvip1 "[Premium buff] ->"
#define MSG_GOSSIP_TEXT_BUFF_MENUvip2 "[Title] ->"
#define MSG_GOSSIP_TEXT_BUFF_MENUvip3 "[test] ->"
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

#define CONST_HONOR_1  0//1000000
#define CONST_HONOR_2 0 //100000
#define CONST_ARENA_POINT_1  0//500
#define CONST_ARENA_POINT_2  0//1000
#define CONST_ARENA_POINT_3  0//3000
#define CONST_ARENA_POINT_4  0//5000


class npc_buffer : public CreatureScript
{
public:
	npc_buffer() : CreatureScript("npc_buffer") { }


	void CompleteLearnProfession(Player *player, Creature * _creature, SkillType skill)
	{
		if (PlayerAlreadyHasNineProfessions(player) && !IsSecondarySkill(skill))
			_creature->Whisper("Вы уже выучили 11 професии!", LANG_UNIVERSAL, player);
		else
		{
			if (!LearnAllRecipesInProfession(player, skill))
				_creature->Whisper("Ошибка!", LANG_UNIVERSAL, player);
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
			TC_LOG_ERROR("scripts", "Teleport NPC: received non-valid skill ID (LearnAllRecipesInProfession)");
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

			player->LearnSpell(skillLine->spellId, false);
		}
	}

	bool OnGossipHello(Player *player, Creature *_creature)
	{
		_creature->Whisper(MSG_GOSSIP_TEXT_GETTING_STARTED, LANG_UNIVERSAL, player);
		AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_RIDING, GOSSIP_SENDER_MAIN, 35);
		AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_HEALTH, GOSSIP_SENDER_MAIN, 33);
		AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_SKILL, GOSSIP_SENDER_MAIN, 34);
		AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENU, GOSSIP_SENDER_MAIN, 2);
        AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENUvip1, GOSSIP_SENDER_MAIN, 13);
        AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENUvip2, GOSSIP_SENDER_MAIN, 22);
		AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENUvip3, GOSSIP_SENDER_MAIN, 2233);
		AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_PROFFESION_MENU, GOSSIP_SENDER_MAIN, 36);
		SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 action)
	{
		if (!player->getAttackers().empty())
		{
			_creature->Whisper(MSG_ERR_INCOMBAT, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		switch (action)
		{
		case 2:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_POWER_WORD, GOSSIP_SENDER_MAIN, 3);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_KINGS, GOSSIP_SENDER_MAIN, 4);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_MARK_OF_THE_WILD, GOSSIP_SENDER_MAIN, 5);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_ARCANE_BRILLIANCE, GOSSIP_SENDER_MAIN, 6);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_MIGHT, GOSSIP_SENDER_MAIN, 7);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_BLESSING_OF_WISDOM, GOSSIP_SENDER_MAIN, 8);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_THORNS, GOSSIP_SENDER_MAIN, 9);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_DIVINE_SPIRIT, GOSSIP_SENDER_MAIN, 10);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_SHADOW_PROTECTION, GOSSIP_SENDER_MAIN, 11);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BUFF_STAMINA, GOSSIP_SENDER_MAIN, 12);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 3:
			// Наложение стойкости (Исправлено)
			player->CastSpell(player, 69377, true);
			CloseGossipMenuFor(player);
			break;
		case 4:
			// Наложение Благословение Королей (Исправлено)
			player->CastSpell(player, 56525, true);
			CloseGossipMenuFor(player);
			break;
		case 5:
			// Наложение Знак дикой природы
			player->CastSpell(player, 1126, true);
			CloseGossipMenuFor(player);
			break;
		case 6:
			// Наложение Чародейской гениальности Даларана (Исправлено)
			player->CastSpell(player, 61316, true);
			CloseGossipMenuFor(player);
			break;
		case 7:
			// Наложение Благословение могущества (Исправлено)
			player->CastSpell(player, 29381, true);
			CloseGossipMenuFor(player);
			break;
		case 8:
			// Наложение Благословение мудрости (Исправлено)
			player->CastSpell(player, 56521, true);
			CloseGossipMenuFor(player);
			break;
		case 9:
			// Наложение Шипов (Исправлено)
			player->CastSpell(player, 53307, true);
			CloseGossipMenuFor(player);
			break;
		case 10:
			// Наложение Божественный духа (Исправлено)
			player->CastSpell(player, 48074, true);
			CloseGossipMenuFor(player);
			break;
		case 11:
			// Наложение Защиты от темной магии (Исправлено)
			player->CastSpell(player, 48170, true);
			CloseGossipMenuFor(player);
			break;
		case 12:
			player->CastSpell(player, 48102, true);
			CloseGossipMenuFor(player);
			break;
		case 13:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_BERSERK, GOSSIP_SENDER_MAIN, 14);
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_AEGIS_OF_RAGNAROS, GOSSIP_SENDER_MAIN, 15);
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_AEGIS_OF_NELTHARION, GOSSIP_SENDER_MAIN, 16);
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_BLESSING_ADALS, GOSSIP_SENDER_MAIN, 17);
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_CRIT_SPELLS, GOSSIP_SENDER_MAIN, 18);
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_BLESSING_PINCHI, GOSSIP_SENDER_MAIN, 19);
			AddGossipItemFor(player, GOSSIP_ICON_MONEY_BAG, MSG_GOSSIP_TEXT_SUPPER_BUFF_TRANSPARENCY, GOSSIP_SENDER_MAIN, 20);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 14:
			if (player->GetHonorPoints() < CONST_HONOR_1)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение берсерка и отнятие 1 ляма хонора (Доработано)
				player->CastSpell(player, 41924, true);
				player->ModifyHonorPoints(-CONST_HONOR_1);
				CloseGossipMenuFor(player);
			}
			break;
		case 15:
			if (player->GetHonorPoints() < CONST_HONOR_2)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение Эгиды Рагнароса(Доработано)
				player->CastSpell(player, 20620, true);
				player->ModifyHonorPoints(-CONST_HONOR_2);
				CloseGossipMenuFor(player);
			}
			break;
		case 16:
			if (player->GetHonorPoints() < CONST_HONOR_2)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение Защита Нелтариона(Доработано)
				player->CastSpell(player, 51512, true);
				player->ModifyHonorPoints(-CONST_HONOR_2);
				CloseGossipMenuFor(player);
			}
			break;
		case 17:
			if (player->GetHonorPoints() < CONST_HONOR_2)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение Благословение А'дала
				player->CastSpell(player, 35076, true);
				player->ModifyHonorPoints(-CONST_HONOR_2);
				CloseGossipMenuFor(player);
			}
			break;
		case 18:
			if (player->GetHonorPoints() < CONST_HONOR_2)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение Критического срабатывания положительных эффектов
				player->CastSpell(player, 31305, true);
				player->ModifyHonorPoints(-CONST_HONOR_2);
				CloseGossipMenuFor(player);
			}
			break;
		case 19:
			if (player->GetHonorPoints() < CONST_HONOR_2)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение Благословения мистера Пинчи
				player->CastSpell(player, 33053, true);
				player->ModifyHonorPoints(-CONST_HONOR_2);
				CloseGossipMenuFor(player);
			}
			break;
		case 20:
			if (player->GetHonorPoints() < CONST_HONOR_2)
			{
				_creature->Whisper(MSG_ERR_HONOR, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Наложение Прозрачности
				player->CastSpell(player, 37802, true);
				player->ModifyHonorPoints(-CONST_HONOR_2);
				CloseGossipMenuFor(player);
		case 21:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_RIDING, GOSSIP_SENDER_MAIN, 35);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_HEALTH, GOSSIP_SENDER_MAIN, 33);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MAX_SKILL, GOSSIP_SENDER_MAIN, 34);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENU, GOSSIP_SENDER_MAIN, 2);
            AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENUvip1, GOSSIP_SENDER_MAIN, 13);
            AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENUvip2, GOSSIP_SENDER_MAIN, 22);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_BUFF_MENUvip3, GOSSIP_SENDER_MAIN, 2233);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_PROFFESION_MENU, GOSSIP_SENDER_MAIN, 36);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 2233:
			player->PlayerTalkClass->ClearMenus();
			//AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_JENKINS, GOSSIP_SENDER_MAIN, 23);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Algalon", GOSSIP_SENDER_MAIN, 711);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Doomwalker", GOSSIP_SENDER_MAIN, 712);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Doomlord kazzak", GOSSIP_SENDER_MAIN, 713);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Onyxia", GOSSIP_SENDER_MAIN, 714);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Thaddius", GOSSIP_SENDER_MAIN, 715);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Gluth", GOSSIP_SENDER_MAIN, 716);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Maexxna", GOSSIP_SENDER_MAIN, 717);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Sapphiron", GOSSIP_SENDER_MAIN, 718);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Noth The Plaguebringer", GOSSIP_SENDER_MAIN, 719);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Kel'Thuzad", GOSSIP_SENDER_MAIN, 720);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Kael'thas Sunstrider", GOSSIP_SENDER_MAIN, 721);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "C'thun", GOSSIP_SENDER_MAIN, 722);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Thrall", GOSSIP_SENDER_MAIN, 723);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Sylvanas Windrunner", GOSSIP_SENDER_MAIN, 724);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Alexstrasza (Blutelf)", GOSSIP_SENDER_MAIN, 725);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Varian Wrynn", GOSSIP_SENDER_MAIN, 726);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Varimathras", GOSSIP_SENDER_MAIN, 727);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Alexstrasza (Drache)", GOSSIP_SENDER_MAIN, 728);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, "Mal'ganis", GOSSIP_SENDER_MAIN, 729);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 22:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_JENKINS, GOSSIP_SENDER_MAIN, 23);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_THE_LOVE_FOOL, GOSSIP_SENDER_MAIN, 24);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_MERRYMAKER, GOSSIP_SENDER_MAIN, 25);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_SCARAB_LORD, GOSSIP_SENDER_MAIN, 26);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_THE_NOBLE, GOSSIP_SENDER_MAIN, 27);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_TITLES_OBSIDIAN_SLAYER, GOSSIP_SENDER_MAIN, 28);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
       case 711: // Algalon
            CloseGossipMenuFor(player);
            player->SetDisplayId(28641);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
            break;
       case 712: // Doomwalker
            CloseGossipMenuFor(player);
            player->SetDisplayId(16630);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
            break;
       case 713: // Doomlord kazzak
            CloseGossipMenuFor(player);
            player->SetDisplayId(17887);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.10f);
            break;
       case 714: // Onyxia
            CloseGossipMenuFor(player);
            player->SetDisplayId(8570);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
            break;
       case 715: // Thaddius
            CloseGossipMenuFor(player);
            player->SetDisplayId(16137);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
            break;
       case 716: // Gluth
            CloseGossipMenuFor(player);
            player->SetDisplayId(16064);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
            break;
       case 717: // Maexxna
            CloseGossipMenuFor(player);
            player->SetDisplayId(15928);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.15f);
            break;
       case 718: // Sapphiron
            CloseGossipMenuFor(player);
            player->SetDisplayId(16033);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
            break;
       case 719: // Noth The Plaguebringer
            CloseGossipMenuFor(player);
            player->SetDisplayId(16590);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.7f);
            break;
       case 720: // Kel'Thuzad
			CloseGossipMenuFor(player);
            player->SetDisplayId(15945);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.2f);
            break;
       case 721: // Kael'thas Sunstrider
            CloseGossipMenuFor(player);
            player->SetDisplayId(20023);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
            break;
	   case 722: // C'thun
            CloseGossipMenuFor(player);
            player->SetDisplayId(15786);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
            break;
       case 723: // Thrall
            CloseGossipMenuFor(player);
            player->SetDisplayId(4527);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
            break;
       case 724: // Sylvanas Windrunner
            CloseGossipMenuFor(player);
            player->SetDisplayId(28213);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
            break;
		case 725: // Alexstrasza, BElf
            CloseGossipMenuFor(player);
            player->SetDisplayId(28227);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.8f);
            break;
       case 726: // Varian Wrynn
            CloseGossipMenuFor(player);
            player->SetDisplayId(28127);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
            break;
       case 727: // Varimathras
            CloseGossipMenuFor(player);
            player->SetDisplayId(28220);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.7f);
            break;
       case 728: // Alexstrasza, dragon
            CloseGossipMenuFor(player);
            player->SetDisplayId(27569);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.1f);
            break;
       case 729: // Mal'ganis
            CloseGossipMenuFor(player);
            player->SetDisplayId(26582);
            player->SetFloatValue(OBJECT_FIELD_SCALE_X, 0.5f);
            break;
		case 23:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(143);
		if (player->HasTitle(titleInfo))
		{
			_creature->Whisper(MSG_ERR_TITLE, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		if (player->GetArenaPoints() < CONST_ARENA_POINT_1)
		{
			_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
		}
		else{
			// Даем звание Дженкинс 
			player->SetTitle(titleInfo);
			player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
			CloseGossipMenuFor(player);
		}
		}
		break;
		case 24:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(135);
		if (player->HasTitle(titleInfo))
		{
			_creature->Whisper(MSG_ERR_TITLE, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		if (player->GetArenaPoints() < CONST_ARENA_POINT_1)
		{
			_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
		}
		else{
			// Даем звание Безумно Влюбленный
			player->SetTitle(titleInfo);
			player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
			CloseGossipMenuFor(player);
		}
		}
		break;
		case 25:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(134);
		if (player->HasTitle(titleInfo))
		{
			_creature->Whisper(MSG_ERR_TITLE, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
			_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
		}
		else{
			// Даем звание Весельчак
			player->SetTitle(titleInfo);
			player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
			CloseGossipMenuFor(player);
		}
		}
		break;
		case 26:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(46);
		if (player->HasTitle(titleInfo))
		{
			_creature->Whisper(MSG_ERR_TITLE, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
			_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
		}
		else{
			// Даем звание Повелитель Скоробеев
			player->SetTitle(titleInfo);
			player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
			CloseGossipMenuFor(player);
		}
		}
		break;
		case 27:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(155);
		if (player->HasTitle(titleInfo))
		{
			_creature->Whisper(MSG_ERR_TITLE, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
			_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
		}
		else{
			// Даем звание Чудесный 
			player->SetTitle(titleInfo);
			player->ModifyArenaPoints(-CONST_ARENA_POINT_1);
			CloseGossipMenuFor(player);
		}
		}
		break;
		case 28:
		{CharTitlesEntry const* titleInfo = sCharTitlesStore.LookupEntry(139);
		if (player->HasTitle(titleInfo))
		{
			_creature->Whisper(MSG_ERR_TITLE, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
			return false;
		}
		if (player->GetArenaPoints() < CONST_ARENA_POINT_1) {
			_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
			CloseGossipMenuFor(player);
		}
		else{
			// Даем звание Покоритель Обсидианового святилища 
			player->SetTitle(titleInfo);
			player->ModifyArenaPoints(-CONST_ARENA_POINT_2);
			CloseGossipMenuFor(player);
		}
		}
		break;
		case 29:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_RENAME, GOSSIP_SENDER_MAIN, 30);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_CUSTOM, GOSSIP_SENDER_MAIN, 31);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_CHANGE_FACTION, GOSSIP_SENDER_MAIN, 32);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 30:
			if (player->GetArenaPoints() < CONST_ARENA_POINT_3)
			{
				_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Делаем Ренейм
				player->SetAtLoginFlag(AT_LOGIN_RENAME);
				player->ModifyArenaPoints(-CONST_ARENA_POINT_3);
				_creature->Whisper(MSG_COMPLETE_RENAME, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			break;
		case 31:
			if (player->GetArenaPoints() < CONST_ARENA_POINT_3)
			{
				_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Делаем Смену внешности
				player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
				player->ModifyArenaPoints(-CONST_ARENA_POINT_3);
				_creature->Whisper(MSG_CUSTOMIZE_COMPLETE, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			break;
		case 32:
			if (player->GetArenaPoints() < CONST_ARENA_POINT_4)
			{
				_creature->Whisper(MSG_ERR_ARENA_POINT_1, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			else{
				// Делаем Смену внешности
				player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
				player->ModifyArenaPoints(-CONST_ARENA_POINT_4);
				_creature->Whisper(MSG_CHANGE_FACTION_COMPLETE, LANG_UNIVERSAL, player);
				CloseGossipMenuFor(player);
			}
			break;
		case 33:
			player->SetHealth(player->GetMaxHealth());
			CloseGossipMenuFor(player);

			break;
		case 34:
			player->UpdateSkillsToMaxSkillsForLevel();
			CloseGossipMenuFor(player);
			break;
		case 35:
			player->LearnSpell(90265, true);
			player->SetSkill(762, 6, 450, 450);
			player->LearnSpell(54197, true);
			CloseGossipMenuFor(player);
			break;
		case 36:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_ALCHEMY, GOSSIP_SENDER_MAIN, 37);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_BLACKSMITHING, GOSSIP_SENDER_MAIN, 38);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_ENCNANTING, GOSSIP_SENDER_MAIN, 39);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_ENGINEERING, GOSSIP_SENDER_MAIN, 40);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_HERBALISM, GOSSIP_SENDER_MAIN, 41);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_INSCRIPTION, GOSSIP_SENDER_MAIN, 42);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_JEWELCRAFTING, GOSSIP_SENDER_MAIN, 43);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_LEATHERWORKING, GOSSIP_SENDER_MAIN, 44);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_MINING, GOSSIP_SENDER_MAIN, 45);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_SKINNING, GOSSIP_SENDER_MAIN, 46);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_TAILORING, GOSSIP_SENDER_MAIN, 47);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_PROFFESION_SECON_MENU, GOSSIP_SENDER_MAIN, 48);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 37:
			CompleteLearnProfession(player, _creature, SKILL_ALCHEMY);
			CloseGossipMenuFor(player);
			break;
		case 38:
			CompleteLearnProfession(player, _creature, SKILL_BLACKSMITHING);
			CloseGossipMenuFor(player);
			break;
		case 39:
			CompleteLearnProfession(player, _creature, SKILL_ENCHANTING);
			CloseGossipMenuFor(player);
			break;
		case 40:
			CompleteLearnProfession(player, _creature, SKILL_ENGINEERING);
			CloseGossipMenuFor(player);
			break;
		case 41:
			CompleteLearnProfession(player, _creature, SKILL_HERBALISM);
			CloseGossipMenuFor(player);
                        break;
		case 42:
			CompleteLearnProfession(player, _creature, SKILL_INSCRIPTION);
			CloseGossipMenuFor(player);
			break;
		case 43:
			CompleteLearnProfession(player, _creature, SKILL_JEWELCRAFTING);
			CloseGossipMenuFor(player);
			break;
		case 44:
			CompleteLearnProfession(player, _creature, SKILL_LEATHERWORKING);
			CloseGossipMenuFor(player);
			break;
		case 45:
			CompleteLearnProfession(player, _creature, SKILL_MINING);
			CloseGossipMenuFor(player);
			break;
		case 46:
			CompleteLearnProfession(player, _creature, SKILL_SKINNING);
			CloseGossipMenuFor(player);
			break;
		case 47:
			CompleteLearnProfession(player, _creature, SKILL_TAILORING);
			CloseGossipMenuFor(player);
			break;
		case 48:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_COOKING, GOSSIP_SENDER_MAIN, 49);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_FIRST_AID, GOSSIP_SENDER_MAIN, 50);
			AddGossipItemFor(player, GOSSIP_ICON_TRAINER, MSG_GOSSIP_TEXT_FISHING, GOSSIP_SENDER_MAIN, 51);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 49:
			CompleteLearnProfession(player, _creature, SKILL_COOKING);
			CloseGossipMenuFor(player);
			break;
		case 50:
			CompleteLearnProfession(player, _creature, SKILL_FIRST_AID);
			CloseGossipMenuFor(player);
			break;
		case 51:
			CompleteLearnProfession(player, _creature, SKILL_FISHING);
			CloseGossipMenuFor(player);
			break;
		case 52:
			player->PlayerTalkClass->ClearMenus();
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_GNOME_MALE, GOSSIP_SENDER_MAIN, 53);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_GNOME_FEMALE, GOSSIP_SENDER_MAIN, 54);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_HUMAN_MALE, GOSSIP_SENDER_MAIN, 55);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_HUMAN_FEMALE, GOSSIP_SENDER_MAIN, 56);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_BLOOD_ELF_MALE, GOSSIP_SENDER_MAIN, 57);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_BLOOD_ELF_MALE, GOSSIP_SENDER_MAIN, 58);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_TAUREN_MALE, GOSSIP_SENDER_MAIN, 59);
			AddGossipItemFor(player, GOSSIP_ICON_INTERACT_1, MSG_GOSSIP_TEXT_MORTH_TAUREN_FEMALE, GOSSIP_SENDER_MAIN, 50);
			AddGossipItemFor(player, GOSSIP_ICON_TALK, MSG_GOSSIP_TEXT_MAIN_MENU, GOSSIP_SENDER_MAIN, 21);
			SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
			break;
		case 53:
			player->CastSpell(player, 37808, true);
			CloseGossipMenuFor(player);
			break;
		case 54:
			player->CastSpell(player, 37809, true);
			CloseGossipMenuFor(player);
			break;
		case 55:
			player->CastSpell(player, 35466, true);
			CloseGossipMenuFor(player);
			break;
		case 56:
			player->CastSpell(player, 37805, true);
			CloseGossipMenuFor(player);
			break;
		case 57:
			player->CastSpell(player, 37807, true);
			CloseGossipMenuFor(player);
			break;
		case 58:
			player->CastSpell(player, 37806, true);
			CloseGossipMenuFor(player);
			break;
		case 59:
			player->CastSpell(player, 37810, true);
			CloseGossipMenuFor(player);
			break;
		case 60:
			player->CastSpell(player, 37811, true);
			CloseGossipMenuFor(player);
			break;
		case 61:
			player->RemoveAllAuras();
			CloseGossipMenuFor(player);
			}
		}
		return true;
	}

};

void AddSC_Resets()
{
	new fast_arena_start();
	new System_Censure();
	new npc_buffer;
}
