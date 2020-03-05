/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID", "_playerTotalScore","_oldPlayerScore","_currentPlayerScore","_newPlayerScore","_player"];

_player = _this select 0;
_playerUID = getPlayerUID _player;
_oldPlayerScore = missionNamespace getVariable format ["WFBE_SCORE_UID_%1", getPlayerUID _x];
_currentPlayerScore = score _player;
_playerTotalScore = [_playerUID] call IniDB_GetScore;

_newPlayerScore = _playerTotalScore + (_currentPlayerScore - _oldplayerScore);

["WASP_playerSkills", _playerUID, "score", _newPlayerScore] call iniDB_write;