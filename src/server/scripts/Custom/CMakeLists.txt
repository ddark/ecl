# Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  Custom/mod_ArenaWatcher.cpp
  Custom/mod_AuctionHouseBot.cpp
  Custom/mod_AutoLearn.cpp
  Custom/mod_BattlegroundHistory.cpp
  Custom/mod_BossHistory.cpp
  Custom/mod_CharacterHistory.cpp
  Custom/mod_CharacterModel.cpp
  Custom/mod_CustomRewardWorldPvP.cpp
  Custom/mod_DefaultSpec.cpp
  Custom/mod_DynamicInsctane.cpp
  Custom/mod_DynamicRate.cpp
  Custom/mod_ExternalMail.cpp
  Custom/mod_Tournaments.cpp
  Custom/mod_GuildDefault.cpp
  Custom/mod_HonorRank.cpp
  Custom/mod_ItemUpgrade.cpp
  Custom/mod_MailHistory.cpp
  Custom/mod_MultiKill.cpp
  Custom/mod_SpecialCode.cpp
  Custom/hunterpet_vendor.cpp
  Custom/npc_buffer.cpp
  Custom/event_npc.cpp
  Custom/npcbuff.cpp
  Custom/npc_arena_teamTop.cpp
  Custom/Transmogrification.cpp
  Custom/Transmogrification.h
  Custom/chat_censure.cpp
  Custom/npcs_mini_boss.cpp
  Custom/npc_morph.cpp
  Custom/boss_pvpchalenge.cpp
  Custom/buffcommand.cpp
  Custom/mr_spell.cpp
  Custom/cs_fake.cpp
  Custom/1.cpp
  Custom/AIO-4.0a.cpp
  Custom/npc_gurubashi_theme.cpp
  Custom/ChangeToken.cpp
  Custom/TransmogDisplayVendorConf.h
  Custom/TransmogDisplayVendor.cpp
  Custom/npc_enchant.cpp
  Custom/icc_rings_recovery.cpp
  Custom/arena_fast_start.cpp
  Custom/world_chat_race.cpp
  Custom/mod_LexicsCutter.cpp
)

message("  -> Prepared: Custom")
