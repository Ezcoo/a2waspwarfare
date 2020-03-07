Private ["_reinforcement_team", "_side", "_town", "_vehicles"];

_side = _this select 0;
_reinforcement_team = _this select 1;
_town = _this select 2;
_vehicles = if (count _this > 3) then {_this select 3} else {[]};

missionNamespace setVariable [Format ["REINFORCER_ACTIVE_%1", _side], (missionNamespace getVariable Format ["REINFORCER_ACTIVE_%1", _side]) + 1];
_town setVariable ["wfbe_reinforcer_count", if !(isNil {_town getVariable "wfbe_reinforcer_count"}) then {(_town getVariable "wfbe_reinforcer_count") + 1} else {1}];

//--- Wait until our team is complete or not.
while {true} do {
	sleep 15;
	
	if (isNull _reinforcement_team) exitWith {};
	if (({alive _x} count units _reinforcement_team) < 1 || _reinforcement_team Call WFBE_CO_FNC_AreWaypointsComplete || !(_town getVariable "wfbe_active")) exitWith {};
};

//--- Make sure that the team is alive and that the town is still active.
if (!isNull _reinforcement_team && (_town getVariable "wfbe_active")) then {
	if (({alive _x} count units _reinforcement_team) < 1) exitWith {};

	//--- AI use the town patrol FSM.
	[_town, _reinforcement_team, _side Call WFBE_CO_FNC_GetSideID] execFSM "Server\FSM\server_town_patrol.fsm";

	//--- Wait for town de-spawn.
	while {true} do {
		sleep 5;
		
		if (isNull _reinforcement_team || !(_town getVariable "wfbe_active")) exitWith {};
		if (({alive _x} count units _reinforcement_team) < 1) exitWith {};
	};
};

//--- Cleanup.
if (!isNull _reinforcement_team) then {
	{if !(isNull _x) then {deleteVehicle _x}} forEach (units _reinforcement_team);
	deleteGroup _reinforcement_team;
};

{if !(isNull _x) then {deleteVehicle _x}} forEach _vehicles;

missionNamespace setVariable [Format ["REINFORCER_ACTIVE_%1", _side], (missionNamespace getVariable Format ["REINFORCER_ACTIVE_%1", _side]) - 1];
_town setVariable ["wfbe_reinforcer_count", (_town getVariable "wfbe_reinforcer_count") - 1];