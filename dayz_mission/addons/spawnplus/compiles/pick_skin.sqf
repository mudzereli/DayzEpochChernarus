waitUntil {!dialog};
diag_log text "SPAWNPLUS: building skin 1 menu...";
DonatorSkins1 =
[
    ["",true],
    ["Military Skins",[0]           ,""                           ,-5,[["expression",""]],"1","0"],
    [""              ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Rocket"        ,[DIK_1,DIK_N1],""                           ,-5,[["expression","['Skin_Rocket_DZ'                 ] call add_donator_skin;"]],"1","1"],
    ["Soldier"       ,[DIK_2,DIK_N2],""                           ,-5,[["expression","['Skin_Soldier1_DZ'               ] call add_donator_skin;"]],"1","1"],
    ["Camo"          ,[DIK_3,DIK_N3],""                           ,-5,[["expression","['Skin_Camo1_DZ'                  ] call add_donator_skin;"]],"1","1"],
    ["Jungle Camo"   ,[DIK_4,DIK_N4],""                           ,-5,[["expression","['Skin_FR_OHara_DZ'               ] call add_donator_skin;"]],"1","1"],
    ["Urban Camo"    ,[DIK_5,DIK_N5],""                           ,-5,[["expression","['Skin_Graves_Light_DZ'                ] call add_donator_skin;"]],"1","1"],
    ["Gunner Outfit" ,[DIK_6,DIK_N6],""                           ,-5,[["expression","['Skin_FR_Rodriguez_DZ'                ] call add_donator_skin;"]],"1","1"],
    ["Spec Forces"   ,[DIK_7,DIK_N7],""                           ,-5,[["expression","['Skin_CZ_Special_Forces_GL_DES_EP1_DZ'] call add_donator_skin;"]],"1","1"],
    ["BodyGuard"     ,[DIK_8,DIK_N8],""                           ,-5,[["expression","['Skin_Soldier_Bodyguard_AA12_PMC_DZ'  ] call add_donator_skin;"]],"1","1"],
    ["Marksman"      ,[DIK_9,DIK_N9],""                           ,-5,[["expression","['Skin_Soldier_Sniper_PMC_DZ'          ] call add_donator_skin;"]],"1","1"],
    [""              ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Next Page"     ,[DIK_GRV]	    ,"#USER:DonatorSkins2"        ,-5,[["expression",""]],"1","1"],
    [""              ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
	["Exit"          ,[DIK_EQL]     ,""                           ,-5,[["expression",""]],"1","1"]
];
diag_log text "SPAWNPLUS: building skin 2 menu...";
DonatorSkins2 =
[
    ["",true],
    ["Rebel Skins"     ,[0]           ,""                           ,-5,[["expression",""]],"1","0"],
    [""                ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Bandit 1"        ,[DIK_1,DIK_N1],""                           ,-5,[["expression","['Skin_Bandit1_DZ'           ] call add_donator_skin;"]],"1","1"],
    ["Bandit 2"        ,[DIK_2,DIK_N2],""                           ,-5,[["expression","['Skin_Bandit2_DZ'           ] call add_donator_skin;"]],"1","1"],
    ["Bandit Gunner"   ,[DIK_3,DIK_N3],""                           ,-5,[["expression","['Skin_GUE_Soldier_MG_DZ'    ] call add_donator_skin;"]],"1","1"],
    ["Bandit Baklava"  ,[DIK_4,DIK_N4],""                           ,-5,[["expression","['Skin_GUE_Soldier_Crew_DZ'  ] call add_donator_skin;"]],"1","1"],
    ["Bandit Mask"     ,[DIK_5,DIK_N5],""                           ,-5,[["expression","['Skin_GUE_Soldier_CO_DZ'    ] call add_donator_skin;"]],"1","1"],
    ["Bandit Hat"      ,[DIK_6,DIK_N6],""                           ,-5,[["expression","['Skin_GUE_Soldier_2_DZ'     ] call add_donator_skin;"]],"1","1"],
    ["Rebel Uniform"   ,[DIK_7,DIK_N7],""                           ,-5,[["expression","['Skin_GUE_Commander_DZ'     ] call add_donator_skin;"]],"1","1"],
    ["Terrorist"       ,[DIK_8,DIK_N8],""                           ,-5,[["expression","['Skin_Ins_Soldier_GL_DZ'    ] call add_donator_skin;"]],"1","1"],
    ["Takistan Soldier",[DIK_9,DIK_N9],""                           ,-5,[["expression","['Skin_TK_INS_Soldier_EP1_DZ'] call add_donator_skin;"]],"1","1"],
    [""                ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Next Page"       ,[DIK_GRV]	  ,"#USER:DonatorSkins3"        ,-5,[["expression",""]],"1","1"],
    [""                ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
	["Exit"            ,[DIK_EQL]     ,""                           ,-5,[["expression",""]],"1","1"]
];
diag_log text "SPAWNPLUS: building skin 3 menu...";
DonatorSkins3 =
[
    ["",true],
    ["Civilian Skins",[0]           ,""                           ,-5,[["expression",""]],"1","0"],
    [""              ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Policeman"     ,[DIK_1,DIK_N1],""                           ,-5,[["expression","['Skin_RU_Policeman_DZ'   ] call add_donator_skin;"]],"1","1"],
    ["Priest"        ,[DIK_2,DIK_N2],""                           ,-5,[["expression","['Skin_Priest_DZ'         ] call add_donator_skin;"]],"1","1"],
    ["Press"         ,[DIK_3,DIK_N3],""                           ,-5,[["expression","['Skin_Haris_Press_EP1_DZ'] call add_donator_skin;"]],"1","1"],
    ["Pilot"         ,[DIK_4,DIK_N4],""                           ,-5,[["expression","['Skin_Pilot_EP1_DZ'      ] call add_donator_skin;"]],"1","1"],
    ["Business"      ,[DIK_5,DIK_N5],""                           ,-5,[["expression","['Skin_Functionary1_DZ'   ] call add_donator_skin;"]],"1","1"],
    ["Rocker Blue"   ,[DIK_6,DIK_N6],""                           ,-5,[["expression","['Skin_Rocker1_DZ'        ] call add_donator_skin;"]],"1","1"],
    ["Rocker Black"  ,[DIK_7,DIK_N7],""                           ,-5,[["expression","['Skin_Rocker2_DZ'        ] call add_donator_skin;"]],"1","1"],
    ["Rocker Browm"  ,[DIK_8,DIK_N8],""                           ,-5,[["expression","['Skin_Rocker3_DZ'        ] call add_donator_skin;"]],"1","1"],
    ["Rocker Green"  ,[DIK_9,DIK_N9],""                           ,-5,[["expression","['Skin_Rocker4_DZ'        ] call add_donator_skin;"]],"1","1"],
    [""              ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Next Page"     ,[DIK_GRV]	    ,"#USER:DonatorSkins4"        ,-5,[["expression",""]],"1","1"],
    [""              ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
	["Exit"          ,[DIK_EQL]     ,""                           ,-5,[["expression",""]],"1","1"]
];
diag_log text "SPAWNPLUS: building skin 4 menu...";
DonatorSkins4 =
[
    ["",true],
    ["Female Skins",[0]           ,""                           ,-5,[["expression",""]],"1","0"],
    [""            ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["Bandit Annie",[DIK_1,DIK_N1],""                           ,-5,[["expression","['Skin_BanditW1_DZ'       ] call add_donator_skin;"]],"1","1"],
    ["Bandit Jane" ,[DIK_2,DIK_N2],""                           ,-5,[["expression","['Skin_BanditW2_DZ'       ] call add_donator_skin;"]],"1","1"],
    ["Annie"       ,[DIK_3,DIK_N3],""                           ,-5,[["expression","['Skin_SurvivorW2_DZ'     ] call add_donator_skin;"]],"1","1"],
    ["Jane"        ,[DIK_4,DIK_N4],""                           ,-5,[["expression","['Skin_SurvivorW3_DZ'     ] call add_donator_skin;"]],"1","1"],
    ["Alejandria"  ,[DIK_5,DIK_N5],""                           ,-5,[["expression","['Skin_SurvivorWcombat_DZ'] call add_donator_skin;"]],"1","1"],
    ["Savannah"    ,[DIK_6,DIK_N6],""                           ,-5,[["expression","['Skin_SurvivorWdesert_DZ'] call add_donator_skin;"]],"1","1"],
    ["Sophia"      ,[DIK_7,DIK_N7],""                           ,-5,[["expression","['Skin_SurvivorWurban_DZ' ] call add_donator_skin;"]],"1","1"],
    ["Melly"       ,[DIK_8,DIK_N8],""                           ,-5,[["expression","['Skin_SurvivorWpink_DZ'  ] call add_donator_skin;"]],"1","1"],
    [""            ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
    ["First Page"  ,[DIK_GRV]	  ,"#USER:DonatorSkins1"        ,-5,[["expression",""]],"1","1"],
    [""            ,[0]           ,""                           ,-1,[["expression",""]],"1","1"],
	["Exit"        ,[DIK_EQL]     ,""                           ,-5,[["expression",""]],"1","1"]
];
diag_log text "SPAWNPLUS: showing skin menu...";
showCommandingMenu "#USER:DonatorSkins1";