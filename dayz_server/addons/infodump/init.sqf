diag_log text "INFODUMP: initialized > loading config";
_handle = execVM "z\addons\dayz_server\addons\infodump\config.sqf";
waitUntil { scriptDone _handle; };
diag_log text "INFODUMP: config loaded > starting hook";
_object_types = [];
while {true} do {
	_objects = allMissionObjects "ALL";
	{
		_classname = typeOf _x;
		if (!(_classname in _object_types)) then {
			_object_types set [count _object_types,_classname];
		};
	} forEach _objects;
	diag_log text format ["INFODUMP: %1 objects",count _objects];
	diag_log text format ["INFODUMP: %1 object types",count _object_types];
	diag_log text "INFODUMP: listing object type counts...";
	_u_object_counts = [];
	{
		_classname = _x;
		_count     = _x countType _objects;
		_u_object_counts set [count _u_object_counts,[_count,_classname]];
	} forEach _object_types;
	_s_object_counts = [];
	{
		_max_count = 0;
		_index     = 0;
		_selection = [_max_count,""];
		_r_index   = 0;
		{
			_count = _x select 0;
			if (_count > _max_count) then { 
				_max_count = _count;
				_selection = _x;
				_r_index   = _index;
			};
			_index = _index + 1;
		} forEach _u_object_counts;
		_s_object_counts set [count _s_object_counts,_selection];
		_u_object_counts set [_r_index,-1];
		_u_object_counts = _u_object_counts - [-1];
	} forEach _u_object_counts;
	{
		_count     = _x select 0;
		_classname = _x select 1;
		diag_log text format ["INFODUMP: %1x%2",_count,_classname];
	} forEach _s_object_counts;
	sleep DZ_INFODUMP_INTERVAL;
};
