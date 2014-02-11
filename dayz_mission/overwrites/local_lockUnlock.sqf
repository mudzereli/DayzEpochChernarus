private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
        ///######## PREVENT TOWING OF LOCKED VEHICLES
        _vehicle setVariable ["R3F_LOG_disabled",true,true];
        ///######## END INSERTED CODE
	} else {
		_vehicle setVehicleLock "UNLOCKED";
        ///######## PREVENT TOWING OF LOCKED VEHICLES
        _vehicle setVariable ["R3F_LOG_disabled",false,true];
        ///######## END INSERTED CODE
	};
};