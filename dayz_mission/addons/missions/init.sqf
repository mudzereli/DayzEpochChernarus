if (isDedicated) exitWith {};
diag_log text "MISSION SYSTEM: initializing client side";
PVDZ_MISSION_MAJOR_STATUS = [0,[0,0,0]];
PVDZ_MISSION_MINOR_STATUS = [0,[0,0,0]];
diag_log text "MISSION SYSTEM: loading major mission public variable event handler";
"PVDZ_MISSION_MAJOR_STATUS" addPublicVariableEventHandler {
	diag_log text format["MISSION SYSTEM: PV update: %1",_this select 0];
	deleteMarker "MARKER_MAJOR";
	switch ((_this select 1) select 0) do {
		case 1: { 
			diag_log text "MISSION SYSTEM: major mission in progress - creating marker...";
			DZ_MARKER_MAJOR = createMarker ["MARKER_MAJOR", (_this select 1) select 1];
			DZ_MARKER_MAJOR setMarkerColor "ColorGreen";
			DZ_MARKER_MAJOR setMarkerShape "ELLIPSE";
			DZ_MARKER_MAJOR setMarkerBrush "Solid";
			DZ_MARKER_MAJOR setMarkerSize [175,175];
		};
		case 2: { 
			diag_log text "MISSION SYSTEM: major mission in completed phase - creating marker...";
			DZ_MARKER_MAJOR = createMarker ["MARKER_MAJOR", (_this select 1) select 1];
			DZ_MARKER_MAJOR setMarkerColor "ColorGreen";
			DZ_MARKER_MAJOR setMarkerShape "ELLIPSE";
			DZ_MARKER_MAJOR setMarkerBrush "DiagGrid";
			DZ_MARKER_MAJOR setMarkerSize [175,175];
		};
	};
};
diag_log text "MISSION SYSTEM: loading minor mission public variable event handler";
"PVDZ_MISSION_MINOR_STATUS" addPublicVariableEventHandler {
	diag_log text format["MISSION SYSTEM: PV update: %1",_this select 0];
	deleteMarker "MARKER_MINOR";
	switch ((_this select 1) select 0) do {
		case 1: { 
			diag_log text "MISSION SYSTEM: minor mission in progress - creating marker...";
			DZ_MARKER_MINOR = createMarker["MARKER_MINOR", (_this select 1) select 1];
			DZ_MARKER_MINOR setMarkerColor "ColorRed";
			DZ_MARKER_MINOR setMarkerShape "ELLIPSE";
			DZ_MARKER_MINOR setMarkerBrush "Solid";
			DZ_MARKER_MINOR setMarkerSize [100,100];
		};
		case 2: { 
			diag_log text "MISSION SYSTEM: minor mission in completed phase - creating marker...";
			DZ_MARKER_MINOR = createMarker["MARKER_MINOR", (_this select 1) select 1];
			DZ_MARKER_MINOR setMarkerColor "ColorRed";
			DZ_MARKER_MINOR setMarkerShape "ELLIPSE";
			DZ_MARKER_MINOR setMarkerBrush "DiagGrid";
			DZ_MARKER_MINOR setMarkerSize [100,100];
		};
	};
};