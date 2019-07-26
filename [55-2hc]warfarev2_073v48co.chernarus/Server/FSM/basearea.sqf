private["_brr","_mbr","_onAreaRemoved","_side","_logik","_buildings","_command","_service","_aar","_areas","_grp","_areas_old"];

_brr = missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE";
_mbr = missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE";

_onAreaRemoved = {
	Private ["_areas", "_center", "_delete", "_objects", "_side"];
	_center = _this select 0;
	_side = _this select 1;
	_areas = _this select 2;
	
	_objects = nearestObjects [_center, missionNamespace getVariable Format["WFBE_%1DEFENSENAMES", _side], (missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE") + (missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE")];
	{_objects = _objects - (nearestObjects [getPos _x, missionNamespace getVariable Format["WFBE_%1DEFENSENAMES", _side], (missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE") + (missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE")])} forEach _areas;
	
	sleep 60;
	
	{
		if !(isNil {_x getVariable "wfbe_defense"}) then {
			_delete = true;
			if (_x isKindOf "StaticWeapon") then {
				_unit = gunner _x;
				if (alive _unit) then {
					if (isNil {(group _unit) getVariable "wfbe_funds"}) then {
						_unit setPos (getPos _x);
						deleteVehicle _unit;
					} else {
						_delete = false;
					};
				};
			};
			if (_delete) then {deleteVehicle _x};
		};
	} forEach _objects;
};

while {!gameOver} do {
	{
		_side = _x;
		_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
		_buildings = (_side Call WFBE_CO_FNC_GetSideStructures) + [_side Call WFBE_CO_FNC_GetSideHQ];
		_command=[_side,missionNamespace getVariable Format["WFBE_%1COMMANDCENTERTYPE",str _side],_buildings] Call GetFactories;
		_service=[_side,missionNamespace getVariable Format["WFBE_%1SERVICEPOINTTYPE",str _side],_buildings] Call GetFactories;
		_aar = [_side,missionNamespace getVariable Format["WFBE_%1AARADARTYPE",str _side],_buildings] Call GetFactories;
		_buildings = _buildings - _command - _service - _aar;
		_areas_old = _logik getVariable "wfbe_basearea";
		_areas = _areas_old;
	
		{
			_structure = [_x, _buildings] Call WFBE_CO_FNC_GetClosestEntity;
			if (!isNull _structure) then {
				if (_structure distance _x > (_brr + _mbr)) then {
					//--- On deletion, remove the statics/defenses later.
					[getPos _x, _side, _areas_old] Spawn _onAreaRemoved;
					_areas = _areas - [_x] - [objNull];
					_grp = group _x;
					deleteVehicle _x;
					deleteGroup _grp;
				};
			};
		} forEach _areas_old;
	
		if (count _areas_old != count _areas) then {
			_logik setVariable ["wfbe_basearea", _areas, true];
		};
	} forEach WFBE_PRESENTSIDES;
	sleep 20;
};