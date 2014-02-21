/*
 * Should a toolbox be required to craft?
 * FORMAT : true/false 
 * DEFAULT: true
 */

DZ_VEHICLE_CRAFT_TOOLBOX = true;

/*
 * This table contains the recipes used to craft items
 * FORMAT: ["New_Vehicle_Class",[["Part_Class_1","Part_Class_1_Count],...]]
 */
 
DZ_VEHICLE_CRAFT_RECIPES = [
	["MMT_Civ"   ,[["PartWheel"   ,2],["PartGeneric",1]                                    ]],
	["TT650_Civ" ,[["PartWheel"   ,2],["PartGeneric",1],["PartFueltank",1],["PartEngine",1]]],
	["ATV_US_EP1",[["PartWheel"   ,4],["PartGeneric",1],["PartFueltank",1],["PartEngine",1]]],
	["CSJ_GyroC" ,[["PartFueltank",1],["PartVRotor" ,1],["PartGeneric" ,2],["PartEngine",1]]]
];