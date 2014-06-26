waitUntil {!dialog};
fmt_execvm = 'player execVM "addons\newspawn\classes\%1"';
Classes =
[
    ["",true],
    ["Pick Class",[0]  	        ,"#USER:Classes",-5,[["expression",""                               ]],"1","0"],
    [""          ,[0]           ,""             ,-1,[["expression",""                               ]],"1","1"],
    ["Woodsman"  ,[DIK_1,DIK_N1],""             ,-5,[["expression",format[fmt_execvm,"woodsman.sqf"]]],"1","1"],
    ["Doctor"    ,[DIK_2,DIK_N2],""             ,-5,[["expression",format[fmt_execvm,"doctor.sqf"  ]]],"1","1"],
    ["Mechanic"  ,[DIK_3,DIK_N3],""             ,-5,[["expression",format[fmt_execvm,"mechanic.sqf"]]],"1","1"],
    ["Chef"      ,[DIK_4,DIK_N4],""             ,-5,[["expression",format[fmt_execvm,"chef.sqf"    ]]],"1","1"],
    ["Commando"  ,[DIK_5,DIK_N5],""             ,-5,[["expression",format[fmt_execvm,"commando.sqf"]]],"1","1"],
    ["Crafter"   ,[DIK_6,DIK_N6],""             ,-5,[["expression",format[fmt_execvm,"crafter.sqf" ]]],"1","1"]
];
showCommandingMenu "#USER:Classes";