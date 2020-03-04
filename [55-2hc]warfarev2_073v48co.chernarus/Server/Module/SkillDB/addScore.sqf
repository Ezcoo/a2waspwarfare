/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID", "_playerScore"];

_playerUID = this select 0;
_playerScore = missionNamespace getVariable format["WFBE_SCORE_UID_%1", _playerUID];

if (["read", ["playerScores", _playerUID]] call _inidbi)

if (["write", ["playerScores", _playerUID]])