_sleep = _this select 0;
_miniSleep = _this select 1;

while { true } do {
	uiSleep _sleep;
	{
		if (isPlayer _x) then {
			missionNamespace setVariable [format ["WFBE_CO_CURRENT_SCORE_PLAYER_%1", getPlayerUID _x], score _x];
			uiSleep _miniSleep;
		};
	} forEach allUnits;
};