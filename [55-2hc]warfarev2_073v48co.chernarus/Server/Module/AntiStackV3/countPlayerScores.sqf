private["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal","_sleep"];

_sleep = if (count _this > 0) then {_this select 0} else {0.05};

{
	if (isPlayer _x && hasInterface) then {
		_playerScore = score _x;
		_playerPrevStats = [getPlayerUID _x, name _x] call WFBE_DB_GetPlayerStats;
		_playerPrevScoreTotal = _playerPrevStats select 0;
		_playerPrevTimePlayedTotal = (_playerPrevStats select 1) + 5;

		_oldScore = missionNamespace getVariable format ["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x];

		if (isNil "_oldScore") then {
			_oldScore = 0;
		};

		missionNamespace setVariable format [["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x], _playerScore];

		_playerScoreDiff = _playerScore - _oldScore;
		_playerNewScore = _playerPrevScore + _playerScoreDiff;

		_result = [getPlayerUID _x, name _x, _playerNewScore + _playerPrevScoreTotal, _playerPrevTimePlayed + 5] call WFBE_DB_UpdatePlayerStats;
	};

} forEach allUnits;