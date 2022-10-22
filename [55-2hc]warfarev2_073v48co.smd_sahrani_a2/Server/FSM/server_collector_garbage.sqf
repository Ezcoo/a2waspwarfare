private["_whq","_ehq"];

while {!WFBE_GameOver} do {
	_whq = (west) Call WFBE_CO_FNC_GetSideHQ;
	_ehq = (east) Call WFBE_CO_FNC_GetSideHQ;

	if (isNil "gc_collector") then { gc_collector = []; };

	gc_collector = gc_collector - [objNull];
	{
		if (isNil {_x getVariable "wfbe_trashable"} && !(_x in gc_collector)  && (_x != _whq) && (_x != _ehq)) then {
			_x spawn TrashObject;
			gc_collector = gc_collector + [_x];
		};
	} forEach allDead;
	sleep 0.5;
};