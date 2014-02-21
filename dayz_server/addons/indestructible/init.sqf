diag_log text "INDESTRUCTIBLE BASES: loading...";
[] spawn {
    private ["_count"];
    waitUntil { !(isNil "sm_done") };
    diag_log text "INDESTRUCTIBLE BASES: hooked...";
    _count = 0;
    {
        if (typeOf(_x) in DZ_INDESTRUCTIBLE_CLASSES) then {
            _x addEventHandler ["HandleDamage", {false}];
            _x enableSimulation false;
            _count = _count + 1;
        };
    } forEach PVDZE_serverObjectMonitor;
    diag_log text format["INDESTRUCTIBLE BASES: loaded %1 indestructible base items...",_count];
};