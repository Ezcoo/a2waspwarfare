/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID","_totalTicks"];

_playerUID = _this select 0;

_totalTicks = ["read", [_playerUID, "ticks", 1]] call _inidbi;

// Prevent zero divisor error in skill calculation
if (_totalTicks < 1) then {
    _totalTicks = 1;
};

_totalTicks