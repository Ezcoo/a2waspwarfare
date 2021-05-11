private["_clear", "_timer"];

_timer = missionNamespace getVariable ["WFBE_C_BUILDING_RESTORER_TIME_PERIOD", 600];

while {!WFBE_GameOver} do {
	_clear = nearestObjects [[7500,7900,0],["WarfareBBaseStructure"],10500];
	{
		_x setdamage 0;
		sleep 0.5;
	} forEach _clear;
	uisleep _timer;
};