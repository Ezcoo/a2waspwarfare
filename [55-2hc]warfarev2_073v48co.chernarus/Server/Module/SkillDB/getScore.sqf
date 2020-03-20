/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID"];

_playerUID = _this select 0;

_totalScore = ["WASP_playerSkills", _playerUID, "score", "NUMBER"] call iniDB_read;

waitUntil {!isNil _totalScore};

_totalScore;