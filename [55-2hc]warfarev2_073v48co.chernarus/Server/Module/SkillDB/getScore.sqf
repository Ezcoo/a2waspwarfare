/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID"];

_playerUID = _this select 0;

_totalScore = ["read", [_playerUID, "score", 1]] call _inidbi;

_totalScore