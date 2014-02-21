if (isDedicated) exitWith {};
private ["_has_toolbox","_has_parts","_vehicle_class","_parts_required","_required_class","_required_count","_actual_count","_on_ladder","_can_do"];
diag_log text "CRAFT VEHICLES: waiting for login...";
[] spawn {
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    diag_log text "CRAFT VEHICLES: hooking...";
    while {true} do {
        if(!isNull player) then {
            //diag_log text "CRAFT VEHICLES: checking if player has toolbox";
            _has_toolbox = "ItemToolbox" in (weapons player);
            _on_ladder   = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
            _can_do      = (!r_drag_sqf and !r_player_unconscious and !_on_ladder);
            if (!DZ_VEHICLE_CRAFT_TOOLBOX) then { _has_toolbox = true; };
            if (_can_do && _has_toolbox) then {
                {
                    _has_parts      = true;
                    _vehicle_class  = _x select 0;
                    _parts_required = _x select 1;
                    {
                        _required_class = _x select 0;
                        _required_count = _x select 1;
                        _actual_count   = { _x == _required_class; } count magazines player;
                        if (_actual_count < _required_count) then { _has_parts = false; };
                    } forEach _parts_required;
                    call compile format["
                    if (isNil 'scroll_craft_%1') then { scroll_craft_%1 = -1; };
                    if (_has_parts) then {
                        if (scroll_craft_%1 < 0) then {
                            scroll_craft_%1 = player addAction ['<t color=""#33b5e5"">' + 'Craft %1' + '</t>', 'addons\craftvehicles\craft_vehicle.sqf',[_x,scroll_craft_%1],-10,false,true,'',''];
                        };
                    } else {
                        player removeAction scroll_craft_%1;
                        scroll_craft_%1 = -1;
                    };
                    ",_vehicle_class];
                } forEach DZ_VEHICLE_CRAFT_RECIPES;
            };
        };
        sleep 2;
    };
};