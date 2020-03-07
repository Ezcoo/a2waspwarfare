Private ["_boat", "_naval_boats", "_naval_teams", "_place", "_properties", "_side", "_town", "_units", "_water_places"];

_side = _this select 0;
_water_places = _this select 1;
_town = _this select 2;

["INFORMATION", Format ["Reinforcer_ProcessNaval.sqf: [%1] [%2] Reinforcing the town with naval units.", _side, _town]] Call WFBE_CO_FNC_LogContent;

_units = missionNamespace getVariable Format["REINFORCER_%1_NAVAL_UNITS", _side];
if (isNil '_units') exitWith {};

_units = [_units, _town] Call REINFORCER_Func_PickUnits;
if (count _units < 1) exitWith {};

_boat = _units select 0;
_units = _units select 1;

//--- We pick a random spawn location.
_place = _water_places select floor(random count _water_places);

//--- We get a random chopper if needed.
if (typeName _boat == "ARRAY") then {_boat = _boat select floor(random count _boat) };

//--- We spawn the required amount of boats.
_properties = [_side, _place, _boat, count(_units)] Call REINFORCER_Func_SpawnNavalTransports;
_naval_teams = _properties select 0;
_naval_boats = _properties select 1;

//--- Make sure that we were able to create the team.
if (count _naval_teams > 0) then {
	Private ["_reinforcement_properties", "_reinforcement_team", "_tr_unload", "_wp"];
	
	//--- We fill our boats with the given infantry array.
	_properties = [_side, _units, _naval_boats] Call REINFORCER_Func_FillVehicleCargo;
	_reinforcement_team = _properties select 0;
	_reinforcement_properties = _properties select 1;
	
	//--- We're set! let's give our boats a waypoint.
	_tr_unload = _town;
	
	//--- Some towns may have harbors with a clusterfuck of piers around, we may want to hint the transport team to a special location!
	if !(isNil {_town getVariable "wfbe_docks"}) then {
		//--- Get the closest unload position.
		_tr_unload = position ([_place, (_town getVariable "wfbe_docks")] Call WFBE_CO_FNC_GetClosestEntity);
	};
	
	//--- Naval units go forth! (and back!).
	{
		_wp = _x addWaypoint [_tr_unload, 20];
		_wp setWaypointType "TR UNLOAD";
		_wp = _x addWaypoint [_place, 20];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
	} forEach _naval_teams;
	
	//--- Prevent ai from wetting emselves.
	_reinforcement_team setFormation "VEE";
	
	//--- We track our cargo and our units. We don't want to find our ai landed on Saint Pierre's shore don't we?
	{[_x, _reinforcement_team, _town] Spawn REINFORCER_Func_HandleNaval} forEach _reinforcement_properties;
	
	//--- We track our units.
	[_side, _reinforcement_team, _town] Spawn REINFORCER_Func_HandleNavalUnits;
};