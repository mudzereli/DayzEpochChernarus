if (isDedicated) exitWith {};
call compile preprocessFileLineNumbers "addons\newspawn\key_map.sqf";
diag_log text "NEWSPAWN: building functions...";
pick_location    = compile preprocessFileLineNumbers "addons\newspawn\pick_location.sqf";
pick_skin        = compile preprocessFileLineNumbers "addons\newspawn\pick_skin.sqf";
pick_class       = compile preprocessFileLineNumbers "addons\newspawn\pick_class.sqf";
respawn_handler  = compile preprocessFileLineNumbers "addons\newspawn\respawn_handler.sqf";
add_donator_skin = compile '
    DZ_NEWSPAWN_CREATION_STAGE = 3;
    player addMagazine (_this select 0);
    cutText["You receive a clothing package!","PLAIN DOWN"];
';
[] spawn {
    private ["_donatorID"];
	diag_log text "NEWSPAWN: waiting for login...";
    waitUntil {!isNil "PVDZE_plr_LoginRecord"};
    diag_log text "NEWSPAWN: building arrays...";
    DZ_NEWSPAWN_CREATION_STAGE       = 3;
    DZ_NEWSPAWN_DONATOR_SPAWN_POINTS = [];
    DZ_NEWSPAWN_DONATOR_LOADOUT      = false;
    DZ_NEWSPAWN_DONATOR_SKIN         = false;
    {
        _donatorID = _x select 1;
        if ((getPlayerUID player) == _donatorID) then {
            diag_log text "NEWSPAWN: player is a donator!";
            DZ_NEWSPAWN_DONATOR_SPAWN_POINTS = _x select 2;
            DZ_NEWSPAWN_DONATOR_LOADOUT      = _x select 3;
            DZ_NEWSPAWN_DONATOR_SKIN         = _x select 4;
        };
    } forEach DZ_NEWSPAWN_DONATOR_TABLE;
    diag_log text "NEWSPAWN: hooking...";
    if (dayzPlayerLogin2 select 2) then { 
        DZ_NEWSPAWN_CREATION_STAGE = 0;
        [] spawn respawn_handler; 
    };
    diag_log text "NEWSPAWN: hooked...";
};