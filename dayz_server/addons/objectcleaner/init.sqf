diag_log text "CLEANER: loading config";
call compile preprocessFileLineNumbers "z\addons\dayz_server\addons\objectcleaner\config.sqf";
diag_log text "CLEANER: config loaded ... initializing object cleaner";
execVM "z\addons\dayz_server\addons\objectcleaner\objectcleaner.sqf";