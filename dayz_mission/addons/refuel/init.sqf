if (isDedicated) exitWith {};
call compile preprocessFileLineNumbers "addons\refuel\config.sqf";
[] spawn {
    private ["_vehicle","_vehicle_refuel_id","_isNearFeed","_last_vehicle"];
    diag_log text "REFUEL: initializing...";
    _vehicle = objNull;
    _vehicle_refuel_id = -1;
    diag_log text "REFUEL: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    while {true} do {
        _isNearFeed = count ((position _vehicle) nearObjects ["Land_A_FuelStation_Feed", 10]) > 0;
        if(!DZ_REFUEL_AUTOMATIC) then {
            _last_vehicle = _vehicle;
            if(vehicle player != player) then { _vehicle = vehicle player; } else { _vehicle = objNull; };
            if (_vehicle_refuel_id > -1 && !(isNull _last_vehicle) && _last_vehicle != _vehicle) then {
                _last_vehicle removeAction _vehicle_refuel_id;
                _vehicle_refuel_id = -1;
            };
            if (!(isNull _vehicle)) then {
                _isNearFeed = count ((position _vehicle) nearObjects ["Land_A_FuelStation_Feed", 10]) > 0;
                switch (true) do {
                    case (_isNearFeed && _vehicle_refuel_id == -1): {
                        _vehicle_refuel_id = _vehicle addAction["<t color='#ffbb33'>" + "Refuel" + "<\t>","addons\refuel\refuel.sqf",[],-1, false,false,"","vehicle _this == _target && local _target"];
                    }; 
                    case (!_isNearFeed): {
                        _vehicle removeAction _vehicle_refuel_id;
                        _vehicle_refuel_id = -1;
                    };
                };
            };
        } else {
            if(vehicle player != player) then {
                [(vehicle player),(vehicle player),0] execVM "addons\refuel\refuel.sqf";
            };
        };
        sleep 4;
    };
};