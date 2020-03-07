Private ["_boat", "_boat_group", "_reinforcement_team", "_start", "_town", "_units"];

_boat = (_this select 0) select 0;
_units = (_this select 0) select 1;
_boat_group = (_this select 0) select 2;
_reinforcement_team = _this select 1;
_town = _this select 2;

_start = time;

while {true} do {
	if (isNull _reinforcement_team) exitWith {};
	if (!alive _boat || _boat_group Call WFBE_CO_FNC_AreWaypointsComplete || !canMove _boat || ({alive _x} count units _boat_group) < 1 || time - _start > 360 || !alive driver _boat || !(_town getVariable "wfbe_active")) exitWith {};
	sleep 30;
};

//--- Premature death of the driver.
if (alive _boat && !isNull _reinforcement_team) then {
	{if (_x in crew _boat) then {deleteVehicle _x}} forEach _units;
	if ({alive _x} count units _reinforcement_team < 1) then {deleteGroup _reinforcement_team};
};

//--- Crew is alive, delete them.
{deleteVehicle _x} forEach (units _boat_group);
deleteGroup _boat_group;

//--- Just remove the boat if it's not toasted already.
if (alive _boat) then {deleteVehicle _boat};