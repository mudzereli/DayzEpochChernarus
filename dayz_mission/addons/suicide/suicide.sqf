private ["_secondary","_position"];
canAbort = true;
_position = position player;
_secondary = currentWeapon player;
cutText [format[DZ_SUICIDE_MESSAGE_1], "PLAIN DOWN"];
sleep (DZ_SUICIDE_CANCEL_TIME / 3);
cutText [format[DZ_SUICIDE_MESSAGE_2], "PLAIN DOWN"];
sleep (DZ_SUICIDE_CANCEL_TIME / 3);
cutText [format[DZ_SUICIDE_MESSAGE_3], "PLAIN DOWN"];
sleep (DZ_SUICIDE_CANCEL_TIME / 3);
if (position player select 0 == _position select 0 && position player select 1 == _position select 1) then {
    cutText [format[DZ_SUICIDE_MESSAGE_4], "PLAIN DOWN"];
    canAbort = false;
    player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
    sleep 8.4;
    player fire _secondary;
    sleep 1;
    player SetDamage 1;
} else {
    cutText [format[DZ_SUICIDE_CANCEL_MESSAGE], "PLAIN DOWN"];
};