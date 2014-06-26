diag_log text format["SPAWNPLUS: Handling Respawn With Creation Stage Of %1",DZ_SPAWNPLUS_CREATION_STAGE];
switch (DZ_SPAWNPLUS_CREATION_STAGE) do {
	case 0: {
		[] call pick_location;
	};
	case 1: {
        if (DZ_SPAWNPLUS_PICK_CLASS) then {
            [] call pick_class;
        } else {
            DZ_SPAWNPLUS_CREATION_STAGE = 2;
            [] spawn respawn_handler; 
        };
	};
	case 2: {
        if (DZ_SPAWNPLUS_DONATOR_LOADOUT or DZ_SPAWNPLUS_ALL_SKINS) then {
            [] call pick_skin;
        } else {
            DZ_SPAWNPLUS_CREATION_STAGE = 3;
        };
	};
};