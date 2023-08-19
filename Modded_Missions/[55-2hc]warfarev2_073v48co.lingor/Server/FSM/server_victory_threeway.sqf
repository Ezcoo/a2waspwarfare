private["_victory","_total","_side","_hq","_structures","_towns","_factories"];

_victory = missionNamespace getVariable "WFBE_C_VICTORY_THREEWAY";
_total = totalTowns;
_innerTimer = 0;
_loopTimer = 60;

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
			};
		} forEach WFBE_PRESENTSIDES - [WFBE_DEFENDER];
	};

	if(_innerTimer >= 300)then{
		_innerTimer = 0;
	};
	sleep _loopTimer;
	_innerTimer = _innerTimer + _loopTimer;
};
sleep 5;
diag_log Format["[WFBE (OUTRO)][frameno:%1 | ticktime:%2] server_victory_threeway.sqf: Mission end - [Done]",diag_frameno,diag_tickTime];
failMission "END1";