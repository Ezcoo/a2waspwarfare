Private ["_ammo","_irLock","_missile","_source","_unit","_indirectHit","_aiRateOfFireDistance","_maxRange","_maxRangeProbab"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;

_missile = nearestObject [_source,_ammo];
if (isNull _missile) exitWith {};

_irLock = getNumber(configFile >> "CfgAmmo" >> _ammo >> "irLock"); //--- Get the ammo type.
if (_irLock == 0) then {if (_ammo in ["Bo_FAB_250","Bo_Mk82"]) then {_irLock = 1}}; //--- Dumb bomb workaround (rocket simulation).

if (_irLock == 1) then { //--- IR Lock is affected
	_source = getPos _source;
	_distance = _unit distance _source;
	
	_limit = missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE";
	
	if (_distance > _limit) then {
		waitUntil {_missile distance _source > _limit};
		deleteVehicle _missile;
	};
};

//Maverick / CRV-7 PG (Wildcat) fix
_indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    if (_ammo in ["CRV7_PG"])
        then {
            _indirectHit = 800
            };


_indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    if (_ammo in ["M_Maverick_AT"])
        then {
            _indirectHit = 850
            };

//Metis fixes
_aiRateOfFireDistance = getNumber(configFile >> "CfgWeapons" >> _unit >> "aiRateOfFireDistance");
if (_unit in ["MetisLauncher"]) then {
    _aiRateOfFireDistance = 3000
};

_maxRange = getNumber(configFile >> "CfgWeapons" >> _unit >> "maxRange");
if (_unit in ["MetisLauncher"]) then {
    _maxRange = 5000
};

_maxRangeProbab = getNumber(configFile >> "CfgWeapons" >> _unit >> "maxRangeProbab");
if (_unit in ["MetisLauncher"]) then {
    _maxRangeProbab = 0
};
