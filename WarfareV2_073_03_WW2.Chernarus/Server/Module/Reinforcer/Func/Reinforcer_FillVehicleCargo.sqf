Private ["_cargo", "_set", "_side", "_squad", "_sideID", "_transports", "_u", "_units"];

_side = _this select 0;
_units = _this select 1;
_transports = _this select 2;
_sideID = _side Call WFBE_CO_FNC_GetSideID;

_u = 0;
_squad = createGroup _side;
_set = [];

//--- Man each vehicles while there is enough room in it.
{
	_cargo = [];
	while {_x emptyPositions "cargo" > 0 && _u < count(_units)} do { 
		_unit = _units select _u;
		_unit = [_unit, _squad, [0,0,100], _sideID] Call WFBE_CO_FNC_CreateUnit;
		_unit moveInCargo _x; 
		_unit setVariable ["wfbe_garbage_delay", missionNamespace getVariable "REINFORCER_UNITS_DEAD_DELAY"];
		_cargo = _cargo + [_unit];
		_u = _u + 1;
	};
	_set = _set + [[_x, _cargo, group effectiveCommander _x]];
} forEach _transports;

//--- Return the squad and the units.
[_squad, _set]