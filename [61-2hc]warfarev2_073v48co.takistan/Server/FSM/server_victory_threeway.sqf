private["_victory","_total","_side","_hq","_structures","_towns","_factories"];

_victory = missionNamespace getVariable "WFBE_C_VICTORY_THREEWAY";
_total = totalTowns;
_innerTimer = 0;
_loopTimer = 80;
_miniSleep = 0.05;

while {!gameOver} do {

	if (!gameOver && _victory == 0) then {
		{
			_side = _x;
			_hq = (_x) Call WFBE_CO_FNC_GetSideHQ;
			_structures = (_x) Call WFBE_CO_FNC_GetSideStructures;
			_towns = (_x) Call GetTownsHeld;
	
			_factories = 0;
			{
				_factories = _factories + count([_side,missionNamespace getVariable Format ["WFBE_%1%2TYPE",_side,_x], _structures] Call GetFactories);
			} forEach ["BARRACKS","LIGHT","HEAVY","AIRCRAFT"];

			if (!(alive _hq)  && _factories == 0 || _towns == _total && !WFBE_GameOver) then {
				[nil, "HandleSpecial", ["endgame", (_x) Call WFBE_CO_FNC_GetSideID]] Call 	WFBE_CO_FNC_SendToClients;
				WF_Logic setVariable ["WF_Winner", _x];
				gameOver = true;
				WFBE_GameOver = true;

				_side = west;

				if (_x == west) then {
				    _side = east;
				};

				[_side] call WFBE_CO_FNC_LogGameEnd;
				
			};
		} forEach WFBE_PRESENTSIDES - [WFBE_DEFENDER];
	};

	sleep _loopTimer;
	_innerTimer = _innerTimer + _loopTimer;
};

//--- Save the players' stats to database.
{
	
	if (isPlayer _x) then {
		_uid = getPlayerUID _x;
		_name = name _x;
		_playerScore = missionNamespace getVariable format ["WFBE_CO_CURRENT_SCORE_PLAYER_%1", _uid];
		
		if (isNil "_playerScore") then {
			_playerScore = 0;
			["ERROR", Format ["Server_Victory_Threeway.sqf: Player [%1] [%2] has no score to be saved upon match end. This can be caused by immediate disconnection from the match after joining, or it can be something fishy. Or the player just joined when the match ended.", _name, _uid]] Call WFBE_CO_FNC_LogContent;
		};
		_oldScore = missionNamespace getVariable format ["WFBE_CO_OLD_SCORE_PLAYER_%1", _uid];
		
		if (isNil "_oldScore") then {
			_oldScore = 0;
		};
		missionNamespace setVariable [format["WFBE_CO_OLD_SCORE_PLAYER_%1", _uid], _playerScore];
		_playerScoreDiff = _playerScore - _oldScore;
		_result = ["STORE", [_uid, _playerScoreDiff]] call WFBE_SE_FNC_CallDatabaseStore;
		sleep _miniSleep;
		
	};

} forEach allUnits;

["FLUSH_PLAYERLIST"] call WFBE_SE_FNC_CallDatabaseFlushPlayerList;

// 0 = NONE
// 1 = CHERNARUS
// 2 = TAKISTAN
["SET_MAP", 0] call WFBE_SE_FNC_CallDatabaseSetMap;

sleep 5;
diag_log Format["[WFBE (OUTRO)][frameno:%1 | ticktime:%2] server_victory_threeway.sqf: Mission end - [Done]",diag_frameno,diag_tickTime];
failMission "END1";