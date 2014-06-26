DZ_SPAWNPLUS_CREATION_STAGE = 2;
titleText ["Selecting class...", "PLAIN DOWN", 3];
//remove items
removeAllWeapons player;
removeAllItems   player;
player addBackpack "DZ_Patrol_Pack_EP1";
if (DZ_SPAWNPLUS_DONATOR_LOADOUT) then {
    removeBackpack   player;
	//add backpack
	player addBackpack "DZ_TerminalPack_EP1";
	//add inventory
	player addMagazine "FoodbaconCooked";
	player addMagazine "ItemSodaOrangeSherbet";
	//add tools
	player addWeapon "ItemMatchbox_DZE";
	player addWeapon "ItemKnife";
	//add primary
	player addWeapon   "M1014";
	player addMagazine "8Rnd_B_Beneli_74Slug";
	player addMagazine "8Rnd_B_Beneli_74Slug";
	player addMagazine "8Rnd_B_Beneli_74Slug";
};
//add default stuff
player addMagazine "ItemBandage";
player addMagazine "ItemPainkiller";
player addWeapon   "ItemMap";
player addWeapon   "ItemFlashlight";
//add secondary
player addWeapon   "M9SD";
player addMagazine "15Rnd_9x19_M9SD";
player addMagazine "15Rnd_9x19_M9SD";
player addMagazine "15Rnd_9x19_M9SD";
//add basic stuff
player addMagazine 'FoodSteakCooked';
player addMagazine 'FoodSteakCooked';
player addMagazine 'ItemWaterbottle';
reload player;
player selectWeapon "M9SD";
player setVehicleAmmo 1;
sleep 2;
titleText ["Class selected!", "PLAIN DOWN", 3];
titleFadeOut 1;
[] call respawn_handler;