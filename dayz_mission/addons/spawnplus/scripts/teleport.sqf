private ["_randomspawn","_vehicle"];

if (dayz_combat == 1) then {
	titleText["You can't select a spawn point while in combat!","PLAIN DOWN",3];
	titleFadeOut 1;
	DZ_SPAWNPLUS_CREATION_STAGE = 0;
	[] call respawn_handler;
} else {
	DZ_SPAWNPLUS_CREATION_STAGE = 1;
	titleText["Spawning at selected location...","PLAIN DOWN",3];
	_randomspawn = _this call BIS_fnc_selectRandom;
	player setPosATL _randomspawn;
	titleText ["Spawned!","PLAIN DOWN",3];
	titleFadeOut 1;
    if (DZ_RESPAWN_VEHICLE_CLASS != "NONE") then {
        _vehicle = DZ_RESPAWN_VEHICLE_CLASS createVehicle(position player);
        _vehicle setVariable["Mission",1,true];
        _vehicle setVariable["Sarge",1,true];
    };
	[] call respawn_handler;
};