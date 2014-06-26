private["_key"];
waitUntil {!dialog};
fmt_execvm = 'player execVM "addons\spawnplus\classes\%1"';
Classes =
[
    ["",true],
    ["Pick Class",[0]  	        ,"#USER:Classes",-5,[["expression",""                               ]],"1","0"],
    [""          ,[0]           ,""             ,-1,[["expression",""                               ]],"1","1"]
];
_key = 1;
{
    Classes = Classes + [[_x select 0,[call compile format['DIK_%1',_key],call compile format['DIK_N%1',_key]],"",-5,[["expression",format[fmt_execvm,_x select 1]]],"1","1"]];
    _key = _key + 1;
} forEach DZ_SPAWNPLUS_CLASSES;
showCommandingMenu "#USER:Classes";