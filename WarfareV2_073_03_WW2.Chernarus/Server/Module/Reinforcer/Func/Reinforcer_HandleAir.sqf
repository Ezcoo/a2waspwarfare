Private ["_chopper", "_chopper_group", "_reinforcement_team", "_start", "_town", "_units"];

_chopper = (_this select 0) select 0;
_units = (_this select 0) select 1;
_chopper_group = (_this select 0) select 2;
_reinforcement_team = _this select 1;
_town = _this select 2;

_crew_original = crew _chopper - _units;

//--- Prevent AI paratroopers from swiming around and place them on the coast if needed.
_poolclosed = {
	while {alive _this && position _this select 2 > 5} do {sleep 2};
	
	if (surfaceIsWater position _this) then { //--- You had one job!
		{
			if !(surfaceIsWater(_x select 0)) exitWith {_this setPos (_x select 0)};
		} forEach (selectBestPlaces [position _this, 250, "(1 + meadow + hills + houses) * (1 - sea)", 8, 3]);
	};
};

while {true} do {
	if (isNull _reinforcement_team || isNull _reinforcement_team) exitWith {};
	if (!alive _chopper || _chopper_group Call WFBE_CO_FNC_AreWaypointsComplete || !canMove _chopper || ({alive _x} count units _chopper_group) < 1 || !alive driver _chopper || !(_town getVariable "wfbe_active") || !isNil{_chopper_group getVariable "reinforcer_bail"}) exitWith {};
	if (waypointPosition[_chopper_group, currentWaypoint _chopper_group] distance [position _chopper select 0, position _chopper select 1, 0] < 400 + random 50) exitWith {};
	
	sleep 1;
};

//--- Different scenarios.
if (_town getVariable "wfbe_active") then {
	_chopper_group setVariable ["reinforcer_bail", true];
	if (alive _chopper && !isNull _reinforcement_team && !isNull _reinforcement_team) then {
	
		//--- Chopper can still run.
		if (canMove _chopper && alive driver _chopper) then {
			//--- We still got living units right?
			if (({alive _x} count _units) > 0) then {
				//--- Need proper surface.
				_start = time;
				while {surfaceIsWater getPos _chopper && time - _start < 30} do {sleep 0.5};
			
				//--- Green light!
				{
					if (alive _x) then {
						unassignVehicle _x;
						_x action ["EJECT", _chopper];
						_x Spawn _poolclosed;
						sleep 0.85;
					};
				} forEach _units;
				
				while {true} do {
					if (isNull _reinforcement_team || isNull _reinforcement_team) exitWith {};
					if (!alive _chopper || _chopper_group Call WFBE_CO_FNC_AreWaypointsComplete || !canMove _chopper || ({alive _x} count units _chopper_group) < 1 || !alive driver _chopper || !(_town getVariable "wfbe_active")) exitWith {};
					
					sleep 5;
				};
			};
		} else {
			//--- Cannot move!!
			while {surfaceIsWater getPos _chopper && getPos _chopper select 2 > 50} do {sleep 0.4};
			
			//--- Everyone bail! Panic!
			if (getPos _chopper select 2 > 50) then {
				{
					if (alive _x) then {
						unassignVehicle _x;
						_x action ["EJECT", _chopper];
						_x Spawn _poolclosed;
						sleep 0.3;
					};
				} forEach _units;
			};
		};
	};
};

if (alive _chopper) then {
	if (canMove _chopper) then {
		deleteVehicle _chopper
	} else {
		waitUntil {sleep 0.5; !alive _chopper || position _chopper select 2 < 5};
		sleep 10;
		if (alive _chopper) then {deleteVehicle _chopper};
	};
};

if !(isNull _chopper_group) then {
	{
		if (vehicle _x != _x && alive _x) then {deleteVehicle vehicle _x};
		deleteVehicle _x;
	} forEach (_crew_original);
	sleep 2;
	if !(isNull _chopper_group) then {
		if (({alive _x} count units _chopper_group) < 1) then {deleteGroup _chopper_group};
	};
};