private ["_crate","_loops"];

_crate = _this select 0;

clearWeaponCargoGlobal   _crate;
clearMagazineCargoGlobal _crate;

/* Add clothing supply loot to crate */
_loops = 0;
while {_loops < 10} do {
	_crate addMagazineCargoGlobal [DZ_MISSIONS_CLOTHING call BIS_fnc_selectRandom, 1];
	_loops = _loops + 1;
};