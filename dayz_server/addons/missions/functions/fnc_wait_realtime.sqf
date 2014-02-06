private ["_doneWaiting","_curTime","_timePassed","_waitTime","_checkInterval","_startTime"];

_waitTime      = _this select 0;
_checkInterval = _this select 1;

_doneWaiting = false;
_startTime   = diag_tickTime;
while {!_doneWaiting} do {
    sleep _checkInterval;
    _curTime    = diag_tickTime;
    _timePassed = _curTime - _startTime;
    if (_timePassed > _waitTime) then {
        _doneWaiting = true;
    };
};