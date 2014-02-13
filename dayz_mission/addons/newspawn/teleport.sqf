private ["_ebayrandomspawn"];

if (dayz_combat == 1) then {
	titleText["You can't select a spawn point while in combat!","PLAIN DOWN",3];
	titleFadeOut 1;
	DZ_NEWSPAWN_CREATION_STAGE = 0;
	[] call respawn_handler;
} else {
	DZ_NEWSPAWN_CREATION_STAGE = 1;
	titleText["Spawning at selected location...","PLAIN DOWN",3];
	_ebayrandomspawn=_this call BIS_fnc_selectRandom;
	player setPosATL _ebayrandomspawn;
	titleText ["Spawned!","PLAIN DOWN",3];
	titleFadeOut 1;
	[] call respawn_handler;
};