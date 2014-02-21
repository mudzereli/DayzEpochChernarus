private ["_vehicle_class","_parts_required","_has_parts","_required_class","_required_count","_actual_count","_removed_count","_vehicle","_eh_handle"];
_has_parts      = true;
_vehicle_class  = _this select 3 select 0 select 0;
_parts_required = _this select 3 select 0 select 1;
_eh_handle      = _this select 3 select 1;
player removeAction _eh_handle;
{
	_required_class = _x select 0;
	_required_count = _x select 1;
	_actual_count   = { _x == _required_class; } count magazines player;
	if (_actual_count < _required_count) then { _has_parts = false; };
} forEach _parts_required;
if (_has_parts) then {
	{
		_required_class = _x select 0;
		_required_count = _x select 1;
		_removed_count  = 0;
		while {_removed_count < _required_count} do {
			player removeMagazine _required_class;
			_removed_count = _removed_count + 1;
		};
	} forEach _parts_required;
	player playActionNow "Medic";
	sleep 3;
	_vehicle = _vehicle_class createVehicle(position player);
	_vehicle setVariable["ObjectID",str floor(random 9999999)];
	_vehicle setVariable["Mission",1];
	PVDZE_veh_Publish = [_vehicle,[getDir _vehicle,getPos _vehicle],typeOf _vehicle,false,0];
	PublicVariableServer "PVDZE_veh_Publish";
	cutText[format["You build a %1!",_vehicle_class],"PLAIN DOWN"];
} else {
	cutText[format["You don't have the parts to build %1!",_vehicle_class],"PLAIN DOWN"];
};