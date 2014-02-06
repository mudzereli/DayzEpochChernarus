private["_crate","_secondary","_primary","_special","_smoke","_loops"];

_crate = _this select 0;

clearWeaponCargoGlobal   _crate;
clearMagazineCargoGlobal _crate;

/* Add clothing loot to crate */
_crate addMagazineCargoGlobal [DZ_MISSIONS_CLOTHING call BIS_fnc_selectRandom, 3];

/* Add pistol loot to crate */
_loops = 0;
while {_loops < 5} do {
    _secondary = DZ_MISSIONS_SECONDARY call BIS_fnc_selectRandom;
    _crate addWeaponCargoGlobal   [_secondary select 0, 1];
    _crate addMagazineCargoGlobal [_secondary select 1, 3];
    _loops = _loops + 1;
};

/* Add primary weapon loot to crate */
_loops = 0;
while {_loops < 2} do {
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
_loops = 0;
while {_loops < 3} do {
    _crate addMagazineCargoGlobal [DZ_MISSIONS_BUILDING call BIS_fnc_selectRandom, 1];
    _loops = _loops + 1;
};

/* Add smokes to crate */
_smoke = ["SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellYellow"] call BIS_fnc_selectRandom;
_crate addMagazineCargoGlobal [_smoke, 10];

/* Add backpack to crate */
_crate addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];