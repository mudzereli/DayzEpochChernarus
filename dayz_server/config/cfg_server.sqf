//########################################################################################
//### MAIN CONFIG OPTIONS
//########################################################################################

/* 0 = DEFAULT, 1 = SOLO, 2 = OUTBREAK */
DZS_GAMEMODE = 0;

/* try to load infistar files if this is set to true */
DZ_INFISTAR_ENABLED = true;

/* load init.sqf files from the following addon folders */
DZ_SERVER_ADDONS = ["indestructible","cleanup"];

//########################################################################################
//### DYNAMIC VEHICLES
//########################################################################################

DZ_DYNAMIC_VEHICLE_MULTIPLIER = 2;

//########################################################################################
//### INDESTRUCTIBLE BASES
//########################################################################################

/* objects with these classes are indestructible */
DZ_INDESTRUCTIBLE_CLASSES = ["CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorLocked_DZ","CinderWallDoorway_DZ","MetalFloor_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoor_DZ"];

//########################################################################################
//### DZMS
//########################################################################################
call compile preprocessFileLineNumbers "z\addons\dayz_server\config\DZMSConfig.sqf";

//########################################################################################
//### DZAI
//########################################################################################
call compile preprocessFileLineNumbers "z\addons\dayz_server\config\dzai_config.sqf";

//########################################################################################
//### GAMEMODE
//########################################################################################
switch(DZS_GAMEMODE) do {
    case 1: {
        DZ_SERVER_ADDONS = DZ_SERVER_ADDONS - ["indestructible"];
        DZ_DYNAMIC_VEHICLE_MULTIPLIER = 1;
    };
    case 2: {
        DZ_SERVER_ADDONS = DZ_SERVER_ADDONS - ["indestructible"];
        DZ_DYNAMIC_VEHICLE_MULTIPLIER = 4;
    };
};

//########################################################################################
//### OVERRIDES
//########################################################################################
call compile preprocessFileLineNumbers "z\addons\dayz_server\config\cfg_server_override.sqf";