Private["_friendlyTowns","_object","_nearest","_side"];

_object = _this select 0;
_side = _this select 1;
_cvar = if (count _this > 2) then {_this select 2} else {""};

_friendlyTowns = (_side) Call GetSideTowns;
_nearest = objNull;

if (count _friendlyTowns > 0) then {
	_nearests = [_object,_friendlyTowns] Call SortByDistance;
	_nearest = _nearests select 0;
};

_nearest