Private ["_cargo_chopper", "_cargo_total", "_chopper", "_choppers", "_crew", "_get", "_place", "_side", "_sideID", "_soldier", "_team", "_vehicles"];

_side = _this select 0;
_place = _this select 1;
_chopper = _this select 2;
_cargo_total = _this select 3;
_sideID = _side Call WFBE_CO_FNC_GetSideID;

_vehicles = [];
_team = grpNull;

_cargo_chopper = getNumber (configFile >> 'CfgVehicles' >> _chopper >> 'transportSoldier');

//--- Make sure that we can carry at least 2 soldiers.
if (_cargo_chopper > 1) then {
	//--- We use the crew defined in the vehicle's config.
	_crew = getText(configFile >> 'CfgVehicles' >> _chopper >> 'crew');
	
	_vehicle_side = switch (getNumber(configFile >> "CfgVehicles" >> _chopper >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
	
	//--- Don't use civilian crew.
	if (_vehicle_side == civilian) then {
		_crew = missionNamespace getVariable Format["WFBE_%1PILOT", _side];
	};
	
	//--- Determine how many choppers do we need to carry our infantry units.
	_choppers = ceil(_cargo_total/_cargo_chopper);
	
	//--- Create the team.
	_team = createGroup _side;
	
	//--- Create the transports.
	for '_i' from 1 to _choppers do {
		_place_at = [(_place select 0) + random 50 - random 50, (_place select 1) + random 50 - random 50, 300];
		_vehicle = [_chopper, _place_at, _sideID, 0, false, true, true, "FLY"] Call WFBE_CO_FNC_CreateVehicle;
		
		//--- Base.
		if (_vehicle emptyPositions 'driver' > 0) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInDriver _vehicle};
		if (_vehicle emptyPositions 'gunner' > 0) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInGunner _vehicle};
		if (_vehicle emptyPositions 'commander' > 0) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInCommander _vehicle};
		
		//--- Turrets.
		_get = missionNamespace getVariable _chopper;
		if !(isNil '_get') then {				
			{
				if (isNull (_vehicle turretUnit _x)) then {_soldier = [_crew,_team,[0,0,100],_sideID] Call WFBE_CO_FNC_CreateUnit; _soldier moveInTurret [_vehicle, _x]};
			} forEach (_get select QUERYUNITTURRETS);
		};
		
		//--- Prevent the pilot from wandering where he should not!
		{driver _vehicle disableAI _x} forEach ["AUTOTARGET", "TARGET"];
		
		_vehicle setPos [position _vehicle select 0, position _vehicle select 1, 275];
		_vehicle flyInHeight 275;
		_vehicle lock true;
		
		_vehicles = _vehicles + [_vehicle];
	};
};

_team setFormation "COLUMN";
_team setBehaviour "CARELESS";

//--- Our team can use the vehicles (if there's any obviously).
{_team addVehicle _x} forEach _vehicles;

//--- We return the team along with the choppers.
[_team, _vehicles]