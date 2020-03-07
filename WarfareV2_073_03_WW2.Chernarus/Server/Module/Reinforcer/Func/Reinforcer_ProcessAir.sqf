Private ["_air_places", "_place", "_properties", "_side", "_town", "_transport_team", "_transport_vehicles", "_units", "_vehicles"];

_side = _this select 0;
_air_places = _this select 1;
_town = _this select 2;

["INFORMATION", Format ["Reinforcer_ProcessAir.sqf: [%1] [%2] Reinforcing the town with air units.", _side, _town]] Call WFBE_CO_FNC_LogContent;

_units = missionNamespace getVariable Format["REINFORCER_%1_AIR_UNITS", _side];
if (isNil '_units') exitWith {};

_units = [_units, _town] Call REINFORCER_Func_PickUnits;
if (count _units < 1) exitWith {};

_chopper = _units select 0;
_units = _units select 1;

//--- We pick a random spawn location.
_place = _air_places select floor(random count _air_places);

//--- We get a random chopper if needed.
if (typeName _chopper == "ARRAY") then {_chopper = _chopper select floor(random count _chopper) };

//--- We spawn the required amount of choppers.
_properties = [_side, _place, _chopper, count(_units)] Call REINFORCER_Func_SpawnAirTransports;
_transport_team = _properties select 0;
_transport_vehicles = _properties select 1;

if !(isNull _transport_team) then {
	//--- Paratroop our boys around the town then head back to the source.
	_wp = _transport_team addWaypoint [_town, 200];
	_wp setWaypointType "MOVE";
	_wp setWaypointTimeout [15, 17, 20];
	_wp = _transport_team addWaypoint [_place, 20];
	_wp setWaypointType "MOVE";
	
	//--- We fill our boats with the given infantry array.
	_properties = [_side, _units, _transport_vehicles] Call REINFORCER_Func_FillVehicleCargo;
	_reinforcement_team = _properties select 0;
	_reinforcement_properties = _properties select 1;
	
	//--- We track our cargo and our units. We don't want to find our ai on Saint Pierre's shore don't we?
	{[_x, _reinforcement_team, _town] Spawn REINFORCER_Func_HandleAir} forEach _reinforcement_properties;
	
	[_side, _reinforcement_team, _town] Spawn REINFORCER_Func_HandleAirUnits;
};