/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_requestID","_side"];

_requestID = _this select 0;
_side = _this select 1;

// Wait until skill of all players on given side have been calculated
waitUntil {count (format ["WFBE_CL_VAR_SKILL_%1_REQUESTID_%2", _side, _requestID]) >= ({isPlayer _x && side _x == (format ["%1", _side])} count allUnits)};

