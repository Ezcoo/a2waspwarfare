/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID","_playerTotalTicks","_newPlayerTicks","_player"];

_playerUID = _this select 0;
_playerTotalTicks = [_playerUID] call IniDB_getTicks;

_playerTicksNew = _playerTotalTicks + 1;

["write", [_playerUID, "ticks", _playerTicksNew]] call _inidbi;