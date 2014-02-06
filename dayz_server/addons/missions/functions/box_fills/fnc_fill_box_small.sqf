private["_crate","_secondary","_primary","_special","_loops"];

_crate = _this select 0;

clearWeaponCargoGlobal   _crate;
clearMagazineCargoGlobal _crate;

/* Add pistol loot to crate */
_loops = 0;
while {_loops < 2} do {
    _secondary = DZ_MISSIONS_SECONDARY call BIS_fnc_selectRandom;
    _crate addWeaponCargoGlobal   [_secondary select 0, 1];
    _crate addMagazineCargoGlobal [_secondary select 1, 3];
    _loops = _loops + 1;
};

/* Add primary weapon loot to crate */
_loops = 0;
while {_loops < 3} do {
    _primary = DZ_MISSIONS_PRIMARY call BIS_fnc_selectRandom;
    _crate addWeaponCargoGlobal   [_primary select 0, 1];
    _crate addMagazineCargoGlobal [_primary select 1, 3];
    _loops = _loops + 1;
};

/* Add special weapon loot to crate */
_loops = 0;
while {_loops < 1} do {
    _special = DZ_MISSIONS_SPECIAL call BIS_fnc_selectRandom;
    _crate addWeaponCargoGlobal   [_special select 0, 1];
    _crate addMagazineCargoGlobal [_special select 1, 3];
    _loops = _loops + 1;
};

/* Add building supply loot to crate */
_crate addMagazineCargoGlobal [DZ_MISSIONS_BUILDING call BIS_fnc_selectRandom, 1];