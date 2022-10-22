_location = _this select 0;
_sideID = _this select 1;
_side = (_sideID) Call WFBE_CO_FNC_GetSideFromID;

_team_job = "patrol";
_team_target = objNull;
_team_alive = false;

_town_reuse = missionNamespace getVariable "WFBE_C_PATROLS_TOWNS_LOCK";
_town_vehicle_lock_defender = if ((missionNamespace getVariable "WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER") > 0) then {true} else {false};
_towns_visited = [_location];

_group = [_location, _side] Call WFBE_SE_FNC_GetTownPatrol;

_team = objNull;
if (count _group > 0) then {
	_team_alive = true;
	_team = createGroup _side;

	_position = ([getPos _location, 50, 500] Call WFBE_CO_FNC_GetRandomPosition);
	_position = [_position, 50] Call WFBE_CO_FNC_GetEmptyPosition;
	_lock = if (_side == WFBE_DEFENDER) then {_town_vehicle_lock_defender} else {true};
	_retVal = [_group, _position, _side, _lock, _team] Call WFBE_CO_FNC_CreateTeam;
};

while {!WFBE_GameOver || _team_alive} do {

	_team_alive = if (count ((units _team) Call WFBE_CO_FNC_GetLiveUnits) == 0 || isNull _team) then {false} else {true};
	
	if(_team_job == "capture" && !WFBE_GameOver && _team_alive) then {
		if ((_team_target getVariable "sideID") == _sideID) then {
		//--- Captured, the team can move on.
		[_towns_visited, _team_target] Call WFBE_CO_FNC_ArrayPush;
		_team_target = objNull;
		_team_job = "patrol";

		//todo, rearm, repair, refuel.
		};
	};
	
	if(_team_job == "patrol" && !WFBE_GameOver && _team_alive)then{
		if(isNull _team_target) then{
			//--- Refresh the town list which can be visited.
			if (count _towns_visited > _town_reuse) then {
				_towns_visited = [_towns_visited, 0] Call WFBE_CO_FNC_ArrayRemoveIndex;
			};

			//--- Get the closest location which is available to the patrol while excluding previously visited towns.
			_team_target = [_location, towns - _towns_visited] Call WFBE_CO_FNC_GetClosestEntity;

			//--- Tell our patrol to move to the depot.
			[_team, getPos _team_target, 'MOVE', 25] Spawn WFBE_CO_FNC_WaypointSimple;
		};
		if(!isNull _team_target) then {
			if ((leader _team) distance _team_target < 200) then {
				_town_capturable = true;
				if ((_team_target getVariable "sideID") == _sideID && _town_capturable) then {
				//--- Town is friendly, don't bother.
				[_towns_visited, _team_target] Call WFBE_CO_FNC_ArrayPush;
				_team_target = objNull;
				} else {
					//--- Attempt to capture the town.
					_team_job = "capture";
				};
			};
		};
	};
	sleep 30;
};

_location setVariable ["wfbe_patrol_active", false];
_location setVariable ["wfbe_patrol_active_last", time];