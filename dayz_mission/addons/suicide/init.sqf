if (isDedicated) exitWith {};
diag_log text "SUICIDE: initializing...";
[] spawn {
    private ["_onLadder","_canDo"];
    diag_log text "SUICIDE: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    while {true} do {
        if(!isNull player) then {
            _onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
            _canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
            private ["_handGun"];
            _handGun = currentWeapon player;
            if ((_handGun in ["glock17_EP1","M9","M9SD","Makarov","MakarovSD","revolver_EP1","UZI_EP1","Sa61_EP1","Colt1911"]) && (!DZ_SUICIDE_REQUIRE_BULLET || player ammo _handGun > 0)) then {
                hasSecondary = true;
            } else {
                hasSecondary = false;
            };
            if((speed player <= 1) && hasSecondary && _canDo) then {
                if (s_player_suicide < 0) then {
                    s_player_suicide = player addaction["<t color=""#ff4444"">" + "Commit Suicide" + "</t>","addons\suicide\suicide.sqf",_handGun,0,false,true,"", ""];
                };
            } else {
                player removeAction s_player_suicide;
                s_player_suicide = -1;
            };
        };
        sleep 2;
    };
};