call %~dp0clean.bat
xcopy /S /Y dayz_server\* build\vilayercodecustom\dayz_epoch\*
xcopy /S /Y dayz_mission\* build\vilayercodecustom\missions\epoch.chernarus\*
xcopy /S /Y ..\antihack\* build\vilayercodecustom\dayz_epoch\addons\antihack\*