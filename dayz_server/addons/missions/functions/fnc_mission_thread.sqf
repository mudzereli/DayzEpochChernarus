private[
    "_coords","_pos","_mission","_buildings","_messageStart","_difficulty","_vehicles","_crates","_aiGroups","_messageComplete","_worldSpawns","_aiSpawns","_safeCoords","_coordsX","_coordsY",
    "_cityCoords","_cityRadius","_cityCoordsX","_cityCoordsY","_minCoordsY","_maxCoordsY","_minCoordsX","_maxCoordsX","_insideCityX","_insideCityY","_insideCity","_crateClassName","_crateFile","_crate","_crates","_bldg","_buildings",
    "_veh","_vehicles","_aiUnits","_missions","_cityName"
];

_missions = _this;

while {true} do {
    _mission         = _missions call BIS_fnc_selectRandom;
    _buildings       = _mission select 0;
    _messageStart    = _mission select 1;
    _difficulty      = _mission select 2;
    _vehicles        = _mission select 3;
    _crates          = _mission select 4;
    _aiGroups        = _mission select 5;
    _messageComplete = _mission select 6;
    _worldSpawns     = [];
    _aiSpawns        = [];
    
    [DZ_MISSION_WAIT_TIMER + (random DZ_MISSION_WAIT_TIMER),5] call fnc_wait_realtime;
    
    _safeCoords = false;
    while {!_safeCoords} do {
        _safeCoords = true;
        _coords     = [getMarkerPos "center",0,5000,10,0,1250,0] call BIS_fnc_findSafePos;
        _coordsX    = _coords select 0;
        _coordsY    = _coords select 1;
        {
            _cityName    = _x select 0;
            _cityCoords  = _x select 1;
            _cityRadius  = _x select 2;
            _cityCoordsX = _cityCoords select 0;
            _cityCoordsY = _cityCoords select 1;
            _minCoordsY  = _cityCoordsY - _cityRadius;
            _maxCoordsY  = _cityCoordsY + _cityRadius;
            _minCoordsX  = _cityCoordsX - _cityRadius;
            _maxCoordsX  = _cityCoordsX + _cityRadius;
            _insideCityX = _coordsX < _maxCoordsX && _coordsX > _minCoordsX;
            _insideCityY = _coordsY < _maxCoordsY && _coordsY > _minCoordsY;
            _insideCity  = _insideCityX && _insideCityY;
            if (_insideCity) then { _safeCoords = false; };
        } forEach DZ_MISSION_BLACKLIST_ZONES;
    };
    
    if (_difficulty == "major") then {
        PVDZ_MISSION_MAJOR_STATUS = [1,_coords];
        publicVariable "PVDZ_MISSION_MAJOR_STATUS";
    } else {
        PVDZ_MISSION_MINOR_STATUS = [1,_coords];
        publicVariable "PVDZ_MISSION_MINOR_STATUS";
    };
    
    diag_log text format["MISSION SYSTEM: starting mission at %1...",_coords];
    [nil,nil,rTitleText,_messageStart, "PLAIN",10] call RE;
    
    diag_log text format["MISSION SYSTEM: loading %1 crates...",count _crates];
    {
        _crateClassName = _x select 0;
        _crateFile      = _x select 1;
        _crate          = createVehicle[_crateClassName,_coords,[],0,"NONE"];
        _crate setVariable ["Mission",1,true];
        _crate enableSimulation false;
        diag_log text format["MISSION SYSTEM: Created a CRATE: %1 @ %2",typeOf _crate,getPos _crate];
        [_crate] call compile preprocessFileLineNumbers format["z\addons\dayz_server\addons\missions\functions\box_fills\%1.sqf",_crateFile];
        diag_log text format["MISSION SYSTEM: Filled CRATE %1 @ %2 with loot: %3",typeOf _crate,getPos _crate,_crateFile];
        _worldSpawns set [count _worldSpawns,_crate];
        diag_log text format["MISSION SYSTEM: added CRATE %1 @ %2 to worldspawns",typeOf _crate,getPos _crate];
    } forEach _crates;
    
    diag_log text format["MISSION SYSTEM: loading %1 buildings...",count _buildings];
    {
        _pos  = [_coords,10] call fnc_random_distance;
        _bldg = createVehicle[_x,_pos,[],0,"NONE"];
        _bldg setVariable ["Mission",1,true];
        _bldg enableSimulation false;
        diag_log text format["MISSION SYSTEM: Created a BUILDING: %1 @ %2",typeOf _bldg,getPos _bldg];
        _worldSpawns set [count _worldSpawns,_bldg];
        diag_log text format["MISSION SYSTEM: added BUILDING %1 @ %2 to worldspawns",typeOf _bldg,getPos _bldg];
    } forEach _buildings;
    
    diag_log text format["MISSION SYSTEM: loading %1 vehicles...",count _vehicles];
    {
        _pos = [_coords,10] call fnc_random_distance;
        _veh = createVehicle[_x,_pos,[],0,"NONE"];
        _veh setVariable ["Mission",1,true];
        _uniqueid = str(round(random 999999));
        _veh setVariable ["ObjectID", _uniqueid, true];
        _veh setVariable ["ObjectUID", _uniqueid, true];
        clearWeaponCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
    } forEach _vehicles;

    diag_log text format["MISSION SYSTEM: loading %1 ai groups...",count _aiGroups];
    {
        _pos      = [_coords,10] call fnc_random_distance;
        _aiUnits  = [_pos,_x select 0,_x select 1,_x select 2,_x select 3] call fnc_add_unit_group;
        _aiSpawns = _aiSpawns + _aiUnits;
    } forEach _aiGroups;
    diag_log text format["MISSION SYSTEM: spawned %1 ai units...",count _aiSpawns];

    diag_log text "MISSION SYSTEM: waiting for mission complete...";
    waitUntil{{isPlayer _x && {_x distance _coords < 20}} count playableUnits > 0 && {({alive _x} count (_aiSpawns)) <= 2}}; 
    

    if (_difficulty == "major") then {
        PVDZ_MISSION_MAJOR_STATUS = [2,_coords];
        publicVariable "PVDZ_MISSION_MAJOR_STATUS";
    } else {
        PVDZ_MISSION_MINOR_STATUS = [2,_coords];
        publicVariable "PVDZ_MISSION_MINOR_STATUS";
    };
    
    diag_log text "MISSION SYSTEM: mission completed...";
    [nil,nil,rTitleText,_messageComplete, "PLAIN",6] call RE;

    diag_log text format["MISSION SYSTEM: waiting %1 seconds to begin despawning items...",DZ_MISSION_DESPAWN_TIMER];
        
    [DZ_MISSION_DESPAWN_TIMER,5] call fnc_wait_realtime;
    
    diag_log text format["MISSION SYSTEM: killing %1 remaining units from group...",count _aiSpawns];
    {
        _x setDamage 1.0;
        deleteVehicle _x;
    } forEach _aiSpawns;

    diag_log text format["MISSION SYSTEM: despawning %1 buildings...",count _worldSpawns];
    {
        diag_log text format["MISSION SYSTEM: cleanup deleted worldspawn: %1 @ %2",typeOf _x,getPos _x];
        deleteVehicle _x;
    } forEach _worldSpawns;
        
    diag_log text "MISSION SYSTEM: removing markers and looking for new mission...";

    if (_difficulty == "major") then {
        PVDZ_MISSION_MAJOR_STATUS = [0,_coords];
        publicVariable "PVDZ_MISSION_MAJOR_STATUS";
    } else {
        PVDZ_MISSION_MINOR_STATUS = [0,_coords];
        publicVariable "PVDZ_MISSION_MINOR_STATUS";
    };
};