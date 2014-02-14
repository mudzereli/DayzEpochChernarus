diag_log text format["NEWSPAWN: Handling Respawn With Creation Stage Of %1",DZ_NEWSPAWN_CREATION_STAGE];
switch (DZ_NEWSPAWN_CREATION_STAGE) do {
	case 0: {
		[] call pick_location;
	};
	case 1: {
		[] call pick_class;
	};
	case 2: {
        if (DZ_NEWSPAWN_DONATOR_LOADOUT) then {
            [] call pick_skin;
        } else {
            DZ_NEWSPAWN_CREATION_STAGE = 3;
        };
	};
};