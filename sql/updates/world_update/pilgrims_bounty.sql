
-- ------------------
-- -- Event Spawns --
-- ------------------
SET @CGUID := 2100000; -- Set by TDB
SET @OGUID := 2100000; -- Set by TDB
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID AND @CGUID+3998;

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID AND @OGUID+591;


-- Link Creatures to event
DELETE FROM `game_event_creature` WHERE `eventEntry`=26 AND `guid` BETWEEN @CGUID AND @CGUID+3998;

-- Link Objects to event
DELETE FROM `game_event_gameobject` WHERE `eventEntry`=26 AND `guid` BETWEEN @OGUID AND @OGUID+591;
