if (isDedicated) exitWith {};
diag_log text "SPAWNPLUS: loading config...";
call compile preprocessFileLineNumbers "addons\spawnplus\config.sqf";

diag_log text "SPAWNPLUS: loading libraries...";
call compile preprocessFileLineNumbers "addons\spawnplus\lib\key_map.sqf";

diag_log text "SPAWNPLUS: compiling functions...";
pick_location    = compile preprocessFileLineNumbers "addons\spawnplus\compiles\pick_location.sqf";
pick_skin        = compile preprocessFileLineNumbers "addons\spawnplus\compiles\pick_skin.sqf";
pick_class       = compile preprocessFileLineNumbers "addons\spawnplus\compiles\pick_class.sqf";
respawn_handler  = compile preprocessFileLineNumbers "addons\spawnplus\compiles\respawn_handler.sqf";
add_donator_skin = compile preprocessFileLineNumbers "addons\spawnplus\compiles\give_clothes.sqf";

diag_log text "SPAWNPLUS: spawning main script...";
[] spawn {
    private ["_donatorID"];
	diag_log text "SPAWNPLUS: waiting for login...";
    waitUntil {!isNil "PVDZE_plr_LoginRecord"};
    
    diag_log text "SPAWNPLUS: building arrays...";
    DZ_SPAWNPLUS_CREATION_STAGE       = 3;
    DZ_SPAWNPLUS_DONATOR_SPAWN_POINTS = [];
    DZ_SPAWNPLUS_DONATOR_LOADOUT      = false;
    DZ_SPAWNPLUS_DONATOR_SKIN         = false;
    {
        _donatorID = _x select 1;
        if ((getPlayerUID player) == _donatorID) then {
            diag_log text "SPAWNPLUS: player is a donator!";
            DZ_SPAWNPLUS_DONATOR_SPAWN_POINTS = _x select 2;
            DZ_SPAWNPLUS_DONATOR_LOADOUT      = _x select 3;
            DZ_SPAWNPLUS_DONATOR_SKIN         = _x select 4;
        };
    } forEach DZ_SPAWNPLUS_DONATOR_TABLE;
    
    diag_log text "SPAWNPLUS: hooking...";
    if (dayzPlayerLogin2 select 2) then { 
        DZ_SPAWNPLUS_CREATION_STAGE = 0;
        [] spawn respawn_handler; 
        diag_log text "SPAWNPLUS: hooked...";
    };
};