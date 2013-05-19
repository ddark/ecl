#include "bp_cai.h"
//#include "Common.h"
//#include "World.h"
//#include "SpellMgr.h"
#include "Player.h"
#include "Group.h"
//#include "ObjectMgr.h"
//#include "WorldPacket.h"
//#include "Unit.h"
#include "bp_ai.h"

PlayerbotClassAI::PlayerbotClassAI(Player* const master, Player* const bot, PlayerbotAI* const ai) :
m_master(master), me(bot), m_ai(ai) {}
PlayerbotClassAI::~PlayerbotClassAI() {}
