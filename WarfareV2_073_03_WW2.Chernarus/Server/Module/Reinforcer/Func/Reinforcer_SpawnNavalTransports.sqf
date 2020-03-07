Private ["_boat", "_cargo_boat", "_cargo_total", "_crew", "_place", "_side", "_sideID", "_team", "_teams", "_unit", "_vehicles"];

_side = _this select 0;
_place = _this select 1;
_boat = _this select 2;
_cargo_total = _this select 3;
_sideID = _side Call WFBE_CO_FNC_GetSideID;

_vehicles = [];
_teams = [];

//--- Make sure that we can carry at least 2 soldiers.
_cargo_boat = getNumber (configFile >> 'CfgVehicles' >> _boat >> 'transportSoldier');
if (_cargo_boat > 1) then {
	//--- We use the crew defined in the vehicle's config.
	_crew = getText(configFile >> 'CfgVehicles' >> _boat >> 'crew');
	
	_vehicle_side = switch (getNumber(configFile >> "CfgVehicles" >> _boat >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
	
	//--- Don't use civilian crew.
	if (_vehicle_side == civilian) then {
		_crew = missionNamespace getVariable Format["WFBE_%1CREW", _side];
	};
	
	//--- Determine how many boats do we need to carry our infantry units.
	_boats = ceil(_cargo_total/_cargo_boat);
	
	//--- Create the transportation group along with the boats.
	for '_i' from 1 to _boats do {
		_team = createGroup _side;
		_place_at = _place;
		
		//--- Try to place the next boats properly.
		if (_i > 1) then {
			_safe = _place findEmptyPosition [5, 40, _boat];
			if (count _safe > 0) then {_place_at = _safe};
		};
		
		//--- Create the boat.
		_vehicle = [_boat, _place_at, _sideID, 0, false] Call WFBE_CO_FNC_CreateVehicle;
		
		if (_vehicle emptyPositions 'driver' > 0) then {_unit = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInDriver _vehicle};
		if (_vehicle emptyPositions 'gunner' > 0) then {_unit = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInGunner _vehicle};
		if (_vehicle emptyPositions 'commander' > 0) then {_unit = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _unit moveInCommander _vehicle};
		
		//--- If we plan on using "TR UNLOAD" waypoints, then we need to addVehicle the boats to the crew's team so that it may actually unload other units (from other groups).
		_team addVehicle _vehicle;
		_vehicle lock true;
		
		_vehicles = _vehicles + [_vehicle];
		_teams = _teams + [_team];
	};
};

//--- We return the team along with the boats.
[_teams, _vehicles]