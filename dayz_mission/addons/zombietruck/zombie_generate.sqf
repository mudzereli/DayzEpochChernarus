private ["_position","_doLoiter","_unitTypes","_loot","_array","_agent","_type","_radius","_method","_myDest","_newDest","_lootType","_rnd"];
_position =     _this select 0;
_doLoiter =     _this select 1;
_unitTypes =    _this select 2;

_loot =     "";
_array =    [];
_agent =    objNull;

if (count _unitTypes == 0) then {
    _unitTypes =    []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};

_type     = _unitTypes call BIS_fnc_selectRandom;
_radius   = 15;
_method   = "FORM";
_agent    = createAgent [_type, _position, [], _radius, _method];

PVDZE_zed_Spawn = [_agent];
publicVariableServer "PVDZE_zed_Spawn";

if (_doLoiter) then {
    _agent setDir round(random 180);
    _agent setPosATL _position;
    _agent setvelocity [0, 0, 1];
} else {
    _agent setVariable ["doLoiter",false,true];
};

dayz_spawnZombies = dayz_spawnZombies + 1;

_position = getPosATL _agent;
if (random 1 > 0.7) then {
    _agent setUnitPos "Middle";
};

if (isNull _agent) exitWith {
    dayz_spawnZombies = dayz_spawnZombies - 1;
};

_myDest = getPosATL _agent;
_newDest = getPosATL _agent;
_agent setVariable ["myDest",_myDest];
_agent setVariable ["newDest",_newDest];

_rnd = random 1;
if (_rnd > 0.3) then {
    _lootType =         configFile >> "CfgVehicles" >> _type >> "zombieLoot";
    if (isText _lootType) then {
        _array = []+ getArray (configFile >> "cfgLoot" >> getText(_lootType));
        if (count _array > 0) then {
            _loot = _array call BIS_fnc_selectRandomWeighted;
            if(!isNil "_array") then {
                _agent addMagazine _loot;
            };
        };
    };
};

//Start behavior
[_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";