Private ["_meadow_places", "_place", "_properties", "_side", "_town", "_units", "_vehicles"];

_side = _this select 0;
_meadow_places = _this select 1;
_town = _this select 2;

["INFORMATION", Format ["Reinforcer_ProcessGroundSimple.sqf: [%1] [%2] Reinforcing the town with a simple unit group.", _side, _town]] Call WFBE_CO_FNC_LogContent;

_units = missionNamespace getVariable Format["REINFORCER_%1_GROUND_UNITS", _side];
if (isNil '_units') exitWith {};

_units = [_units, _town] Call REINFORCER_Func_PickUnits;
if (count _units < 1) exitWith {};

["INFORMATION", Format ["Reinforcer_ProcessGroundSimple.sqf: [%1] [%2] Reinforcing the town with %3.", _side, _town, _units]] Call WFBE_CO_FNC_LogContent;

//--- We pick a random spawn location.
_place = _meadow_places select floor(random count _meadow_places);

//--- We spawn the convoy.
_properties = [_side, _place, _units] Call REINFORCER_Func_SpawnGroundSimple;
_reinforcement_team = _properties select 0;
_reinforcement_vehicles = _properties select 1;

if !(isNull _reinforcement_team) then {
	_wp = _reinforcement_team addWaypoint [_town, 300];
	_wp setWaypointType "MOVE";
	
	//--- We track our units.
	[_side, _reinforcement_team, _town, _reinforcement_vehicles] Spawn REINFORCER_Func_HandleGroundSimple;
};