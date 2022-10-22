private ["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal","_sleep"];

_sleep = 0.02;
_mainSleep = 60;

while {!WFBE_GameOver} do {

	uiSleep _mainSleep;

	{
		if (isPlayer _x && hasInterface) then {
			_playerScore = score _x;
			_playerPrevStats = ["Retrieve", getPlayerUID _x] call WFBE_SE_FNC_CallDatabase;
			_playerPrevScoreTotal = _playerPrevStats select 0;
			_playerPrevTimePlayedTotal = _playerPrevStats select 1;

			["INFORMATION", Format["CountPlayerScores.sqf: _playerScore: %1, _playerPrevStats: %2, _playerPrevScoreTotal: %3, _playerPrevTimePlayedTotal: %4.", _playerScore, _playerPrevStats, _playerPrevScoreTotal, _playerPrevTimePlayedTotal]] Call WFBE_CO_FNC_LogContent;

			_oldScore = missionNamespace getVariable format ["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x];

			if (isNil "_oldScore") then {
				_oldScore = 0;
			};

			missionNamespace setVariable format [["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x], _playerScore];

			_playerScoreDiff = _playerScore - _oldScore;
			_playerNewScore = _playerPrevScoreTotal + _playerScoreDiff;

			["INFORMATION", Format["CountPlayerScores.sqf: Calling database: STORE: player UID: %1, _playerScoreDiff: %2", getPlayerUID _x, _playerScoreDiff]] Call WFBE_CO_FNC_LogContent;
			_result = ["Store", format ["%1,%2", getPlayerUID _x, _playerScoreDiff]] call WFBE_SE_FNC_CallDatabase;
			["INFORMATION", "Called database!"] Call WFBE_CO_FNC_LogContent;
		};

		uiSleep _sleep;

	} forEach allUnits;

};