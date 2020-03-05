/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID","_playerTotalTicks","_newPlayerTicks","_player"];

_playerUID = _this select 0;
_playerTotalTicks = [_playerUID] call IniDB_getTicks;

_playerTicksNew = _playerTotalTicks + 1;

["WASP_playerSkills", _playerUID, "ticks", _playerTicksNew] call iniDB_write;