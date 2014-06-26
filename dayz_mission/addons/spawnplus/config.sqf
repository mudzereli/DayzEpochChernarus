/* This table maps donators to their spawn points */
DZ_SPAWNPLUS_DONATOR_TABLE = 
[
	/* 	PLAYERNAME      PLAYERUID    SPAWN POINT	 LOADOUT      SKIN     */
	[	"Example",     "000000000",      [[0,0,0]],         true,        true      ]
];

/* should players be able to choose a class or not? */
DZ_SPAWNPLUS_PICK_CLASS = true;

/* should all players be able to choose a skin? */
DZ_SPAWNPLUS_ALL_SKINS = true;

/* what vehicle should players spawn with? default = "NONE" */
DZ_RESPAWN_VEHICLE_CLASS = "MMT_Civ";

/* what classes should be loaded? -- currently only supports 9 classes */
DZ_SPAWNPLUS_CLASSES = [
    /* NAME        FILE         */
    ["Woodsman"  ,"woodsman.sqf"],
    ["Doctor"    ,"doctor.sqf"  ],
    ["Mechanic"  ,"mechanic.sqf"],
    ["Chef"      ,"chef.sqf"    ],
    ["Commando"  ,"commando.sqf"],
    ["Crafter"   ,"crafter.sqf" ]
];