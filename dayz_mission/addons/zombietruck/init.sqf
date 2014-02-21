if (isDedicated) exitWith {};
private ["_distanceTarget","_targetClassName","_isTargetTruck","_loadedZombies","_nearZombies","_nearestZombie"];
diag_log text "ZOMBIE TRUCK: initializing...";
if (isNil "s_player_unload_zombies") then { s_player_unload_zombies = -1; };
if (isNil "s_player_load_zombie") then { s_player_load_zombie = -1; };
unload_zombie_generate = compile preprocessFileLineNumbers "addons\zombietruck\zombie_generate.sqf";
[] spawn {
    diag_log text "ZOMBIE TRUCK: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    diag_log text "ZOMBIE TRUCK: hooking...";
    while {true} do {
        if(!isNull player) then {
            _distanceTarget  = player distance cursorTarget;
            _targetClassName = typeOf cursorTarget;
            _isTargetTruck   = _targetClassName in DZ_ZOMBIE_TRUCK_TRUCK_CLASSES;
            if (_isTargetTruck && {_distanceTarget < DZ_ZOMBIE_TRUCK_LOAD_DISTANCE}) then {
                //diag_log text "ZOMBIE TRUCK: targeting truck within range ... checking for zombies";
                _loadedZombies = cursorTarget getVariable["LoadedZombies",0];
                _nearZombies = [];
                if (_loadedZombies < DZ_ZOMBIE_TRUCK_ZOMBIE_LIMIT) then {
                    //diag_log text "ZOMBIE TRUCK: able to load more zombies ... building list of nearby zombies";
                    {
                        _nearZombies = _nearZombies + (player nearEntities[_x,DZ_ZOMBIE_TRUCK_LOAD_DISTANCE]);
                    } forEach DZ_ZOMBIE_TRUCK_ZOMBIE_CLASSES;
                };
                if (count _nearZombies > 0) then {
                    //diag_log text "ZOMBIE TRUCK: enough zombies nearby ... adding action";
                    _nearestZombie = _nearZombies select 0;
                    if (s_player_load_zombie < 0) then {
                        s_player_load_zombie = player addAction ["<t color='#99cc00'>" + "Load Zombie" + "</t>", "addons\zombietruck\load_zombie.sqf",[_nearestZombie,cursorTarget],-10,false,true,"",""];
                    };
                } else {
                    player removeAction s_player_load_zombie;
                    s_player_load_zombie = -1;
                };
            } else {
                player removeAction s_player_load_zombie;
                s_player_load_zombie = -1;
            };
            //diag_log text "ZOMBIE TRUCK: load action finished ... checking to see if player can unload zombies";
            if (_isTargetTruck && {_distanceTarget < DZ_ZOMBIE_TRUCK_LOAD_DISTANCE}) then {
                //diag_log text "ZOMBIE TRUCK: player in range of unloadable truck ... checking if enough zombies are inside";
                _loadedZombies = cursorTarget getVariable["LoadedZombies",0];
                if (_loadedZombies > 0) then {
                    //diag_log text "ZOMBIE TRUCK: truck can be unloaded with zombies ... adding action";
                    if (s_player_unload_zombies < 0) then {
                        s_player_unload_zombies = player addAction ["<t color='#99cc00'>" + format["Unload %1 Zombies",_loadedZombies] + "</t>", "addons\zombietruck\unload_zombies.sqf",cursorTarget,-10,false,true,"",""];
                    };
                } else {
                    player removeAction s_player_unload_zombies;
                    s_player_unload_zombies = -1;
                };
            } else {
                player removeAction s_player_unload_zombies;
                s_player_unload_zombies = -1;
            };
        };
        sleep 2;
    };
};