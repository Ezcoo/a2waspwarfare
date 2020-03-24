/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID", "_playerTotalScore","_oldPlayerScore","_currentPlayerScore","_newPlayerScore","_player","_scoreDifference"];

_player = _this select 0;
_playerUID = getPlayerUID _player;

_oldPlayerScore = missionNamespace getVariable format ["WFBE_OLD_SCORE_UID_%1", _playerUID];
if (isNil "_oldPlayerScore") then {
    missionNamespace setVariable [format ["WFBE_OLD_SCORE_UID_%1", _playerUID], 0];
    _oldPlayerScore = missionNamespace getVariable format ["WFBE_OLD_SCORE_UID_%1", _playerUID];
};

_currentPlayerScore = score _player;
_playerTotalScore = [_playerUID] call IniDB_GetScore;

_scoreDifference = _currentPlayerScore - _oldPlayerScore;

if (_scoreDifference < -5) then {
    _scoreDifference = 0;
};

_newPlayerScore = _playerTotalScore + _scoreDifference;


[] spawn {
    if(!(["WASP_playerSkills", _playerUID, "score", _newPlayerScore] call iniDB_write) ) then {
        ["WARNING", Format["AddTick.sqf: Failed to save score [%1] for player [%2] in database.",_newPlayerScore,_playerUID]] Call WFBE_CO_FNC_LogContent;
    };
};