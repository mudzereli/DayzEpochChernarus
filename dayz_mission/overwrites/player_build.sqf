/*
    DayZ Base Building
    Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort","_isNear","_need","_objHupDiff","_needNear","_vehicle","_inVehicle","_previewCounter","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap"];

//### BEGIN INSERTED CODE: CHECK IF PLAYER IS ADMIN
private["_isAdmin"];
_isAdmin = false;
if ((getPlayerUID player) in DZ_BUILDPLUS_ADMINS) then { _isAdmin = true; };
//### END INSERTED CODE: CHECK IF PLAYER IS ADMIN

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

// disallow building if too many objects are found within 30m
if((count ((getPosATL player) nearObjects ["All",30])) >= DZE_BuildingLimit) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"];};

_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater =      dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time && !_isAdmin) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_item = _this;

// Need Near Requirements
_abort = false;
_distance = 3;
_reason = "";

_needNear =     getArray (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "neednearby");

{
    switch(_x) do{
        case "fire":
        {
            _isNear = {inflamed _x} count (getPosATL player nearObjects _distance);
            if(_isNear == 0) then {  
                _abort = true;
                _reason = "fire";
            };
        };
        case "workshop":
        {
            _isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
            if(_isNear == 0) then {  
                _abort = true;
                _reason = "workshop";
            };
        };
    };
} forEach _needNear;

if(_abort && !_isAdmin) exitWith {
    cutText [format[(localize "str_epoch_player_135"),_reason,_distance], "PLAIN DOWN"];
    DZE_ActionInProgress = false;
};

_classname =    getText (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "create");
_classnametmp = _classname;
_require =  getArray (configFile >> "cfgMagazines" >> _this >> "ItemActions" >> "Build" >> "require");
_text =         getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
_ghost = getText (configFile >> "CfgVehicles" >> _classname >> "ghostpreview");

_lockable = 0;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "lockable")) then {
    _lockable = getNumber(configFile >> "CfgVehicles" >> _classname >> "lockable");
};

_requireplot = DZE_requireplot;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "requireplot")) then {
    _requireplot = getNumber(configFile >> "CfgVehicles" >> _classname >> "requireplot");
};

_isAllowedUnderGround = 1;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
    _isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset =   getArray (configFile >> "CfgVehicles" >> _classname >> "offset");
if((count _offset) <= 0) then {
    _offset = [0,1.5,0];
};

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZ_BUILDPLUS_PLOT_DIAMETER;
_needText = localize "str_epoch_player_246";

if(_isPole) then {
    _distance = _distance * 2;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];
_findNearestUnownedPole = [];

{
    if (alive _x) then {
        _findNearestPole set [(count _findNearestPole),_x];
        if (_x getVariable["CharacterID","0"] != dayz_characterID) then {
            _findNearestUnownedPole set [(count _findNearestUnownedPole),_x];
        };
    };
} foreach _findNearestPoles;
diag_log text format["BUILDPLUS: found %1 poles, %2 owned by other players...",count _findNearestPoles, count _findNearestUnownedPole];

_IsNearPlot = count (_findNearestPole);
_IsNearUnownedPlot = count (_findNearestUnownedPole);

// If item is plot pole and another one exists within 45m
if (DZ_BUILDPLUS_PLOT_IN_PLOT) then {
    if(_isPole && _IsNearUnownedPlot > 0 && !_isAdmin) exitWith { DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_44") , "PLAIN DOWN"]; };
} else {
    if(_isPole && _IsNearPlot > 0 && !_isAdmin) exitWith {  DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_44") , "PLAIN DOWN"]; };
};

if(_IsNearPlot == 0) then {

    // Allow building of plot
    if(_requireplot == 0 or _isLandFireDZ or _className in DZ_BUILDPLUS_NO_PLOT_ITEMS) then {
        _canBuildOnPlot = true;
    };

} else {
    // Since there are plots nearby we check for ownership and then for friend status
    
    // check nearby plots ownership and then for friend status
    _nearestPole = _findNearestPole select 0;

    // Find owner 
    _ownerID = _nearestPole getVariable["CharacterID","0"];

    // diag_log format["DEBUG BUILDING: %1 = %2", dayz_characterID, _ownerID];

    // check if friendly to owner
    if(dayz_characterID == _ownerID) then {  //Keep ownership
        // owner can build anything within his plot
        _canBuildOnPlot = true; 
    } else {
        // disallow building plot
        if(!_isPole) then {
            _friendlies     = player getVariable ["friendlyTo",[]];
            // check if friendly to owner
            if(_ownerID in _friendlies) then {
                _canBuildOnPlot = true;
            };
        };
    };
};

if(!_canBuildOnPlot && _IsNearUnownedPlot > 0 && !_isAdmin) exitWith {  DZE_ActionInProgress = false; cutText ["Plot already controlled. If you have recently died and you own the plot, you must remove and replace the plot pole to re-claim it.", "PLAIN DOWN"]; };
// _message
if(!_canBuildOnPlot && !_isAdmin) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; };

_missing = "";
_hasrequireditem = true;
{
    _hastoolweapon = _x in weapons player;
    if(!_hastoolweapon && !_isAdmin) exitWith { _hasrequireditem = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName"); }
} forEach _require;

_hasbuilditem = _this in magazines player;
if (!_hasbuilditem && !_isAdmin) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_player_31"),_text,"build"] , "PLAIN DOWN"]; };

if (!_hasrequireditem && !_isAdmin) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_137"),_missing] , "PLAIN DOWN"]; };
if (_hasrequireditem || _isAdmin) then {

    _location = [0,0,0];
    _isOk = true;

    // get inital players position
    _location1 = getPosATL player;
    _dir = getDir player;

    _object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
    
    _object setDir _dir;
    _object attachTo [player,_offset];
    
    _position = getPosATL _object;

    cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];

    _previewCounter = DZ_BUILDPLUS_PREVIEW_TIMER;
    
    player allowDamage false;
    SnappingOffset = _offset;
    SnappingDir = 0;
    SnappingSpotMarkers = [];
    SnappingEnabled = false;
    SnappedOffsetZ = 0;
    SnappingResetPos = false;

    if (isClass (missionConfigFile >> "SnapPoints" >> _classname)) then {
        s_building_snapping = player addAction ["<t color=""#33b5e5"">Toggle Snapping</t>", "addons\buildplus\player_toggleSnapping.sqf",_classname, 3, true, false, "",""];
    };
    
    _snapper = [_object, _classname] spawn snap_object;
                
    while {_isOk} do {
        _zheightchanged = false;
        _zheightdirection = "";
        _rotate = false;
    
        if (DZE_Q) then {
            DZE_Q = false;
            _zheightdirection = "up";
            _zheightchanged = true;
        };
        if (DZE_Z) then {
            DZE_Z = false;
            _zheightdirection = "down";
            _zheightchanged = true; 
        };
        if (DZE_Q_alt) then {
            DZE_Q_alt = false;
            _zheightdirection = "up_alt";
            _zheightchanged = true;
        };
        if (DZE_Z_alt) then {
            DZE_Z_alt = false;
            _zheightdirection = "down_alt";
            _zheightchanged = true;
        };
        if (DZE_Q_ctrl) then {
            DZE_Q_ctrl = false;
            _zheightdirection = "up_ctrl";
            _zheightchanged = true;
        };
        if (DZE_Z_ctrl) then {
            DZE_Z_ctrl = false;
            _zheightdirection = "down_ctrl";
            _zheightchanged = true;
        };
        if (DZE_4) then {
            DZE_4 = false;
            SnappingDir = 0;
            _rotate = true;
        };
        if (DZE_6) then {
            DZE_6 = false;
            SnappingDir = 180;
            _rotate = true;
        };
    
        if(_zheightchanged) then {
            if(_zheightdirection == "up") then {
                SnappingOffset set [2, ((SnappingOffset select 2) + 0.1)];
            };
    
            if(_zheightdirection == "down") then {
                SnappingOffset set [2, ((SnappingOffset select 2) - 0.1)];
            };
    
            if(_zheightdirection == "up_alt") then {
                SnappingOffset set [2, ((SnappingOffset select 2) + 1)];
            };
    
            if(_zheightdirection == "down_alt") then {
                SnappingOffset set [2, ((SnappingOffset select 2) - 1)];
            };
    
            if(_zheightdirection == "up_ctrl") then {
                SnappingOffset set [2, ((SnappingOffset select 2) + 0.01)];
            };
    
            if(_zheightdirection == "down_ctrl") then {
                SnappingOffset set [2, ((SnappingOffset select 2) - 0.01)];
            };
        };
        sleep 0.5;
    
        if (_zheightchanged or _rotate) then {
            SnappingAttachedToPlayer = false;
            diag_log "height or rotation changed";
        };

        _location2 = getPosATL player;

        if(DZE_5) exitWith {
            _isOk = false;
            detach _object;
            _dir = getDir _object;
            _position = getPosATL _object;
        };
        
        if(_location1 distance _location2 > DZ_BUILDPLUS_PREVIEW_CHANGE_DIST) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = format["You've moved to far away from where you started building (within %1 meters)",DZ_BUILDPLUS_PREVIEW_CHANGE_DIST]; 
            detach _object;
            deleteVehicle _object;
        };
        
        [format["<t size='0.6'>Time left to build: %1</t>",(ceil(_previewCounter))],0,0.8,0.5,0,0,8] spawn BIS_fnc_dynamicText;
        
        if(_previewCounter <= 0) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = "Ran out of time to find position"; 
            detach _object;
            deleteVehicle _object;
        };

        _previewCounter = _previewCounter - 0.5;
        
        if(((SnappingOffset select 2) > DZ_BUILDPLUS_PREVIEW_CHANGE_DIST) or ((SnappingOffset select 2) < -DZ_BUILDPLUS_PREVIEW_CHANGE_DIST)) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = format["Cannot move up or down more than %1 meters",DZ_BUILDPLUS_PREVIEW_CHANGE_DIST]; 
            detach _object;
        };

        if (player getVariable["combattimeout", 0] >= time && !_isAdmin) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = (localize "str_epoch_player_43");
            detach _object;
            deleteVehicle _object;
        };

        if (DZE_cancelBuilding) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = "Cancelled building.";
            detach _object;
            deleteVehicle _object;
        };
    };

    terminate _snapper;
    player removeAction s_building_snapping;
    player allowDamage true;

    //No building on roads unless toggled
    if (!DZE_BuildOnRoads) then {
        if (isOnRoad _position) then { _cancel = true; _reason = "Cannot build on a road."; };
    };

    // No building in trader zones
    if(!canbuild && !_isAdmin) then { _cancel = true; _reason = "Cannot build in a city."; };
    if(!placevault && !_isAdmin) then { _cancel = true; _reason = "Cannot build in a city."; };

    if(!_cancel) then {

        _classname = _classnametmp;

        _location = _position;

        if((_isAllowedUnderGround == 0) and ((_location select 2) < 0)) then {
            _location set [2,0];
        };
    
        cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];
        
        _limit = 3;

        if(isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
            _limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
        };
        
        if (DZ_BUILDPLUS_SINGLE_STAGE_CRAFTING) then {
            _limit = 1;
        };

        _isOk = true;
        _proceed = false;
        _counter = 0;
        
        while {_isOk} do {

            [10,10] call dayz_HungerThirst;
            player playActionNow "Medic";
            
            _dis=20;
            _sfx = "repair";
            [player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
            [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
    
            r_interrupt = false;
            _animState = animationState player;
            r_doLoop = true;
            _started = false;
            _finished = false;
    
            while {r_doLoop} do {
                _animState = animationState player;
                _isMedic = ["medic",_animState] call fnc_inString;
                if (_isMedic) then {
                    _started = true;
                };
                if (_started and !_isMedic) then {
                    r_doLoop = false;
                    _finished = true;
                };
                if (r_interrupt or (player getVariable["combattimeout", 0] >= time)) then {
                    r_doLoop = false;
                };
                if (DZE_cancelBuilding) exitWith {
                    r_doLoop = false;
                };
                sleep 0.1;
            };
            r_doLoop = false;


            if(!_finished) exitWith {
                _isOk = false;
                _proceed = false;
            };

            if(_finished) then {
                _counter = _counter + 1;
            };

            cutText [format[(localize "str_epoch_player_139"),_text, _counter,_limit], "PLAIN DOWN"];

            if(_counter == _limit) exitWith {
                _isOk = false;
                _proceed = true;
            };
    
        };

        if (_proceed) then {
    
            _num_removed = ([player,_item] call BIS_fnc_invRemove);
            if(_num_removed == 1) then {

                cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];
                
                if (_isPole) then {
                    [] spawn player_plotPreview;
                };

                _object setVariable ["OEMPos",_location,true];

                if(_lockable > 1) then {
                    
                    _combinationDisplay = "";

                    switch (_lockable) do {
                        
                        case 2: { // 2 lockbox
                            _combination_1 = (floor(random 3)) + 100; // 100=red,101=green,102=blue
                            _combination_2 = floor(random 10);
                            _combination_3 = floor(random 10);
                            _combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
                            dayz_combination = _combination;
                            if (_combination_1 == 100) then {
                                _combination_1_Display = "Red";
                            };
                            if (_combination_1 == 101) then {
                                _combination_1_Display = "Green";
                            };
                            if (_combination_1 == 102) then {
                                _combination_1_Display = "Blue";
                            };
                            _combinationDisplay = format["%1%2%3",_combination_1_Display,_combination_2,_combination_3];
                        };
                        
                        case 3: { // 3 combolock
                            _combination_1 = floor(random 10);
                            _combination_2 = floor(random 10);
                            _combination_3 = floor(random 10);
                            _combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
                            dayz_combination = _combination;
                            _combinationDisplay = _combination;
                        };
                        
                        case 4: { // 4 safe
                            _combination_1 = floor(random 10);
                            _combination_2 = floor(random 10);
                            _combination_3 = floor(random 10);
                            _combination_4 = floor(random 10);
                            _combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
                            dayz_combination = _combination;
                            _combinationDisplay = _combination;
                        };
                    };

                    _object setVariable ["CharacterID",_combination,true];
                    

                    PVDZE_obj_Publish = [_combination,_object,[_dir,_location],_classname];
                    publicVariableServer "PVDZE_obj_Publish";

                    cutText [format[(localize "str_epoch_player_140"),_combinationDisplay,_text], "PLAIN DOWN", 5];
                    

                } else {
                    _object setVariable ["CharacterID",dayz_characterID,true];
                    
                    // fire?
                    if(_object isKindOf "Land_Fire_DZ") then {
                        _object spawn player_fireMonitor;
                    } else {
                        PVDZE_obj_Publish = [dayz_characterID,_object,[_dir,_location],_classname];
                        publicVariableServer "PVDZE_obj_Publish";
                    };
                };
            } else {
                deleteVehicle _object;
                cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
            };

        } else {
            r_interrupt = false;
            if (vehicle player == player) then {
                [objNull, player, rSwitchMove,""] call RE;
                player playActionNow "stop";
            };

            deleteVehicle _object;

            cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
        };

    } else {
        deleteVehicle _object;
        cutText [format[(localize "str_epoch_player_47"),_text,_reason], "PLAIN DOWN"];
    };
};

DZE_ActionInProgress = false;
