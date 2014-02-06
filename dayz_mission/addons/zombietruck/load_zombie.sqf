private ["_nearestZombie","_zombieTruck","_loadedZombies"];
player removeAction s_player_load_zombie;
_nearestZombie = _this select 3 select 0;
_zombieTruck   = _this select 3 select 1;
player playActionNow "Medic";
sleep DZ_ZOMBIE_TRUCK_LOAD_TIME;
if (alive _nearestZombie) then {
    {
        _nearestZombie removeAllEventHandlers _x;
    } forEach ["fired","firednear","dammaged","hit","killed","mphit","mpkilled"];
    _nearestZombie setDamage 1;
    deleteVehicle _nearestZombie;
    _loadedZombies = _zombieTruck getVariable["LoadedZombies",0];
    _loadedZombies = _loadedZombies + 1;
    _zombieTruck setVariable["LoadedZombies",_loadedZombies];
    cutText[format["This truck is now holding %1 zombies!",_loadedZombies],"PLAIN DOWN"];
} else {
    cutText["The zombie must be alive to load it!","PLAIN DOWN"];
};