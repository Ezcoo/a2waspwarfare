Private ["_start", "_team_transport", "_vehicle"];

_team_transport = _this select 0;
_vehicles = _this select 1;

sleep random 2;

_start = time;

while {true} do {
	if (isNull _team_transport) exitWith {};
	if (_team_transport Call WFBE_CO_FNC_AreWaypointsComplete || ({alive _x} count units _team_transport) < 1 || time - _start > 1440) exitWith {};
	sleep 30;
};

//--- Crew is alive, delete them.
if !(isNull _team_transport) then {
	{deleteVehicle _x} forEach (units _team_transport);
	deleteGroup _team_transport;
};

//--- Just remove the vehicles if they're not toasted already.
{if (alive _x) then {deleteVehicle _x}} forEach _vehicles;