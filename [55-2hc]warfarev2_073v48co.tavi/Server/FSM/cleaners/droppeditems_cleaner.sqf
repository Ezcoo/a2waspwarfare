private["_clear", "_timer"];

_timer = missionNamespace getVariable "WFBE_C_DROPPEDITEMS_CLEANER_TIME_PERIOD";
while {!WFBE_GameOver} do {

	_clear = nearestObjects [[7000,7500,0],["weaponholder"],20000];
	{deleteVehicle _x;sleep 0.5;} forEach _clear;

	_clear = nearestObjects [[7000,7500,0],["Mine"],20000];
	{deleteVehicle _x;sleep 0.5;} forEach _clear;

	_clear = nearestObjects [[7000,7500,0],["MineE"],20000];
	{deleteVehicle _x;sleep 0.5;} forEach _clear;

	if(!(isNil "_timer"))then{
		sleep _timer;
	}else{
		sleep 600;
	}
};