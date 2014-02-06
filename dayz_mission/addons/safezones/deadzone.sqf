if (isDedicated) exitWith {};
 
diag_log ( "[AGN] Starting Deadzone Commander!" );

private ["_EH_Fired","_inVehicle","_inVehicleLast","_EH_Fired_Vehicle"];

//CONFIGURATION
AGN_deadZoneMessages = true;                                //Should messages be displayed?
AGN_safeZone_Vehicles_DisableMountedGuns = true;			//Should players not be able to shoot bullets/projectiles from mounted guns?
AGN_safeZone_Players_DisableWeaponFiring = true;			//Should players not be able to shoot bullets/projectiles from their weapon(s)?

disableSerialization;
waitUntil {!isNil "dayz_animalCheck"};
diag_log text "[AGN] deadzone done waiting -- initializing!";

_inVehicle = objNull;
_inVehicleLast = objNull;
_EH_Fired_Vehicle = -1;

diag_log text "[AGN] deadzone starting loop!";

while {true} do {
	diag_log text "[AGN] deadzone waiting for no-shoot zone!";
	waitUntil { !canshoot };
	diag_log text "[AGN] deadzone entering no-shoot zone!";

	if ( AGN_deadZoneMessages ) then { systemChat ("[AGN] Entering Deadzone -- No Weapon Firing"); };
	
	if ( AGN_safeZone_Players_DisableWeaponFiring ) then
	{
		diag_log text "[AGN] deadzone adding player weapon disable eventhandler!";
		_EH_Fired = player addEventHandler ["Fired", {
			systemChat ("[AGN] You can not fire your weapon in a Deadzone");
			NearestObject [_this select 0,_this select 4] setPos[0,0,0];
		}];
	};
	
	if ( AGN_safeZone_Vehicles_DisableMountedGuns ) then
	{
		diag_log text "[AGN] deadzone starting vehicle weapon disable thread!";
		while { !canshoot } do
		{
			sleep 0.1;
			if ( !(isNull _inVehicle) && (vehicle player == player) ) then
			{
				_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
				_inVehicleLast = _inVehicle;
				_inVehicle = objNull;
			};
			
			if ( vehicle player != player && isNull _inVehicle ) then
			{
				if (AGN_deadZoneMessages) then { systemChat ( "[AGN] Vehicle Guns Disabled" ); };
				_inVehicle = vehicle player;
				_EH_Fired_Vehicle = _inVehicle addEventHandler ["Fired", {
					systemChat ("[AGN] You can not fire your vehicle's weapon in a Deadzone");
					NearestObject [_this select 0,_this select 4] setPos[0,0,0];
				}];
			};
		};
	} else {
		waitUntil { canshoot };
	};

	diag_log text "[AGN] deadzone starting deadzone exit!";
	
	if ( AGN_deadZoneMessages ) then { systemChat ("[AGN] Exiting Deadzone"); };
	
	if ( AGN_safeZone_Vehicles_DisableMountedGuns ) then
	{
		diag_log text "[AGN] deadzone removing event handler that disables vehicle guns!";
		if ( !(isNull _inVehicle) ) then
		{
			if ( AGN_deadZoneMessages ) then { systemChat ( "[AGN] Vehicle Guns Enabled" ); };
			_inVehicle removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
		
		if ( !(isNull _inVehicleLast) ) then
		{
			if ( AGN_deadZoneMessages ) then { systemChat ( "[AGN] Vehicle Guns Enabled" ); };
			_inVehicleLast removeEventHandler ["Fired", _EH_Fired_Vehicle];
		};
	};

	if ( AGN_safeZone_Players_DisableWeaponFiring ) then
	{
		diag_log text "[AGN] deadzone removing event handler that disables player guns!";
		player removeEventHandler ["Fired", _EH_Fired];
	};
};