private ["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal","_sleep","_miniSleep"];

_miniSleep = 0.01;
_mainSleep = 30;

["INFORMATION", "CountPlayerScores.sqf got execVMd!"] Call WFBE_CO_FNC_LogContent;

[_miniSleep, _mainSleep] spawn {

	_miniSleep = _this select 0;
	_mainSleep = _this select 1;

	["INFORMATION", "CountPlayerScores.sqf: Starting main loop..."] Call WFBE_CO_FNC_LogContent;

	while { true } do {

		uiSleep _mainSleep;

		{

			if (isPlayer _x) then {

				_playerScore = score _x;
				_playerPrevStats = ["RETRIEVE", getPlayerUID _x] call WFBE_SE_FNC_CallDatabase;
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

				_result = ["STORE", [getPlayerUID _x, _playerScoreDiff, side _x]] call WFBE_SE_FNC_CallDatabase;

			};

		} forEach allUnits;

	};

};


_sleep = 1;

[_sleep, _miniSleep] spawn {

	_sleep = _this select 0;
	_miniSleep = _this select 1;

	while { true } do {

		uiSleep _sleep;

		{

			if (isPlayer _x) then {
				missionNamespace setVariable [format ["WFBE_CO_CURRENT_SCORE_PLAYER_%1", getPlayerUID _x], score _x];
				uiSleep _miniSleep;
			};

		uiSleep _sleep;

		} forEach allUnits;

	};

};

_flushSleep = 5;

[_flushSleep] spawn {

	_flushSleep = _this select 0;
	_playersOnServer = [];

	while { true } do {

		_playersOnServer = [];

		uiSleep _flushSleep;

		{
			if (isPlayer _x) then {

				_playersOnServer set [count _playersOnServer, [getPlayerUID _x, side _x]];

			};

		} forEach allUnits;

		["SEND_PLAYERLIST", _playersOnServer] call WFBE_SE_FNC_CallDatabaseExtra;
	};
};