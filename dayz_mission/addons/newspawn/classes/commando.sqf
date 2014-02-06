titleText ["Selecting class...", "PLAIN DOWN", 3];
//remove items
removeAllWeapons player;
removeAllItems   player;
player addBackpack "DZ_Patrol_Pack_EP1";
if (DZ_NEWSPAWN_DONATOR_LOADOUT) then {
    removeBackpack   player;
	//add backpack
	player addBackpack "CZ_VestPouch_EP1";
	//add inventory
	player addMagazine "ItemWaterbottle";
	player addMagazine "FoodMRE";
	//add tools
	player addWeapon "Binocular";
	player addWeapon "ItemCompass";
	//add primary
	player addWeapon   "bizon_silenced";
	player addMagazine "64Rnd_9x19_SD_Bizon";
	player addMagazine "64Rnd_9x19_SD_Bizon";
	player addMagazine "64Rnd_9x19_SD_Bizon";
};
//add default stuff
player addMagazine "ItemBandage";
player addMagazine "ItemPainkiller";
player addWeapon   "ItemMap";
player addWeapon   "ItemFlashlightRed";
//add secondary
player addWeapon   "glock17_EP1";
player addMagazine "17Rnd_9x19_glock17";
player addMagazine "17Rnd_9x19_glock17";
player addMagazine "17Rnd_9x19_glock17";
//add basic stuff
player addWeapon   'ItemMachete';
player addMagazine 'ItemBandage';
player addMagazine 'ItemPainkiller';
reload player;
sleep 2;
titleText ["Class selected!", "PLAIN DOWN", 3];
titleFadeOut 1;
DZ_NEWSPAWN_CREATION_STAGE = 2;
[] call respawn_handler;