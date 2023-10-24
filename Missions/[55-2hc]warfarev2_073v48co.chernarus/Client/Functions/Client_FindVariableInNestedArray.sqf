private ["_array", "_value", "_index"];

_array = _this select 0;
_value = _this select 1;

_index = 
	{
		if (_value in _x) exitWith {_forEachIndex};
	} forEach _array;
	
if (isNil "_index") then {-1} else {_index};