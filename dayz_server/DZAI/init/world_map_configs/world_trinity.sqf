/*
	Trinity Island static/dynamic trigger configuration 
	
	Last updated: 11:44 AM 6/7/2013
	
*/

#include "spawn_markers\markers_trinity.sqf"	//Load manual spawn point definitions file.
#include "spawn_areas\areas_trinity.sqf"		//Load spawn area definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [7183.8403, 7067.4727];
	"DZAI_centerMarker" setMarkerSize [5250, 5250];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 10;};
};

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {

	//begin triggers
	["DZAI_StansfieldAirport",[2,2],[],2] call DZAI_static_spawn;
	["DZAI_FarmArea",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_HouseArea1",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_HouseArea2",[0,2],[],0] call DZAI_static_spawn;
	["DZAI_Edan"] call DZAI_static_spawn;
	["DZAI_Barracks1",[2,1]] call DZAI_static_spawn;
	["DZAI_ChapelHill",[0,1]] call DZAI_static_spawn;
	["DZAI_SarasotaS"] call DZAI_static_spawn;
	["DZAI_Sarasota"] call DZAI_static_spawn;
	["DZAI_CoastalHouse",[0,1]] call DZAI_static_spawn;
	["DZAI_Rivlin",[2,2]] call DZAI_static_spawn;
	["DZAI_RivlinChurch"] call DZAI_static_spawn;
	["DZAI_MilBase",[1,1],[],3] call DZAI_static_spawn;
	["DZAI_Ellesmere"] call DZAI_static_spawn;
	["DZAI_Bree",[1,2]] call DZAI_static_spawn;
	["DZAI_Helm",[1,2]] call DZAI_static_spawn;
	["DZAI_HelmE"] call DZAI_static_spawn;
	["DZAI_MilBase2"] call DZAI_static_spawn;
	["DZAI_MilBase3"] call DZAI_static_spawn;
	["DZAI_Abbeyfield",[2,1]] call DZAI_static_spawn;
	["DZAI_StFrances"] call DZAI_static_spawn;
	["DZAI_StFrancesW",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Contra",[2,1]] call DZAI_static_spawn;
	["DZAI_ContraNW"] call DZAI_static_spawn;
	["DZAI_Richmond",[2,1]] call DZAI_static_spawn;
	["DZAI_Totley",[1,2],[],1,2] call DZAI_static_spawn;
	["DZAI_Koul"] call DZAI_static_spawn;
	["DZAI_DurrasHights"] call DZAI_static_spawn;
	["DZAI_LodgeMoor"] call DZAI_static_spawn;
	["DZAI_MilBase4",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_MilBase5"] call DZAI_static_spawn;
	["DZAI_Deepcut",[2,2]] call DZAI_static_spawn;
	["DZAI_FarmArea2"] call DZAI_static_spawn;
	["DZAI_LibertyAirport",[2,1],[],2] call DZAI_static_spawn;
	["DZAI_Maine",[1,2]] call DZAI_static_spawn;
	["DZAI_Eastwick"] call DZAI_static_spawn;
	["DZAI_HessIsland",[0,2]] call DZAI_static_spawn;
	["DZAI_StattonPort"] call DZAI_static_spawn;
	["DZAI_HarleyW"] call DZAI_static_spawn;
	["DZAI_Harley"] call DZAI_static_spawn;
	["DZAI_MilBarracks",[2,2],[],3] call DZAI_static_spawn;
	["DZAI_Yale",[2,1]] call DZAI_static_spawn;
	["DZAI_YaleS",[0,1],[],0] call DZAI_static_spawn;
	["DZAI_Madison"] call DZAI_static_spawn;
	["DZAI_MilBase6"] call DZAI_static_spawn;
	["DZAI_Lavayette"] call DZAI_static_spawn;
	["DZAI_TimberlandN",[2,1]] call DZAI_static_spawn;
	["DZAI_MilBase7"] call DZAI_static_spawn;
	["DZAI_TimberlandIndustrial"] call DZAI_static_spawn;
	//end of triggers
};

#include "custom_markers\cust_markers_trinity.sqf"
#include "custom_spawns\cust_spawns_trinity.sqf"

diag_log "Trinity Island/dynamic trigger configuration loaded.";
