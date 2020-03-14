/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID", "_playerTotalScore","_oldPlayerScore","_currentPlayerScore","_newPlayerScore","_player","_scoreDifference"];

_player = _this select 0;
_playerUID = getPlayerUID _player;
_oldPlayerScore = missionNamespace getVariable format ["WFBE_OLD_SCORE_UID_%1", _playerUID];
_currentPlayerScore = score _player;
_playerTotalScore = [_playerUID] call IniDB_GetScore;

_scoreDifference = _currentPlayerScore - _oldPlayerScore;

if (_scoreDifference < -5) then {
    _scoreDifference = 0;
};

_newPlayerScore = _playerTotalScore + _scoreDifference;


["write", [_playerUID, "score", _newPlayerScore]] call _inidbi;