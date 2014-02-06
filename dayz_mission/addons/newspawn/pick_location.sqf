private ["_showDonatorSpawnPointMenu","_spawnPoint","_spawnPointLoc","_spawnPointName","_array","_key"];
waitUntil {!dialog};
fmt_execvm = '%1 execVM "addons\newspawn\teleport.sqf"';
diag_log text "NEWSPAWN: building spawn location 1 menu...";
_showDonatorSpawnPointMenu = 0;
if ((count DZ_NEWSPAWN_DONATOR_SPAWN_POINTS) > 0) then { _showDonatorSpawnPointMenu = 1; };
SpawnLocations1 =
[
    ["",true],
    ["Pick Spawn" ,[0]           ,""                           ,-5,[["expression",""]],"1","0"],
    [""           ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Elektro"    ,[DIK_1,DIK_N1],""                           ,-5,[["expression",format[fmt_execvm,"[[10845.30,02701.37,0.002],[09479.41,01960.80,0.002],[10497.30,02016.50,0.002],[10214.10,02411.58,0.002],[10432.70,02047.76,0.002]]"]]],"1","1"],
    ["Cherno"     ,[DIK_2,DIK_N2],""                           ,-5,[["expression",format[fmt_execvm,"[[06686.80,02290.11,0.002],[07235.60,02233.50,0.002],[06288.59,02574.14,0.002],[06827.66,03168.46,0.002],[06960.53,02550.45,0.002]]"]]],"1","1"],
    ["Balota"     ,[DIK_3,DIK_N3],""                           ,-5,[["expression",format[fmt_execvm,"[[04388.23,02263.44,0.002],[05683.43,03004.63,0.002],[04517.41,02420.66,0.002],[05171.99,02070.86,0.002],[04253.29,02533.43,0.002]]"]]],"1","1"],
    ["Zelenogorsk",[DIK_4,DIK_N4],""                           ,-5,[["expression",format[fmt_execvm,"[[03003.99,05329.99,0.002],[02909.99,05671.99,0.002],[02499.99,05388.99,0.002],[02241.99,05023.99,0.002],[02926.99,05014.99,0.002]]"]]],"1","1"],
    ["Vybor"      ,[DIK_5,DIK_N5],""                           ,-5,[["expression",format[fmt_execvm,"[[03625.72,08976.06,0.002],[03685.59,08564.40,0.002],[04197.10,08917.17,0.002],[03870.38,08997.64,0.002],[03729.86,08869.19,0.002]]"]]],"1","1"],
    ["Gorka"      ,[DIK_6,DIK_N6],""                           ,-5,[["expression",format[fmt_execvm,"[[09711.25,08962.20,0.002],[09756.47,08715.15,0.002],[09401.49,08953.64,0.002],[09240.90,08802.83,0.002],[09867.63,08751.83,0.002]]"]]],"1","1"],
    ["Solnichniy" ,[DIK_7,DIK_N7],""                           ,-5,[["expression",format[fmt_execvm,"[[13387.50,06617.04,0.002],[13285.00,06115.62,0.002],[13310.10,06331.05,0.002],[13401.90,05995.73,0.002],[13513.40,06326.69,0.002]]"]]],"1","1"],
    ["Berezino"   ,[DIK_8,DIK_N8],""                           ,-5,[["expression",format[fmt_execvm,"[[11936.10,08870.28,0.002],[12287.30,08471.17,0.002],[12263.70,09160.70,0.002],[11702.70,09172.23,0.002],[12618.50,09560.67,0.002]]"]]],"1","1"],
    ["Krasnostav" ,[DIK_9,DIK_N9],""                           ,-5,[["expression",format[fmt_execvm,"[[11052.50,12361.20,0.002],[11764.10,12147.60,0.002],[12086.00,11991.00,0.002],[10804.70,12483.50,0.002],[11073.30,12468.80,0.002]]"]]],"1","1"],
    [""           ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Special"    ,[DIK_EQL]     ,"#USER:DonatorSpawnLocations",-5,[["expression",""]],"1",format["%1",_showDonatorSpawnPointMenu]]
];
diag_log text "NEWSPAWN: building donator spawn location menu...";
DonatorSpawnLocations =
[
	["",true],
	["Pick Spawn",[0]           ,""                     ,-5,[["expression",""]],"1","0"],
	[""          ,[0]           ,""                     ,-1,[["expression",""]],"1","1"]
];
diag_log text "NEWSPAWN: adding player specific locations to donator menu...";
_key = 1;
{
	_spawnPoint     = _x;
	_spawnPointName = _spawnPoint select 0;
	_spawnPointLoc  = _spawnPoint select 1;
	_array = [_spawnPointName,[call compile format['DIK_%1',_key],call compile format['DIK_N%1',_key]],"",-5,[["expression",format[fmt_execvm,format['[%1]',_spawnPointLoc]]]],"1","1"];
	DonatorSpawnLocations = DonatorSpawnLocations + [_array];
	_key + _key + 1;
} forEach DZ_NEWSPAWN_DONATOR_SPAWN_POINTS;
diag_log text "NEWSPAWN: finishing donator spawn menu...";
DonatorSpawnLocations = DonatorSpawnLocations + [
	[""          ,[0]           ,""                     ,-1,[["expression",""]],"1","1"],
    ["Main Page" ,[DIK_GRV]	    ,"#USER:SpawnLocations1",-5,[["expression",""]],"1","1"]
];
diag_log text "NEWSPAWN: showing spawn menu...";
showCommandingMenu "#USER:SpawnLocations1";