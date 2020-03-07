Private ["_cargo_total", "_cargo_transport", "_created", "_crew", "_place", "_side", "_sideID", "_team", "_transports", "_unit", "_vehicles", "_vehicles_types"];

_side = _this select 0;
_place = _this select 1;
_vehicles_types = _this select 2;
_cargo_total = _this select 3;
_sideID = _side Call WFBE_CO_FNC_GetSideID;

_vehicle_transport = _vehicles_types select 1;

_vehicles = [];
_vehicles_transport = [];
_team = grpNull;

//--- Make sure that we can carry at least 2 soldiers.
_cargo_transport = getNumber (configFile >> 'CfgVehicles' >> _vehicle_transport >> 'transportSoldier');
if (_cargo_transport > 1) then {
	//--- Determine how many vehicles do we need to carry our infantry units.
	_transports = ceil(_cargo_total/_cargo_transport);
	
	//--- The transport team.
	_team = createGroup _side;
	
	//--- Since we're using arrays, we may have more than 1 transport.
	_vehicles_transports = [];
	for '_i' from 1 to _transports do {_vehicles_transports = _vehicles_transports + [_vehicle_transport]};
	
	//--- Head vehicle, [Convoy], Tail vehicle.
	_vehicles_transports = [_vehicles_types select 0, _vehicles_transports, _vehicles_types select 2];
	
	//--- Create the transportation group along with the vehicles.
	_created = 0;
	for '_i' from 0 to count(_vehicles_transports)-1 do {
		{
			_place_at = _place;
			
			//--- Try to place the next vehicles properly.
			if (_created > 0) then {
				_safe = _place findEmptyPosition [10, 40, _x];
				if (count _safe > 0) then {_place_at = _safe};
			};
			
			//--- Create the vehicle.
			_vehicle = [_x, _place_at, _sideID, 0, false] Call WFBE_CO_FNC_CreateVehicle;
			
			//--- We use the crew defined in the vehicle's config.
			_crew = getText(configFile >> 'CfgVehicles' >> _vehicle_transport >> 'crew');
			
			//_vehicle_side = switch (getNumber(configFile >> "CfgVehicles" >> _vehicle_transport >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
			_vehicle_side = switch (getNumber(configFile >> "CfgVehicles" >> _vehicle_transport >> "side")) do {case 0: {east}; case 1: {west}; default {civilian}};
						
			
			//--- Don't use civilian crew.
			if (_vehicle_side == civilian) then {
				_crew = missionNamespace getVariable Format["WFBE_%1CREW", _side];
			};
			
			//--- Base.
			if (_vehicle emptyPositions 'driver' > 0) then {_unit = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInDriver _vehicle};
			if (_vehicle emptyPositions 'gunner' > 0) then {_unit = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInGunner _vehicle};
			if (_vehicle emptyPositions 'commander' > 0) then {_unit = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInCommander _vehicle};
			
			//--- Turrets.
			_get = missionNamespace getVariable _x;
			if !(isNil '_get') then {				
				{
					if (isNull (_vehicle turretUnit _x)) then {_unit = [_crew,_team,_place_at,_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInTurret [_vehicle, _x]};
				} forEach (_get select QUERYUNITTURRETS);
			};
			
			//--- If we plan on using "TR UNLOAD" waypoints, then we need to addVehicle the vehicles to the crew's team so that it may actually unload other units (from other groups).
			_team addVehicle _vehicle;
			_vehicle lock true;
			
			if (_i == 1) then {
				_vehicles_transport = _vehicles_transport + [_vehicle];
			} else {
				_vehicles = _vehicles + [_vehicle];
			};
			
			_created = _created + 1;
		} forEach (_vehicles_transports select _i);
	};
	
	{_team addVehicle _x} forEach (_vehicles_transport + _vehicles);
	
	_team setFormation "COLUMN";
	_team setBehaviour "SAFE";
};

//--- We return the team along with the vehicles.
[_team, [_vehicles, _vehicles_transport]]