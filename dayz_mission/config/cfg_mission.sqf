//########################################################################################
//### MAIN CONFIG OPTIONS
//########################################################################################

/* 0 = DEFAULT, 1 = SOLO, 2 = OUTBREAK, -1 = RANDOM */
DZ_GAMEMODE = 0;

/* addons from these folders will be loaded */
DZ_MISSION_ADDONS = ["bloodbag","buildings","buildplus","craftvehicles","keyhandler","newspawn","refuel","deadzones","safezones","suicide","takeclothes","zombietruck"];

DZ_LOAD_SARGE_AI = false;

//########################################################################################
//### EPOCH CONFIG
//########################################################################################
dayZ_instance =	1742;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio true;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
MaxHeliCrashes= 5; // Default = 5
MaxVehicleLimit = 600; // Default = 50
MaxDynamicDebris = 100; // Default = 100
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 15; // Default = 30
DZE_teleport = [99999,99999,99999,99999,99999]; 
DefaultMagazines = ["ItemBandage","ItemPainkiller","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"]; 
DefaultWeapons = ["ItemFlashlight","Makarov"]; 
DefaultBackpack = "CZ_VestPouch_EP1"; 
DZE_BuildingLimit = 9999;
DZE_MissionLootTable = true;

dayz_paraSpawn = false;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//########################################################################################
//### EXTRA LOOT
//########################################################################################
/* multiplier for loot chance */
DZ_LOOTCHANCE_MULTIPLIER = 1;

//########################################################################################
//### SELF BLOODBAG
//########################################################################################

/* Amount of blood to give to player */
DZ_BLOODBAG_BLOOD_AMOUNT = 4000;

/* Amount of time it takes in second for the player to use the self bloodbag */
DZ_BLOODBAG_USE_TIME = 20;

/* Amount of time in seconds before player can use self bloodbag again after a succesful use */
DZ_BLOODBAG_LAST_USED_TIME = 60;

/* Percent chance of player infection on self bloodbag (10 = 10% | 2 = 50% | 1 = 100%) */
DZ_BLOODBAG_INFECTION_CHANCE = 10;

/* Whether the player can loose life if infected (True = On | False = off) */
DZ_BLOODBAG_INFECTION_CAN_DAMAGE = true;

/* Amount of life to loose in becomes infected */
DZ_BLOODBAG_INFECTION_DAMAGE = 1000;

/* Whether the player can get humanity from giving self a bloodbag (True = On | False = off) */
DZ_BLOODBAG_CAN_GAIN_HUMANITY = false;

/* Amount of humanity to give player if _humanityBool is true (250 is default for normal bloodbags) */
DZ_BLOODBAG_GAIN_HUMANITY = 50;

//########################################################################################
//### BUILDPLUS
//########################################################################################

/* Time to preview before building (default = 60) */
DZ_BUILDPLUS_PREVIEW_TIMER = 300;

/* Diameter of a plot (default = 30) */
DZ_BUILDPLUS_PLOT_DIAMETER = 30;

/* When previewing, how many meters can a player move an item before cancelling (default = 5) */
DZ_BUILDPLUS_PREVIEW_CHANGE_DIST = 10;

/* All crafting only takes one stage (default = false)?  */
DZ_BUILDPLUS_SINGLE_STAGE_CRAFTING = true;

/* Allow Player To Build Plot In Their Own Plot? (default = false)  */
DZ_BUILDPLUS_PLOT_IN_PLOT = true;

/* Players can build these items without a plot pole */
DZ_BUILDPLUS_NO_PLOT_ITEMS = [
    "WoodFloor_DZ",
    "WoodFloorHalf_DZ",
    "WoodFloorQuarter_DZ",
    "Land_DZE_LargeWoodDoorLocked",
    "WoodLargeWallDoor_DZ",
    "WoodLargeWallWin_DZ",
    "WoodLargeWall_DZ",
    "Land_DZE_WoodDoorLocked",
    "WoodSmallWallDoor_DZ",
    "WoodSmallWallWin_DZ",
    "Land_DZE_GarageWoodDoor",
    "Land_DZE_GarageWoodDoorLocked",
    "WoodLadder_DZ",
    "WoodStairsSans_DZ",
    "WoodStairs_DZ",
    "WoodSmallWall_DZ",
    "WoodSmallWallThird_DZ",
    "Land_DZE_LargeWoodDoor"
];

//########################################################################################
//### CRAFT VEHICLES
//########################################################################################

/* require toolbox to craft? */
DZ_VEHICLE_CRAFT_TOOLBOX = true;

/* 
    This table contains the recipes used to craft items
    FORMAT: ["New_Vehicle_Class",[["Part_Class_1","Part_Class_1_Count],...]]
*/
 
DZ_VEHICLE_CRAFT_RECIPES = [
	["MMT_Civ"   ,[["PartWheel"   ,2],["PartGeneric",1]                                    ]],
	["TT650_Civ" ,[["PartWheel"   ,2],["PartGeneric",1],["PartFueltank",1],["PartEngine",1]]],
	["ATV_US_EP1",[["PartWheel"   ,4],["PartGeneric",1],["PartFueltank",1],["PartEngine",1]]],
	["CSJ_GyroC" ,[["PartFueltank",1],["PartVRotor" ,1],["PartGeneric" ,2],["PartEngine",1]]]
];

//########################################################################################
//### NEWSPAWN
//########################################################################################

/* This table maps donators to their spawn points */
DZ_NEWSPAWN_DONATOR_TABLE = 
[
	/* 	PLAYERNAME                   PLAYERUID    SPAWN POINT	 LOADOUT       SKIN     */
	[	"Evan",                  "134594118",      [],         true,        true      ],
	[	"(KMS) iTyphlosion",                  "144292230",      [],         true,        true      ],
	[	"PyroMatick",                  "150615686",      [],         true,        true      ],
	[	"Livid",                  "144292230",      [],         true,        true      ],
	[	"Beauman",                  "163696262",      [],         true,        true      ],
	[	"Kensington",                  "167076486",      [],         true,        true      ],
	[	"Pvt. Fagtron",                  "168254086",      [],         true,        true      ],
	[	"mudzereli",                  "38130182",      [],         true,        true      ],
	[	"NossaT",                  "50513926",      [],         true,        true      ],
	[	"NikeFreek",                  "88930246",      [],         true,        true      ],
	[	"BigCores",                  "93026246",      [],         true,        true      ],
	[	"Barkity",                  "40113734",      [],         true,        true      ],
	[	"[BTY]Neux",                  "15708166",      [],         true,        true      ],
	[	"Bekool813",                  "236779846",      [],         true,        true      ],
	[	"Example",                  "000000000",      [],         true,        true      ]
];

/* should players be able to choose a class or not? */
DZ_NEWSPAWN_PICK_CLASS = true;

/* should all players be able to choose a skin? */
DZ_NEWSPAWN_ALL_SKINS = true;

/* what vehicle should players spawn with? default = "NONE" */
DZ_RESPAWN_VEHICLE_CLASS = "NONE";

//########################################################################################
//### REFUEL
//########################################################################################

/* Refuel tick in seconds (default 0.5) */
DZ_REFUEL_TICK_INTERVAL = 1;

/* How much % fuel to add per tick (default 0.005)*/
DZ_REFUEL_AMOUNT_PER_TICK = 0.02;

/* Should vehicles automatically refuel without using an action menu? */
DZ_REFUEL_AUTOMATIC = true;

//########################################################################################
//### DEADZONES
//########################################################################################

AGN_deadZoneMessages = true;                                //Should messages be displayed?
AGN_safeZone_Vehicles_DisableMountedGuns = true;			//Should players not be able to shoot bullets/projectiles from mounted guns?
AGN_safeZone_Players_DisableWeaponFiring = true;			//Should players not be able to shoot bullets/projectiles from their weapon(s)?

//########################################################################################
//### SAFEZONES
//########################################################################################

AGN_safeZoneDebug = false; 									//Debug notes on screen.
AGN_safeZoneGodmode = true; 								//Should safezone Godmode be enabled?
AGN_safeZoneVehicleGodmode = true; 							//Should safezone Vehicle Godmode be enabled?
AGN_safeZoneMessages = true;								//Should players get messages when entering and exiting the safe zone?
AGN_safeZone_Backpack_EnableAntiBackpack = true;			//Should players not be able to take from peoples bags?
AGN_safeZone_Backpack_AllowGearFromLootPiles = true;		//Should players be able to loot from loot piles?
AGN_safeZone_Backpack_AllowGearFromVehicles = true;		    //Should players be able to loot from a vehicles gear?
AGN_safeZone_Backpack_AllowGearFromDeadPlayers = true;	    //Should players be able to loot from a dead players corpse?
AGN_safeZone_Backpack_AllowFriendlyTaggedAccess = true;	    //Should players who are tagged friendly be able to access eachothers bags?
AGN_safeZone_Vehicles_AllowGearFromWithinVehicles = true;	//Should players be able to open the gear screen while they are inside a vehicle?
AGN_safeZone_Remove_Zombie_Radius = 30;						//Radius @ which to remove zombies (0 = do not remove)

//########################################################################################
//### SUICIDE
//########################################################################################

/* Player must have one bullet to commit suicide */
DZ_SUICIDE_REQUIRE_BULLET = true;

/* Intro for suicide time, player can cancel by moving */
DZ_SUICIDE_CANCEL_TIME = 6;

/* Message displayed after suicide is cancelled */
DZ_SUICIDE_CANCEL_MESSAGE = "Wait, I do still want to live!";

/* First message displayed during suicide sequence */
DZ_SUICIDE_MESSAGE_1 = "What have I done to deserve this terrible life???";

/* Second message displayed during suicide sequence */
DZ_SUICIDE_MESSAGE_2 = "There's no reason to go on living now...";

/* Third message displayed during suicide sequence */
DZ_SUICIDE_MESSAGE_3 = "I refuse to become one of those, those THINGS!";

/* Final message displayed during suicide sequence */
DZ_SUICIDE_MESSAGE_4 = "This is the end!";

//########################################################################################
//### TAKECLOTHES
//########################################################################################

/* This holds all the skins that don't need a Map */ 
DZ_TAKECLOTHES_MATCH = [
"Sniper1_DZ", "Soldier1_DZ", "Camo1_DZ", "Survivor2_DZ", "RU_Policeman_DZ", "Priest_DZ", "Haris_Press_EP1_DZ", "Pilot_EP1_DZ", "Functionary1_EP1_DZ",
"Rocker1_DZ", "Rocker2_DZ", "Rocker3_DZ", "Rocker4_DZ", "BanditW1_DZ", "BanditW2_DZ", "SurvivorW2_DZ", "SurvivorW3_DZ", "SurvivorWcombat_DZ", "SurvivorWdesert_DZ",
"SurvivorWurban_DZ", "SurvivorWpink_DZ", "Rocket_DZ", "CZ_Soldier_Sniper_EP1_DZ", "FR_OHara_DZ", "FR_Rodriguez_DZ", "Graves_Light_DZ",
"CZ_Special_Forces_GL_DES_EP1_DZ", "Soldier_Bodyguard_AA12_PMC_DZ", "Soldier_Sniper_PMC_DZ", "Bandit1_DZ", "Bandit2_DZ", "GUE_Soldier_MG_DZ",
"GUE_Soldier_Sniper_DZ", "GUE_Soldier_Crew_DZ", "GUE_Soldier_CO_DZ", "GUE_Soldier_2_DZ", "GUE_Commander_DZ", "Ins_Soldier_GL_DZ", "TK_INS_Soldier_EP1_DZ",
"TK_INS_Warlord_EP1_DZ", "INS_Worker2_DZ", "INS_Bardak_DZ", "INS_Soldier_CO_DZ", "INS_Soldier_AR_DZ", "INS_Lopotev_DZ", "RU_Soldier_Crew_DZ", "TK_Commander_EP1_DZ",
"TK_Soldier_Sniper_EP1_DZ", "TK_Special_Forces_MG_EP1_DZ", "Soldier_TL_PMC"
]; 
/* This table is used to look up the model to see what clothing package should be given */
DZ_TAKECLOTHES_MAP = [
["z_policeman","Skin_RU_Policeman_DZ"],
["z_suit1","Skin_Functionary1_EP1_DZ"],
["z_suit2","Skin_Functionary1_EP1_DZ"],
["z_suit3","Skin_Functionary1_EP1_DZ"], 
["z_priest","Skin_Priest_DZ"],
["z_soldier","Skin_Camo1_DZ"],
["z_soldier_heavy","Skin_Soldier1_DZ"],
["z_soldier_pilot","Skin_RU_Soldier_Crew_DZ"]
];

//########################################################################################
//### ZOMBIETRUCK
//########################################################################################

/* This list is used to determine what kinds of trucks can load zombies */
DZ_ZOMBIE_TRUCK_TRUCK_CLASSES = ["Ural_CDF","Ural_TK_CIV_EP1","Ural_UN_EP1","V3S_Open_TK_CIV_EP1","V3S_Open_TK_EP1","Kamaz","MTVR_DES_EP1","V3S_Civ","V3S_RA_TK_GUE_EP1_DZE","V3S_TK_EP1_DZE","UralCivil_DZE","UralCivil2_DZE","KamazOpen_DZE","MTVR"];

/* This list is used to determine what kinds of zombies can be loaded into trucks */
DZ_ZOMBIE_TRUCK_ZOMBIE_CLASSES = ["zZombie_Base","z_policeman","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_doctor","z_teacher","z_hunter","z_villager1","z_villager2","z_villager3","z_priest","z_soldier","z_soldier_pilot","z_soldier_heavy"];

/* Max number of zombies a truck can hold? (default = 15) */
DZ_ZOMBIE_TRUCK_ZOMBIE_LIMIT = 15;

/* How long is a player stuck when loading a zombie? (default = 5) */
DZ_ZOMBIE_TRUCK_LOAD_TIME = 5;

/* Max distance from truck and zombie to load it? (default = 5) */
DZ_ZOMBIE_TRUCK_LOAD_DISTANCE = 5;

//########################################################################################
//### SPAWN LOOT
//########################################################################################

/* multiplier for ALL loot -- stacks with settings below */
DZ_SPAWN_LOOT_MULTIPLIER = 1;

/* multiplier for default loot */
DZ_SPAWN_LOOT_DEFAULT_MULTIPLIER = 1;

/* multiplier for weapon mag loot */
DZ_SPAWN_LOOT_WEAPON_MAG_MULTIPLIER = 1;

/* multiplier for supply loot */
DZ_SPAWN_LOOT_SUPPLIES_MULTIPLIER = 1;

//########################################################################################
//### SARGE CONFIG
//########################################################################################
call compile preprocessFileLineNumbers "config\SAR_config.sqf";

//########################################################################################
//### OVERRIDES
//########################################################################################
call compile preprocessFileLineNumbers "config\cfg_mission_override.sqf";

//########################################################################################
//### GAMEMODE OVERRIDES
//########################################################################################
if (DZ_GAMEMODE == -1) then {DZ_GAMEMODE = floor(random 3);};
switch (DZ_GAMEMODE) do {
    case 1: {
        DZ_MISSION_ADDONS = DZ_MISSION_ADDONS - ["craftvehicles","deadzones","buildings"];
        DZ_LOAD_SARGE_AI = true;
        DZE_BuildOnRoads = true;
        dayz_fullMoonNights = false;
        DZ_NEWSPAWN_PICK_CLASS = false;
        DZ_REFUEL_AUTOMATIC = false;
        DZ_LOOTCHANCE_MULTIPLIER = 0.5;
        DefaultWeapons = ["ItemFlashlight"]; 
        DefaultBackpack = "CZ_VestPouch_EP1";
    };
    case 2: {
        DZ_LOAD_SARGE_AI = true;
        DynamicVehicleDamageHigh = 0;
        dayz_maxLocalZombies = 50;
        MaxVehicleLimit = 2000;
        MaxHeliCrashes= 10;
        DZ_RESPAWN_VEHICLE_CLASS = "SUV_Camo";
        DZ_SPAWN_LOOT_MULTIPLIER = 2;
        DZ_SPAWN_LOOT_WEAPON_MAG_MULTIPLIER = 2;
        DZ_SPAWN_LOOT_SUPPLIES_MULTIPLIER = 3;
        DZ_LOOTCHANCE_MULTIPLIER = 3;
    };
};