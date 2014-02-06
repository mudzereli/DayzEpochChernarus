private["_crate"];

_crate = _this select 0;

clearWeaponCargoGlobal   _crate;
clearMagazineCargoGlobal _crate;

_crate addMagazineCargoGlobal ["ItemBandage", 20];

_crate addMagazineCargoGlobal ["ItemMorphine", 15];

_crate addMagazineCargoGlobal ["ItemEpinephrine", 10];

_crate addMagazineCargoGlobal ["ItemPainkiller", 20];

_crate addMagazineCargoGlobal ["ItemWaterbottle", 15];

_crate addMagazineCargoGlobal ["FoodCanBakedBeans", 30];

_crate addMagazineCargoGlobal ["ItemAntibiotic", 5];

_crate addMagazineCargoGlobal ["ItemBloodbag", 15];

_crate addMagazineCargoGlobal ["SmokeShellRed", 10];

_crate addMagazineCargoGlobal [DZ_MISSIONS_BUILDING call BIS_fnc_selectRandom, 1];