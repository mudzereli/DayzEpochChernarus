private ["_cfcust","_isNearFeed","_velocity","_target","_caller"];
_target = _this select 0;
_caller = _this select 1;
if (isNil "ib_refueling_in_progress") then { ib_refueling_in_progress = false; };
if (!ib_refueling_in_progress) then {
    _isNearFeed = count ((position _caller) nearObjects ["Land_A_FuelStation_Feed", 10]) > 0;
    if (!_isNearFeed) then {
        if (!DZ_REFUEL_AUTOMATIC) then {
            titleText ["You must be near a fuel station pump.", "PLAIN DOWN", 3];
            titleFadeOut 3;
        };
    } else {
        ib_refueling_in_progress = true;
        titleText ["Refueling", "PLAIN", 3];
        while {(vehicle _caller == _target) and (local _target) and _isNearFeed } do {
            _isNearFeed = count ((position _caller) nearObjects ["Land_A_FuelStation_Feed", 10]) > 0;
            _velocity = velocity _target;
            _cfcust = fuel _target;
            if ((_velocity select 0 > 1) or (_velocity select 1 > 1) or (_velocity select 2 > 1)) exitWith { };
            if (_cfcust >= 1.0) exitWith { };
            sleep DZ_REFUEL_TICK_INTERVAL;
            _cfcust = _cfcust + DZ_REFUEL_AMOUNT_PER_TICK;
            if (_cfcust >= 1.0) then { _cfcust = 1.0; };
            _target setFuel _cfcust;
            if (!_isNearFeed) then {
                titleText ["You must be near a fuel station pump.", "PLAIN DOWN", 3];
                titleFadeOut 3;
            };
        };
        titleFadeOut 1;
        ib_refueling_in_progress = false;
    };
};