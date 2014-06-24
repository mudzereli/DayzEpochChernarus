//########################################################################################
//### MAIN CONFIG OPTIONS
//########################################################################################

/* try to load infistar files if this is set to true */
DZ_INFISTAR_ENABLED = true;

/* load init.sqf files from the following addon folders */
DZ_SERVER_ADDONS = ["indestructible","cleanup"];

/* should the DZAI addon be enabled ? */
DZ_LOAD_DZAI = true;

/* should the DZMS mission system be enabled ? */
DZ_LOAD_DZMS = true;

//########################################################################################
//### DYNAMIC VEHICLES
//########################################################################################

/* if you are having trouble with not enough vehicles spawning even after changing the max vehicle spawn count, then adjust this number */
DZ_DYNAMIC_VEHICLE_MULTIPLIER = 1;

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
//### OVERRIDES
//########################################################################################
call compile preprocessFileLineNumbers "z\addons\dayz_server\config\cfg_server_override.sqf";