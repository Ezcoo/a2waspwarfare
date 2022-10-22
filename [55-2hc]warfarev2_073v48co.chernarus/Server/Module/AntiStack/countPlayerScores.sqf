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
			_playerPrevTimePlayedTotal = (_playerPrevStats select 1) + 5;

			_oldScore = missionNamespace getVariable format ["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x];

			if (isNil "_oldScore") then {
				_oldScore = 0;
			};

			missionNamespace setVariable format [["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x], _playerScore];

			_playerScoreDiff = _playerScore - _oldScore;
			_playerNewScore = _playerPrevScoreTotal + _playerScoreDiff;

			_result = ["Store", format ["%1,%2", getPlayerUID _x, _playerScoreDiff]] call WFBE_SE_FNC_CallDatabase;
		};

		uiSleep _sleep;

	} forEach allUnits;

};