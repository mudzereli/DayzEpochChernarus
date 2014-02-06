/* Time for units to despawn after mission complete (chests & bandits -- not vehicles) */
DZ_MISSION_DESPAWN_TIMER = 600;

/* Min seconds between missions */
DZ_MISSION_WAIT_TIMER = 300;

DZ_MISSION_BLACKLIST_ZONES = 
[
    ["Stary" ,[06325,07807],500],
    ["Klen"  ,[04063,11664],500],
    ["Bash"  ,[11447,11364],500],
    ["Hero"  ,[01606,07803],400],
    ["Bandit",[12944,12766],400]
];

/* Clothing loot will be generated from this array */
DZ_MISSIONS_CLOTHING = 
[
    "Skin_Sniper1_DZ",
    "Skin_Soldier1_DZ",
    "Skin_Camo1_DZ",
    "Skin_Survivor2_DZ",
    "Skin_RU_Policeman_DZ",
    "Skin_Priest_DZ",
    "Skin_Haris_Press_EP1_DZ",
    "Skin_Pilot_EP1_DZ",
    "Skin_Functionary1_EP1_DZ",
    "Skin_Rocker1_DZ",
    "Skin_Rocker2_DZ",
    "Skin_Rocker3_DZ",
    "Skin_Rocker4_DZ",
    "Skin_BanditW1_DZ",
    "Skin_BanditW2_DZ",
    "Skin_SurvivorW2_DZ",
    "Skin_SurvivorW3_DZ",
    "Skin_SurvivorWcombat_DZ",
    "Skin_SurvivorWdesert_DZ",
    "Skin_SurvivorWurban_DZ",
    "Skin_SurvivorWpink_DZ",
    "Skin_Rocket_DZ",
    "Skin_CZ_Soldier_Sniper_EP1_DZ",
    "Skin_FR_OHara_DZ",
    "Skin_FR_Rodriguez_DZ",
    "Skin_Graves_Light_DZ",
    "Skin_CZ_Special_Forces_GL_DES_EP1_DZ",
    "Skin_Soldier_Bodyguard_AA12_PMC_DZ",
    "Skin_Soldier_Sniper_PMC_DZ",
    "Skin_Bandit1_DZ",
    "Skin_Bandit2_DZ",
    "Skin_GUE_Soldier_MG_DZ",
    "Skin_GUE_Soldier_Sniper_DZ",
    "Skin_GUE_Soldier_Crew_DZ",
    "Skin_GUE_Soldier_CO_DZ",
    "Skin_GUE_Soldier_2_DZ",
    "Skin_GUE_Commander_DZ",
    "Skin_Ins_Soldier_GL_DZ",
    "Skin_TK_INS_Soldier_EP1_DZ",
    "Skin_TK_INS_Warlord_EP1_DZ",
    "Skin_INS_Worker2_DZ",
    "Skin_INS_Bardak_DZ",
    "Skin_INS_Soldier_CO_DZ",
    "Skin_INS_Soldier_AR_DZ",
    "Skin_INS_Lopotev_DZ",
    "Skin_RU_Soldier_Crew_DZ",
    "Skin_TK_Commander_EP1_DZ",
    "Skin_TK_Soldier_Sniper_EP1_DZ",
    "Skin_TK_Special_Forces_MG_EP1_DZ",
    "Skin_Soldier_TL_PMC"
];

/* Pistol loot will be generated from this array */
DZ_MISSIONS_SECONDARY = 
[
    ["Makarov"     ,"8Rnd_9x18_Makarov" ],
    ["M9"          ,"15Rnd_9x19_M9"     ],
    ["revolver_EP1","6Rnd_45ACP"        ],
    ["Colt1911"    ,"7Rnd_45ACP_1911"   ],
    ["glock17_EP1" ,"17Rnd_9x19_glock17"]
];

/* Primary loot will be generated from this array */
DZ_MISSIONS_PRIMARY = 
[
    ["M16A2"            ,"30Rnd_556x45_Stanag" ],
    ["M4A1"             ,"30Rnd_556x45_Stanag" ],
    ["Sa58V_EP1"        ,"30Rnd_762x39_SA58"   ],
    ["AKS_74_U"         ,"30Rnd_762x39_AK47"   ],
    ["G36C"             ,"30Rnd_556x45_Stanag" ],
    ["M16A2GL"          ,"1Rnd_HE_M203"        ],
    ["Sa58P_EP1"        ,"30Rnd_762x39_SA58"   ],
    ["AKS_74_kobra"     ,"30Rnd_545x39_AK"     ],
    ["AK_74"            ,"30Rnd_545x39_AK"     ],  
    ["M1014"            ,"8Rnd_B_Beneli_74Slug"]
];

/* Special loot will be generated from this array */
DZ_MISSIONS_SPECIAL = 
[
    ["FN_FAL"            ,"30Rnd_556x45_Stanag"  ],
    ["M16A4_ACG"         ,"30Rnd_556x45_Stanag"  ],   
    ["Sa58V_RCO_EP1"     ,"30Rnd_762x39_SA58"    ],   
    ["BAF_L85A2_RIS_Holo","30Rnd_556x45_Stanag"  ],
    ["M4A3_CCO_EP1"      ,"30Rnd_556x45_Stanag"  ],
    ["AK_47_M"           ,"30Rnd_762x39_AK47"    ],
    ["SVD_CAMO"          ,"10Rnd_762x54_SVD"     ],
    ["M4SPR"             ,"30Rnd_556x45_Stanag"  ],  
    ["SVD_des_EP1"       ,"10Rnd_762x54_SVD"     ],
    ["M24_des_EP1"       ,"5Rnd_762x51_M24"      ],
    ["M40A3"             ,"5Rnd_762x51_M24"      ],   
    ["SVD"               ,"10Rnd_762x54_SVD"     ],
    ["M24"               ,"5Rnd_762x51_M24"      ],
    ["M240_DZ"           ,"100Rnd_762x51_M240"   ],
    ["M249_DZ"           ,"200Rnd_556x45_M249"   ],
    ["Mk_48_DZ"          ,"100Rnd_762x51_M240"   ],
    ["bizon_silenced"    ,"64Rnd_9x19_SD_Bizon"  ],
    ["G36_C_SD_camo"     ,"30Rnd_556x45_StanagSD"],
    ["FN_FAL_ANPVS4"     ,"20Rnd_762x51_FNFAL"   ],
    ["M4A1_AIM_SD_camo"  ,"30Rnd_556x45_StanagSD"]
];

/* Building Supply loot will be generated from this array */
DZ_MISSIONS_BUILDING = ["MortarBucket","CinderBlocks","CinderBlocks","CinderBlocks","PartWoodPlywood","PartWoodLumber","ItemTankTrap","ItemPole"];

/* Used Car loot will be generated from this array */
DZ_MISSIONS_USED_CAR_VEHICLES = [
    "Skoda",    
    "LadaLM",   
    "Lada2_TK_CIV_EP1", 
    "Lada2",    
    "Lada1_TK_CIV_EP1", 
    "Lada1",    
    "GLT_M300_ST",  
    "GLT_M300_LT",  
    "car_sedan",    
    "car_hatchback",    
    "SkodaBlue",    
    "SkodaGreen",   
    "SkodaRed", 
    "VolhaLimo_TK_CIV_EP1", 
    "Volha_1_TK_CIV_EP1",   
    "Volha_2_TK_CIV_EP1",   
    "VWGolf"
];

/* Cargo Truck loot will be generated from this array */
DZ_MISSIONS_CARGO_VEHICLES = [
    "MTVR_DES_EP1", 
    "Kamaz",    
    "V3S_Open_TK_EP1",  
    "V3S_Open_TK_CIV_EP1",  
    "Ural_UN_EP1",  
    "Ural_TK_CIV_EP1",  
    "Ural_CDF"
];

/* Bike/ATV loot will be generated from this array */
DZ_MISSIONS_BIKE_ATV_VEHICLES = [
    "Old_moto_TK_Civ_EP1",  
    "M1030_US_DES_EP1", 
    "ATV_US_EP1",   
    "ATV_CZ_EP1",   
    "TT650_TK_CIV_EP1", 
    "TT650_Ins",    
    "TT650_Civ",    
    "MMT_Civ"
];

/* Bus/Van loot will be generated from this array */
DZ_MISSIONS_BUS_VAN_VEHICLES = [
    "S1203_ambulance_EP1",  
    "S1203_TK_CIV_EP1", 
    "Ikarus_TK_CIV_EP1",    
    "Ikarus"
];

/* Fuel Truck loot will be generated from this array */
DZ_MISSIONS_FUEL_VEHICLES = [
    "KamazRefuel_DZ",   
    "MtvrRefuel_DES_EP1_DZ",    
    "UralRefuel_TK_EP1_DZ", 
    "V3S_Refuel_TK_GUE_EP1_DZ"
];

/* Utility Vehicle loot will be generated from this array */
DZ_MISSIONS_UTILITY_VEHICLES = [
    "hilux1_civil_2_covered",   
    "datsun1_civil_1_open", 
    "datsun1_civil_2_covered",  
    "hilux1_civil_1_open",  
    "datsun1_civil_3_open", 
    "hilux1_civil_3_open_EP1",  
    "SUV_Camo", 
    "UAZ_CDF",  
    "UAZ_INS",  
    "UAZ_RU",   
    "UAZ_Unarmed_TK_CIV_EP1",   
    "UAZ_Unarmed_TK_EP1",   
    "UAZ_Unarmed_UN_EP1",   
    "SUV_Yellow",   
    "SUV_White",    
    "SUV_TK_CIV_EP1",   
    "SUV_Blue", 
    "SUV_Charcoal", 
    "SUV_Green",    
    "SUV_Orange",   
    "SUV_Pink", 
    "SUV_Red",  
    "SUV_Silver"
];

/* Military Unarmed Vehicle loot will be generated from this array */
DZ_MISSIONS_MILITARY_UNARMED_VEHICLES = [
    "LandRover_CZ_EP1", 
    "HMMWV_DZ", 
    "GAZ_Vodnik_MedEvac",   
    "HMMWV_DES_EP1",    
    "HMMWV_Ambulance_CZ_DES_EP1",   
    "HMMWV_Ambulance",  
    "HMMWV_M1035_DES_EP1",  
    "LandRover_TK_CIV_EP1"
];

DZ_MISSIONS_OFFROAD_VEHICLES = DZ_MISSIONS_UTILITY_VEHICLES + DZ_MISSIONS_BIKE_ATV_VEHICLES;
DZ_MISSIONS_CIVILIAN_VEHICLES = DZ_MISSIONS_OFFROAD_VEHICLES + DZ_MISSIONS_USED_CAR_VEHICLES + DZ_MISSIONS_BUS_VAN_VEHICLES;
DZ_MISSIONS_LARGE_VEHICLES = DZ_MISSIONS_UTILITY_VEHICLES + DZ_MISSIONS_MILITARY_UNARMED_VEHICLES + DZ_MISSIONS_FUEL_VEHICLES + DZ_MISSIONS_BUS_VAN_VEHICLES + DZ_MISSIONS_CARGO_VEHICLES;