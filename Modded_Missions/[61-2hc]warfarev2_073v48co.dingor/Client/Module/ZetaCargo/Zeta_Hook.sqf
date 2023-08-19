Private ["_action","_actionID","_caller","_ehq","_whq","_index","_isAttached","_lifter","_position","_sorted","_type","_vehicle","_vehicles"];

_lifter = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;
_ehq = ['BTR90_HQ','BMP2_HQ_TK_EP1','BMP2_HQ_INS'];
_whq = ['LAV25_HQ','M1130_CV_EP1','BMP2_HQ_CDF'];

if (_caller != driver _lifter) exitWith {};
if ((typeOf _lifter) in Zeta_Special) then {
	if (speed _lifter > 20) exitWith {};
} else {
	if ((speed _lifter > 20)||((getpos _lifter select 2)<2)) exitWith {};
};
//--- nearEntities handle living units.
_vehicles = _lifter nearObjects ["LandVehicle", 10];
if (count _vehicles < 1) exitWith {};

_vehicle = [_lifter,_vehicles] Call WFBE_CO_FNC_GetClosestEntity;

if ((typeOf _vehicle in _ehq) && (!(alive _vehicle)) && (side _caller == WEST)) exitWith {hint "You can't airlift ennemy HQ wreck because someone thought it was a bit too much"};
if ((typeOf _vehicle in _whq) && (!(alive _vehicle)) && (side _caller == EAST)) exitWith {hint "You can't airlift ennemy HQ wreck because someone thought it was a bit too much"};
_type = typeOf _lifter;
_position = Zeta_DefaultPos;
_index = Zeta_Special find _type;
if (_index != -1) then {_position = Zeta_SpecialPosition select _index};

if (count crew(_vehicle) > 0) exitWith {hint (localize 'STR_WF_INFO_Hook_Manned')};

_vehicle attachTo [_lifter,_position];
_lifter setVariable ["Attached",true,false];
_lifter removeAction _actionID;

_action = _lifter addAction [localize "STR_WF_Lift_Detach","Client\Module\ZetaCargo\Zeta_Unhook.sqf"];

while {!gameOver} do {
	sleep 2;
	_isAttached = _lifter getVariable "Attached";
	if ((getDammage _lifter > 0.3)||!_isAttached||isNull (driver _lifter)) exitWith {
		detach _vehicle;
		_lifter removeAction _action;
		if (alive _lifter) then {_lifter addAction [localize "STR_WF_Lift","Client\Module\ZetaCargo\Zeta_Hook.sqf"]};
	};
};