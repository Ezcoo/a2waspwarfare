/*
	Handle a vehicle emptiness.
	 Parameters:
		- Vehicle.
		- {Delay override}.
*/

Private ["_delay", "_timer", "_vehicle"];

_vehicle = _this select 0;
_delay = if (count _this > 1) then {_this select 1} else {if (typeOf _vehicle in ['I44_Car_A_WillysMB_Medic_Army','I44_Car_B_WillysAB_Medic_Army','GAZ_Vodnik_MedEvac','Mi17_medevac_RU','M113Ambul_TK_EP1']) then {(missionNamespace getVariable "WFBE_C_UNITS_EMPTY_TIMEOUT")*2} else {missionNamespace getVariable "WFBE_C_UNITS_EMPTY_TIMEOUT"};};
_timer = 0;

while {alive _vehicle} do {
	sleep 20;
	
	_timer = if (({alive _x} count crew _vehicle) > 0) then {0} else {_timer + 20};
	if (_timer > _delay) exitWith {deleteVehicle _vehicle};
};

emptyQueu = emptyQueu - [_vehicle];