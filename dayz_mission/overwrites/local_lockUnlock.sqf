private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if(_status) then {
		_vehicle setVehicleLock "LOCKED";
                ///######## BEGIN INSERTED CODE: prevent towing locked vehicles
                _vehicle setVariable ["R3F_LOG_disabled",true,true];
                ///######## END INSERTED CODE: prevent towing locked vehicles
	} else {
		_vehicle setVehicleLock "UNLOCKED";
                ///######## BEGIN INSERTED CODE: prevent towing locked vehicles
                _vehicle setVariable ["R3F_LOG_disabled",false,true];
                ///######## END INSERTED CODE: prevent towing locked vehicles
	};
};