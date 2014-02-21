if (isDedicated) exitWith {};
private ["_onLadder","_canDo","_mags"];
diag_log text "SELF BLOODBAG: initializing...";
[] spawn {
    diag_log text "SELF BLOODBAG: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    while {true} do {
        if(!isNull player) then {
            _onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
            _canDo    = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
            _mags     = magazines player;
            if ("ItemBloodbag" in _mags) then {
                hasBagItem = true;
            } else { hasBagItem = false;};
            if((speed player <= 1) && hasBagItem && _canDo) then {
                if (s_player_selfBloodbag < 0) then {
                    s_player_selfBloodbag = player addaction["<t color=""#ff4444"">" + "Self Transfusion" + "</t>","addons\bloodbag\player_selfbloodbag.sqf","",5,false,true,"",""];
                };
            } else {
                player removeAction s_player_selfBloodbag;
                s_player_selfBloodbag = -1;
            };
        };
        sleep 3;
    };
};