DZ_NEWSPAWN_CREATION_STAGE = 2;
titleText ["Selecting class...", "PLAIN DOWN", 3];
//remove items
removeAllWeapons player;
removeAllItems   player;
player addBackpack "DZ_Patrol_Pack_EP1";
if (DZ_NEWSPAWN_DONATOR_LOADOUT) then {
    removeBackpack   player;
	//add backpack
	player addBackpack "DZ_ALICE_Pack_EP1";
	//add inventory
	player addMagazine "ItemBloodbag";
	player addMagazine "ItemPainkiller";
	//add tools
	player addWeapon "ItemMatchbox_DZE";
	player addWeapon "ItemKnife";
	//add primary
	player addWeapon   "MR43";
	player addMagazine "2Rnd_shotgun_74Slug";
	player addMagazine "2Rnd_shotgun_74Slug";
	player addMagazine "2Rnd_shotgun_74Slug";
};
//add default stuff
player addMagazine "ItemBandage";
player addMagazine "ItemPainkiller";
player addWeapon   "ItemMap";
player addWeapon   "ItemFlashlight";
//add secondary
player addWeapon   "M9";
player addMagazine "15Rnd_9x19_M9";
player addMagazine "15Rnd_9x19_M9";
player addMagazine "15Rnd_9x19_M9";
//add basic
player addMagazine 'ItemBandage';
player addMagazine 'ItemBloodbag';
player addMagazine 'ItemMorphine';
reload player;
player selectWeapon "M9";
player setVehicleAmmo 1;
sleep 2;
titleText ["Class selected!", "PLAIN DOWN", 3];
titleFadeOut 1;
[] call respawn_handler;