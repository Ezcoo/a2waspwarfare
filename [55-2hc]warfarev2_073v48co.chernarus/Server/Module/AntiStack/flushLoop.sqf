private ["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal","_sleep","_miniSleep","_hasConnectedAtLaunch","_flushSleep","_initialSleep"];

_flushSleep = _this select 0;
_initialSleep = _this select 1;
_miniSleep = _this select 2;

_playersOnServer = [];

uiSleep _initialSleep;

while { !WFBE_GameOver } do {
	
	_playersOnServer = [];
	{
		if (isPlayer _x) then {
			uiSleep _miniSleep;
			
			_confirmedSide = missionNamespace getVariable Format["WFBE_JIP_USER%1_TEAM_JOINED", getPlayerUID _x];
			if (!(isNil "_confirmedSide")) then {
				_playersOnServer set [count _playersOnServer, [getPlayerUID _x, _confirmedSide]];
			} else {
				_hasConnectedAtLaunch = missionNamespace getVariable format ["WFBE_PLAYER_%1_CONNECTED_AT_LAUNCH", getPlayerUID _x];
				if (!(isNil "_hasConnectedAtLaunch")) then {
					// diag_log format ["UID: %1 _hasConnectedAtLaunch: %2", getPlayerUID _x, _hasConnectedAtLaunch];
					_playersOnServer set [count _playersOnServer, [getPlayerUID _x, side _x]];
				};
			};
		};
	} forEach allUnits;
	// ["TEST", format ["CountPlayerScores.sqf: DEBUG: Contents of _playersOnServer ('SEND_PLAYERLIST'): %1", _playersOnServer]] Call WFBE_CO_FNC_LogContent;
	["SEND_PLAYERLIST", _playersOnServer] call WFBE_SE_FNC_CallDatabaseSendPlayerList;
	uiSleep _flushSleep;

};