Private ["_team_transport", "_vehicle"];

_team_transport = _this select 0;
_vehicle = _this select 1;

while {true} do {
	if (isNull _vehicle || isNull _team_transport) exitWith {};
	if (!alive _vehicle || !canMove _vehicle || !(driver _vehicle in units _team_transport)) exitWith {};
	sleep 30;
};

if (alive _vehicle) then {
	waitUntil {speed _vehicle < 15};
	{unassignVehicle _x; _x action ["EJECT", _vehicle];	sleep 1} forEach (crew _vehicle);
	deleteVehicle _vehicle;
};