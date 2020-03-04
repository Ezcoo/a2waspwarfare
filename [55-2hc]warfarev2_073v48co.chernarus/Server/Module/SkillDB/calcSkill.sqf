/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID", "_playerTicks","_playerScore","_playerSkill"];

_playerUID = _this select 0;

_playerScore = [_playerUID] call IniDB_getScore;
_playerTicks = [_playerUID] call IniDB_getTicks;

_playerSkill = _playerScore / _playerTicks;

_playerSkill;