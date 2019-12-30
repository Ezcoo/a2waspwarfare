private["_clear", "_timer"];

_timer = missionNamespace getVariable "WFBE_C_BUILDING_RESTORER_TIME_PERIOD";
_baseb = [
      "Base_WarfareBBarracks",
	  "Base_WarfareBLightFactory",
	  "Base_WarfareBHeavyFactory",
	  "Base_WarfareBUAVterminal",
	  "Base_WarfareBAircraftFactory",
	  "BASE_WarfareBAntiAirRadar",
	  "BASE_WarfareBArtilleryRadar",
	  "Warfare_HQ_base_unfolded",
	  "BASE_WarfareBFieldhHospital",
	  "Base_WarfareBVehicleServicePoint"
];

while {!WFBE_GameOver} do {
	_clear = nearestObjects [[7000,7500,0],[],20000];
	{
		if(!(_x in _baseb)) then {
			_x setdamage 0;
		};
		sleep 0.5;
	} forEach _clear;

	if(!(isNil "_timer"))then{
		sleep _timer;
	}else{
		sleep 600;
	}
};