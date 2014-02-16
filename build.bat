mkdir build\dayz_epoch
xcopy /S /Y dayz_server\* build\dayz_epoch\*
mkdir build\missions\epoch.chernarus
xcopy /S /Y dayz_mission\* build\missions\epoch.chernarus\*
xcopy /S /Y ..\antihack\* build\dayz_epoch\addons\antihack\*