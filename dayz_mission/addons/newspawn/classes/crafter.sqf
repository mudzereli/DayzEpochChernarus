DZ_NEWSPAWN_CREATION_STAGE = 2;
titleText ["Selecting class...", "PLAIN DOWN", 3];
//remove items
removeAllWeapons player;
removeAllItems   player;
player addBackpack "DZ_Patrol_Pack_EP1";
if (DZ_NEWSPAWN_DONATOR_LOADOUT) then {
    removeBackpack   player;
	//add backpack
	player addBackpack "DZ_TK_Assault_Pack_EP1";
	//add inventory
	player addMagazine "ItemWire";
	player addMagazine "ItemTankTrap";
	//add tools
	player addWeapon "ItemETool";
	player addWeapon "ItemCompass";
	//add primary
	player addWeapon   "Winchester1866";
	player addMagazine "15Rnd_W1866_Slug";
	player addMagazine "15Rnd_W1866_Slug";
	player addMagazine "15Rnd_W1866_Slug";
};
//add default stuff
player addMagazine "ItemBandage";
player addMagazine "ItemPainkiller";
player addWeapon   "ItemMap";
player addWeapon   "ItemFlashlight";
//add secondary
player addWeapon   "MakarovSD";
player addMagazine "8Rnd_9x18_MakarovSD";
player addMagazine "8Rnd_9x18_MakarovSD";
player addMagazine "8Rnd_9x18_MakarovSD";
//add basic stuff
player addWeapon 'ItemCrowbar';
player addWeapon 'ItemKnife';
player addWeapon 'ItemToolbox';
reload player;
player selectWeapon "MakarovSD";
player setVehicleAmmo 1;
sleep 2;
titleText ["Class selected!", "PLAIN DOWN", 3];
titleFadeOut 1;
[] call respawn_handler;