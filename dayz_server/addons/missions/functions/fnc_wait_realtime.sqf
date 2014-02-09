private ["_waitTime","_checkInterval","_startTime"];

_waitTime      = _this select 0;
_checkInterval = _this select 1;

_startTime = diag_tickTime;
while {(diag_tickTime - _startTime) < _waitTime } do {
    sleep _checkInterval;
};