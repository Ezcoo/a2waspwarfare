/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID","_totalScore"];

_playerUID = _this select 0;

_totalScore = ["WASP_playerSkills", _playerUID, "score", "NUMBER"] call iniDB_read;


_totalScore;