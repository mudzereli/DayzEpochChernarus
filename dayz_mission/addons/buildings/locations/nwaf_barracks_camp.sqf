private ["_structure","_vehicle"];

_structure = createVehicle ["LAND_Mil_Barracks_i", [4723.3726, 10754.428], [], 0, "CAN_COLLIDE"];
_structure setDir 64.49173;
_structure setPos [4723.3726, 10754.428];

_structure = createVehicle ["LAND_Mil_Barracks_i", [4710.604, 10748.435], [], 0, "CAN_COLLIDE"];
_structure setDir 62.612907;
_structure setPos [4710.604, 10748.435];

_structure = createVehicle ["MAP_Mil_Barracks_L", [4652.3472, 10710.342, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_structure setDir 56.595188;
_structure setPos [4652.3472, 10710.342, -6.1035156e-005];

_structure = createVehicle ["LAND_Mil_Barracks_i", [4696.5938, 10740.809, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
_structure setDir 59.112877;
_structure setPos [4696.5938, 10740.809, 9.1552734e-005];

_structure = createVehicle ["LAND_Mil_Barracks_i", [4695.1201, 10703.646, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_structure setDir -117.30161;
_structure setPos [4695.1201, 10703.646, -3.0517578e-005];

_structure = createVehicle ["LAND_Mil_Barracks_i", [4708.8325, 10712.961], [], 0, "CAN_COLLIDE"];
_structure setDir -122.18837;
_structure setPos [4708.8325, 10712.961];

_structure = createVehicle ["LAND_Mil_Barracks_i", [4724.3032, 10721, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_structure setDir -119.59373;
_structure setPos [4724.3032, 10721, -3.0517578e-005];

_structure = createVehicle ["LAND_A_GeneralStore_01a", [4750.2188, 10729.065, 0.00015258789], [], 0, "CAN_COLLIDE"];
_structure setDir 59.792034;
_structure setPos [4750.2188, 10729.065, 0.00015258789];

_structure = createVehicle ["USMC_WarfareBFieldhHospital", [4713.2471, 10643.939, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_structure setDir 52.786396;
_structure setPos [4713.2471, 10643.939, -3.0517578e-005];

if (random 1 < 0.33) then {
    _vehicle = createVehicle ["Mi17_Civilian", [4657.8726, 10754.547, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
    _vehicle setDir 54.96735;
    _vehicle setPos [4657.8726, 10754.547, 9.1552734e-005];
    _vehicle setVariable["Mission",1];
};

if (random 1 < 0.33) then {
    _vehicle = createVehicle ["UH1H_TK_GUE_EP1", [4758.7373, 10675.016, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
    _vehicle setPos [4758.7373, 10675.016, -6.1035156e-005];
    _vehicle setVariable["Mission",1];
};
