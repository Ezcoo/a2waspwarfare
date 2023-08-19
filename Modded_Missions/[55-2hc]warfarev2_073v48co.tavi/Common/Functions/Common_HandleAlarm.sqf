Private ["_ammo","_missile","_source","_unit","_limit"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;
_limit = missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE";

_missile = nearestObject [_source,_ammo];
if ((_unit getvariable "busy") || isNull _missile) exitWith {};
if (isPlayer (driver _unit)) then {_unit setvariable ["busy",true];
while {_source distance _missile < _limit} do {
playSound ["inbound",true];sleep 2;
        };
		_unit setvariable ["busy",false]
};