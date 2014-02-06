diag_log text "MISSION SYSTEM: initializing...";
call compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\config.sqf";
diag_log text "MISSION SYSTEM: loading missions...";
call compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\missions.sqf";
diag_log text "MISSION SYSTEM: loading functions...";
fnc_random_distance = compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\functions\fnc_random_distance.sqf";
fnc_add_unit_group  = compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\functions\fnc_add_unit_group.sqf";
fnc_wait_realtime   = compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\functions\fnc_wait_realtime.sqf";
DZ_MISSIONS_MINOR   = [];
DZ_MISSIONS_MAJOR   = [];
{
    if ((_x select 2) == "major") then {
        DZ_MISSIONS_MAJOR set [count DZ_MISSIONS_MAJOR,_x];
    } else {
        DZ_MISSIONS_MINOR set [count DZ_MISSIONS_MINOR,_x];
    };
} forEach DZ_MISSIONS;
diag_log text format["MISSION SYSTEM: loaded %1 major and %2 minor missions...",count DZ_MISSIONS_MAJOR, count DZ_MISSIONS_MINOR];
diag_log text "MISSION SYSTEM: launching major mission script...";
DZ_MISSIONS_MAJOR spawn compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\functions\fnc_mission_thread.sqf";
diag_log text "MISSION SYSTEM: launching minor mission script...";
DZ_MISSIONS_MINOR spawn compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\functions\fnc_mission_thread.sqf";
diag_log text "MISSION SYSTEM: starting marker refresh script...";
[] spawn compile preprocessFileLineNumbers "z\addons\dayz_server\addons\missions\refresh_markers.sqf";
