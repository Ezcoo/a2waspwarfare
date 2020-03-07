Private ["_reinforcement_team", "_side", "_town"];

_side = _this select 0;
_reinforcement_team = _this select 1;
_town = _this select 2;

//--- Wait until our team is complete or not.
while {true} do {
	sleep 15;
	
	if (isNull _reinforcement_team) exitWith {};
	if (({alive _x} count units _reinforcement_team) < 1 || ({vehicle _x != _x} count units _reinforcement_team) < 1) exitWith {};
};

//--- Team is null or units are dead.
if (isNull _reinforcement_team) exitWith {};
if (({alive _x} count units _reinforcement_team) < 1) exitWith {};

//--- AI use the town patrol FSM.
[_town, _reinforcement_team, _side Call WFBE_CO_FNC_GetSideID] execFSM "Server\FSM\server_town_patrol.fsm";

//--- Wait for town de-spawn.
while {true} do {
	sleep 5;
	
	if (isNull _reinforcement_team || !(_town getVariable "wfbe_active")) exitWith {};
	if (({alive _x} count units _reinforcement_team) < 1) exitWith {};
};

if (isNull _reinforcement_team) exitWith {};
if (({alive _x} count units _reinforcement_team) < 1) exitWith {};

//--- Cleanup.
{if !(isNull _x) then {deleteVehicle _x}} forEach _vehicles+(units _reinforcement_team);
deleteGroup _reinforcement_team;