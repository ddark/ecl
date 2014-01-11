DELETE FROM `account_achievement`;

INSERT INTO `account_achievement`
SELECT      `c`.`account`,
            `a`.`achievement`,
            `a`.`date`
FROM        `character_achievement` `a`,
            `characters` `c`
GROUP BY    `c`.`account`,
            `a`.`achievement`;

DELETE FROM `account_achievement_progress`;

INSERT INTO `account_achievement_progress`
SELECT      `c`.`account`,
            `a`.`criteria`,
            MAX(`a`.`counter`), /* can SUM() */
            `a`.`date`
FROM        `character_achievement_progress` `a`,
            `characters` `c`
GROUP BY    `c`.`account`,
            `a`.`criteria`;