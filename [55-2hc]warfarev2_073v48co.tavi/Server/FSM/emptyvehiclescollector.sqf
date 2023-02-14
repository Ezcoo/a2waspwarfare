private["_vehicles", "_vehicles2","_reloaded"];

while {!gameOver} do {
	_vehicles = WF_Logic getVariable "emptyVehicles";

	{
		if !(_x in emptyQueu) then {
			_vehicles2 = WF_Logic getVariable "emptyVehicles";
			emptyQueu = emptyQueu + [_x];
			[_x] Spawn WFBE_SE_FNC_HandleEmptyVehicle;
			_reloaded = _vehicles2 - [_x] - [objNull];
			WF_Logic setVariable ["emptyVehicles",_reloaded,true];
		};
	} forEach _vehicles;
	sleep 0.5
};