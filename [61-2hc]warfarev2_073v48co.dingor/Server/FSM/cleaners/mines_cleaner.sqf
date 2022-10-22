private["_clear", "_timer"];

mines = [];
_timer = missionNamespace getVariable "WFBE_C_MINEFIELDS_CLEANER_TIME_PERIOD";

while {!WFBE_GameOver} do {
	{
		_mine_timer = _x select 1;
		if((time - _mine_timer) >= _timer) then{
			deleteVehicle (_x select 0);
			mines = mines - _x;
		};
		sleep 0.5;
	} forEach mines;
	if(!(isNil "_timer"))then{
		sleep _timer;
	}else{
		sleep 600;
	};
};