DZ_SPAWNPLUS_CREATION_STAGE = 2;
titleText ["Selecting class...", "PLAIN DOWN", 3];
//remove items
removeAllWeapons player;
removeAllItems   player;
player addBackpack "DZ_Patrol_Pack_EP1";
if (DZ_SPAWNPLUS_DONATOR_LOADOUT) then {
    removeBackpack   player;
	//add backpack
	player addBackpack "DZ_TK_Assault_Pack_EP1";
	//add inventory
	player addMagazine "ItemBandage";
	player addMagazine "FoodNutmix";
	//add tools
	player addWeapon "Binocular";
	player addWeapon "ItemMachete";
	//add primary
	player addWeapon   "LeeEnfield";
	player addMagazine "10x_303";
	player addMagazine "10x_303";
	player addMagazine "10x_303";
};
//add default stuff
player addMagazine "ItemBandage";
player addMagazine "ItemPainkiller";
player addWeapon   "ItemMap";
player addWeapon   "ItemFlashlight";
//add secondary
player addWeapon   "revolver_EP1";
player addMagazine "6Rnd_45ACP";
player addMagazine "6Rnd_45ACP";
player addMagazine "6Rnd_45ACP";
//add basic stuff
player addWeapon 'ItemHatchet_DZE';
player addWeapon 'ItemMatchbox_DZE';
player addWeapon 'ItemKnife';
reload player;
player selectWeapon "revolver_EP1";
player setVehicleAmmo 1;
sleep 2;
titleText ["Class selected!", "PLAIN DOWN", 3];
titleFadeOut 1;
[] call respawn_handler;