UPDATE creature_template SET subname = 4224 WHERE entry >= 500000 AND entry <= 500145;

replace into creature_template SET name = 4224 WHERE `entry` IN (12);