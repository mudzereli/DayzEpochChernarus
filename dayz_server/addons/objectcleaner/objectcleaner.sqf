private ["_objectsNearPlayer","_protectedObjects","_player","_protectedClassName","_protectedClassRadius","_myGroupX","_object","_numDeleted","_startTime","_protectedClassNames","_curTime","_timePassed"];
_startTime = diag_tickTime;
while {true} do {
	_curTime = diag_tickTime;
	_timePassed = _curTime - _startTime;
	if (_timePassed > DZ_CLEANER_OBJECT_CLEANUP_INTERVAL) then {
		_startTime = diag_tickTime; 
		_protectedClassNames  = [];
		_protectedObjects     = [];
		diag_log text "CLEANER: object cleanup started ... building list of protected objects...";
		{
			_protectedClassName   = _x select 0;
			_protectedClassRadius = _x select 1;
			{
				_player = _x;
				if (alive _player) then {
					_objectsNearPlayer = _player nearObjects[_protectedClassName,_protectedClassRadius];
					_protectedObjects  = _protectedObjects + _objectsNearPlayer;
					//diag_log text format["CLEANER: adding %1 protected %2 near %3",(_protectedClassName countType _protectedObjects),_protectedClassName,(name _player)];
				};
			} forEach playableUnits;
			_protectedClassNames set [count _protectedClassNames, _protectedClassName];
			diag_log text format["CLEANER: finished ... %1 protected %2",(_protectedClassName countType _protectedObjects),_protectedClassName];
		} forEach DZ_CLEANER_TABLE;
		diag_log text format["CLEANER: created total of %1 protected objects across %2 classes...",count _protectedObjects, count _protectedClassNames];
		{
			_protectedClassName = _x;
			_numDeleted         = 0;
			{
				_object = _x;
				if(!(_object in _protectedObjects) && {_object getVariable["Mission",0] == 0}) then {
					_object enableSimulation false;
					_myGroupX = group _object;
					_object removeAllMPEventHandlers "mpkilled";
					_object removeAllMPEventHandlers "mphit";
					_object removeAllMPEventHandlers "mprespawn";
					_object removeAllEventHandlers "FiredNear";
					_object removeAllEventHandlers "HandleDamage";
					_object removeAllEventHandlers "Killed";
					_object removeAllEventHandlers "Fired";
					_object removeAllEventHandlers "GetOut";
					_object removeAllEventHandlers "Local";
					clearVehicleInit _object;
					deleteVehicle _object;
					deleteGroup _myGroupX;
					_object = nil;
					_numDeleted = _numDeleted + 1;
				};
			} forEach allMissionObjects _protectedClassName;
			diag_log text format["CLEANER: attempting to delete %1/%2 of %3.", _numDeleted, count allMissionObjects _protectedClassName, _protectedClassName];
		} forEach _protectedClassNames;
		diag_log text "CLEANER: object cleanup finished";
	};
    sleep 5;
};