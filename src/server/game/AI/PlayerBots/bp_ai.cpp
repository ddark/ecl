/*
Playerbot System by Graff (onlysuffering@gmail.com)
Original source: https://github.com/blueboy/portal/commits/new-ai
Type: Rewrite project
Complete: ~10%
TODO:
Everything but this
*/

//#include "Common.h"
#include "ItemPrototype.h"
//#include "World.h"
//#include "SpellMgr.h"
//#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "bot_GridNotifiers.h"
#include "CellImpl.h"
//#include "ProgressBar.h"
#include "Chat.h"
#include "bp_ai.h"
#include "bp_mgr.h"
#include "bp_dk_ai.h"
#include "bp_dru_ai.h"
#include "bp_hun_ai.h"
#include "bp_mag_ai.h"
#include "bp_pal_ai.h"
#include "bp_pri_ai.h"
#include "bp_rog_ai.h"
#include "bp_sha_ai.h"
#include "bp_warl_ai.h"
#include "bp_warr_ai.h"
#include "InstanceSaveMgr.h"
#include "Player.h"
#include "Group.h"
#include "GroupMgr.h"
#include "Pet.h"
//#include "ReputationMgr.h"
#include "ObjectMgr.h"
#include "WorldSession.h"
//#include "Spell.h"
//#include "Unit.h"
//#include "SpellAuras.h"
#include "SpellAuraEffects.h"
//#include "SharedDefines.h"
//#include "Log.h"
#include "GossipDef.h"
//#include "MotionMaster.h"
#include "AuctionHouseMgr.h"
//#include "Mail.h"
#include "Guild.h"
//#include "GuildMgr.h"
#include "Language.h"
#include <iomanip>
//#include <iostream>

const uint32 VENDOR_MASK = (UNIT_NPC_FLAG_VENDOR | UNIT_NPC_FLAG_VENDOR_AMMO | UNIT_NPC_FLAG_VENDOR_FOOD | UNIT_NPC_FLAG_VENDOR_POISON | UNIT_NPC_FLAG_VENDOR_REAGENT);
Player::BoundInstancesMap _botBoundInstances[MAX_DIFFICULTY];

AfterCast::AfterCast()
{
    _afterCastTarget = NULL;
}
inline Unit* AfterCast::GetTarget() const
{
    return _afterCastTarget;
}
inline void AfterCast::SetTarget(Unit* target)
{
    _afterCastTarget = target;
}
inline void AfterCast::SetAfterCastCommand(void (*newAfterCast)(Unit*))
{
    afterCast = newAfterCast;
}
inline void AfterCast::LaunchAfterCastCommand()
{
    ASSERT(_afterCastTarget);

    return (*afterCast)(_afterCastTarget);
}

class PlayerbotChatHandler : public ChatHandler
{
public:
    explicit PlayerbotChatHandler(WorldSession* masterSession) : ChatHandler(masterSession) {}
    bool revive(Player& botPlayer) { return HandleReviveCommand(this, botPlayer.GetName().c_str()); }
    bool teleport(Player& botPlayer) { return HandleSummonCommand(this, botPlayer.GetName().c_str()); }
    //bool teleport(Player& botPlayer, WorldObject &obj) { return botPlayer.TeleportTo(obj); }
    void sysmessage(char const* str) { SendSysMessage(str); }
    bool dropQuest(char const* str) { return HandleQuestRemove(this, str); }
private:
    static bool HandleReviveCommand(ChatHandler* handler, char const* args)
    {
        Player* target;
        uint64 targetGuid;
        std::string targetName;
        if (!handler->extractPlayerTarget((char*)args, &target, &targetGuid, &targetName))
            return false;

        //Player* _player = handler->GetSession()->GetPlayer();
        if (!target || target->isAlive() || target->InArena())
        {
            handler->PSendSysMessage("Resurrection player %s, failed", uint32(GUID_LOPART(targetGuid)));
            handler->SetSentErrorMessage(true);
            return false;
        }

        target->ResurrectPlayer(target->InBattleground() ? 1.0f : 0.5f);
        target->SpawnCorpseBones();

        handler->SetSentErrorMessage(true);
        return true;
    }

    static bool HandleSummonCommand(ChatHandler* handler, char const* args)
    {
        Player* target;
        uint64 targetGuid;
        std::string targetName;
        if (!handler->extractPlayerTarget((char*)args, &target, &targetGuid, &targetName))
            return false;

        Player* _player = handler->GetSession()->GetPlayer();
        if (target == _player || targetGuid == _player->GetGUID())
        {
            handler->PSendSysMessage(LANG_CANT_TELEPORT_SELF);
            handler->SetSentErrorMessage(true);
            return false;
        }

        if (target)
        {
            std::string nameLink = handler->playerLink(targetName);

            if (target->IsBeingTeleported())
            {
                handler->PSendSysMessage(LANG_IS_TELEPORTED, nameLink.c_str());
                handler->SetSentErrorMessage(true);
                return false;
            }

            Map* map = handler->GetSession()->GetPlayer()->GetMap();

            if (map->IsBattlegroundOrArena())
            {
                //// only allow if gm mode is on
                //if (!_player->isGameMaster())
                //{
                //    handler->PSendSysMessage(LANG_CANNOT_GO_TO_BG_GM, nameLink.c_str());
                //    handler->SetSentErrorMessage(true);
                //    return false;
                //}
                // if both players are in different bgs
                /*else */if (target->GetBattlegroundId() && handler->GetSession()->GetPlayer()->GetBattlegroundId() != target->GetBattlegroundId())
                    target->LeaveBattleground(false); // Note: should be changed so target gets no Deserter debuff

                // all's well, set bg id
                // when porting out from the bg, it will be reset to 0
                target->SetBattlegroundId(handler->GetSession()->GetPlayer()->GetBattlegroundId(), handler->GetSession()->GetPlayer()->GetBattlegroundTypeId());
                // remember current position as entry point for return at bg end teleportation
                if (!target->GetMap()->IsBattlegroundOrArena())
                    target->SetBattlegroundEntryPoint();
            }
            else if (map->IsDungeon())
            {
                Map* map = target->GetMap();

                if (map->Instanceable() && map->GetInstanceId() != map->GetInstanceId())
                    target->UnbindInstance(map->GetInstanceId(), target->GetDungeonDifficulty(), true);

                //// we are in instance, and can summon only player in our group with us as lead
                //if (!handler->GetSession()->GetPlayer()->GetGroup() || !target->GetGroup() ||
                //    (target->GetGroup()->GetLeaderGUID() != handler->GetSession()->GetPlayer()->GetGUID()) ||
                //    (handler->GetSession()->GetPlayer()->GetGroup()->GetLeaderGUID() != handler->GetSession()->GetPlayer()->GetGUID()))
                //    // the last check is a bit excessive, but let it be, just in case
                //{
                //    handler->PSendSysMessage(LANG_CANNOT_SUMMON_TO_INST, nameLink.c_str());
                //    handler->SetSentErrorMessage(true);
                //    return false;
                //}
            }

            //handler->PSendSysMessage(LANG_SUMMONING, nameLink.c_str(), "");
            //if (handler->needReportToTarget(target))
            //    ChatHandler(target).PSendSysMessage(LANG_SUMMONED_BY, handler->playerLink(_player->GetName()).c_str());

            // stop flight if need
            if (target->isInFlight())
            {
                target->GetMotionMaster()->MovementExpired();
                target->CleanupAfterTaxiFlight();
            }
            // save only in non-flight case
            else
                target->SaveRecallPosition();

            // before GM
            float x, y, z;
            handler->GetSession()->GetPlayer()->GetClosePoint(x, y, z, target->GetObjectSize());
            target->TeleportTo(handler->GetSession()->GetPlayer()->GetMapId(), x, y, z, target->GetOrientation(), TELE_TO_GM_MODE);
            target->SetPhaseMask(handler->GetSession()->GetPlayer()->GetPhaseMask(), true);
        }
        else
        {
            //std::string nameLink = handler->playerLink(targetName);

            //handler->PSendSysMessage(LANG_SUMMONING, nameLink.c_str(), handler->GetTrinityString(LANG_OFFLINE));

            // in point where GM stay
            Player::SavePositionInDB(handler->GetSession()->GetPlayer()->GetMapId(),
                handler->GetSession()->GetPlayer()->GetPositionX(),
                handler->GetSession()->GetPlayer()->GetPositionY(),
                handler->GetSession()->GetPlayer()->GetPositionZ(),
                handler->GetSession()->GetPlayer()->GetOrientation(),
                handler->GetSession()->GetPlayer()->GetZoneId(),
                targetGuid);
        }

        return true;
    }

    static bool HandleQuestRemove(ChatHandler* handler, const char* args)
    {
        Player* player = handler->getSelectedPlayer();
        if (!player)
        {
            handler->SendSysMessage(LANG_NO_CHAR_SELECTED);
            handler->SetSentErrorMessage(true);
            return false;
        }

        // .removequest #entry'
        // number or [name] Shift-click form |color|Hquest:quest_id:quest_level|h[name]|h|r
        char* cId = handler->extractKeyFromLink((char*)args, "Hquest");
        if (!cId)
            return false;

        uint32 entry = atol(cId);

        Quest const* quest = sObjectMgr->GetQuestTemplate(entry);

        if (!quest)
        {
            handler->PSendSysMessage(LANG_COMMAND_QUEST_NOTFOUND, entry);
            handler->SetSentErrorMessage(true);
            return false;
        }

        // remove all quest entries for 'entry' from quest log
        for (uint8 slot = 0; slot < MAX_QUEST_LOG_SIZE; ++slot)
        {
            uint32 logQuest = player->GetQuestSlotQuestId(slot);
            if (logQuest == entry)
            {
                player->SetQuestSlot(slot, 0);

                // we ignore unequippable quest items in this case, its' still be equipped
                player->TakeQuestSourceItem(logQuest, false);
            }
        }

        player->RemoveActiveQuest(entry);
        player->RemoveRewardedQuest(entry);

        handler->SendSysMessage(LANG_COMMAND_QUEST_REMOVED);
        return true;
    }
};

PlayerbotAI::PlayerbotAI(PlayerbotMgr* const mgr, Player* const bot) : _mgr(mgr), me(bot), _classAI(NULL)
//m_combatOrder(ORDERS_NONE), m_ScenarioType(SCENARIO_PVE),
//m_TimeDoneEating(0), m_TimeDoneDrinking(0),
//m_CurrentlyCastingSpellId(0), 
//m_CraftSpellId(0), m_spellIdCommand(0),
//m_targetGuidCommand(0),
//m_taxiMaster(0)
{
    //m_bDebugCommandChat = _mgr->m_confDebugWhisper;

    //m_targetChanged = false;
    //m_targetType = TARGET_NORMAL;
    //m_targetCombat = 0;
    //m_targetAssist = 0;
    //m_targetProtect = 0;

    // set collection options
    //m_collectionFlags = 0;
    //m_collectDist = _mgr->m_confCollectDistance;
    //if (_mgr->m_confCollectCombat)
    //    SetCollectFlag(COLLECT_FLAG_COMBAT);
    //if (_mgr->m_confCollectQuest)
    //    SetCollectFlag(COLLECT_FLAG_QUEST);
    //if (_mgr->m_confCollectProfession)
    //    SetCollectFlag(COLLECT_FLAG_PROFESSION);
    //if (_mgr->m_confCollectLoot)
    //    SetCollectFlag(COLLECT_FLAG_LOOT);
    //if (_mgr->m_confCollectSkin && m_bot->HasSkill(SKILL_SKINNING))
    //    SetCollectFlag(COLLECT_FLAG_SKIN);
    //if (_mgr->m_confCollectObjects)
    //    SetCollectFlag(COLLECT_FLAG_NEAROBJECT);

    //// set needed item list
    //SetQuestNeedItems();
    //SetQuestNeedCreatures();

    //// start following master (will also teleport bot to master)
    //m_dropWhite = false;
    //m_AutoEquipToggle = false;
    //m_FollowAutoGo = FOLLOWAUTOGO_OFF; //turn on bot auto follow distance can be turned off by player
    //DistOverRide = 0; //set initial adjustable follow settings
    //IsUpOrDown = 0;
    //gTempDist = 0.5f;
    //gTempDist2 = 1.0f;
    //BotDataRestore();
    //ClearActiveTalentSpec();

    _botStates = 0;
    _combatStates = 0;
    _movementFlags = 0;
    _followTimer = 0;
    _followTargetGUID = 0;
    _waitTimer = 0;
    _mountTimer = 0;
    _cureTimer = 0;
    _selfResTimer = 0;
    _opponent = NULL;
    _afterCast = NULL;

    _canSelfRes = false;

    //get class specific ai
    ReloadClassAI();
    //init motion
    AddBotState(BOTSTATE_FOLLOW);
    //init group (temp)
    //if (me->GetTeamId() != GetMaster()->GetTeamId())
    //    me->setFaction(GetMaster()->getFaction());
    _InviteToMastersGroup();
    //save instance bounds
    for (uint8 i = REGULAR_DIFFICULTY; i != MAX_DIFFICULTY; ++i)
    {
        for (Player::BoundInstancesMap::iterator itr = me->GetBoundInstances(Difficulty(i)).begin(); itr != me->GetBoundInstances(Difficulty(i)).end(); ++itr)
        {
            _botBoundInstances[Difficulty(i)][itr->first].perm = itr->second.perm;
            //reserve current save by creating new (fake) save, any of bot's saves can become invalid in time
            _botBoundInstances[Difficulty(i)][itr->first].save = new InstanceSave(itr->second.save->GetMapId(), itr->second.save->GetInstanceId(), Difficulty(i), itr->second.save->GetResetTime(), itr->second.save->CanReset());
        }
    }
}

PlayerbotAI::~PlayerbotAI()
{
    SQLTransaction trans = CharacterDatabase.BeginTransaction();
    for (uint8 i = REGULAR_DIFFICULTY; i != MAX_DIFFICULTY; ++i)
    {
        Difficulty diff = Difficulty(i);
        for (Player::BoundInstancesMap::iterator itr = _botBoundInstances[i].begin(); itr != _botBoundInstances[i].end(); ++itr)
        {
            if (me->GetBoundInstance(itr->first, diff))
                me->UnbindInstance(itr->first, diff);

            PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_INS_CHAR_INSTANCE);

            stmt->setUInt32(0, me->GetGUIDLow());
            stmt->setUInt32(1, itr->second.save->GetInstanceId());
            stmt->setBool(2, itr->second.perm);

            trans->Append(stmt);
            //if after unbind old save is not unloaded bind to old save, else create new save and save to instance mgr
            //if (InstanceSave* save = sInstanceSaveMgr->AddInstanceSave(itr->second.save->GetMapId(), itr->second.save->GetInstanceId(), diff, itr->second.save->GetResetTime(), itr->second.save->CanReset(), true))
            //    me->BindToInstance(save, itr->second.perm);

            delete itr->second.save; //delete our old fake save
        }

        _botBoundInstances[diff].clear();
    }

    CharacterDatabase.CommitTransaction(trans);

    if (_classAI) delete _classAI;
    if (_afterCast) delete _afterCast;
}

void PlayerbotAI::ReloadClassAI()
{
    if (_classAI)
        delete _classAI;
    _mySpec = PlayerbotMgr::GetSpec(me);
    switch (me->getClass())
    {
        case CLASS_PRIEST:
            _classAI = (PlayerbotClassAI*) new PlayerbotPriestAI(GetMaster(), me, this);
            break;
        case CLASS_MAGE:
            _classAI = (PlayerbotClassAI*) new PlayerbotMageAI(GetMaster(), me, this);
            break;
        case CLASS_WARLOCK:
            _classAI = (PlayerbotClassAI*) new PlayerbotWarlockAI(GetMaster(), me, this);
            break;
        case CLASS_WARRIOR:
            _classAI = (PlayerbotClassAI*) new PlayerbotWarriorAI(GetMaster(), me, this);
            break;
        case CLASS_SHAMAN:
            _classAI = (PlayerbotClassAI*) new PlayerbotShamanAI(GetMaster(), me, this);
            break;
        case CLASS_PALADIN:
            _classAI = (PlayerbotClassAI*) new PlayerbotPaladinAI(GetMaster(), me, this);
            break;
        case CLASS_ROGUE:
            _classAI = (PlayerbotClassAI*) new PlayerbotRogueAI(GetMaster(), me, this);
            break;
        case CLASS_DRUID:
            _classAI = (PlayerbotClassAI*) new PlayerbotDruidAI(GetMaster(), me, this);
            break;
        case CLASS_HUNTER:
            _classAI = (PlayerbotClassAI*) new PlayerbotHunterAI(GetMaster(), me, this);
            break;
        case CLASS_DEATH_KNIGHT:
            _classAI = (PlayerbotClassAI*) new PlayerbotDeathKnightAI(GetMaster(), me, this);
            break;
    }

    //HERB_GATHERING      = initSpell(HERB_GATHERING_1);
    //MINING              = initSpell(MINING_1);
    //SKINNING            = initSpell(SKINNING_1);
}

void PlayerbotAI::UpdateAI(uint32 diff)
{
    _doTimers(diff);

    //disabled AI check point 1
    if (!_classAI || me->IsBeingTeleported() || !me->IsInWorld() || !me->FindMap())
        return;

    //debug remove root
    if (!me->HasUnitState(UNIT_STATE_CASTING))
    {
        if (me->HasAura(SPELL_ROOT))
            me->RemoveAura(SPELL_ROOT);
        //process aftercast
        //Aftercast should be created in certain cast action
        //TODO: aftercast pack
        if (_afterCast != NULL)
        {
            _afterCast->LaunchAfterCastCommand();
            delete _afterCast;
            _afterCast = NULL;
        }
    }

    if (_waitTimer > diff)
        return;

    _waitTimer = 600 + (_mgr->GetPlayerBotsCount() - 1) * 50;//up to a sec

    //DEATH BEHAVIOUR 99.5%
    if (me->isDead())
    {
        UpdateDeadActions(diff);
        return;
    }

    //disabled AI check point 2
    if (me->isInFlight() || me->isCharmed() || me->GetTrader())
        return;

    //BreakCC(diff);
    if (CCed(me)) return;

    //POTIONS/FLASKS/etc. (opt)

    //CURE / HEAL / CLASS SPECIFIC / NON-COMBAT ACTIONS
    _classAI->UpdateGroupActions(diff);

    //MISC ACTIONS

    //INCOMBAT UPDATE PAI 70% else is CAI
    if (HasAttackTarget(me->getClass(), _mySpec))
    {
        if (me->IsMounted())
            UpdateMountedState(diff);

        UpdateIncombatActions();
        return;
    }

    //OUT OF COMBAT BEHAVIOUR 1%
    if (HasBotState(BOTSTATE_LOOTING))
    {
        //TODO: LOOT
    }
    else if (!me->isInCombat())
    {
        //TODO: UpdateNonCombatActions();
        //TODO: UpdateRations();
        AddBotState(BOTSTATE_FOLLOW);
    }

    if (HasBotState(BOTSTATE_FOLLOW))
        UpdateFollowActions(diff);

    UpdateStandState();

    //DELAYED OPERATIONS

    //TODO: TAME

    //TODO: DIRECT CAST

    //TODO: CRAFTING

    //TODO: ORDERS (opt)
}

void PlayerbotAI::UpdateDeadActions(uint32 diff)
{
    if (!_canSelfRes)
    {
        _selfResTimer = GetMaster()->isInCombat() ? 2000 : 10000;
        if (Map* map = GetMaster()->FindMap())
            if (map->IsRaidOrHeroicDungeon())
                _selfResTimer /= 2;
        _canSelfRes = true;
        return;
    }

    if (_selfResTimer > diff)
        return;

    if (me->getDeathState() == CORPSE)
    {
        //debug
        //if (me->GetCorpse())
        //{
        //    TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: UpdateDeadActions - %s already has a corpse!", me->GetName().c_str());
        //    //m_bot->setDeathState(DEAD);
        //    return;
        //}
        //clear loot
        //m_lootTargets.clear();
        //m_lootCurrent = 0;

        //has selfRezz
        if (me->GetUInt32Value(PLAYER_SELF_RES_SPELL))
        {
            WorldPacket p;//not really used
            me->GetSession()->HandleSelfResOpcode(p);
            return;
        }

        me->BuildPlayerRepop();
        me->setDeathState(DEAD);
        //me->ResetDeathTimer();//release 
        //me->RepopAtGraveyard();
    }
    //else if (m_bot->getDeathState() == DEAD) //appears to be unused for players
    else if (me->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
    {
        Corpse* corpse = me->GetCorpse();
        //debug
        if (!corpse)
        {
            //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: UpdateAI - %s has no corpse!", me->GetName().c_str());
            //m_bot->setDeathState(CORPSE);
            return;
        }
        //check reclaim distance, teleport if needed
        if (me->GetDistance(corpse) > CORPSE_RECLAIM_RADIUS)
        {
            //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: UpdateAI - Teleport %s to corpse...", me->GetName().c_str());
            me->TeleportTo(*corpse, TELE_TO_GM_MODE);
        }
        //check reclaim delay
        int32 delay = (corpse->GetGhostTime() + me->GetCorpseReclaimDelay(corpse->GetType() == CORPSE_RESURRECTABLE_PVP)) - time(NULL);
        if (delay > 0)
        {
            //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: UpdateAI - %s has to wait for %u seconds to revive...", me->GetName().c_str(), uint32(delay));
            return;
        }
        //revive by master
        //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: UpdateAI - Reviving %s...", me->GetName().c_str());
        if (!PlayerbotChatHandler(GetMaster()->GetSession()).revive(*me))
        {
            //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s could not be revived ...", me->GetName().c_str());
            return;
        }
    }
    _canSelfRes = false;
}

void PlayerbotAI::UpdateIncombatActions()
{
    //SHEATH
    if (!me->HasUnitState(UNIT_STATE_CASTING) && !me->IsMounted())
    {
        SheathState sheath = ShouldRanged() ? SHEATH_STATE_RANGED : SHEATH_STATE_MELEE;
        if (me->GetSheath() != sheath)
            me->SetSheath(sheath);
    }

    //CC CAI full
    { }

    //handle target
    if (Unit* u = me->getVictim())
    {
        //POSITION
        if (me->GetDistance2d(u) > GetMinAttackRange(u) && !ShouldStay())
        {
            GetInPosition(true, ShouldRanged());
            //return;
        }
        //ANGLE (emulated)
        else if (!me->HasInArc(M_PI*0.5f, u))
        {
            float x = me->GetPositionX() - (me->GetPositionX() - u->GetPositionX())*0.05f;
            float y = me->GetPositionY() - (me->GetPositionY() - u->GetPositionY())*0.05f;
            float z = me->GetPositionZ() - (me->GetPositionZ() - u->GetPositionZ())*0.05f;
            me->GetMotionMaster()->MovePoint(me->GetMapId(), x, y, z);
            //me->SetFacingToObject(u);
        }

        //ATTACK CAI full
        _classAI->DoCombatActions();

        return;
    }

    //no target
    ClearBotState(BOTSTATE_COMBAT);
}

void PlayerbotAI::UpdateFollowActions(uint32 diff)
{
    if (_followTimer > diff)
        return;

    _followTimer = 2000;

    if (me->HasUnitState(UNIT_STATE_CASTING) || CCed(me, true))
        return;

    if (me->getVictim())
    {
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s tried following while still fighting!", me->GetName().c_str());
        return;
    }

    //debug
    if ((CanFollowOthers()) != (_followTargetGUID != 0))
    {
        if (CanFollowOthers() && _followTargetGUID == 0)
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s should follow someone else but has no target specified!", me->GetName().c_str());
        else if (!CanFollowOthers() && _followTargetGUID != 0)
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s has follow target specified but cannot follow it!", me->GetName().c_str());
        //force follow master
        _followTargetGUID = 0;
        ClearMovementFlag(MOVEMENT_FLAG_TARGET_CHANGED);
    }

    //get follow target:
    //a) current follow target (selected)
    //b) follow target set by master
    //c) master
    //if player target is dead use it's corpse as follow target
    WorldObject* fTarget = NULL;
    if (uint64 sel = me->GetSelection())
    {
        if (!me->GetGroup() || me->GetGroup()->IsMember(sel))
            fTarget = sObjectAccessor->GetPlayer(*me, sel);
    }
    else if (Group* group = me->GetGroup())
    {
        if (group == GetMaster()->GetGroup())
            fTarget = GetMaster();
    }
    else if (_followTargetGUID != 0)
    {
        fTarget = sObjectAccessor->GetPlayer(*me, _followTargetGUID);
        if (fTarget->GetTypeId() == TYPEID_PLAYER && fTarget->ToPlayer()->isDead() && fTarget->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
            fTarget = fTarget->ToPlayer()->GetCorpse();
    }
    else
    {
        if (GetMaster()->isDead() && GetMaster()->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
            fTarget = GetMaster()->GetCorpse();
        else
            fTarget = GetMaster();
    }

    if (!fTarget)
    {
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s has no follow target! Set to master...", me->GetName().c_str());
        fTarget = GetMaster();
        _followTargetGUID = 0;
        ClearMovementFlag(MOVEMENT_FLAG_TARGET_CHANGED);
    }

    //unsafe
    if (me->GetPhaseMask() != fTarget->GetPhaseMask())
        me->SetPhaseMask(fTarget->GetPhaseMask(), true);

    Player* fPlayer = fTarget->ToPlayer();

    //flight check (all such checks should go here)
    if (!fTarget->IsInWorld() || !fTarget->FindMap() ||
        (fPlayer && (fPlayer->isInFlight() || fPlayer->IsBeingTeleported())))
    {
        _followTimer = 5000;
        return;
    }

    //teleport if too far away
    Map const* const mymap = me->GetMap();
    Map const* const tarmap = fTarget->GetMap();
    if (mymap != tarmap || me->GetDistance2d(fTarget) > sWorld->GetMaxVisibleDistanceOnContinents())
    {
        if (fPlayer && tarmap->Instanceable() && mymap != tarmap)
        {
            Difficulty diff = fPlayer->GetDifficulty(tarmap->IsRaid());
            if (InstancePlayerBind* bind = me->GetBoundInstance(tarmap->GetId(), diff))
                _UnbindInstance(tarmap->GetId(), diff);
        }
        me->TeleportTo(*fTarget, TELE_TO_GM_MODE);
        return;

    }

    //sheath additive
    if (me->GetSheath() != SHEATH_STATE_UNARMED && _mgr->Rand() < 30)
        me->SetSheath(SHEATH_STATE_UNARMED);

    if (!me->HasUnitState(UNIT_STATE_FOLLOW))
        SetMovement(fTarget);

    //only if following master
    if (fTarget->GetGUID() == GetMaster()->GetGUID())
        UpdateMountedState(diff);
}

void PlayerbotAI::UpdateStandState()
{
    //only if following master
    if (_followTargetGUID != 0)
        return;

    if (GetMaster()->getStandState() == UNIT_STAND_STATE_STAND && me->getStandState() == UNIT_STAND_STATE_SIT &&
        !(me->GetInterruptMask() & AURA_INTERRUPT_FLAG_NOT_SEATED))
        me->SetStandState(UNIT_STAND_STATE_STAND);
    if (GetMaster()->getStandState() == UNIT_STAND_STATE_SIT && me->getStandState() == UNIT_STAND_STATE_STAND &&
        !me->isInCombat() && !me->isMoving() && !me->IsMounted())
        me->SetStandState(UNIT_STAND_STATE_SIT);
}

void PlayerbotAI::UpdateMountedState(uint32 diff)
{
    //dismount
    if (!GetMaster()->IsMounted() || ((me->isInCombat() || !me->getAttackers().empty()) && HasBotState(BOTSTATE_COMBAT)))
    {
        if (me->HasAuraType(SPELL_AURA_MOUNTED))
            me->RemoveAurasByType(SPELL_AURA_MOUNTED);
        return;
    }

    if (_mountTimer > diff)
        return;

    _mountTimer = 500;

    //cannot mount in water, in combat, if mounted somehow (some encounter)
    if (me->HasUnitMovementFlag(MOVEMENTFLAG_SWIMMING) || me->isInCombat() || me->IsMounted())
        return;

    //TODO: HUGE
    //Player Part
    Unit::AuraEffectList const& auraList = GetMaster()->GetAuraEffectsByType(SPELL_AURA_MOUNTED);
    if (!auraList.empty())
    {
        SpellInfo const* spellInfo = auraList.front()->GetSpellInfo();
        if (!spellInfo)
        {
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s tried to mount but master %s is mounted by spell with no spellInfo!", me->GetName().c_str(), GetMaster()->GetName().c_str());
            return;
        }

        //Bot Part
        uint32 spellMount = 0;
        //cheap check if we know this spell
        for (PlayerSpellMap::iterator itr = me->GetSpellMap().begin(); itr != me->GetSpellMap().end(); ++itr)
        {
            //if (itr->second->state == PLAYERSPELL_REMOVED || itr->second->disabled)
            //    continue;

            //cheap check if we just have the same mount
            uint32 spellId = itr->first;
            if (spellInfo->Id == spellId)
            {
                spellMount = spellId;
                break;
            }
        }
        if (!spellMount)
        {
            //analyze and find proper mount spell
            for (PlayerSpellMap::iterator itr = me->GetSpellMap().begin(); itr != me->GetSpellMap().end(); ++itr)
            {
                //if (itr->second->state == PLAYERSPELL_REMOVED || itr->second->disabled)
                //    continue;
                uint32 spellId = itr->first;
                SpellInfo const* bSpellInfo = sSpellMgr->GetSpellInfo(spellId);
                if (!bSpellInfo || bSpellInfo->IsPassive())
                    continue;

                for (uint8 i = 0; i != MAX_SPELL_EFFECTS; ++i)
                {
                    if (bSpellInfo->Effects[i].ApplyAuraName == SPELL_AURA_MOUNTED)
                    {
                        //arrange values
                        int8 j = i-1, k = i+1;
                        if (j < 0)// i == 0
                            j = k+1;//2
                        else if (k >= MAX_SPELL_EFFECTS)// i == 2
                            k = j-1;//0

                        if (bSpellInfo->Effects[j].ApplyAuraName == SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED)
                        {
                            for (uint8 i = 0; i != MAX_SPELL_EFFECTS; ++i)
                            {
                                if (spellInfo->Effects[i].BasePoints == bSpellInfo->Effects[j].BasePoints)
                                {
                                    spellMount = spellId;
                                    break;
                                }
                            }
                            if (spellMount)
                                break;
                        }
                        else if (bSpellInfo->Effects[k].ApplyAuraName == SPELL_AURA_MOD_INCREASE_MOUNTED_FLIGHT_SPEED)
                        {
                            for (uint8 i = 0; i != MAX_SPELL_EFFECTS; ++i)
                            {
                                if (spellInfo->Effects[i].BasePoints == bSpellInfo->Effects[k].BasePoints)
                                {
                                    spellMount = spellId;
                                    break;
                                }
                            }
                            if (spellMount)
                                break;
                        }
                        else if (bSpellInfo->Effects[j].ApplyAuraName == SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED)
                        {
                            for (uint8 i = 0; i != MAX_SPELL_EFFECTS; ++i)
                            {
                                if (spellInfo->Effects[i].BasePoints == bSpellInfo->Effects[j].BasePoints)
                                {
                                    spellMount = spellId;
                                    break;
                                }
                            }
                            if (spellMount)
                                break;
                        }
                        else if (bSpellInfo->Effects[k].ApplyAuraName == SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED)
                        {
                            for (uint8 i = 0; i != MAX_SPELL_EFFECTS; ++i)
                            {
                                if (spellInfo->Effects[i].BasePoints == bSpellInfo->Effects[k].BasePoints)
                                {
                                    spellMount = spellId;
                                    break;
                                }
                            }
                            if (spellMount)
                                break;
                        }
                    }
                }
                if (spellMount)
                    break;
            }
        }
        if (spellMount)
        {
            CastSpell(me, spellMount);
        }
        else
        {
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s cannot find a proper mount!", me->GetName().c_str());
            //SendWhisper("Cannot find approriate mount!", *GetMaster());
        }
    }
}

bool PlayerbotAI::HasAttackTarget(uint8 /*myclass*/, uint32 myspec)
{
    bool ranged = false;
    bool byspell = false;
    bool reset = false;

    //choose proper targeting mode
    //step 1: by spec
    //step 2: check conditions
    switch (MainSpec(myspec))
    {
        case MAGE_SPEC_FIRE:
        case MAGE_SPEC_FROST:
        case MAGE_SPEC_ARCANE:
        case PRIEST_SPEC_DISCIPLINE:
        case PRIEST_SPEC_HOLY:
        case PRIEST_SPEC_SHADOW:
        case SHAMAN_SPEC_ELEMENTAL:
        case SHAMAN_SPEC_RESTORATION:
        case DRUID_SPEC_RESTORATION:
        case DRUID_SPEC_BALANCE:
        case WARLOCK_SPEC_DESTRUCTION:
        case WARLOCK_SPEC_AFFLICTION:
        case WARLOCK_SPEC_DEMONOLOGY:
        {
            ranged = true;
            byspell = true;
            break;
        }
        case PALADIN_SPEC_HOLY:
        //case PALADIN_SPEC_PROTECTION:
        {
            byspell = true;
            break;
        }
        case HUNTER_SPEC_BEASTMASTERY:
        case HUNTER_SPEC_SURVIVAL:
        case HUNTER_SPEC_MARKSMANSHIP:
        {
            ranged = true;
            break;
        }
        default:
            break;
    }

    //TODO: wand (casters) / melee (hunter)
    //switch (myclass)
    //{
    ////wand users
    //case CLASS_WARLOCK:
    //case CLASS_PRIEST:
    //case CLASS_MAGE:
    //{
    //    if (GetManaPCT(me) < 5)
    //    {
    //    }
    //}

    //}

    _opponent = GetAttackTarget(byspell, ranged, reset);

    if (!_opponent)
    {
        me->AttackStop();
        ClearBotState(BOTSTATE_COMBAT);
        return false;
    }

    AddBotState(BOTSTATE_COMBAT);
    if (_opponent->GetTypeId() == TYPEID_PLAYER)
        AddCombatState(COMBAT_STATE_PVP);
    ClearBotState(BOTSTATE_FOLLOW);
    if (reset)
        AddCombatState(COMBAT_STATE_RESET);

    if (me->IsMounted())
        UpdateMountedState(0);//now

    if (!me->IsMounted() && _opponent != me->getVictim())
        me->Attack(_opponent, !ranged);

    return true;
}

Unit* PlayerbotAI::GetAttackTarget(bool /*ranged*/, bool byspell, bool &reset) const
{
    //Check if need to assist master
    Unit* u = GetMaster()->getVictim();
    Unit* mytar = me->getVictim();

    //1) heck for common target
    if (u && u == mytar)
    {
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s continues attack common target %s", me->GetName().c_str(), u->GetName().c_str());
        return u;
    }

    //TODO:
    ////Follow if...
    //uint8 followdist = master->GetBotFollowDist();
    //float foldist = _getAttackDistance(float(followdist));
    //if (!u && master->isAlive() && (me->GetDistance(master) > foldist || (mytar && master->GetDistance(mytar) > foldist && me->GetDistance(master) > foldist)))
    //{
    //    //TC_LOG_ERROR(LOG_FILTER_PLAYER, "bot %s cannot attack target %s, too far away", me->GetName().c_str(), mytar ? mytar->GetName().c_str() : "");
    //    return NULL;
    //}

    //2) accuring master's target (new target, if have no target or attacking something else)
    if (u && (GetMaster()->isInCombat() || u->isInCombat()) && !IsUnitInDuel(u, GetMaster()) && !IsUnitInPlayersParty(u, GetMaster()))
    {
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s starts attack master's target %s", me->GetName().c_str(), u->GetName().c_str());
        return u;
    }

    if (CanPlayerbotAttack(me, mytar, byspell)/* && !IsUnitInDuel(mytar, GetMaster())*/)
    {
        //if (me->GetDistance(mytar) > (ranged ? 20.f : 5.f) && m_botCommandState != COMMAND_STAY && m_botCommandState != COMMAND_FOLLOW)
        reset = (me->GetDistance(mytar) > GetMinAttackRange(mytar));
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s continues attack its target %s (reset = %u)", me->GetName().c_str(), mytar->GetName().c_str(), uint8(reset));
        return mytar;
    }

    //if (followdist == 0 && master->isAlive())
    //    return NULL; //do not bother

    //Check group
    //1) create playerlist
    std::set<Player*> playerSet;
    Group const* gr = GetMaster()->GetGroup();
    if (!gr)
    {
        playerSet.insert(GetMaster());
        for (PlayerBotMap::const_iterator itr = _mgr->GetPlayerBotsBegin(); itr != _mgr->GetPlayerBotsEnd(); ++itr)
        {
            Player* pl = itr->second;
            if (!pl || !pl->IsInWorld() || pl->IsBeingTeleported() || me->GetMap() != pl->FindMap() || !pl->InSamePhase(me))
                continue;
            playerSet.insert(itr->second);
        }
    }
    else
    {
        for (GroupReference const* ref = gr->GetFirstMember(); ref != NULL; ref = ref->next())
        {
            Player* pl = ref->getSource();
            if (!pl || !pl->IsInWorld() || pl->IsBeingTeleported() || me->GetMap() != pl->FindMap() || !pl->InSamePhase(me))
                continue;
            playerSet.insert(pl);
            for (PlayerBotMap::const_iterator itr = _mgr->GetPlayerBotsBegin(); itr != _mgr->GetPlayerBotsEnd(); ++itr)
            {
                pl = itr->second;
                if (!pl || !pl->IsInWorld() || pl->IsBeingTeleported() || me->GetMap() != pl->FindMap() || !pl->InSamePhase(me))
                    continue;
                playerSet.insert(itr->second);
            }
        }
    }
    //2) cycle through to find proper target; check players and their npcbots (and their bot pets)
    for (std::set<Player*>::const_iterator itr = playerSet.begin(); itr != playerSet.end(); ++itr)
    {
        Player* pl = (*itr);
        u = pl->getVictim();
        if (u && pl != GetMaster() && CanPlayerbotAttack(me, u, byspell) && (pl->isInCombat() || u->isInCombat()))
        {
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s hooked %s's victim %s", me->GetName().c_str(), pl->GetName().c_str(), u->GetName().c_str());
            return u;
        }
        if (!pl->HaveBot()) continue;
        for (uint8 i = 0; i != pl->GetMaxNpcBots(); ++i)
        {
            Creature* bot = pl->GetBotMap(i)->_Cre();
            if (!bot || !bot->IsInWorld() || me->GetMap() != bot->FindMap() || !bot->InSamePhase(me))
                continue;
            u = bot->getVictim();
            if (u && CanPlayerbotAttack(me, u, byspell) && (bot->isInCombat() || u->isInCombat()))
            {
                TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s hooked %s's victim %s", me->GetName().c_str(), bot->GetName().c_str(), u->GetName().c_str());
                return u;
            }
            Creature* pet = bot->GetIAmABot() ? bot->GetBotsPet() : NULL;
            if (!pet || !pet->InSamePhase(me)) continue;
            u = pet->getVictim();
            if (u && CanPlayerbotAttack(me, u, byspell) && (pet->isInCombat() || u->isInCombat()))
            {
                TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s hooked %s's victim %s", me->GetName().c_str(), pet->GetName().c_str(), u->GetName().c_str());
                return u;
            }
        }
    }

    //Check targets around
    Unit* t = NULL;
    float maxdist = sWorld->GetMaxVisibleDistanceOnContinents();
    //first cycle we search non-cced target, then, if not found, check all
    for (uint8 i = 0; i != 2; ++i)
    {
        if (!t)
        {
            bool attackCC = bool(i);

            CellCoord p(Trinity::ComputeCellCoord(me->GetPositionX(), me->GetPositionY()));
            Cell cell(p);
            cell.SetNoCreate();

            NearestHostileUnitCheck check(me, maxdist, byspell, NULL, attackCC);
            Trinity::UnitLastSearcher <NearestHostileUnitCheck> searcher(me, t, check);
            me->VisitNearbyWorldObject(maxdist, searcher);

            TypeContainerVisitor<Trinity::UnitLastSearcher <NearestHostileUnitCheck>, WorldTypeMapContainer > world_unit_searcher(searcher);
            TypeContainerVisitor<Trinity::UnitLastSearcher <NearestHostileUnitCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);
            cell.Visit(p, world_unit_searcher, *me->GetMap(), *me, maxdist);
            cell.Visit(p, grid_unit_searcher, *me->GetMap(), *me, maxdist);
        }
    }

    //Duel check, should come after common target
    //here we don't check anything (yet)
    if (!t)
    {
        t = me->duel ? me->duel->opponent : NULL;
    }

    if (t)
    {
        if (_opponent && t != _opponent)
        {
            TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::GetAttackTarget(): bot %s has Found a new target %s", me->GetName().c_str(), t->GetName().c_str());
            reset = true;
        }
    }

    return t;
}

void PlayerbotAI::GetInPosition(bool force, bool ranged, Unit* target, Position* /*pos*/)
{
    if (me->HasUnitState(UNIT_STATE_CASTING) || CCed(me, true))
        return;
    if (!target)
        target = me->getVictim();
    if (!target)
        return;
    if (!target->isInCombat() && !force)
        return;

    me->GetMotionMaster()->MoveChase(target, ShouldRanged() ? GetMinAttackRange(target) : 0);

    //TODO: Position
    if (!me->HasUnitState(UNIT_STATE_MELEE_ATTACKING) || target != me->getVictim())
        me->Attack(target, !ranged);
}

void PlayerbotAI::SetMovement(WorldObject* followTarget)
{
    if (!followTarget || !followTarget->IsInWorld() || me->GetMap() != followTarget->FindMap())
        return;

    //outrun case should be handled outside, with teleport
    if (me->GetDistance(followTarget) > sWorld->GetMaxVisibleDistanceOnContinents())
        return;

    if (me->HasUnitState(UNIT_STATE_CASTING) || CCed(me, true))
        return;

    //force selection
    //if (me->GetSelection() != followTarget->GetGUID())
    //    me->SetSelection(followTarget->GetGUID());

    //can we actually move?
    bool canMove = me->isInCombat() ? !ShouldStay() : CanMove();
    if (!canMove)
    {
        if (!me->HasInArc(M_PI*0.8f, followTarget))
        {
            me->SetFacingToObject(followTarget);
            me->SendUpdateToPlayer(GetMaster());
        }
        return;
    }

    //pick proper follow mode
    bool chase = false;
    Unit* unit = followTarget->ToUnit();
    if (unit)
        chase = HasBotState(BOTSTATE_COMBAT);
    if (chase)
    {
        me->GetMotionMaster()->MoveChase(unit);
    }
    else
    {
        //TODO: angle
        if (unit)
            me->GetMotionMaster()->MoveFollow(unit, frand(_mgr->m_confFollowDistance[0], _mgr->m_confFollowDistance[1]), frand(0, 2*M_PI));
        else //corpse etc.
        {
            float x(0),y(0),z(0);
            followTarget->GetNearPoint(me, x, y, z, 0.f, frand(_mgr->m_confFollowDistance[0], _mgr->m_confFollowDistance[1]), frand(0, 2*M_PI));
            me->GetMotionMaster()->MovePoint(followTarget->GetMapId(), x, y, z);
        }
    }
}

uint32 PlayerbotAI::InitSpell(Player* caster, uint32 baseSpell)
{
    if (baseSpell == 0 || !caster || !caster->HasSpell(baseSpell))
        return 0;

    uint32 next = 0;
    SpellChainNode const* Node = sSpellMgr->GetSpellChainNode(baseSpell);
    next = Node && Node->next ? Node->next->Id : 0;

    if (next == 0 || !caster->HasSpell(next)) //next spell in chain doesn't exist or unavailable
        return baseSpell;

    //SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(baseSpell);
    //TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI::InitSpell() proceed spell %u (%s): forwarding to %u (%s)", baseSpell, spellInfo->SpellName[0], next, sSpellMgr->GetSpellInfo(next)->SpellName[0]);
    return InitSpell(caster, next);
}

bool PlayerbotAI::CastSpell(Unit* victim, uint32 spellId) const
{
    return CastSpell(victim, sSpellMgr->GetSpellInfo(spellId));
}

bool PlayerbotAI::CastSpell(Unit* victim, SpellInfo const* spellInfo) const
{
    ASSERT(victim);

    if (!spellInfo)
        return false;
    if (!victim->IsInWorld() || me->GetPhaseMask() != victim->GetPhaseMask() || me->GetMap() != victim->FindMap())
        return false;
    //cooldown
    if (me->HasSpellCooldown(spellInfo->Id))
        return false;
    //GCD
    if (me->GetGlobalCooldownMgr().HasGlobalCooldown(spellInfo))
        return false;
    //power cost
    if (int32(me->GetPower(Powers(spellInfo->PowerType))) < spellInfo->CalcPowerCost(me, spellInfo->GetSchoolMask()))
        return false;
    //range
    bool friendly = me->IsFriendlyTo(victim);
    if (me->GetDistance(victim) > spellInfo->GetMaxRange(friendly, me))
        return false;
    //debug
    if (spellInfo->HasEffect(SPELL_EFFECT_OPEN_LOCK) ||
        spellInfo->HasEffect(SPELL_EFFECT_SKINNING) ||
        spellInfo->HasEffect(SPELL_EFFECT_ENCHANT_ITEM) ||
        spellInfo->HasEffect(SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY))
    {
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s trying to cast wrong spell on unit! %s (%u) on %s", me->GetName().c_str(), spellInfo->SpellName[uint8(GetMaster()->GetSession()->GetSessionDbcLocale())], spellInfo->Id, victim->GetName().c_str());
        //return false;
    }

    TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s casts: %s (%u) on %s", me->GetName().c_str(), spellInfo->SpellName[uint8(GetMaster()->GetSession()->GetSessionDbcLocale())], spellInfo->Id, victim->GetName().c_str());

    //everything checked, prepare character for cast
    //LoS - cheaty ;)
    if (friendly && me->IsWithinLOSInMap(victim))
        me->Relocate(victim);
    //face target - just in case
    if (victim != me/* && !me->HasInArc(M_PI * 0.25f, victim)*/)
    {
        me->SetFacingToObject(victim);
        me->SendUpdateToPlayer(GetMaster());
    }

    Spell* spell = new Spell(me, spellInfo, TRIGGERED_NONE);

    //stop moving
    if (spellInfo->CalcCastTime(me, spell) != 0)
    {
        me->StopMoving();
        //debug add root (removed in SPELL_GO)
        me->AddAura(SPELL_ROOT, me);
    }

    delete spell;

    me->CastSpell(victim, spellInfo);
    //if (spell->CheckCast(true) != SPELL_CAST_OK)
    //{
    //    spell->finish(false);
    //    delete spell;
    //    return false;
    //}
    //SpellCastTargets targets;
    //targets.SetUnitTarget(victim);
    //spell->prepare(&targets);

    //check cast success
    if (GetCurrentSpell() == spell)
    {
        //after cast action setup
        //SHOULD BE MOVED TO CERTAIN AI
        //if (afterCast && _afterCast == NULL)
        //{
        //    _afterCast = new AfterCast();
        //    _afterCast->SetTarget(afterTarget);
        //    _afterCast->SetAfterCastCommand(afterCast);
        //}
        return true;
    }

    return false;
}

bool PlayerbotAI::CastSpell(Item* item, uint32 spellId) const
{
    return CastSpell(item, sSpellMgr->GetSpellInfo(spellId));
}

bool PlayerbotAI::CastSpell(Item* item, SpellInfo const* spellInfo) const
{
    ASSERT(item);

    if (!spellInfo || me->HasSpellCooldown(spellInfo->Id) ||
        me->GetGlobalCooldownMgr().HasGlobalCooldown(spellInfo) ||
        int32(me->GetPower(Powers(spellInfo->PowerType))) < spellInfo->CalcPowerCost(me, spellInfo->GetSchoolMask()))
        return false;
    //debug
    if (!(spellInfo->HasEffect(SPELL_EFFECT_ENCHANT_ITEM) ||
        spellInfo->HasEffect(SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY) ||
        spellInfo->HasEffect(SPELL_EFFECT_DISENCHANT)))
    {
        TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s trying to cast wrong spell on item! %s (%u) on %s", me->GetName().c_str(), spellInfo->SpellName[uint8(GetMaster()->GetSession()->GetSessionDbcLocale())], spellInfo->Id, item->GetTemplate()->Name1.c_str());
        return false;
    }

    TC_LOG_ERROR(LOG_FILTER_PLAYER, "PlayerbotAI: %s casts: %s (%u) on %s", me->GetName().c_str(), spellInfo->SpellName[uint8(GetMaster()->GetSession()->GetSessionDbcLocale())], spellInfo->Id, item->GetTemplate()->Name1.c_str());

    Spell* spell = new Spell(me, spellInfo, TRIGGERED_NONE);

    if (spellInfo->CalcCastTime(me, spell) != 0)
    {
        me->StopMoving();
        me->AddAura(SPELL_ROOT, me);
    }

    delete spell;

    SpellCastTargets targets;
    targets.SetItemTarget(item);
    targets.SetUnitTarget(item->GetOwner());
    me->CastSpell(targets, spellInfo, NULL);

    return (GetCurrentSpell() == spell);
}

void PlayerbotAI::CureGroup(Player* player, uint32 cureSpell, const uint32 diff)
{
    if (!cureSpell || !player)
        return;

    if (_cureTimer > diff)
        return;

    SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(cureSpell);
    if (!spellInfo)
        return;
    if (me->HasSpellCooldown(spellInfo->Id))
        return;
    if (me->GetGlobalCooldownMgr().HasGlobalCooldown(spellInfo))
        return;
    if (int32(me->GetPower(Powers(spellInfo->PowerType))) < spellInfo->CalcPowerCost(me, spellInfo->GetSchoolMask()))
        return;
    if (!IsUnitInPlayersParty(player, GetMaster()))
        return;

    Group const* gr = player->GetGroup();
    if (!gr)
    {
        if (_CureTarget(player, spellInfo))
            return;
        if (Pet* pet = player->GetPet())
            if (_CureTarget(pet, spellInfo))
                return;
        if (!player->HaveBot())
            return;

        for (uint8 i = 0; i != player->GetMaxNpcBots(); ++i)
            if (_CureTarget(player->GetBotMap(i)->_Cre(), spellInfo))
                return;
    }
    else
    {
        bool bots = false;
        Player* tPlayer = NULL;
        for (GroupReference const* itr = gr->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            tPlayer = itr->getSource();
            if (!tPlayer || (!tPlayer->isAlive() && !tPlayer->HaveBot()))
                continue;
            if (!bots && tPlayer->HaveBot())
                bots = true;
            if (_CureTarget(tPlayer, spellInfo))
                return;
            if (Pet* pet = tPlayer->GetPet())
                if (_CureTarget(pet, spellInfo))
                    return;
        }
        if (bots)
        {
            for (GroupReference const* itr = gr->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                tPlayer = itr->getSource();
                if (!tPlayer || !tPlayer->HaveBot())
                    continue;
                for (uint8 i = 0; i != tPlayer->GetMaxNpcBots(); ++i)
                    if (_CureTarget(tPlayer->GetBotMap(i)->_Cre(), spellInfo))
                        return;
            }
        }
    }

    //if no target found (basically) set check delay to prevent useless cycle
    _cureTimer = 2000;
}

inline bool PlayerbotAI::_CureTarget(Unit* target, SpellInfo const* spellInfo) const
{
    return _CanCureTarget(target, spellInfo) ? CastSpell(target, spellInfo) : false;
}

bool PlayerbotAI::_CanCureTarget(Unit* target, SpellInfo const* spellInfo) const
{
    if (!target || !spellInfo)
        return false;

    if (!target->isAlive())
        return false;

    if (!target->IsInWorld() ||
        me->GetMap() != target->FindMap() ||
        me->GetPhaseMask() != target->GetPhaseMask())
         return false;

    if (Player* player = target->ToPlayer())
        if (player->IsBeingTeleported())
            return false;

    if (me->GetDistance(target) > spellInfo->RangeEntry->maxRangeFriend)
        return false;

    if (!IsUnitInPlayersParty(target, GetMaster()))
        return false;

    uint32 dispelMask = 0;
    for (uint8 i = 0; i != MAX_SPELL_EFFECTS; ++i)
        if (spellInfo->Effects[i].Effect == SPELL_EFFECT_DISPEL)
            dispelMask |= SpellInfo::GetDispelMask(DispelType(spellInfo->Effects[i].MiscValue));

    if (dispelMask == 0)
        return false;

    DispelChargesList dispel_list;
    target->GetDispellableAuraList(me, dispelMask, dispel_list);

    return (!dispel_list.empty());
}

void PlayerbotAI::OnBotOutgoingPacket(WorldPacket const& packet)
{
    switch (packet.GetOpcode())
    {
        case SMSG_GROUP_INVITE:
        {
            if (me->GetGroup())
                return;

            if (Group* grp = me->GetGroupInvite())
            {
                //Player const* inviter = sObjectAccessor->FindPlayer(grp->GetLeaderGUID());
                //if (!inviter)
                //    return;

                WorldPacket p;
                if (grp->GetLeaderGUID() != GetMaster()->GetGUID())//(!canObeyCommandFrom(*inviter))
                {
                    std::string buf = "I can't accept your invite unless you first invite my master ";
                    buf += GetMaster()->GetName();
                    buf += ".";
                    me->Whisper(buf, LANG_UNIVERSAL, grp->GetLeaderGUID());//SendWhisper(buf, *inviter);
                    me->GetSession()->HandleGroupDeclineOpcode(p); // packet not used
                }
                else
                {
                    //if (m_bot->IsFriendlyTo(inviter))
                    {
                        //DO NOT UNCOMMENT
                        //p.read_skip<uint32>();

                        grp->RemoveInvite(me);

                        if (grp->IsFull())
                        {
                            me->GetSession()->SendPartyResult(PARTY_OP_INVITE, "", ERR_GROUP_FULL);
                            return;
                        }

                        Player* leader = sObjectAccessor->FindPlayer(grp->GetLeaderGUID());

                        if (!grp->IsCreated())
                        {
                            if (!leader)
                            {
                                grp->RemoveAllInvites();
                                return;
                            }

                            grp->RemoveInvite(leader);
                            grp->Create(leader);
                            sGroupMgr->AddGroup(grp);
                        }

                        if (!grp->AddMember(me))
                            return;

                        grp->BroadcastGroupUpdate();
                    }
                    //else
                    //{
                    //    //TODO: custom group section
                    //}
                }
            }
            return;
        }
    }
}

void PlayerbotAI::HandleTeleportAck()
{
    me->GetMotionMaster()->Clear(true);
    if (me->IsBeingTeleportedNear())
    {
        WorldPacket p = WorldPacket(MSG_MOVE_TELEPORT_ACK, 8 + 4 + 4);
        p.appendPackGUID(me->GetGUID());
        p << uint32(0); // cast flags
        p << uint32(time(NULL)); // time - not used
        me->GetSession()->HandleMoveTeleportAck(p);
    }
    else if (me->IsBeingTeleportedFar())
        me->GetSession()->HandleMoveWorldportAckOpcode();
}

bool PlayerbotAI::CanPlayerbotAttack(Player* bot, Unit* target, int8 byspell)
{
    if (!target || !bot || !bot->IsPlayerBot()) return false;
    Player* master = bot->GetPlayerbotAI()->GetMaster();
    if (!master)
        return false;
    return
       (target->isAlive() && target->IsVisible() && target->isTargetableForAttack() && !IsUnitInPlayersParty(target, master) &&
        (target->IsHostileTo(master) || target->IsHostileTo(bot) ||
        (target->GetReactionTo(master) < REP_FRIENDLY && master->getVictim() == target && (master->isInCombat() || target->isInCombat()))) && //master has pointed this target
        //target->IsWithinLOSInMap(me) &&
        (byspell < 0 || !target->IsImmunedToDamage(byspell ? SPELL_SCHOOL_MASK_MAGIC : SPELL_SCHOOL_MASK_NORMAL)));
}

bool PlayerbotAI::IsUnitInDuel(Unit* target, Player* master)
{
    if (!target) return false;
    bool isbot = target->GetTypeId() == TYPEID_UNIT && (target->ToCreature()->GetIAmABot() || target->ToCreature()->GetIAmABotsPet());
    Player* player = target->GetTypeId() == TYPEID_PLAYER ? target->ToPlayer() : isbot ? target->ToCreature()->GetBotOwner() : NULL;
    if (!player)
    {
        if (!target->IsControlledByPlayer())
            return false;
        player = target->GetCharmerOrOwnerPlayerOrPlayerItself();
    }

    return (player && player->duel && (IsUnitInPlayersParty(player, master) || IsUnitInPlayersParty(player->duel->opponent, master)));
}

bool PlayerbotAI::IsUnitInPlayersParty(Unit* unit, Player* master)
{
    if (!unit || !master) return false;
    if (unit == master) return true;

    //group member case (any player / any npcbot)
    if (Group* gr = master->GetGroup())
        if (gr->IsMember(unit->GetGUID()))
            return true;

    //Player-controlled creature case
    if (Creature* cre = unit->ToCreature())
    {
        //npcbot/npcbot's pet case
        if (Player* owner = cre->GetBotOwner())
        {
            //master's npcbot's pet
            if (owner == master)
                return true;
            else
            {
                //playerbot's npcbot's pet
                if (owner->IsPlayerBot())
                {
                    //master's playerbot's npcbot's pet
                    if (PlayerbotMgr* mgr = master->GetPlayerbotMgr())
                        if (mgr->GetPlayerBot(unit->GetGUID()))
                            return true;
                    //other player's playerbot's npcbot's pet
                    if (master->GetGroup() && master->GetGroup()->IsMember(owner->GetPlayerbotAI()->GetMaster()->GetGUID()))
                        return true;
                }
            }
        }
        //pets, minions, guardians etc.
        else
        {
            uint64 ownerGuid = unit->GetOwnerGUID();
            //controlled by group member
            if (Group* gr = master->GetGroup())
                if (gr->IsMember(ownerGuid))
                    return true;
            //controlled by playerbot
            owner = sObjectAccessor->FindPlayer(ownerGuid);
            if (owner && owner->IsPlayerBot())
            {
                //master's playerbot
                if (PlayerbotMgr* mgr = master->GetPlayerbotMgr())
                    if (mgr->GetPlayerBot(unit->GetGUID()))
                        return true;
                //other player's playerbot
                if (master->GetGroup() && master->GetGroup()->IsMember(owner->GetPlayerbotAI()->GetMaster()->GetGUID()))
                    return true;
            }
        }
    }
    //Player-controlled player case
    else if (Player* bot = unit->ToPlayer())
    {
        //Playerbot case
        if (bot->IsPlayerBot())
        {
            //master's playerbot
            if (PlayerbotMgr* mgr = master->GetPlayerbotMgr())
                if (mgr->GetPlayerBot(unit->GetGUID()))
                    return true;
            //other player's playerbot
            if (master->GetGroup() && master->GetGroup()->IsMember(bot->GetPlayerbotAI()->GetMaster()->GetGUID()))
                return true;
        }
    }

    return false;
}

inline void PlayerbotAI::Tell(std::string const& text, uint64 targetGUID)
{
    if (!targetGUID)
        targetGUID = GetMaster()->GetGUID();
    if (text.empty() || !IS_PLAYER_GUID(targetGUID))
        return;

    me->Whisper(text, LANG_UNIVERSAL, targetGUID);
}

Player* PlayerbotAI::GetMaster() const
{
    return _mgr->GetMaster();
}

inline bool PlayerbotAI::IsMoving() const
{
    return (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == IDLE_MOTION_TYPE ? false : true);
}

inline Spell* PlayerbotAI::GetCurrentSpell() const
{
    for (uint8 i = CURRENT_FIRST_NON_MELEE_SPELL; i != CURRENT_AUTOREPEAT_SPELL; ++i)
        if (Spell* spell = me->GetCurrentSpell(CurrentSpellTypes(i)))
            return spell;

    return NULL;
}

inline uint32 PlayerbotAI::GetCurrentSpellId() const
{
    Spell* spell = GetCurrentSpell();
    return spell ? spell->GetSpellInfo()->Id : 0;
}

inline bool PlayerbotAI::CCed(Unit* unit, bool root)
{
    return unit ? unit->HasUnitState(UNIT_STATE_CONFUSED | UNIT_STATE_STUNNED | UNIT_STATE_FLEEING | UNIT_STATE_DISTRACTED | UNIT_STATE_CONFUSED_MOVE | UNIT_STATE_FLEEING_MOVE) || (root && unit->HasUnitState(UNIT_STATE_ROOT)) : true;
}
uint32 PlayerbotAI::GetLostHP(Unit* unit)
{
    return unit->GetMaxHealth() - unit->GetHealth();
}

uint8 PlayerbotAI::GetHealthPCT(Unit* unit)
{
    return (!unit || unit->isDead()) ? 100 : (unit->GetHealth()*100/unit->GetMaxHealth());
}

uint8 PlayerbotAI::GetManaPCT(Unit* unit)
{
    return (!unit || unit->isDead() || unit->getPowerType() != POWER_MANA) ? 100 : (unit->GetPower(POWER_MANA)*100/unit->GetMaxPower(POWER_MANA));
}

inline float PlayerbotAI::GetMinAttackRange(Unit* target) const
{
    //TODO: range for ranged classes
    return ShouldRanged() ? 19.f : target->GetMeleeReach() * 0.8f;
}

void PlayerbotAI::_UnbindInstance(uint32 mapId, Difficulty diff)
{
    for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
    {
        Player::BoundInstancesMap& binds = me->GetBoundInstances(Difficulty(i));
        for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
        {
            InstanceSave* save = itr->second.save;
            if (itr->first != me->GetMapId() && mapId == itr->first && diff == save->GetDifficulty())
            {
                ChatHandler(GetMaster()->GetSession()).PSendSysMessage("PlayerbotAI: unbinding %s's map: %d inst: %d perm: %s diff: %d canReset: %s", me->GetName().c_str(), itr->first, save->GetInstanceId(), itr->second.perm ? "yes" : "no", save->GetDifficulty(), save->CanReset() ? "yes" : "no");
                me->UnbindInstance(itr, Difficulty(i));
                break;
            }
            else
                ++itr;
        }
    }
}

void PlayerbotAI::_InviteToMastersGroup()
{
    if (Group* gr = GetMaster()->GetGroup())
    {
        if (!gr->IsFull())
        {
            if (!gr->AddMember(me))
                return;
        }
        else if (!gr->isRaidGroup()) //non-raid group is full
        {
            gr->ConvertToRaid();
            if (!gr->AddMember(me))
                return;
        }
        else //raid group is full
            return;
    }
    else
    {
        gr = new Group;
        if (!gr->Create(GetMaster()))
        {
            delete gr;
            return;
        }
        sGroupMgr->AddGroup(gr);
        if (!gr->AddMember(me))
            return;
    }
}

void PlayerbotAI::_SendDebugInfo()
{
    uint8 loc = uint8(me->GetSession()->GetSessionDbcLocale());
    ChatHandler ch(GetMaster()->GetSession());

    ch.PSendSysMessage("Listing stats for %s:", me->GetName().c_str());
    std::ostringstream str1;
    str1 << "1) Botstates: (";
    if (HasBotState(BOTSTATE_FOLLOW))
        str1 << "BOTSTATE_FOLLOW";
    if (HasBotState(BOTSTATE_STAY))
        str1 << " | BOTSTATE_STAY";
    if (HasBotState(BOTSTATE_COMBAT))
        str1 << " | BOTSTATE_COMBAT";
    if (HasBotState(BOTSTATE_LOOTING))
        str1 << " | BOTSTATE_LOOTING";
    if (HasBotState(BOTSTATE_TAME))
        str1 << " | BOTSTATE_TAME";
    if (HasBotState(BOTSTATE_DELAYED))
        str1 << " | BOTSTATE_DELAYED";
    if (HasBotState(BOTSTATE_RESET))
        str1 << " | BOTSTATE_RESET";
    str1 << ')';
    ch.PSendSysMessage(str1.str().c_str());

    std::ostringstream str2;
    str2 << "2) Combatstates: (";
    if (HasCombatState(COMBAT_STATE_RANGED))
        str2 << " | COMBAT_STATE_RANGED";
    if (HasCombatState(COMBAT_STATE_STAY))
        str2 << " | COMBAT_STATE_STAY";
    if (HasCombatState(COMBAT_STATE_PVP))
        str2 << " | COMBAT_STATE_PVP";
    if (HasCombatState(COMBAT_STATE_RESET))
        str2 << " | COMBAT_STATE_RESET";
    str2 << ')';
    ch.PSendSysMessage(str2.str().c_str());

    std::ostringstream str3;
    str3 << "3) MovementFlags: (";
    if (HasMovementFlag(MOVEMENT_FLAG_TARGET_CHANGED))
        str3 << " | MOVEMENT_FLAG_TARGET_CHANGED";
    if (HasMovementFlag(MOVEMENT_FLAG_HOLD_GROUND))
        str3 << " | MOVEMENT_FLAG_HOLD_GROUND";
    if (HasMovementFlag(MOVEMENT_FLAG_RANDOM_MOVEMENT))
        str3 << " | MOVEMENT_FLAG_RANDOM_MOVEMENT";
    str3 << ')';
    ch.PSendSysMessage(str3.str().c_str());

    std::ostringstream str4;
    str4 << "My spec: " << _mySpec;
    ch.PSendSysMessage(str4.str().c_str());

    ch.PSendSysMessage("Listing real spells:");
    PlayerSpellMap const& spellMap = me->GetSpellMap();
    for (PlayerSpellMap::const_iterator itr = spellMap.begin(); itr != spellMap.end(); ++itr)
    {
        SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(itr->first);
        if (!spellInfo)
            continue;
        PlayerSpell* spell = itr->second;
        if (!spell)
            continue;
        if (spell->disabled || spell->state == PLAYERSPELL_REMOVED || spell->state == PLAYERSPELL_TEMPORARY)
            continue;
        //triggered or server-side spells
        if (spellInfo->SpellLevel == 0)
            continue;
        //passive spell
        if (spellInfo->IsPassive())
            continue;
        //spell is learned as other class spell
        if (!me->IsSpellFitByClassAndRace(spellInfo->Id))
            continue;
        //is talent
        if (GetTalentSpellPos(spellInfo->Id))
            continue;
        //not hightest rank known
        if (spellInfo->GetNextRankSpell() && me->HasSpell(spellInfo->GetNextRankSpell()->Id))
            continue;
        ////check class family for spells
        //ChrClassesEntry const* classEntry = sChrClassesStore.LookupEntry(me->getClass());
        //if (spellInfo->SpellFamilyName != classEntry->spellfamily)
        //    continue;

        std::ostringstream str5;
        str5 << spellInfo->Id << " - |cffffffff|Hspell:" << spellInfo->Id << "|h[" << spellInfo->SpellName[loc];
        str5 << ' ' << localeNames[loc] << "]|h|r";
        uint32 rank = !spellInfo->ChainEntry ? 0 : spellInfo->GetRank();
        if (rank > 0)
            str5 << " Rank " << rank;
        ch.PSendSysMessage(str5.str().c_str());
    }

    ch.PSendSysMessage("Listing classAI spells:");
    _classAI->SendClassDebugInfo();

    ch.PSendSysMessage("Listing bot instance binds:");

    for (uint8 i = 0; i != MAX_DIFFICULTY; ++i)
    {
        Player::BoundInstancesMap &binds = me->GetBoundInstances(Difficulty(i));
        for (Player::BoundInstancesMap::const_iterator itr = binds.begin(); itr != binds.end(); ++itr)
            if (InstanceSave* save = itr->second.save)
                ch.PSendSysMessage("map: %d inst: %d perm: %s diff: %d canReset: %s", itr->first, save->GetInstanceId(), itr->second.perm ? "yes" : "no",  save->GetDifficulty(), save->CanReset() ? "yes" : "no");
    }

    ch.PSendSysMessage("Listing player instance binds:");

    for (uint8 i = 0; i != MAX_DIFFICULTY; ++i)
    {
        Player::BoundInstancesMap &binds = _botBoundInstances[Difficulty(i)];
        for (Player::BoundInstancesMap::const_iterator itr = binds.begin(); itr != binds.end(); ++itr)
            if (InstanceSave* save = itr->second.save)
                ch.PSendSysMessage("map: %d inst: %d perm: %s diff: %d canReset: %s", itr->first, save->GetInstanceId(), itr->second.perm ? "yes" : "no",  save->GetDifficulty(), save->CanReset() ? "yes" : "no");
    }
}

inline void PlayerbotAI::_doTimers(uint32 diff)
{
    if (_waitTimer > diff)                              _waitTimer -= diff;
    if (_followTimer > diff)                            _followTimer -= diff;
    if (_mountTimer > diff)                             _mountTimer -= diff;
    if (_cureTimer > diff)                              _cureTimer -= diff;
    if (_selfResTimer > diff)                           _selfResTimer -= diff;
}
