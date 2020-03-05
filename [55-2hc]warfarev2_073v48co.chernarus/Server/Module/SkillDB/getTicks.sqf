/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID"];

_playerUID = _this select 0;

_totalTicks = ["WASP_playerSkills", _playerUID, "ticks", "NUMBER"] call iniDB_read;

// Prevent zero divisor error in skill calculation
if (_totalTicks < 1) then {
    _totalTicks = 1;
};

_totalTicks