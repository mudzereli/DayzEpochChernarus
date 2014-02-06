/*
	Chernarus static/dynamic trigger configuration 
	
	Last updated: 12:06 AM 8/20/2013
	
*/

#include "spawn_markers\markers_chernarus.sqf"	//Load manual spawn point definitions file.

if (DZAI_dynAISpawns) then {
	"DZAI_centerMarker" setMarkerPos [7021.9126, 8964.8379];
	"DZAI_centerMarker" setMarkerSize [5500, 5500];
	if (isNil "DZAI_dynTriggersMax") then {DZAI_dynTriggersMax = 15;};
};

if (DZAI_verifyTables) then {
	waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};	//Wait for DZAI to finish verifying classname arrays.
} else {
	waitUntil {sleep 0.1; !isNil "DZAI_weaponsInitialized"};	//Wait for DZAI to finish building weapon classname arrays.
};

if (DZAI_staticAI) then {
	//Begin triggers
	_this = createTrigger ["EmptyDetector", [1876.1113, 2282.8721]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kamenka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_0 = _this;

	_this = createTrigger ["EmptyDetector", [3635.5938, 2394.6064]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Komarovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_2 = _this;

	_this = createTrigger ["EmptyDetector", [4481.4292, 2421.9043]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Balota";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_4 = _this;

	_this = createTrigger ["EmptyDetector", [4774.0439, 2507.7603]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Balota AF";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,175,thisTrigger,['Balota1','Balota2','Balota3','Balota4','Balota5'],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_6 = _this;

	_this = createTrigger ["EmptyDetector", [6970.9785, 2640.334]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Cherno3";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_10 = _this;

	_this = createTrigger ["EmptyDetector", [6566.5137, 2412.969]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Cherno1";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_12 = _this;

	_this = createTrigger ["EmptyDetector", [10186.388, 1936.0364, 3.4404879]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Elektro1";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,175,thisTrigger,[],0,2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_16 = _this;

	_this = createTrigger ["EmptyDetector", [10476.077, 2412.2297, 9.6632004]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Elektro2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_18 = _this;

	_this = createTrigger ["EmptyDetector", [9164.4277, 3832.1824]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pusta";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_20 = _this;

	_this = createTrigger ["EmptyDetector", [12063.045, 3623.7976, 9.5367432e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kamyshovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,175,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_24 = _this;

	_this = createTrigger ["EmptyDetector", [12855.01, 4457.4199, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Tulga";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_26 = _this;

	_this = createTrigger ["EmptyDetector", [11299.008, 5460.605, 2.91008]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Msta";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_28 = _this;

	_this = createTrigger ["EmptyDetector", [13332.188, 6258.8921]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Solnichniy";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_30 = _this;

	_this = createTrigger ["EmptyDetector", [13074.077, 6975.2202]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Solnichniy Factory";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_32 = _this;

	_this = createTrigger ["EmptyDetector", [12161.262, 7288.5391, -0.00061035156]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Orlovets";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_34 = _this;

	_this = createTrigger ["EmptyDetector", [12877.6, 8081.5957]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nizhnoye";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_36 = _this;

	_this = createTrigger ["EmptyDetector", [11938.791, 9118.6982]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Berezino1";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_38 = _this;

	_this = createTrigger ["EmptyDetector", [12734.678, 9571.3135, -2.6702881e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Berezino2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_42 = _this;

	_this = createTrigger ["EmptyDetector", [12870.976, 10060.382, 11.137758]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Berezeno3";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_46 = _this;

	_this = createTrigger ["EmptyDetector", [12307.611, 10841.742]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Khelm";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_50 = _this;

	_this = createTrigger ["EmptyDetector", [12055.516, 12620.125]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NEAF";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,1,200,thisTrigger,['NEAF1','NEAF2','NEAF3','NEAF4','NEAF5'],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_56 = _this;

	_this = createTrigger ["EmptyDetector", [11130.03, 12335.65, 9.50177]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Krasnostav";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_58 = _this;

	_this = createTrigger ["EmptyDetector", [8710.1924, 11791.018, -3.0517578e-005]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gvozdno";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,225,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_62 = _this;

	_this = createTrigger ["EmptyDetector", [6003.6455, 10296.365]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Grishino";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,225,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_64 = _this;

	_this = createTrigger ["EmptyDetector", [2743.1543, 9997.4131]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Lopatino";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_72 = _this;

	_this = createTrigger ["EmptyDetector", [3826.7798, 8926.0244, 8.6271362]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vybor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_74 = _this;

	_this = createTrigger ["EmptyDetector", [5366.3472, 8591.8545, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kabanino";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_76 = _this;

	_this = createTrigger ["EmptyDetector", [6179.4053, 7786.5435]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Stary Sobor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,0,225,thisTrigger,[],1,2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_78 = _this;

	_this = createTrigger ["EmptyDetector", [7038.3643, 7669.3857]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Novy Sobor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,225,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_80 = _this;

	_this = createTrigger ["EmptyDetector", [8457.4629, 6688.627, 4.7903137]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gulglovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_82 = _this;

	_this = createTrigger ["EmptyDetector", [6543.8091, 6106.0352]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Vyshnoye";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_84 = _this;

	_this = createTrigger ["EmptyDetector", [7577.5776, 5111.8057]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Mogilevka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_86 = _this;

	_this = createTrigger ["EmptyDetector", [10121.785, 5479.5034, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Staroye";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_88 = _this;

	_this = createTrigger ["EmptyDetector", [4464.2275, 4616.3687]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Kozlovka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_90 = _this;

	_this = createTrigger ["EmptyDetector", [5848.8809, 4707.165]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Nadezhdino";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,2,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_92 = _this;

	_this = createTrigger ["EmptyDetector", [4930.3384, 5613.7847, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pulkovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_94 = _this;

	_this = createTrigger ["EmptyDetector", [4486.5034, 6420.5313, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pogorevka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_96 = _this;

	_this = createTrigger ["EmptyDetector", [4781.4141, 6797.9297]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rogovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_98 = _this;

	_this = createTrigger ["EmptyDetector", [3066.6545, 7942.9028, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pustoshka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_100 = _this;

	_this = createTrigger ["EmptyDetector", [1986.5758, 7351.6929, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Myshkino";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_102 = _this;

	_this = createTrigger ["EmptyDetector", [2529.2295, 6347.8228]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Sosnovka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_104 = _this;

	_this = createTrigger ["EmptyDetector", [2744.5173, 5288.1021]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Zelenogorsk";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,225,thisTrigger,[],0,2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_108 = _this;

	_this = createTrigger ["EmptyDetector", [1699.3744, 3839.5432]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Pavlovo";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_110 = _this;

	_this = createTrigger ["EmptyDetector", [3336.4529, 3921.7053, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Bor";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_112 = _this;

	_this = createTrigger ["EmptyDetector", [3411.4346, 4930.8711, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Drozhino";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,150,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_114 = _this;

	_this = createTrigger ["EmptyDetector", [3734.5662, 5990.0493, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Green Mountain";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,2,200,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_116 = _this;

	_this = createTrigger ["EmptyDetector", [9572.3516, 8847.8584]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Gorka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,225,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_118 = _this;

	_this = createTrigger ["EmptyDetector", [10420.348, 9844.5205, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dubrovka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,225,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_120 = _this;

	_this = createTrigger ["EmptyDetector", [10007.653, 10376.338]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dubrovka NW";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_122 = _this;

	_this = createTrigger ["EmptyDetector", [10709.08, 8055.9419, 4.4793243]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Polana";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_126 = _this;

	_this = createTrigger ["EmptyDetector", [11229.258, 6583.4165]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dolina";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_128 = _this;

	_this = createTrigger ["EmptyDetector", [9654.4688, 6562.8745]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Shakhovka";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_130 = _this;

	_this = createTrigger ["EmptyDetector", [13661.255, 2914.5103]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Skalisty Island";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,1,175,thisTrigger,['Skalisty1','Skalisty2','Skalisty3'],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_132 = _this;

	_this = createTrigger ["EmptyDetector", [11250.809, 4274.082]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Rog";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,175,thisTrigger,['CastleRog','CastleRog2','Rog3','Rog4'],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_134 = _this;

	_this = createTrigger ["EmptyDetector", [13256.356, 5432.5425, 4.7683716e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Three Valleys";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],1] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_136 = _this;

	_this = createTrigger ["EmptyDetector", [6894.6455, 11438.785]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Devil's Castle";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,0,200,thisTrigger,['DevilsCastle','DevilsCastle2','Devils3','Devils4'],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_138 = _this;

	_this = createTrigger ["EmptyDetector", [6551.4741, 5595.6704]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Zub";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,175,thisTrigger,['CastleZub','CastleZub2','Zub3','Zub4'],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_140 = _this;

	_this = createTrigger ["EmptyDetector", [11458.502, 7483.2754, 12.369965]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Orlovets Factory";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_142 = _this;

	_this = createTrigger ["EmptyDetector", [12215.833, 6270.9868, 3.8146973e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Dolina-Solnichniy";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_144 = _this;

	_this = createTrigger ["EmptyDetector", [6490.1133, 2778.8921, -7.6293945e-006]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Cherno2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_146 = _this;

	_this = createTrigger ["EmptyDetector", [10456.71, 2247.2095]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Elektro3";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_156 = _this;

	_this = createTrigger ["EmptyDetector", [6677.4395, 2585.647]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Cherno4";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_160 = _this;

	_this = createTrigger ["EmptyDetector", [12248.675, 9573.2344, 9.5367432e-007]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Berezino4";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[],0] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_177 = _this;

	_this = createTrigger ["EmptyDetector", [13365.159, 12852.25]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "Olsha";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [0,1,200,thisTrigger,[]] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_197 = _this;
	
	_this = createTrigger ["EmptyDetector", [4673.8091, 10449.009]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF1";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,0,175,thisTrigger,[],3] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_66 = _this;

	_this = createTrigger ["EmptyDetector", [4760.895, 10160.055, 0.080749512]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF2";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,0,175,thisTrigger,[],3] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_68 = _this;

	_this = createTrigger ["EmptyDetector", [4607.541, 9625.1084]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF3";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [2,0,200,thisTrigger,[],3] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_70 = _this;
 
	_this = createTrigger ["EmptyDetector", [5222.3984, 9780.6406, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF4";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,['NWAF4_1','NWAF4_2','NWAF4_3','NWAF4_4'],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_188 = _this;
 
	_this = createTrigger ["EmptyDetector", [4763.522, 10760.788, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF5";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,['NWAF5_1','NWAF5_2','NWAF5_3','NWAF5_4'],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_179 = _this;
 
	_this = createTrigger ["EmptyDetector", [4103.6729, 10876.167]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF6";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,['NWAF6_1','NWAF6_2','NWAF6_3','NWAF6_4'],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_182 = _this;

	_this = createTrigger ["EmptyDetector", [4147.1416, 10313.281, 0]];
	_this setTriggerArea [600, 600, 0, false];
	_this setTriggerActivation ["ANY", "PRESENT", true];
	_this setTriggerTimeout [10, 15, 20, true];
	_this setTriggerText "NWAF7";
	_this setTriggerStatements ["{isPlayer _x} count thisList > 0;", "0 = [1,0,200,thisTrigger,['NWAF7_1','NWAF7_2','NWAF7_3','NWAF7_4'],2] call fnc_spawnBandits;", "0 = [thisTrigger] spawn fnc_despawnBandits;"];
	_trigger_195 = _this;
	//triggers end
};

#include "custom_markers\cust_markers_chernarus.sqf"
#include "custom_spawns\cust_spawns_chernarus.sqf"

diag_log "Chernarus map configuration loaded.";
