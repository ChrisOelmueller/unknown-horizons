CREATE TABLE `colors` (`name` TEXT NOT NULL, `red` INTEGER NOT NULL, `green` INTEGER NOT NULL, `blue` INTEGER NOT NULL, `alpha` INTEGER NOT NULL DEFAULT 255, id int auto_increment not null default -1);
INSERT INTO "colors" VALUES('red',255,10,10,255,1);
INSERT INTO "colors" VALUES('blue',0,72,181,255,2);
INSERT INTO "colors" VALUES('green',0,160,23,255,3);
INSERT INTO "colors" VALUES('orange',224,102,0,255,4);
INSERT INTO "colors" VALUES('purple',128,0,128,255,5);
INSERT INTO "colors" VALUES('cyan',0,255,255,255,6);
INSERT INTO "colors" VALUES('yellow',255,215,0,255,7);
INSERT INTO "colors" VALUES('pink',255,0,255,255,8);
INSERT INTO "colors" VALUES('teal',0,146,139,255,9);
INSERT INTO "colors" VALUES('lemon',0,255,0,255,10);
INSERT INTO "colors" VALUES('bordeaux',150,6,40,255,11);
INSERT INTO "colors" VALUES('white',255,255,255,255,12);
INSERT INTO "colors" VALUES('gray',128,128,128,255,13);
INSERT INTO "colors" VALUES('black',0,0,0,255, 14);
CREATE TABLE `ground_class` (`ground` INTEGER NOT NULL, `class` TEXT NOT NULL);
INSERT INTO "ground_class" VALUES(1,'coastline');
INSERT INTO "ground_class" VALUES(3,'constructible');
INSERT INTO "ground_class" VALUES(4,'constructible');
INSERT INTO "ground_class" VALUES(6,'constructible');
INSERT INTO "ground_class" VALUES(5,'coastline');
INSERT INTO "ground_class" VALUES(7,'constructible');
CREATE TABLE `unit` (`name` TEXT NOT NULL ,`class_package` TEXT NOT NULL ,`class_type` TEXT NOT NULL , `base_velocity` FLOAT DEFAULT '12.0', "radius" INTEGER DEFAULT 5, "id" INTEGER AUTO_INCREMENT);
INSERT INTO "unit" VALUES('Huker','ship','Ship',5.0,5,1000001);
INSERT INTO "unit" VALUES('BuildingCollector','collectors','BuildingCollector',12.0,5,1000002);
INSERT INTO "unit" VALUES('Sheep','animal','FarmAnimal',12.0,3,1000003);
INSERT INTO "unit" VALUES('Fisher','ship','FisherShip',12.0,5,1000004);
INSERT INTO "unit" VALUES('Pirate Ship','ship','PirateShip',12.0,5,1000005);
INSERT INTO "unit" VALUES('Trader','ship','TradeShip',12.0,8,1000006);
INSERT INTO "unit" VALUES('AnimalCarriage','collectors','AnimalCollector',12.0,5,1000007);
INSERT INTO "unit" VALUES('StorageCollector','collectors','StorageCollector',12.0,5,1000008);
INSERT INTO "unit" VALUES('FieldCollector','collectors','FieldCollector',12.0,5,1000009);
INSERT INTO "unit" VALUES('LumberjackCollector','collectors','FieldCollector',12.0,5,1000010);
INSERT INTO "unit" VALUES('SettlerCollector','collectors','StorageCollector',12.0,5,1000011);
INSERT INTO "unit" VALUES('Deer','animal','WildAnimal',12.0,5,1000013);
INSERT INTO "unit" VALUES('HunterCollector','collectors','HunterCollector',12.0,5,1000014);
INSERT INTO "unit" VALUES('FarmAnimalCollector','collectors','FarmAnimalCollector',12.0,5,1000015);
INSERT INTO "unit" VALUES('UsableFisher','ship','Ship',12.0,5,1000016);
INSERT INTO "unit" VALUES('Cattle','animal','FarmAnimal',12.0,3,1000017);
INSERT INTO "unit" VALUES('Boar','animal','FarmAnimal',12.0,5,1000018);
INSERT INTO "unit" VALUES('Doctor','collectors','DisasterRecoveryCollector',12.0,5,1000019);
INSERT INTO "unit" VALUES('Frigate','fightingship','FightingShip',12.0,5,1000020);
INSERT INTO "unit" VALUES('Firefighter','collectors','DisasterRecoveryCollector',12.0,5,1000022);
CREATE TABLE "speech" ("group_id" INTEGER NOT NULL  DEFAULT 0 ,"file" TEXT NOT NULL );
INSERT INTO "speech" VALUES(1,'content/audio/voice/map_creation/en/0.ogg');
INSERT INTO "speech" VALUES(1,'content/audio/voice/map_creation/en/1.ogg');
INSERT INTO "speech" VALUES(1,'content/audio/voice/map_creation/en/2.ogg');
INSERT INTO "speech" VALUES(1,'content/audio/voice/map_creation/en/3.ogg');
INSERT INTO "speech" VALUES(2,'content/audio/sounds/events/new_settlement.ogg');
INSERT INTO "speech" VALUES(3,'content/audio/sounds/events/new_era.ogg');
CREATE TABLE "sounds" ("file" TEXT NOT NULL  DEFAULT '', id auto_increment not null default -1);
INSERT INTO "sounds" VALUES('content/audio/sounds/sheepfield.ogg',1);
INSERT INTO "sounds" VALUES('content/audio/sounds/ships_bell.ogg',2);
INSERT INTO "sounds" VALUES('content/audio/sounds/build.ogg',3);
INSERT INTO "sounds" VALUES('content/audio/sounds/lumberjack.ogg',4);
INSERT INTO "sounds" VALUES('content/audio/sounds/warehouse.ogg',5);
INSERT INTO "sounds" VALUES('content/audio/sounds/main_square.ogg',6);
INSERT INTO "sounds" VALUES('content/audio/sounds/chapel.ogg',7);
INSERT INTO "sounds" VALUES('content/audio/sounds/ships_bell.ogg',8);
INSERT INTO "sounds" VALUES('content/audio/sounds/invalid.ogg',9);
INSERT INTO "sounds" VALUES('content/audio/sounds/flippage.ogg',10);
CREATE TABLE "sounds_special" ("type" TEXT NOT NULL  DEFAULT '', "sound" INTEGER NOT NULL  DEFAULT '');
INSERT INTO "sounds_special" VALUES('build',3);
INSERT INTO "sounds_special" VALUES('message',8);
INSERT INTO "sounds_special" VALUES('error',9);
INSERT INTO "sounds_special" VALUES('flippage',10);
CREATE TABLE "message_icon" ("icon_id" INTEGER NOT NULL, "up_image" TEXT NOT NULL, "down_image" TEXT NOT NULL  DEFAULT '""', "hover_image" TEXT NOT NULL  DEFAULT '""');
INSERT INTO "message_icon" VALUES(1,'content/gui/icons/widgets/messages/msg_letter_n.png','content/gui/icons/widgets/messages/msg_letter_d.png','content/gui/icons/widgets/messages/msg_letter_h.png');
INSERT INTO "message_icon" VALUES(2,'content/gui/icons/widgets/messages/msg_system_n.png','content/gui/icons/widgets/messages/msg_system_d.png','content/gui/icons/widgets/messages/msg_system_h.png');
INSERT INTO "message_icon" VALUES(3,'content/gui/icons/widgets/messages/msg_save_n.png','content/gui/icons/widgets/messages/msg_save_d.png','content/gui/icons/widgets/messages/msg_save_h.png');
INSERT INTO "message_icon" VALUES(4,'content/gui/icons/widgets/messages/msg_anchor_n.png','content/gui/icons/widgets/messages/msg_anchor_d.png','content/gui/icons/widgets/messages/msg_anchor_h.png');
INSERT INTO "message_icon" VALUES(5,'content/gui/icons/widgets/messages/msg_money_n.png','content/gui/icons/widgets/messages/msg_money_d.png','content/gui/icons/widgets/messages/msg_money_h.png');
CREATE TABLE "production_line" ("time" FLOAT NOT NULL ,"changes_animation" INTEGER NOT NULL  DEFAULT 1 ,"id" INTEGER AUTO_INCREMENT,"object_id" INTEGER, "enabled_by_default" BOOL NOT NULL  DEFAULT 1 ,"save_statistics" BOOL NOT NULL  DEFAULT 0 );
INSERT INTO "production_line" VALUES(60.0,1,1,17,1,0);
INSERT INTO "production_line" VALUES(7.0,1,2,8,1,1);
INSERT INTO "production_line" VALUES(45.0,1,4,1000003,1,0);
INSERT INTO "production_line" VALUES(30.0,1,5,18,1,0);
INSERT INTO "production_line" VALUES(1.0,1,7,20,1,1);
INSERT INTO "production_line" VALUES(12.0,1,9,7,1,1);
INSERT INTO "production_line" VALUES(10.0,1,11,11,1,1);
INSERT INTO "production_line" VALUES(4.0,1,13,5,1,1);
INSERT INTO "production_line" VALUES(60.0,1,15,12,1,0);
INSERT INTO "production_line" VALUES(45.0,1,16,1000013,1,0);
INSERT INTO "production_line" VALUES(10.0,1,18,9,1,1);
INSERT INTO "production_line" VALUES(25.0,0,17,17,1,0);
INSERT INTO "production_line" VALUES(60.0,0,19,3,0,0);
INSERT INTO "production_line" VALUES(180.0,0,20,3,0,1);
INSERT INTO "production_line" VALUES(90.0,0,21,3,0,0);
INSERT INTO "production_line" VALUES(26.0,1,22,19,1,0);
INSERT INTO "production_line" VALUES(1.0,1,23,20,1,1);
INSERT INTO "production_line" VALUES(1.0,0,24,3,0,0);
INSERT INTO "production_line" VALUES(4.0,1,25,21,1,1);
INSERT INTO "production_line" VALUES(90.0,0,26,3,0,0);
INSERT INTO "production_line" VALUES(30.0,1,27,22,1,0);
INSERT INTO "production_line" VALUES(1.0,1,28,20,1,1);
INSERT INTO "production_line" VALUES(90.0,0,30,3,0,0);
INSERT INTO "production_line" VALUES(1.0,1,31,4,1,0);
INSERT INTO "production_line" VALUES(15.0,1,32,25,1,1);
INSERT INTO "production_line" VALUES(15.0,1,33,24,1,1);
INSERT INTO "production_line" VALUES(12.0,1,34,26,1,1);
INSERT INTO "production_line" VALUES(1.0,0,35,3,0,0);
INSERT INTO "production_line" VALUES(15.0,1,36,28,1,1);
INSERT INTO "production_line" VALUES(30.0,1,37,29,1,1);
INSERT INTO "production_line" VALUES(15.0,1,38,30,1,1);
INSERT INTO "production_line" VALUES(20.0,1,39,31,1,1);
INSERT INTO "production_line" VALUES(16.0,1,40,32,1,1);
--  time   changes_animation   id   object_id   enabled_by_default   save_statistics
INSERT INTO "production_line" VALUES(90.0,0,41,3,0,0);
INSERT INTO "production_line" VALUES(30.0,0,42,33,1,0);
INSERT INTO "production_line" VALUES(75.0,0,43,3,0,0);
INSERT INTO "production_line" VALUES(90.0,0,44,3,0,0);
INSERT INTO "production_line" VALUES(45.0,1,45,35,1,1);
INSERT INTO "production_line" VALUES(30.0,1,46,36,1,0);
INSERT INTO "production_line" VALUES(1.0,1,47,20,1,0);
INSERT INTO "production_line" VALUES(15.0,1,48,37,1,1);
INSERT INTO "production_line" VALUES(40.0,1,49,38,1,0);
INSERT INTO "production_line" VALUES(60.0,1,50,39,1,0);
INSERT INTO "production_line" VALUES(1.0,1,51,20,1,0);
INSERT INTO "production_line" VALUES(1.0,1,52,20,1,0);
INSERT INTO "production_line" VALUES(30.0,1,53,40,1,1);
--INSERT INTO "production_line" VALUES(1.0,1,54,20,1,0);
INSERT INTO "production_line" VALUES(15.0,1,55,41,1,1);
INSERT INTO "production_line" VALUES(15.0,1,56,41,1,1);
INSERT INTO "production_line" VALUES(60.0,1,57,42,1,0);
INSERT INTO "production_line" VALUES(60.0,1,58,12,1,0);
INSERT INTO "production_line" VALUES(60.0,1,62,12,1,0);
INSERT INTO "production_line" VALUES(60.0,1,63,12,1,0);
INSERT INTO "production_line" VALUES(60.0,1,64,12,1,0);
INSERT INTO "production_line" VALUES(60.0,1,68,12,1,0);
INSERT INTO "production_line" VALUES(90.0,0,69,3,0,0);
INSERT INTO "production_line" VALUES(180.0,0,70,3,0,0);
INSERT INTO "production_line" VALUES(60.0,0,71,3,0,0);
INSERT INTO "production_line" VALUES(90.0,0,72,3,0,0);
CREATE TABLE collector_restrictions(collector INTEGER, object INTEGER);
INSERT INTO "collector_restrictions" VALUES(1000011,4);
INSERT INTO "collector_restrictions" VALUES(1000011,5);
INSERT INTO "collector_restrictions" VALUES(1000011,21);
INSERT INTO "collector_restrictions" VALUES(1000011,32);
CREATE TABLE "message" ("text" TEXT NOT NULL ,"icon" INTEGER NOT NULL ,"visible_for" FLOAT NOT NULL ,"speech_group_id" INTEGER,"id_string" STRING);
INSERT INTO "message" VALUES('A new settlement was founded by {player}.',1,30.0,2,'NEW_SETTLEMENT');
INSERT INTO "message" VALUES('A new world has been created.',1,15.0,1,'NEW_WORLD');
INSERT INTO "message" VALUES('Your game has been saved.',3,15.0,NULL,'SAVED_GAME');
INSERT INTO "message" VALUES('Your game has been autosaved.',3,15.0,NULL,'AUTOSAVE');
INSERT INTO "message" VALUES('Your game has been quicksaved.',3,15.0,NULL,'QUICKSAVE');
INSERT INTO "message" VALUES('Screenshot has been saved to {file}.',2,20.0,NULL,'SCREENSHOT');
INSERT INTO "message" VALUES('Your inhabitants reached level {level}.',1,30.0,3,'SETTLER_LEVEL_UP');
INSERT INTO "message" VALUES('You need more {resource} to build this building.',1,10.0,NULL,'NEED_MORE_RES');
INSERT INTO "message" VALUES('Some of your inhabitants have no access to a main square.',1,30.0,NULL,'NO_MAIN_SQUARE_IN_RANGE');
INSERT INTO "message" VALUES('Some of your inhabitants just moved out.',1,40.0,NULL,'SETTLERS_MOVED_OUT');
INSERT INTO "message" VALUES('You won!',1,60.0,NULL,'YOU_HAVE_WON');
INSERT INTO "message" VALUES('Your mine has run out of resources.',1,30.0,NULL,'MINE_EMPTY');
INSERT INTO "message" VALUES('You can also drag roads.',1,20.0,NULL,'DRAG_ROADS_HINT');
INSERT INTO "message" VALUES('{player1} and {player2} have allied their forces.',1,10.0,NULL,'DIPLOMACY_STATUS_NEUTRAL_ALLY');
INSERT INTO "message" VALUES('{player1} and {player2} have ended the war and are now allied.',1,10.0,NULL,'DIPLOMACY_STATUS_ENEMY_ALLY');
INSERT INTO "message" VALUES('{player1} and {player2} have ended their alliance and are now in a state of war.',1,10.0,NULL,'DIPLOMACY_STATUS_ALLY_ENEMY');
INSERT INTO "message" VALUES('{player1} and {player2} will fight each other to the death.',1,10.0,NULL,'DIPLOMACY_STATUS_NEUTRAL_ENEMY');
INSERT INTO "message" VALUES('{player1} and {player2} have terminated their alliance.',1,10.0,NULL,'DIPLOMACY_STATUS_ALLY_NEUTRAL');
INSERT INTO "message" VALUES('{player1} and {player2} have settled their hostility.',1,10.0,NULL,'DIPLOMACY_STATUS_ENEMY_NEUTRAL');
INSERT INTO "message" VALUES('One of your fields requires a farm to harvest its crops.',1,30.0,NULL,'FIELD_NEEDS_FARM');
INSERT INTO "message" VALUES('You have reached the current maximum increment. Your inhabitants will not upgrade further.',1,45.0,NULL,'MAX_INCR_REACHED');
INSERT INTO "message" VALUES('You cannot tear the warehouse, your settlements needs it.',1,30.0,NULL,'WAREHOUSE_NOT_TEARABLE');
INSERT INTO "message" VALUES('The route is now configured. Start it via the "start route" button in the "configure route" menu.',1,45.0,NULL,'ROUTE_DISABLED');
INSERT INTO "message" VALUES('Your crew refuses to leave this map.',1,20.0,NULL,'MOVE_OUTSIDE_OF_WORLD');
INSERT INTO "message" VALUES('Cannot go here.',1,20.0,NULL,'MOVE_INVALID_LOCATION');
CREATE TABLE ai (client_id TEXT NOT NULL, class_package TEXT NOT NULL, class_name TEXT NOT NULL);
INSERT INTO "ai" VALUES('AIPlayer','aiplayer','AIPlayer');
CREATE TABLE "object_sounds" (object  INTEGER PRIMARY KEY  NOT NULL  DEFAULT '' , "sound" INTEGER NOT NULL  DEFAULT '');
INSERT INTO "object_sounds" VALUES(1,5);
INSERT INTO "object_sounds" VALUES(4,6);
INSERT INTO "object_sounds" VALUES(5,7);
INSERT INTO "object_sounds" VALUES(11,5);
INSERT INTO "object_sounds" VALUES(18,1);
INSERT INTO "object_sounds" VALUES(1000010,4);
CREATE TABLE related_buildings (building int, related_building int);
INSERT INTO "related_buildings" VALUES(8,17);
INSERT INTO "related_buildings" VALUES(20,18);
INSERT INTO "related_buildings" VALUES(20,19);
INSERT INTO "related_buildings" VALUES(20,22);
INSERT INTO "related_buildings" VALUES(20,36);
INSERT INTO "related_buildings" VALUES(20,38);
INSERT INTO "related_buildings" VALUES(20,39);
INSERT INTO "related_buildings" VALUES(3,4);
INSERT INTO "related_buildings" VALUES(3,42);
INSERT INTO "related_buildings" VALUES(3,5);
INSERT INTO "related_buildings" VALUES(3,21);
INSERT INTO "related_buildings" VALUES(3,32);
CREATE TABLE mine(mine INTEGER NOT NULL, deposit NOT NULL);
INSERT INTO "mine" VALUES(25,23);
INSERT INTO "mine" VALUES(28,34);
CREATE TABLE "tile_set" ("set_id" TEXT NOT NULL ,"ground_id" INTEGER NOT NULL );
INSERT INTO "tile_set" VALUES('ts_deep0',0);
INSERT INTO "tile_set" VALUES('ts_shallow0',1);
INSERT INTO "tile_set" VALUES('ts_shallow-deep0',2);
INSERT INTO "tile_set" VALUES('ts_grass0',3);
INSERT INTO "tile_set" VALUES('ts_grass-beach0',4);
INSERT INTO "tile_set" VALUES('ts_beach-shallow0',5);
INSERT INTO "tile_set" VALUES('ts_beach0',6);
CREATE TABLE citynames (
    "name" TEXT NOT NULL,
    "for_pirate" BOOL NOT NULL DEFAULT ('0'),
    "for_player" BOOL NOT NULL DEFAULT ('0')
, "locale" TEXT  NOT NULL  DEFAULT ('en'));
INSERT INTO "citynames" VALUES('St. Petrus',0,1,'en');
INSERT INTO "citynames" VALUES('Jagstursprung',1,0,'en');
INSERT INTO "citynames" VALUES('New Xanten',0,1,'en');
INSERT INTO "citynames" VALUES('Port Foobar',0,1,'en');
INSERT INTO "citynames" VALUES('St. Polten',0,1,'en');
INSERT INTO "citynames" VALUES('New Crailsheim',0,1,'en');
INSERT INTO "citynames" VALUES('Port Sollerup',0,1,'en');
INSERT INTO "citynames" VALUES('New Montabaur',0,1,'en');
INSERT INTO "citynames" VALUES('New Cologne',0,1,'en');
INSERT INTO "citynames" VALUES('New Nuremberg',0,1,'en');
INSERT INTO "citynames" VALUES('New Amsterdam',0,1,'en');
INSERT INTO "citynames" VALUES('Port Southland',0,1,'en');
INSERT INTO "citynames" VALUES('St. Patrick',0,1,'en');
INSERT INTO "citynames" VALUES('Hamburg Harbour',0,1,'en');
INSERT INTO "citynames" VALUES('London Harbour',0,1,'en');
INSERT INTO "citynames" VALUES('St. Inken',0,1,'en');
INSERT INTO "citynames" VALUES('Santeocalli',0,1,'en');
INSERT INTO "citynames" VALUES('La Paranagua',0,1,'en');
INSERT INTO "citynames" VALUES('Nouvelle-Montroulez',0,0,'en');
INSERT INTO "citynames" VALUES('Punta do Socorro',0,1,'en');
INSERT INTO "citynames" VALUES('Colonia del Este',0,1,'en');
INSERT INTO "citynames" VALUES('Asuncion Novatlan',0,1,'en');
INSERT INTO "citynames" VALUES('Cholulameco',0,1,'en');
INSERT INTO "citynames" VALUES('Rivanabia',0,1,'en');
INSERT INTO "citynames" VALUES('San Sanabria',0,1,'en');
INSERT INTO "citynames" VALUES('Teducihalpes',0,1,'en');
INSERT INTO "citynames" VALUES('Xoxochetun',0,1,'en');
INSERT INTO "citynames" VALUES('Port Royal',1,0,'en');
INSERT INTO "citynames" VALUES('Tortuga',1,0,'en');
INSERT INTO "citynames" VALUES('Porta Bravo',0,1,'en');
INSERT INTO "citynames" VALUES('Porta del Sol',0,1,'en');
INSERT INTO "citynames" VALUES('Porta Atlantica',0,1,'en');
INSERT INTO "citynames" VALUES('Porta Lino',0,1,'en');
INSERT INTO "citynames" VALUES('Blackport',1,0,'en');
INSERT INTO "citynames" VALUES('Freetown',1,0,'en');
INSERT INTO "citynames" VALUES('New Viersen',0,1,'en');
INSERT INTO "citynames" VALUES('St. Elmo',0,1,'en');
INSERT INTO "citynames" VALUES('St. Antonio',0,1,'en');
INSERT INTO "citynames" VALUES('New Holland',0,1,'en');
INSERT INTO "citynames" VALUES('Botany Bay',0,1,'en');
INSERT INTO "citynames" VALUES('Batavia',1,0,'en');
INSERT INTO "citynames" VALUES('Fogwaters',1,0,'en');
INSERT INTO "citynames" VALUES('Rum Reef Refuge',1,0,'en');
INSERT INTO "citynames" VALUES('Treasure Gate',1,0,'en');
INSERT INTO "citynames" VALUES('Ghost Piers',1,0,'en');
INSERT INTO "citynames" VALUES('Port Velar',0,1,'en');
INSERT INTO "citynames" VALUES('Wharf Eddy',1,0,'en');
INSERT INTO "citynames" VALUES('St. Anne',0,1,'en');
INSERT INTO "citynames" VALUES('St. Laurens',0,1,'en');
INSERT INTO "citynames" VALUES('St. Peters',0,1,'en');
INSERT INTO "citynames" VALUES('Cap-Rouge',0,1,'en');
INSERT INTO "citynames" VALUES('Charlesfort',0,1,'en');
INSERT INTO "citynames" VALUES('Fort Caroline',0,1,'en');
INSERT INTO "citynames" VALUES('Tadoussac',0,1,'en');
INSERT INTO "citynames" VALUES('Fort Saint Louis',0,1,'en');
INSERT INTO "citynames" VALUES('Saint-Domingue',0,1,'en');
INSERT INTO "citynames" VALUES('Marie-Galante',0,1,'en');
INSERT INTO "citynames" VALUES('Martinique',0,1,'en');
INSERT INTO "citynames" VALUES('St. Croix',0,1,'en');
INSERT INTO "citynames" VALUES('St. Kitts',0,1,'en');
INSERT INTO "citynames" VALUES('St. Lucia',0,1,'en');
INSERT INTO "citynames" VALUES('St. Martin',0,1,'en');
INSERT INTO "citynames" VALUES('St. Vincent',0,1,'en');
INSERT INTO "citynames" VALUES('Tobago',0,1,'en');
INSERT INTO "citynames" VALUES('St. Eustatius',0,1,'en');
INSERT INTO "citynames" VALUES('Los Roques',0,1,'en');
INSERT INTO "citynames" VALUES('La Orchila',0,1,'en');
INSERT INTO "citynames" VALUES('Bonaire',0,1,'en');
INSERT INTO "citynames" VALUES('Saba',0,1,'en');
INSERT INTO "citynames" VALUES('St. Thomas',0,1,'en');
INSERT INTO "citynames" VALUES('St. John',0,1,'en');
INSERT INTO "citynames" VALUES('Santa Ana de Cor',0,1,'en');
INSERT INTO "citynames" VALUES('Seville',0,1,'en');
INSERT INTO "citynames" VALUES('Santo Domingo',0,1,'en');
INSERT INTO "citynames" VALUES('Brandenburg',0,1,'en');
INSERT INTO "citynames" VALUES('Alta Verapaz',0,1,'en');
INSERT INTO "citynames" VALUES('Pozuzo',0,1,'en');
INSERT INTO "citynames" VALUES('Oxapampa',0,1,'en');
INSERT INTO "citynames" VALUES('Recife',0,1,'en');
INSERT INTO "citynames" VALUES('St. Barthelemy',0,1,'en');
INSERT INTO "citynames" VALUES('Bogwaters',1,0,'en');
INSERT INTO "citynames" VALUES('Port la Riqueza',1,0,'en');
CREATE TABLE groundunitnames (
    "name" TEXT NOT NULL,
    "locale" TEXT NOT NULL DEFAULT ('en')
);
INSERT INTO "groundunitnames" VALUES('Robin Hood','en');
INSERT INTO "groundunitnames" VALUES('Klaus Stoertebeker','de');
INSERT INTO "groundunitnames" VALUES('Blackbeard','en');
CREATE TABLE shipnames (
    "name" TEXT NOT NULL,
    "for_player" BOOL NOT NULL DEFAULT ('0'),
    "for_pirate" BOOL NOT NULL DEFAULT ('0'),
    "for_fisher" BOOL NOT NULL DEFAULT ('0'),
    "for_trader" BOOL NOT NULL DEFAULT ('0'),
    "locale" TEXT NOT NULL DEFAULT ('en')
);
INSERT INTO "shipnames" VALUES('Penelope',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Endeavour',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Surprise',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Acheron',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Xanthos',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Galliwasp',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Tracker',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Antigone',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Patrician',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Bruizer',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Renown',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Caroline',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Indefatigable',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Black Pearl',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Black Hawk',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Dancing Betty',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Red Phoenix',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Flying Dutchman',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Bloody Mary',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('The Bearded Lady',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Huitzilopochtli',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Tonatiuh',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Akhet',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Amarnhaten',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Magna Libertatis',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Navis Nautarum',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Essex',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Cibus',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Artis',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Adventure',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Interceptor',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Enterprise',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Mayflower',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Beagle',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Argo',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Blue Tulip',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Swan of Amsterdam',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Flying Molly',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Albertros',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Saint Peter',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Neptune',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Poseidon',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Triton',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Silver Tuna',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Golden Cod',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('Opal Whale',0,0,1,0,'en');
INSERT INTO "shipnames" VALUES('L''Etoile',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Seastar',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Resolution',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Santa Barbara',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Santa Maria',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Gallega',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Pinta',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Santa Clara',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Pietro Gonzale',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Erasmo',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Jodocus',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Cristina de Bolsena',0,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Seewolf',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Queen Anne''s Revenge',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Black Joke',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Blanco',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Cassandra',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Flying Dragon',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Golden Hind',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Good Fortune',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Liberty',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Loyal Fortune',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Ranger',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Revenge',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Rising Sun',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Royal Fortune',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Sea King',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Speedy Return',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Sudden Death',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Victory',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Caleuche',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Dark Maiden',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Night Ram',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Red Sun',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Sea Dragon',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Black Snake',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Surface Shark',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Queen of the Seas',1,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Thunder Dragon',1,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Silver Dragon',1,1,0,0,'en');
INSERT INTO "shipnames" VALUES('The Ghost Dragon',1,1,0,0,'en');
INSERT INTO "shipnames" VALUES('New Hope',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('New Dawn',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('The Mermaid',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Holy Maiden',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Black Thunder',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Black Serpent',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('The Laughing Ghost',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('The Mad King',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('The Dark Maiden',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Victoria',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Carmen',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Jornada',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Fe',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Nassau',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Elisabeth',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Festering Boot',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Cygne Noir',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Los Contaminacao',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Sinspawn',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Keelhaul',0,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Bruynvisch',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Groene Draeck',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Hollandsche Tuin',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Vliegende Draeck',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Vogelstruys',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Vrijheid',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Gerechtigheid',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Gloeyenden Oven',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Tijdverdrijf',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Dolphijn',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Fazant',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Eenhoorn',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Gekroonde Liefde',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Geloof',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Wakende Boei',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Beschermer',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Voorzichtigheid',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Groningen',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Vlissingen',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Walcheren',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Callantsoog',1,0,0,0,'nl');
INSERT INTO "shipnames" VALUES('Ada',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Agnes',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Emma Stonard',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Alice',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Alnwick',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Amelia',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Ann Ellen',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Ann Summer',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Ant',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Argus',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Arthur Gordon',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Augusta',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Backbarrow',1,1,0,1,'en');
INSERT INTO "shipnames" VALUES('Bans Vale',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Bardsea',1,1,0,1,'en');
INSERT INTO "shipnames" VALUES('Belle',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Britannia',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Baron Hill',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Beatrice',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Confidence',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Dove',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Delight',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Dreadnaught',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Emma',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Eugene',1,0,1,1,'en');
INSERT INTO "shipnames" VALUES('Francis',1,1,0,1,'en');
INSERT INTO "shipnames" VALUES('Gauntlet',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Gleaner',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Gratitude',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Glenravil Miner',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Greyhound',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Holy Wath',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Hope',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Hermes',1,1,0,1,'en');
INSERT INTO "shipnames" VALUES('Hare',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Hodbarrow Miner',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Isabella',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Jane',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Kate',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Kitty',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Leo',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Leven',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Mary Jane',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Mary Ann',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Octavia',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Old Hunter',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Rose',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Royal Oak',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Sea King',1,1,0,0,'en');
INSERT INTO "shipnames" VALUES('Squire',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Sirius',1,1,0,1,'en');
INSERT INTO "shipnames" VALUES('Success',1,0,0,0,'en');
INSERT INTO "shipnames" VALUES('Swift',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Tower',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('Wave',1,0,0,1,'en');
INSERT INTO "shipnames" VALUES('William',1,0,1,1,'en');
CREATE TABLE resource (
    "tradeable" BOOL NOT NULL DEFAULT (0),
    "name" TEXT NOT NULL,
    "value" INTEGER,
    "id" INTEGER AUTO_INCREMENT NOT NULL,
    "shown_in_inventory" BOOL NOT NULL DEFAULT (1)
);
INSERT INTO "resource" VALUES(0,'coins',0,1,0);
INSERT INTO "resource" VALUES(0,'lamb wool',2,2,1);
INSERT INTO "resource" VALUES(1,'textile',6.5,3,1);
INSERT INTO "resource" VALUES(1,'boards',1.25,4,1);
INSERT INTO "resource" VALUES(1,'food',2,5,1);
INSERT INTO "resource" VALUES(1,'tools',18.5,6,1);
INSERT INTO "resource" VALUES(1,'bricks',15,7,1);
INSERT INTO "resource" VALUES(0,'wood',1,8,1);
INSERT INTO "resource" VALUES(0,'grass',0,9,0);
INSERT INTO "resource" VALUES(1,'wool',2.5,10,1);
INSERT INTO "resource" VALUES(0,'faith',NULL,11,1);
INSERT INTO "resource" VALUES(0,'deer food A',0,12,0);
INSERT INTO "resource" VALUES(0,'deer meat',2,13,0);
INSERT INTO "resource" VALUES(0,'happiness',NULL,14,0);
INSERT INTO "resource" VALUES(0,'potatoes',2,15,1);
INSERT INTO "resource" VALUES(0,'education',NULL,16,0);
INSERT INTO "resource" VALUES(0,'sugar cane',2,17,1);
INSERT INTO "resource" VALUES(1,'sugar',2.5,18,1);
INSERT INTO "resource" VALUES(0,'community',NULL,19,0);
INSERT INTO "resource" VALUES(0,'clay deposit',0,20,1);
INSERT INTO "resource" VALUES(1,'clay',7.5,21,1);
INSERT INTO "resource" VALUES(1,'liquor',6.5,22,1);
INSERT INTO "resource" VALUES(1,'charcoal',6.5,23,1);
INSERT INTO "resource" VALUES(0,'iron deposit',0,24,1);
INSERT INTO "resource" VALUES(1,'iron ore',7.5,25,1);
INSERT INTO "resource" VALUES(1,'iron ingots',24,26,1);
INSERT INTO "resource" VALUES(0,'get-together',NULL,27,0);
INSERT INTO "resource" VALUES(0,'fish',0,28,0);
INSERT INTO "resource" VALUES(1,'salt',15,29,1);
INSERT INTO "resource" VALUES(0,'tobacco plants',2,30,1);
INSERT INTO "resource" VALUES(1,'tobacco leaves',2.5,31,1);
INSERT INTO "resource" VALUES(1,'tobaccos',10,32,1);
INSERT INTO "resource" VALUES(0,'cattle',0,33,1);
INSERT INTO "resource" VALUES(0,'pigs',0,34,1);
INSERT INTO "resource" VALUES(0,'cattle for slaughter',2,35,1);
INSERT INTO "resource" VALUES(0,'pigs for slaughter',2,36,1);
INSERT INTO "resource" VALUES(0,'herbs',0,37,1);
INSERT INTO "resource" VALUES(0,'medical herbs',2.5,38,0);
INSERT INTO "resource" VALUES(0,'acorns',0,39,1);
INSERT INTO "resource" VALUES(1,'cannon',100,40,1);
INSERT INTO "resource" VALUES(0,'dagger',10,41,0);
INSERT INTO "resource" VALUES(0,'fire',0,42,0);
INSERT INTO "resource" VALUES(0,'gun',100,43,0);
CREATE TABLE translucent_buildings(type INTEGER);
INSERT INTO "translucent_buildings" VALUES(17);
INSERT INTO "translucent_buildings" VALUES(34);
INSERT INTO "translucent_buildings" VALUES(28);
CREATE TABLE "weapon" (
	"id" INTEGER,
	"type" TEXT,
	"damage" INT,
	"min_range" INT,
	"max_range" INT,
	"cooldown_time" INT,
	"attack_speed" INT,
	"attack_radius" INT,
	"stackable" BOOLEAN,
	"bullet_image" TEXT);
INSERT INTO "weapon" VALUES(40,'ranged',7,5,15,3,4,2,1,'content/gfx/misc/cannonballs/cannonball.png');
INSERT INTO "weapon" VALUES(41,'melee',3,1,1,3,2,1,0,'');
INSERT INTO "weapon" VALUES(43,'bullet',5,3,6,3,4,2,0,'content/gfx/misc/cannonballs/cannonball.png');
CREATE TABLE settler_production_line(level INTEGER, production_line INTEGER);
INSERT INTO "settler_production_line" VALUES(0,71);
INSERT INTO "settler_production_line" VALUES(0,72);
INSERT INTO "settler_production_line" VALUES(1,19);
INSERT INTO "settler_production_line" VALUES(1,20);
INSERT INTO "settler_production_line" VALUES(1,21);
INSERT INTO "settler_production_line" VALUES(1,26);
INSERT INTO "settler_production_line" VALUES(0,30);
INSERT INTO "settler_production_line" VALUES(1,30);
INSERT INTO "settler_production_line" VALUES(2,30);
INSERT INTO "settler_production_line" VALUES(2,43);
INSERT INTO "settler_production_line" VALUES(2,20);
INSERT INTO "settler_production_line" VALUES(2,21);
INSERT INTO "settler_production_line" VALUES(2,44);
INSERT INTO "settler_production_line" VALUES(2,41);
INSERT INTO "settler_production_line" VALUES(2,69);
INSERT INTO "settler_production_line" VALUES(2,70);
CREATE TABLE settler_level (
    "level" INT NOT NULL DEFAULT (''),
    "name" TEXT NOT NULL DEFAULT (''),
    "tax_income" INT NOT NULL DEFAULT (''),
    "inhabitants_max" INT
, "residential_name" TEXT   DEFAULT (''));
INSERT INTO "settler_level" VALUES(0,'sailor',3,2,'tent');
INSERT INTO "settler_level" VALUES(1,'pioneer',6,3,'hut');
INSERT INTO "settler_level" VALUES(2,'settler',10,5,'house');
INSERT INTO "settler_level" VALUES(3,'citizen',15,8,'stone house');
INSERT INTO "settler_level" VALUES(4,'merchant',21,13,'estate');
INSERT INTO "settler_level" VALUES(5,'aristocrat',28,21,'manor');
CREATE TABLE status_icon_exclusions (
    "object_type" INT NOT NULL DEFAULT (''));
INSERT INTO "status_icon_exclusions" VALUES(17);
INSERT INTO "status_icon_exclusions" VALUES(1);
INSERT INTO "status_icon_exclusions" VALUES(5);
INSERT INTO "status_icon_exclusions" VALUES(33);
INSERT INTO "status_icon_exclusions" VALUES(15);
INSERT INTO "status_icon_exclusions" VALUES(18);
INSERT INTO "status_icon_exclusions" VALUES(19);
INSERT INTO "status_icon_exclusions" VALUES(22);
INSERT INTO "status_icon_exclusions" VALUES(36);
INSERT INTO "status_icon_exclusions" VALUES(45);
INSERT INTO "status_icon_exclusions" VALUES(21);
INSERT INTO "status_icon_exclusions" VALUES(32);
INSERT INTO "status_icon_exclusions" VALUES(1000013);

CREATE TABLE additional_provided_resources (
    "object_id" INT NOT NULL,
		"resource" INT NOT NULL
	);
INSERT INTO "additional_provided_resources" VALUES(3,42);
