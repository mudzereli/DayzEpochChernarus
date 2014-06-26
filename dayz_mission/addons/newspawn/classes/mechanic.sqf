DZ_NEWSPAWN_CREATION_STAGE = 2;
titleText ["Selecting class...", "PLAIN DOWN", 3];
//remove items
removeAllWeapons player;
removeAllItems   player;
removeBackpack   player;
player addBackpack "DZ_Patrol_Pack_EP1";
if (DZ_NEWSPAWN_DONATOR_LOADOUT) then {
	//add backpack
	player addBackpack "DZ_ALICE_Pack_EP1";
	//add inventory
	player addMagazine "ItemTankTrap";
	player addMagazine "ItemWire";
	//add tools
	player addWeapon "ItemCrowbar";
	player addWeapon "ItemWatch";
	//add primary
	player addWeapon   "MP5A5";
	player addMagazine "30rnd_9x19_MP5";
	player addMagazine "30rnd_9x19_MP5";
	player addMagazine "30rnd_9x19_MP5";
};
//add default stuff
player addMagazine "ItemBandage";
player addMagazine "ItemPainkiller";
player addWeapon   "ItemMap";
player addWeapon   "ItemFlashlight";
//add secondary
player addWeapon   "Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
//add basic stuff
player addMagazine 'ItemJerryCan';
player addMagazine 'PartWheel';
player addWeapon   'ItemToolbox';
reload player;
player selectWeapon "Makarov";
player setVehicleAmmo 1;
sleep 2;
titleText ["Class selected!", "PLAIN DOWN", 3];
titleFadeOut 1;
[] call respawn_handler;