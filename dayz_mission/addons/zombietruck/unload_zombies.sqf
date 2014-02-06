private ["_zombieTruck","_loadedZombies","_unloadedZombies","_position","_dir","_heading"];
player removeAction s_player_unload_zombies;
_zombieTruck = _this select 3;
_position    = getPos _zombieTruck;
_dir         = getDir _zombieTruck;
player playActionNow "Medic";
sleep DZ_ZOMBIE_TRUCK_LOAD_TIME;

_dir = _dir + 45;
if (_dir > 360) then { _dir = _dir - 360; };
_heading = floor(_dir / 90);

switch (_heading) do {
    case 0: {
        diag_log text "ZOMBIE TRUCK: facing north";
        _position = [_position select 0,( _position select 1) - 8, _position select 2];
    };
    case 1: {
        diag_log text "ZOMBIE TRUCK: facing east";
        _position = [(_position select 0) - 8, _position select 1, _position select 2];
    };
    case 2: {
        diag_log text "ZOMBIE TRUCK: facing south";
        _position = [_position select 0, (_position select 1) + 8, _position select 2];
    };
    case 3: {
        diag_log text "ZOMBIE TRUCK: facing west";
        _position = [(_position select 0) + 8, _position select 1, _position select 2];
    };
};

_loadedZombies = _zombieTruck getVariable["LoadedZombies",0];
if (_loadedZombies > 0) then {
    _unloadedZombies = 0;
    while {_unloadedZombies < _loadedZombies} do {
        [_position,true,DZ_ZOMBIE_TRUCK_ZOMBIE_CLASSES] call unload_zombie_generate;
        _unloadedZombies = _unloadedZombies + 1;
    };
    _zombieTruck setVariable["LoadedZombies",0];
    cutText["You unleash the zombies!","PLAIN DOWN"];
} else {
    cutText["There are no zombies in the truck!","PLAIN DOWN"];
};