Private["_enemyTowns","_object","_nearest","_side"];

_object = _this select 0;
_side = _this select 1;
_cvar = if (count _this > 2) then {_this select 2} else {""};

_enemyTowns = towns - ((_side) Call GetSideTowns);
_nearest = objNull;

if (count _enemyTowns > 0) then {

	// Marty : debugging Common_SortByDistance.sqf
	diag_log format["6. DEBUG Common_SortByDistance.sqf CALLED BY Common_GetClosestLocationBySide.sqf"]; 

	_nearests = [_object,_enemyTowns] Call SortByDistance;
	if (_cvar != "") then {
		for '_i' from 0 to count(_nearests)-1 do {
			if ((_nearests select _i) getVariable _cvar) exitWith {_nearest = (_nearests select _i)};
		};
	} else {
		_nearest = _nearests select 0;
	}
};

_nearest