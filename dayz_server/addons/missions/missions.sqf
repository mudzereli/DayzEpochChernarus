DZ_MISSION_WEAPON_CACHE = 
[
    [],
    "Bandits have discovered a weapons cache! Check your map for the location!",
    "major",
    [DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box"]],
    [[30,2,5,1],[30,2,5,1]],
    "The weapons cache is under survivor control!"
];

DZ_MISSION_URAL_BUILDING_CRASH = 
[
    ["UralWreck","UralWreck"],
    "2 Urals full of building supplies have crashed and bandits are securing the site! Check your map for the location!",
    "major",
    ["MTVR_DES_EP1",DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box_building"],["USLaunchersBox","fnc_fill_box_building"]],
    [[30,2,5,1],[30,2,5,1]],
    "The crash site has been secured by survivors!"
];

DZ_MISSION_URAL_CLOTHING_CRASH = 
[
    ["UralWreck"],
    "A Ural full of clothing has crashed and bandits are securing the site! Check your map for the location!",
    "major",
    [DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom],
    [["USLaunchersBox","fnc_fill_box_clothing"],["USLaunchersBox","fnc_fill_box_clothing"]],
    [[30,2,8,1]],
    "The crash site has been secured by survivors!"
];

DZ_MISSION_HUNTING_PARTY = 
[
    [],
    "A bandit hunting party has been spotted! Check your map for the location!",
    "minor",
    [DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box"]],
    [[30,2,3,0]],
    "The hunting party has been wiped out!"
];

DZ_MISSION_MEDICAL_OUTPOST = 
[
    ["US_WarfareBFieldhHospital_Base_EP1","MASH_EP1","MASH_EP1","MASH_EP1"],
    "A group of bandits have taken over a Medical Outpost! Check your map for the location!",
    "minor",
    ["HMMWV_Ambulance",DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box_medical"],["USLaunchersBox","fnc_fill_box_small"]],
    [[30,2,8,0]],
    "The Medical Outpost is under survivor control!"
];

DZ_MISSION_MEDICAL_SUPPLY = 
[
    ["land_fortified_nest_big","Land_Fort_Watchtower"],
    "Bandits have set up a medical re-supply camp! Check your map for the location!",
    "major",
    [DZ_MISSIONS_MILITARY_UNARMED_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box_medical"],["USLaunchersBox","fnc_fill_box_small"]],
    [[30,2,4,1],[30,2,4,1]],
    "Survivors have taken control of the camp and medical supplies."
];

DZ_MISSION_HELI_CRASH = 
[
    [],
    "A bandit supply helicopter has crash landed! Check your map for the location!",
    "major",
    [["Mi17_Civilian_DZ","MH6J_DZ"] call BIS_fnc_selectRandom],
    [["USLaunchersBox","fnc_fill_box_small"],["USLaunchersBox","fnc_fill_box_small"],["RULaunchersBox","fnc_fill_box_large"]],
    [[30,2,5,1],[30,2,5,1]],
    "The helicopter has been taken by survivors!"
];

DZ_MISSION_MEDICAL_URAL_CRASH = 
[
    ["UralWreck"],
    "Bandits have destroyed a Ural carrying medical supplies and are securing the cargo! Check your map for the location!",
    "major",
    [DZ_MISSIONS_LARGE_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_LARGE_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box_medical"],["USLaunchersBox","fnc_fill_box_small"]],
    [[30,2,4,0],[30,2,4,0]],
    "The medical supplies have been secured by survivors!"
];

DZ_MISSION_MEDICAL_CRATE = 
[
    [],
    "A medical supply crate has been secured by bandits! Check your map for the location!",
    "major",
    [DZ_MISSIONS_MILITARY_UNARMED_VEHICLES call BIS_fnc_SelectRandom,"SUV_Red"],
    [["USVehicleBox","fnc_fill_box_medical"],["USLaunchersBox","fnc_fill_box_small"]],
    [[30,2,3,1],[30,2,3,1]],
    "The medical crate is under survivor control!"
];

DZ_MISSION_STASH_HOUSE = 
[
    ["Land_HouseV_1I3","Land_hut06","Land_hut06"],
    "A group of bandits have set up a stash house! Check your map for the location!",
    "minor",
    [DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom],
    [["USVehicleBox","fnc_fill_box"]],
    [[30,2,6,0]],
    "The stash house is under survivor control!"
];

DZ_MISSION_SMALL_HELI_CRASH = 
[
    ["UH60Wreck_DZ"],
    "A bandit helicopter has crashed! Check your map for the location!",
    "minor",
    [DZ_MISSIONS_CIVILIAN_VEHICLES call BIS_fnc_SelectRandom],
    [["USLaunchersBox","fnc_fill_box_small"]],
    [[30,2,6,1]],
    "The crash site has been secured by survivors!"
];

DZ_MISSION_SMALL_HUMVEE_CRASH = 
[
    ["HMMWVwreck"],
    "A Humvee has crashed! Check your map for the location!",
    "minor",
    [DZ_MISSIONS_UTILITY_VEHICLES call BIS_fnc_SelectRandom],
    [["RULaunchersBox","fnc_fill_box_large"]],
    [[30,2,5,1],[40,2,5,1]],
    "The crash site has been secured by survivors!"
];

DZ_MISSION_SMALL_WEAPONS_TRUCK = 
[
    ["UralWreck"],
    "A bandit weapons truck has crashed! Check your map for the location!",
    "minor",
    [DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom,DZ_MISSIONS_BIKE_ATV_VEHICLES call BIS_fnc_SelectRandom],
    [["USLaunchersBox","fnc_fill_box"],["USLaunchersBox","fnc_fill_box_small"],["RULaunchersBox","fnc_fill_box_large"]],
    [[30,2,9,0]],
    "The crash site has been secured by survivors!"
];

DZ_MISSIONS = 
[
    DZ_MISSION_WEAPON_CACHE,
    DZ_MISSION_HUNTING_PARTY,
    DZ_MISSION_URAL_BUILDING_CRASH,
    DZ_MISSION_MEDICAL_OUTPOST,
    DZ_MISSION_MEDICAL_SUPPLY,
    DZ_MISSION_HELI_CRASH,
    DZ_MISSION_MEDICAL_URAL_CRASH,
    DZ_MISSION_MEDICAL_CRATE,
    DZ_MISSION_STASH_HOUSE,
    DZ_MISSION_SMALL_HELI_CRASH,
    DZ_MISSION_SMALL_HUMVEE_CRASH,
    DZ_MISSION_SMALL_WEAPONS_TRUCK
];