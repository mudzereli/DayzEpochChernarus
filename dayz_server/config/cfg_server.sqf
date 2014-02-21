//########################################################################################
//### MAIN CONFIG OPTIONS
//########################################################################################

/* try to load infistar files if this is set to true */
INFISTAR_ENABLED = true;

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
call compile preprocessFileLineNumbers "DZMSConfig.sqf";

//########################################################################################
//### DZAI
//########################################################################################
call compile preprocessFileLineNumbers "dzai_config.sqf";

//########################################################################################
//### OVERRIDES
//########################################################################################
call compile preprocessFileLineNumbers "cfg_server_override.sqf";