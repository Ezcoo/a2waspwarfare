Private["_location","_team","_sideID","_focus","_lastSV","_startSV","_mode","_lastMode","_patrol_range","_defense_range"];

_location = _this select 0;
_team = _this select 1;
_sideID = _this select 2;
_focus = if (count _this > 3) then {_this select 3} else {objNull};

_lastSV = _location getVariable 'supplyValue';
_startSV = _location getVariable 'startingSupplyValue';
_mode = "patrol";
_lastMode = "nil";

_patrol_range = missionNamespace getVariable 'WFBE_C_TOWNS_PATROL_RANGE';
_defense_range = missionNamespace getVariable 'WFBE_C_TOWNS_DEFENSE_RANGE';
_aliveTeam = if (count ((units _team) Call WFBE_CO_FNC_GetLiveUnits) == 0 || isNull _team) then {false} else {true};


while {!WFBE_GameOver || _aliveTeam} do {
	_aliveTeam = if (count ((units _team) Call WFBE_CO_FNC_GetLiveUnits) == 0 || isNull _team) then {false} else {true};

	_currentSV = _location getVariable 'supplyValue';
	if (_currentSV < _lastSV || _currentSV < _startSV || _sideID != (_location getVariable 'sideID')) then {
		_mode = "defense";
	} else {
		_mode = "patrol";
	};

	_lastSV = _currentSV;
	
	if(_aliveTeam && _mode != _lastMode && !WFBE_GameOver) then {
		_lastMode = _mode;

		if (_mode == "patrol") then {
			if (isNull _focus) then {
				[_team,_location,_patrol_range] Spawn WFBE_CO_FNC_WaypointPatrolTown;
			} else {
				[_team,_focus,_patrol_range/4] Spawn WFBE_CO_FNC_WaypointPatrol;
			};
		} else {
			[_team,getPos _location,'SAD',_defense_range] Spawn WFBE_CO_FNC_WaypointSimple;
		};
	};
	sleep 30;
};
