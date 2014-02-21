if (isDedicated) exitWith {};
 
diag_log text "[AGN] Starting Trader City Safezone Commander!";

private ["_inVehicle","_antiBackpackThread","_antiBackpackThread2","_enteredVehicles"];

disableSerialization;
waitUntil {!isNil "dayz_animalCheck"};
diag_log text "[AGN] safezone done waiting -- initializing!";
if ( AGN_safeZoneMessages ) then { systemChat ( "[AGN] Trader Zone Commander Loaded!" ); };

_inVehicle = objNull;
_enteredVehicles = [];

diag_log text "[AGN] safezone starting loop!";

while {true} do {
	diag_log text "[AGN] safezone waiting for no-build zone!";
	waitUntil { !canbuild };
	diag_log text "[AGN] safezone entering no-build zone!";
	if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] Entering Trader Area - God Mode Enabled"); };

	if ( AGN_safeZoneGodmode ) then
	{
		diag_log text "[AGN] safezone enabling godmode!";
		player_zombieCheck = {};
		fnc_usec_damageHandler = {};
		player removeAllEventHandlers "handleDamage";
		player addEventHandler ["handleDamage", {false}];
		player allowDamage false;
	};

	if ( AGN_safeZone_Backpack_EnableAntiBackpack ) then
	{
		diag_log text "[AGN] safezone enabling antibackpack thread!";
		AGN_LastPlayerLookedAt = objNull;
		AGN_LastPlayerLookedAtCountDown = 5;
		_antiBackpackThread = [] spawn {
			private [ "_ct","_ip","_ia","_dis"] ;
			while {!canbuild} do
			{
				if ( isNull AGN_LastPlayerLookedAt ) then
				{
					waitUntil {!isNull cursorTarget};
					_ct = cursorTarget;
					_ip = isPlayer _ct;
					if ( _ip ) then { _ia = alive _ct; _dis = _ct distance player; } else { _ia = false; _dis = 1000; };
					
					if ( (_ip && _ia) && (_dis < 6.5) ) then
					{
						AGN_LastPlayerLookedAt = _ct;
					};
				} else {
					AGN_LastPlayerLookedAtCountDown = AGN_LastPlayerLookedAtCountDown - 1;
					if ( AGN_LastPlayerLookedAtCountDown < 0 ) then { AGN_LastPlayerLookedAtCountDown = 5; AGN_LastPlayerLookedAt = objNull; };
					sleep 1;
				};
			};
		};
			
		_antiBackpackThread2 = [] spawn {
			diag_log text "[AGN] safezone enabling antibackpack thread 2!";
			private ["_to","_dis","_inchk","_ip","_ia","_skip","_ct","_iv","_lp","_inv","_ctOwnerID","_friendlies","_if"];
			_ctOwnerID = 0;
			while {!canbuild} do
			{
				_ct = cursorTarget;
				_skip = false;
				
				if ( !isNull (_ct) ) then
				{
					_to = typeOf _ct;
					_dis = _ct distance player;
					_inchk = ["WeaponHolder","ReammoBox"];
					
					_lp = false;
					{
						if ( (_to isKindOf _x) && (_dis < 10) && AGN_safeZone_Backpack_AllowGearFromLootPiles ) then
						{
							_lp = true;
						};
					} forEach ( _inchk );

					_ip = isPlayer _ct;
					_ia = alive _ct;
					_iv = _ct isKindOf "AllVehicles";
					_inv = (vehicle player != player);
					
					_if = false;
					if ( _ip ) then {
						_ctOwnerID = _ct getVariable["CharacterID","0"];
						_friendlies	= player getVariable ["friendlyTo",[]];
						if(_ctOwnerID in _friendlies) then {	
							if ( AGN_safeZone_Backpack_AllowFriendlyTaggedAccess ) then
							{
								_if = true;
							};
						};
					};
					if ( AGN_safeZoneDebug ) then {
					hintSilent ( format["AGN Safezone Commander\n\nCursorTarget\n%1\n\nDistance\n%2\n\nLootpile\n%3 [%9]\n\nisPlayer\n%4\n\nAlive\n%5\n\nisVehicle\n%6\n\ninVehicle\n%7\n\nisFriendly\n%8 (%12) [%10]\n\nSkip: %11\n",
                                                _ct, _dis, _lp, _ip, _ia, _iv, _inv, _if, AGN_safeZone_Backpack_AllowGearFromLootPiles, AGN_safeZone_Backpack_AllowFriendlyTaggedAccess, _skip, _ctOwnerID] );
};

					
					//Lootpile check
					if ( _lp ) then {_skip = true;};
					
					//Dead body check
					if ( !(_ia) && AGN_safeZone_Backpack_AllowGearFromDeadPlayers ) then {_skip = true;};
					
					//Vehicle check
					if ( _iv && (_dis < 10) && !(_ip) && AGN_safeZone_Backpack_AllowGearFromVehicles ) then {_skip = true;};
					
					//In a vehicle check
					if ( _inv && AGN_safeZone_Vehicles_AllowGearFromWithinVehicles ) then { _skip = true; };
					
					//Is player friendly?
					if ( _if ) then { _skip = true; };
				};
				
				if( !isNull (FindDisplay 106) && !_skip ) then
				{
					if ( isNull AGN_LastPlayerLookedAt ) then
					{
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
						createGearDialog [(player), 'RscDisplayGear'];
						if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] Anti Backpack Stealing - Redirecting you to your own gear!"); };
						waitUntil { isNull (FindDisplay 106) };
					} else {
						if ( AGN_safeZoneMessages ) then { systemChat (format["[AGN] You cannot open your gear at this time as you have looked at a player in the last 5 seconds."]); };
						(findDisplay 106) closeDisplay 1;
						waitUntil { isNull (FindDisplay 106) };
					};
				};
				if ( _skip && _if ) then {
					if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] This player is tagged friendly, you have access to this players bag") };
				};
			};
		};
	};
	
	[] spawn {
		diag_log text "[AGN] safezone starting zombie removal thread!";
		while { !canbuild } do {
			{
				{
					deleteVehicle _x;
				} forEach (player nearEntities [_x,AGN_safeZone_Remove_Zombie_Radius]);
			} forEach ["zZombie_Base","z_hunter","z_priest","z_suit1","z_suit2","z_suit3","z_worker"];
			sleep 3;
		};
	};
	
	if ( AGN_safeZoneVehicleGodmode ) then
	{
		diag_log text "[AGN] safezone starting vehicle godmode thread!";
		while { !canbuild } do
		{
			sleep 0.1;
			if ( !(isNull _inVehicle) && (vehicle player == player) ) then
			{
				_inVehicle = objNull;
			};
			
			if ( vehicle player != player && isNull _inVehicle ) then
			{
				if (AGN_safeZoneMessages) then { systemChat ( "[AGN] Vehicle God Mode Enabled" ); };
				_inVehicle = vehicle player;
				_inVehicle removeAllEventHandlers "handleDamage";
				_inVehicle addEventHandler ["handleDamage", {false}];
				_inVehicle allowDamage false;
				_enteredVehicles = _enteredVehicles + [_inVehicle];
			};
		};
	} else {
		waitUntil { canbuild };
	};

	diag_log text "[AGN] safezone starting safezone exit!";
	AGN_LastPlayerLookedAt = objNull;
	AGN_LastPlayerLookedAtCountDown = 5;
	diag_log text "[AGN] safezone terminating backpack thread!";
	terminate _antiBackpackThread;
	diag_log text "[AGN] safezone terminating backpack thread 2!";
	terminate _antiBackpackThread2;
	if ( AGN_safeZoneMessages ) then { systemChat ("[AGN] Exiting Trader Area - God Mode Disabled"); };
	
	if ( AGN_safeZoneVehicleGodmode ) then
	{
		diag_log text "[AGN] safezone removing vehicle godmode!";
		if ( AGN_safeZoneMessages ) then { systemChat ( "[AGN] Vehicle God Mode Disabled" ); };
		{
			_x addEventHandler ["handleDamage", {true}];
			_x removeAllEventHandlers "handleDamage";
			_x allowDamage true;
		} forEach _enteredVehicles;
		_enteredVehicles = [];
		_inVehicle = objNull;
	};

	if ( AGN_safeZoneGodmode ) then
	{
		diag_log text "[AGN] safezone removing godmode!";
		player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
		fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
		player addEventHandler ["handleDamage", {true}];
		player removeAllEventHandlers "handleDamage";
		player allowDamage true;
	};
};