private ["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal","_sleep","_miniSleep","_hasConnectedAtLaunch","_flushSleep","_initialSleep"];


_sleep = _this select 0;
_miniSleep = _this select 1;

while { true } do {
	uiSleep _sleep;
	{
		if (isPlayer _x) then {
			missionNamespace setVariable [format ["WFBE_CO_CURRENT_SCORE_PLAYER_%1", getPlayerUID _x], score _x];
		};
	} forEach allUnits;
};