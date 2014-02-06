while {true} do {
    diag_log text "MISSION SYSTEM: refreshing mission marker public variables...";
    publicVariable "PVDZ_MISSION_MINOR_STATUS";
    publicVariable "PVDZ_MISSION_MAJOR_STATUS";
    sleep 10;
};