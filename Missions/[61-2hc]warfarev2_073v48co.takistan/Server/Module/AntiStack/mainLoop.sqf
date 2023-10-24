private ["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal","_sleep","_miniSleep","_hasConnectedAtLaunch","_flushSleep","_initialSleep"];


_miniSleep = _this select 0;
_mainSleep = _this select 1;

["INFORMATION", "MainLoop.sqf: Starting main loop..."] Call WFBE_CO_FNC_LogContent;

while { !WFBE_GameOver } do {
	uiSleep _mainSleep;
	{
		if (isPlayer _x) then {
			_playerScore = score _x;
			_playerPrevStats = ["RETRIEVE", getPlayerUID _x] call WFBE_SE_FNC_CallDatabaseRetrieve;
			_playerPrevScoreTotal = _playerPrevStats select 0;
			_playerPrevTimePlayedTotal = _playerPrevStats select 1;
			_oldScore = missionNamespace getVariable format ["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x];
			if (isNil "_oldScore") then {
				_oldScore = 0;
			};
			missionNamespace setVariable [format["WFBE_CO_OLD_SCORE_PLAYER_%1", getPlayerUID _x], _playerScore];
			_playerScoreDiff = _playerScore - _oldScore;
			_playerNewScore = _playerPrevScoreTotal + _playerScoreDiff;
			uiSleep _miniSleep;
			_result = ["STORE", [getPlayerUID _x, _playerScoreDiff]] call WFBE_SE_FNC_CallDatabaseStore;
			uiSleep _miniSleep;
		};
	} forEach allUnits;
};