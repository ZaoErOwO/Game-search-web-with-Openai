/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : GWeb

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 05/08/2023 15:41:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `cname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headshot` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cdate` date NOT NULL,
  `cpart` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cname`) USING BTREE,
  INDEX `FK_Reference_3`(`gname` ASC) USING BTREE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`gname`) REFERENCES `game` (`gname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('Andy', 'Human: Fall Flat', '/imgs/tx1.png', '2023-06-08', 'Playing in a team can literally die of laughter, but playing alone, facing empty scenes and empty soundtracks, is lonely.');
INSERT INTO `comments` VALUES ('Arthur ', 'PLAYERUNKNOWN’S BATTLEGROUNDS', '/imgs/tx2.png', '2023-07-27', 'I remember the first four rows of chicken eating at 5.6 a.m. in the Internet café, there were two of us left, everyone was very nervous, until the moment of eating chicken, everyone seemed to have won the Olympic championship, and it is estimated that it will be difficult to have such a scene in the future.');
INSERT INTO `comments` VALUES ('David', 'Human: Fall Flat', '/imgs/tx2.png', '2023-07-20', 'There are many shortcomings from a game production perspective, and the controls, localization, and servers are a mess, but this game proves that if you give three or five friends a physics engine, humans themselves can be the best game mechanics.');
INSERT INTO `comments` VALUES ('Edward', 'It Takes Two', '/imgs/tx1.png', '2023-06-07', 'Playing with sisters is doubling the pleasure, playing with your boyfriend is doubling the pain. Without him, men play games too much (I really thank you for seeing a hot comment full of stereotypes under a game review that fiercely opposes gender stereotypes)');
INSERT INTO `comments` VALUES ('Gary', 'It Takes Two', '/imgs/tx2.png', '2023-07-14', 'On launch day, I recommended the game to a friend, hinted that he was working with me, and he bought the game and went to play it with his girlfriend. Dog forced.');
INSERT INTO `comments` VALUES ('Jack', 'Counter-Strike: Global Offensive', '/imgs/tx2.png', '2023-07-19', 'Ten thousand hours, five years of youth, countless days and nights of dedication, let me from passers-by dream career, everything about him inside and outside the game has completely shaped me now, but it\'s time to leave, thank you.');
INSERT INTO `comments` VALUES ('Jim', 'MountBlade Il: Bannerlord', '/imgs/tx1.png', '2023-07-03', 'When I was eighty years old, my grandson\'s grandson told me that the old man Ride Chop 2 was released and didn\'t hurry up to land on Steam Chopper, I said it\'s impossible, how many years have they jumped tickets, the production team before those people are estimated to be dead, my grandson\'s grandson said yes, it was their great-grandson\'s great-grandson who did it.');
INSERT INTO `comments` VALUES ('Mark', 'MountBlade Il: Bannerlord', '/imgs/tx2.png', '2023-07-05', 'After many years of sequel to the emotional game, then I must make up the ticket, but unfortunately I have passed the time when I can sit there sleeplessly playing liver games with nothing to do.');
INSERT INTO `comments` VALUES ('Peter', 'PLAYERUNKNOWN’S BATTLEGROUNDS', '/imgs/tx1.png', '2023-06-21', 'I\'m more than willing to shell out the death replay feature... I\'m curious to know who beat me and if I can see from the perspective of how the person who killed me was killed by someone else');
INSERT INTO `comments` VALUES ('Tom', 'Counter-Strike: Global Offensive', '/imgs/tx1.png', '2023-07-12', 'I bought it in June and played for 400 hours until September. Only hit the picture of dust2 until Wheat Spike AK tried various methods in order to test the TOEFL abstinence game, but it didn\'t work. Finally, I bought a hang on Taobao, and I was banned for 3 games without acting, and finally quit.');

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `fid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fdate` date NOT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `FK_Reference_1`(`uname` ASC) USING BTREE,
  INDEX `FK_Reference_2`(`gname` ASC) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`gname`) REFERENCES `game` (`gname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES (10, 'tom', 'Counter-Strike: Global Offensive', '2023-08-05');

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `gname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tid` bigint(20) NULL DEFAULT NULL,
  `gpic1` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gpic2` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gpic3` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gpic4` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gpic5` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gpic6` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gdescribes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gdate` date NOT NULL,
  `gdevelopers` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gpath` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`gname`) USING BTREE,
  INDEX `FK_Reference_4`(`tid` ASC) USING BTREE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`tid`) REFERENCES `type` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES ('Counter-Strike: Global Offensive', 4, '/imgs/go1.jpg', '/imgs/go2.jpg', '/imgs/go3.jpg', '/imgs/go4.jpg', '/imgs/go5.jpg', '/imgs/go6.jpg', 'Counter-Strike: Global Offensive (CS: GO) continues the achievements of the 1999 original in the team-based competitive gameplay category. CS: GO features all-new maps, characters, weapons, new game modes, and offers refurbished classic CS content (de_ dus2, etc.).', '2012-08-21', 'Valve', 'steam://rungameid/730', 'PC,Chinese,Tower defense,terror,PC');
INSERT INTO `game` VALUES ('Human: Fall Flat', 11, '/imgs/hff1.jpg', '/imgs/hff2.jpg', '/imgs/hff3.jpg', '/imgs/hff4.jpg', '/imgs/hff5.jpg', '/imgs/hff6.jpg', 'Human: Fall Flat is a fast-paced open-ended physics simulation third-person puzzle exploration game set in a fantastical floating dream world, where the players goal is to escape the ever-collapsing dream world through a series of puzzles, all relying solely on the players wits and knowledge.', '2116-07-23', 'No Brakes Games', 'steam://rungameid/477160', 'IOS,decrypt,terror,Platform and run');
INSERT INTO `game` VALUES ('It Takes Two', 21, '/imgs/itt1.jpg', '/imgs/itt2.jpg', '/imgs/itt3.jpg', '/imgs/itt4.jpg', '/imgs/itt5.jpg', '/imgs/itt6.jpg', 'Two-For-Two is an action-adventure game developed by Hazelight Studios that was first revealed during the EA Play live show held on 18 June 2020 and released on 26 March 2021 on Microsoft Windows (Steam, Origin), PlayStation 4, PlayStation 5, Xbox One, Xbox Series X, and Xbox Series S platforms.', '2021-03-26', 'Electronic Arts', 'tencent://', 'Android,Japanese,cooperate');
INSERT INTO `game` VALUES ('MountBlade Il: Bannerlord', 8, '/imgs/qk1.jpg', '/imgs/qk2.jpg', '/imgs/qk3.jpg', '/imgs/qk4.jpg', '/imgs/qk5.jpg', '/imgs/qk6.jpg', 'Mount & Blade II: Bannerlord is a strategy and action role-playing game created and published by TaleWorlds. The game takes place 200 years before Mount & Blade: Warband,[3] when Emperor Arenicos of the Karad Empire dies without an heir and the empire descends into civil war. The fall of the Karad Empire is similar to the fall of the Western Roman Empire in real history.', '2020-03-30', 'TaleWorlds', 'D:\\Program Files\\Tencent\\QQ\\Bin\\QQScLauncher.exe', 'survive,Single,English');
INSERT INTO `game` VALUES ('PLAYERUNKNOWN’S BATTLEGROUNDS', 9, '/imgs/pubg1.jpg', '/imgs/pubg2.jpg', '/imgs/pubg3.jpg', '/imgs/pubg4.jpg', '/imgs/pubg5.jpg', '/imgs/pubg6.jpg', 'PLAYERUNKNOWN’S BATTLEGROUNDS (PUBG) is a tactical competitive shooter sandbox game developed by South Koreas Krafton Studios, in which players need to collect various resources on the game map and fight against other players in a shrinking safe zone to survive until the end.', '2022-01-21', 'KRAFTON', 'D:\\Program Files\\Tencent\\QQ\\Bin\\QQScLauncher.exe', 'Korean,PC');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `nid` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ntitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `npic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ncontent` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ntime` date NOT NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '"Skeptical Man" launches on steam, a new sophisticated werewolf game', '/imgs/new1.jpg', 'Nestopi Inc. produces and publishes the exquisite werewolf game new "suspicious people: the camouflage of the game" landed on steam sale, support for Chinese, strengthen the werewolf war system elements, interested players can pay attention to the next.Nestopi Inc. produces and publishes the exquisite werewolf game new "suspicious people: the camouflage of the game" landed on steam sale, support for Chinese, strengthen the werewolf war System elements, interested players can pay attention to. The suspicious person": steam address \r\n\r\n "suspicious person" story about the village outside the abandoned hut there are two survivors, their village was "werewolf" attack. But is it a civilian ...... or a werewolf attacking the village? Through dialogue, or mutual trust, or mutual deception to identify each others true identity.\r\n\r\nThe Sceptics featured:\r\n\r\n■Exclusive 3-minute condensed version of Werewolf game for two players\r\n\r\n■Walking between lies and truth, using "dialogue" to play the game \r\n\\\r\n■Suspicion alone cant survive, its a game of trust \r\n\\r\n■Civilians, werewolves, and other 5 types of cards that unite strategies', '2023-07-31');
INSERT INTO `news` VALUES ('10', '"orz" free on steam hand-drawn style creative action puzzles', '/imgs/new10.jpg', 'hijikuro inomE development and distribution, a creative puzzle new game "orz" July 24th free landing steam, this work supports Chinese, simple and unique gameplay, interested players can pay attention to the next. Orz": steam address \r\n\r\nOrz Originally is the abbreviation of the loss of the body before bending, is a kind of network hieroglyphics originated in Japan (or mood illustration), the shape seems to be a person was crushed by the things kneeling on the ground, is used to describe the things defeated or very depressed, expressed disillusionment or frustration of the mood. It also means admiration as well as worship. \r\n\r\nThis one, on the other hand, requires the player to take control of a young girl in a simple 2D action game, where the aim is to move continuously to the left. You are currently at point 0. Therefore, you need to travel to point 1. During your journey, if you run out of heart power-ups, you will return to point 0. If you fall off the path, you will return to point 0.', '2023-07-22');
INSERT INTO `news` VALUES ('2', '"Century of Steam" is a steam train operation simulator.', '/imgs/new2.jpg', 'Century of Steam on steam steam train operation simulator. Century of Steam": steam address \r\n\r\n "Century of Steam" story is set in 1869 ~ 1969 for the North American continent, it is the birth of the steam train until the prosperity of the period, the player can personally supervise the construction of the steam train, modification, upgrading, and operation of the work, the game provides a beautiful route along the natural scenery and a variety of types of operational tasks. The game offers beautiful natural scenery along the route as well as a variety of types of operational tasks.', '2023-07-30');
INSERT INTO `news` VALUES ('3', '"Odyssey of Light" Crossing Sneak Peek at Steam on 22 August Spaceship Adventure', '/imgs/new3.jpg', 'Produced and released by League of Geeks, a new cosmic Feitron adventure management game "Odyssey of light the transgressions" will be on August 22 steam sneak preview, this work support Chinese, please look forward to. - "Odyssey of light the transgression": steam address \r\n\r\n-"Odyssey of light the transgression" of the main story line towards the mysterious star of eternity, embark on this adventure journey, so that the light of hope forever! Gather survivors, repair and expand starships, face black holes head-on, and defend against attacks, all while managing the daily lives of the crew members in all their shapes and sizes. \r\n\r\n-Features of Odyssey of Light: \r\n\r\nExplore different galaxies and meet a variety of biomes that will have different effects on your starship and crew. \r\n\r\nManage the emergency systems: fire, electric shock, radiation, oxygen deprivation, must always be taken care of. Nothing can ever go smoothly. \r\n\r\nPromote ordinary crew members to departmental officers, harmonise the officers very different managerial proclivities, and do this to achieve a rigorous management that would otherwise be doomed. \r\n\r\n Resisting hostile attack squads against ships, sending starfighters to defend against interstellar invaders.', '2023-07-29');
INSERT INTO `news` VALUES ('4', 'Substitute linked new game The Truth About Mermaids on steam', '/imgs/new4.jpg', 'ImCyan developed the "substitute (the next day)" series of horror games the latest linkage works, and the virtual idol BaoZhongMarin cooperation to launch a new game "the truth about the beauty of the witch: Marlenes secret treasure ship" landing steam, scheduled for August 11th this is the sale, please look forward to. - "The truth of the beauty of the witch": steam address \r\n\r\n-"The truth of the beauty of the witch: Marlenes Secret Treasure Ship" is a famous independent game developers ImCyan and virtual idol BaoZhongMarlene linkage of the new game, the player plays as the captain of the Marlene commanded by the pirate ships new sailors, every day in the salivation of the captains beauty and forget about the hardship of the sea voyage, sailing to find a variety of treasures as well as to find the Marlenes charm elements.', '2023-07-28');
INSERT INTO `news` VALUES ('5', 'Vampire Hunter steam sneak preview opens for first-person meat-pigeon FPS', '/imgs/new5.jpg', 'Today, 27 July, Gamecraft Studios developed the first-person meat pigeon elements of the new FPS game "Vampire Hunters (Vampire Hunters)" in steam to open a sneak preview experience, interested players can pay attention to the next. Vampire Hunters: steam address \r\n\r\n "Vampire Hunters" is a tribute to the classic game "vampire survivor" of the first-person point-of-view shooter, equipped with meat pigeon element gameplay, in this work, the player in addition to their own weapons can be strengthened, but also equipped with a unique cumulative system, so that players can be configured in the screen around the configuration of the classic revolver to the high pressure In this game, the player can not only strengthen their own weapons, but also equipped with a unique accumulation system, so that the player can configure the screen around the classic revolver to high-pressure water hose and other weapons to fight together, so that the player to experience a different from the conventional FPS shooting game fierce fire shooting fun. \r\n\r\nThis game will add three new levels that were not available in the previous trial version, in addition to new features such as auto-fire and aiming support. The preview version is scheduled to be available for more than 4 months, during which time it will be updated with more new elements, so stay tuned.', '2023-07-27');
INSERT INTO `news` VALUES ('6', 'Ultimate Space Commando steam sneak preview opens for squad tactical adventure', '/imgs/new6.jpg', 'Publisher Firesquid announced that one of its 2D squad tactical turn-based adventure new game "Ultimate Space Commando: Counter Force" July 25 steam sneak preview experience opened, this work support Chinese. The Ultimate Space Commando: steam address \r\n\r\nThe Ultimate Space Commando: Counter Force is inspired by XCOM, Space Hulk, and Alien, with a deep skill and combat system that supports a variety of game modes, and turn-based squad tactics that have been brought back to life. In this world, you can command Space Special Forces to discover the truth behind the defeat of Colony MC83-A and protect humanity from the threat of ancient aliens. \r\n\r\n Ultimate Space Commando: Counter Force is a turn-based squad tactics game with a deep sci-fi atmosphere. Youll command a Special Forces tactical team assigned to the planet M-8322, investigating an invasion of mysterious alien creatures while getting down to the business of eradicating whats left. What you see and hear has the potential to dramatically change the course of history. Ultimate Space Commandos: steam address \r\n\r\nUltimate Space Commandos: Strike Back Forces is inspired by XCOM, Space Hulk, and Alien, and features an in-depth skill and combat system with support for a variety of gameplay modes, and a return to turn-based squad tactics. In this world, you can command Space Special Forces to discover the truth behind the defeat of Colony MC83-A and protect humanity from the threat of ancient aliens. \r\n\r\n Ultimate Space Commando: Counter Force is a turn-based squad tactics game with a deep sci-fi atmosphere. Youll command a Special Forces tactical team assigned to the planet M-8322, investigating an invasion of mysterious alien creatures while getting down to the business of eradicating whats left. What you see and hear may drastically change the course of history. This game features:\r\n\r\nl Assemble the ultimate squad: prepare your team for any situation! USC:CF features a career-less system that allows you to fully customise your troops to suit any enemy threat! \r\n\r\nl Diverse Weapons and Tools: Defeat your enemies with various types of melee and long-range weapons and ammo. Collect hacking tools, mines, turrets and more to complete your mission. \r\n\r\nl Fully Interactive Environments: Explore and fight in interactive and fully destructible environments. Rearrange the battlefield, build barriers, avoid and exploit environmental hazards, set traps and more. \r\n\r\nl Multiple Game Modes: Fight alone in fully customisable single-player modes and lead your marines through challenging multi-mission operations with unique objectives. If you dont want to fight as a lone wolf? Try co-operative multiplayer in the classic Hotseat mode, or use Steams "Remote Play" feature to bring a comrade online.', '2023-07-26');
INSERT INTO `news` VALUES ('7', 'New DLC for JR East Train Simulator launches with more detailed new routes!', '/imgs/new7.jpg', 'The new DLC for the ultra-realistic simulation of driving a Japanese train game "JR East Japan Train Simulator" is online, and more detailed new routes from the capitals running circle are launched, priced at 2,980 yen. -JR East Japan Train Simulator: Steam address \r\n\r\n- In JR East Japan Train Simulator, players can drive the train from the drivers point of view and enjoy driving. The street scenes within the game are filmed in high-definition entities, and the sounds made by the trains and tracks are recorded from reality for a sense of realism. In addition, the appearance and data of the dashboard in the train are also the same as the actual train, and the sound and the content of the dashboard will change according to the driving operation and speed. \r\n\r\n-The new DLC includes the Yamanotate Line, a major line in the metropolitan area, and reproduces the platforms, facilities, distances, route plans, and roadside scenery of the line in real life.', '2023-07-25');
INSERT INTO `news` VALUES ('8', 'Steam Latest Weekly Sales Chart Relic 2 Succeeds at the Top', '/imgs/new8.jpg', 'Steam latest weekly sales chart is out (18th July 2023 - 25th July 2023), the upcoming 26th July release of Relic 2 managed to top the charts, the last top one Steam Deck dropped to fifth, in addition, that game 5 is on the charts again this week (sixth). top 10 charts: \r\n\r\n1. Relic 2 \r\n\r\n2. BattleBit Remastered \r\n\r\n3. BattleBit Remastered \r\n\r\n4. Call of Duty: Modern Warfare 2 \r\n\r\n5. Steam Deck \r\n\r\n6. GTA5 \r\n\r\n7. Daleks 2 \r\n\r\n8. Divers Dave \r\n\\r\n9. Street Fighter 6 \r\n\r\n10. Corrosion', '2023-07-24');
INSERT INTO `news` VALUES ('9', 'Dungeon of the ENDLESS free on steam Meat Pigeon Labyrinth Adventure', '/imgs/new9.jpg', 'AMPLITUDE Studios studio development, Sega published a meat pigeon maze adventure game "Dungeon of the ENDLESS" has landed on steam, recently released for free, interested players do not miss. Dungeon of the ENDLESS: steam address \r\n\r\n-"Dungeon of the ENDLESS" is a combination of meat pigeon elements and tower defence elements of the game, the player for the guardian of the downed spaceship generator and to start the collection of exploration journey. \r\n\r\n- Players can choose a team of 4 characters to take on the challenge. The characters are set to be death row inmates who have been exiled for the colonisation of unexplored planets, and each team has different traits and abilities to cope with the complex and unfamiliar world.', '2023-07-23');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `tid` bigint(20) NOT NULL,
  `tname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'Hongmeng', 'a');
INSERT INTO `type` VALUES (2, 'IOS', 'a');
INSERT INTO `type` VALUES (3, 'Android', 'a');
INSERT INTO `type` VALUES (4, 'PC', 'a');
INSERT INTO `type` VALUES (5, 'PS', 'a');
INSERT INTO `type` VALUES (6, 'XBOX', 'a');
INSERT INTO `type` VALUES (7, 'Chinese', 'b');
INSERT INTO `type` VALUES (8, 'English', 'b');
INSERT INTO `type` VALUES (9, 'Korean', 'b');
INSERT INTO `type` VALUES (10, 'Japanese', 'b');
INSERT INTO `type` VALUES (11, 'Platform and run', 'c');
INSERT INTO `type` VALUES (12, 'Fighting and martial arts', 'c');
INSERT INTO `type` VALUES (13, 'Turn-based', 'c');
INSERT INTO `type` VALUES (14, 'military', 'c');
INSERT INTO `type` VALUES (15, 'Instant strategy', 'c');
INSERT INTO `type` VALUES (16, 'Tower defense', 'c');
INSERT INTO `type` VALUES (17, 'Sports competition', 'c');
INSERT INTO `type` VALUES (18, 'In love leisure', 'e');
INSERT INTO `type` VALUES (19, 'decrypt', 'e');
INSERT INTO `type` VALUES (20, 'Single', 'e');
INSERT INTO `type` VALUES (21, 'cooperate', 'e');
INSERT INTO `type` VALUES (22, 'Multiplayer', 'e');
INSERT INTO `type` VALUES (23, 'local area network', 'e');
INSERT INTO `type` VALUES (24, 'Online competition', 'e');
INSERT INTO `type` VALUES (25, 'adult', 'd');
INSERT INTO `type` VALUES (26, 'anime', 'd');
INSERT INTO `type` VALUES (27, 'space', 'd');
INSERT INTO `type` VALUES (28, 'terror', 'd');
INSERT INTO `type` VALUES (29, 'survive', 'd');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uname` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headshot` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('jack', '123456', '1234567891@qq.com', '/imgs/tx2.png', 'Female', '12345678911');
INSERT INTO `user` VALUES ('tom', '123456', '1234567891@qq.com', '/imgs/tx1.png', 'Male', '12345678910');

SET FOREIGN_KEY_CHECKS = 1;
