Private ["_meadow_places", "_place", "_properties", "_side", "_town", "_units", "_vehicles"];

_side = _this select 0;
_meadow_places = _this select 1;
_town = _this select 2;

["INFORMATION", Format ["Reinforcer_ProcessGroundConvoy.sqf: [%1] [%2] Reinforcing the town with a convoy.", _side, _town]] Call WFBE_CO_FNC_LogContent;

_units = missionNamespace getVariable Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side];
if (isNil '_units') exitWith {};

_units = [_units, _town] Call REINFORCER_Func_PickUnits;
if (count _units < 1) exitWith {};

_vehicles = _units select 0;
_units = _units select 1;

//--- Count the total of units.
_units_count = 0;
{
	switch (typeName _x) do {
		case "ARRAY": {_units_count = _units_count + (count _x)};
		case "STRING": {_units_count = _units_count + 1};
	};
} forEach _units;

//--- We pick a random spawn location.
_place = _meadow_places select floor(random count _meadow_places);

//--- We spawn the convoy.
_properties = [_side, _place, _vehicles, _units_count] Call REINFORCER_Func_SpawnGroundTransports;
_transport_team = _properties select 0;
_transport_escort = (_properties select 1) select 0;
_transport_transport = (_properties select 1) select 1;

if !(isNull _transport_team) then {
	//--- We fill our transports with the given infantry arrays.
	_reinforcements_team = [];
	{
		_properties = [_side, _x, _transport_transport] Call REINFORCER_Func_FillVehicleCargo;
		_reinforcement_team = _properties select 0;
		_reinforcement_properties = _properties select 1;
		
		_reinforcements_team = _reinforcements_team + [_reinforcement_team];
		_wp = _reinforcement_team addWaypoint [_town, 300];
		_wp setWaypointType "MOVE";
	} forEach _units;
	
	//--- TODO: tell em to unload near the town.
	_tr_unload = _town;
	
	_wp = _transport_team addWaypoint [_tr_unload, 300];
	_wp setWaypointType "TR UNLOAD";
	_wp setWaypointTimeout [50, 55, 60]; //--- We don't want the transports to move too soon. They may damage the infantry.
	_wp = _transport_team addWaypoint [_place, 20];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	
	//--- We track our transport units.
	{[_transport_team, _x] Spawn REINFORCER_Func_HandleGround} forEach (_transport_transport + _transport_escort);
	
	//--- We track the overall of the transport team.
	[_transport_team, _transport_transport + _transport_escort] Spawn REINFORCER_Func_HandleGroundTransport;
	
	//--- We track our units.
	{[_side, _x, _town] Spawn REINFORCER_Func_HandleGroundTransportUnits} forEach _reinforcements_team;
	
	missionNamespace setVariable [Format ["REINFORCER_ACTIVE_%1", _side], (missionNamespace getVariable Format ["REINFORCER_ACTIVE_%1", _side]) + 1];
	_town setVariable ["wfbe_reinforcer_count", if !(isNil {_town getVariable "wfbe_reinforcer_count"}) then {(_town getVariable "wfbe_reinforcer_count") + 1} else {1}];
	
	//--- Decrease the counter in due time.
	[_side, _reinforcements_team, _town, _transport_transport + _transport_escort, _transport_team] Spawn {
		Private ["_alive", "_reinforcements_team", "_side", "_town", "_transport_team"];
		_side = _this select 0;
		_reinforcements_team = _this select 1;
		_town = _this select 2;
		_vehicles = _this select 3;
		_transport_team = _this select 4;
		
		_alive = 1;
		while {_alive > 0 && (_town getVariable "wfbe_active")} do {
			_alive = 0;
			{if !(isNull _x) then {_alive = _alive + ({alive _x} count units _x)}} forEach _reinforcements_team;
			sleep 25;
		};
		
		missionNamespace setVariable [Format ["REINFORCER_ACTIVE_%1", _side], (missionNamespace getVariable Format ["REINFORCER_ACTIVE_%1", _side]) - 1];
		_town setVariable ["wfbe_reinforcer_count", (_town getVariable "wfbe_reinforcer_count") - 1];
		
		{
			if !(isNull _x) then {
				{if !(isNull _x) then {deleteVehicle _x}} forEach units _x;
				deleteGroup _x;
			};
		} forEach _reinforcements_team;
		
		{if (alive _x) then {_x setVelocity [0,0,0]; deleteVehicle _x}} forEach _vehicles;
		if !(isNull _transport_team) then {
			{deleteVehicle _x} forEach units _transport_team;
			deleteGroup _transport_team;
		};
	};
};