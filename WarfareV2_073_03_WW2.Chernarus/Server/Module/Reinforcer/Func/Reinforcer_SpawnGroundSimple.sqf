Private ["_crew", "_get", "_place", "_place_at", "_safe", "_side", "_sideID", "_soldier", "_team", "_unit", "_units", "_vehicle", "_vehicles"];

_side = _this select 0;
_place = _this select 1;
_units = _this select 2;

_sideID = _side Call WFBE_CO_FNC_GetSideID;

//--- The team.
_team = createGroup _side;

_vehicles = [];
for '_i' from 0 to count(_units)-1 do {
	_unit = _units select _i;
	_place_at = _place;
	
	if (_unit isKindOf "Man") then {
		_soldier = [_unit, _team, _place_at, _sideID] Call WFBE_CO_FNC_CreateUnit;
	} else {
		if (count _vehicles > 0) then {
			_safe = _place findEmptyPosition [10, 40, _unit];
			if (count _safe > 0) then {_place_at = _safe};
		};
		
		//--- Create the vehicle.
		_vehicle = [_unit, _place_at, _sideID, 0, false] Call WFBE_CO_FNC_CreateVehicle;
		
		//--- We use the crew defined in the vehicle's config.
		_crew = getText(configFile >> 'CfgVehicles' >> _unit >> 'crew');
		
		//_vehicle_side = switch (getNumber(configFile >> "CfgVehicles" >> _crew >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
		_vehicle_side = switch (getNumber(configFile >> "CfgVehicles" >> _crew >> "side")) do {case 0: {east}; case 1: {west}; default {civilian}};
			
		//--- Don't use civilian crew.
		if (_vehicle_side == civilian) then {
			_crew = missionNamespace getVariable Format["WFBE_%1CREW", _side];
		};
		
		//--- Base.
		if (_vehicle emptyPositions 'driver' > 0) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInDriver _vehicle};
		if (_vehicle emptyPositions 'gunner' > 0) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInGunner _vehicle};
		if (_vehicle emptyPositions 'commander' > 0) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInCommander _vehicle};
		
		//--- Turrets.
		_get = missionNamespace getVariable _unit;
		if !(isNil '_get') then {				
			{
				if (isNull (_vehicle turretUnit _x)) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInTurret [_vehicle, _x]};
			} forEach (_get select QUERYUNITTURRETS);
		};
		
		_vehicle lock true;
		
		//--- Track the vehicle.
		[_vehicle, missionNamespace getVariable "REINFORCER_VEHICLES_EMPTY_DELAY"] Spawn WFBE_SE_FNC_HandleEmptyVehicle;
		
		_vehicles = _vehicles + [_vehicle];
	};
};

//--- Our team can use the vehicles (if there's any obviously).
{_team addVehicle _x} forEach _vehicles;

_team setFormation "COLUMN";
_team setBehaviour "SAFE";

//--- We return the team along with the vehicles.
[_team, _vehicles]