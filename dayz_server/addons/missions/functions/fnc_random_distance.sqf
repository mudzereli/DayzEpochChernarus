private["_startCoords","_minDistance","_distance","_newCoords"];

_startCoords = _this select 0;
_minDistance = _this select 1;

_distance = _minDistance + floor(random (_minDistance * 2));
if (floor(random 2) == 0) then {
    _distance = _distance * -1;
};
if (floor(random 2) == 0) then {
    _newCoords = [(_startCoords select 0) + _distance,(_startCoords select 1),0];
} else {
    _newCoords = [(_startCoords select 0),(_startCoords select 1) + _distance,0];
};
_newCoords;