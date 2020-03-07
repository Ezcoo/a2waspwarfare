/*
	Triggered whenever a building is killed (non-warfare).
	 Parameters:
		- Killed
		
	todo: don't remove structure ruins from wf building.
*/

Private ["_killed", "_pos"];

_killed = _this;

if !(isNull _killed) then {
	_pos = getPos _killed;
	sleep 5;
	
	_near = nearestObjects [_pos, ["Ruins"], 10]; //--- Some building leave ruins.
	sleep 60; 
	
	if !(isNull _killed) then {deleteVehicle _killed}; //--- Killed structures are never really deleted.
	
	if (count _near > 0) then { //--- Remove the closest ruin.
		if ((_near select 0) distance _pos < 5) then {deleteVehicle (_near select 0)};
	};
};