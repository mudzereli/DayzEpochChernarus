if (isDedicated) exitWith {};
diag_log text "BUILDPLUS: initializing...";
player_build = compile preprocessFileLineNumbers "overwrites\player_build.sqf";
snap_object  = compile preprocessFileLineNumbers "addons\buildplus\snap_object.sqf";