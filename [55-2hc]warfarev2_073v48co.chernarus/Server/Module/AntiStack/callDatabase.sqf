// Call to database
private ["_procedureName","_procedureCode","_parameters","_response"];

_procedureName = _this select 0;
_parameters = _this select 1;
_response = {};

["INFORMATION", format ["CallDatabase.sqf: Calling database with procedure: %1, parameters: %2.", _procedureName, _parameters]] Call WFBE_CO_FNC_LogContent;

_procedureCode = "";

if (_procedureName == "Retrieve") then {
	_procedureCode = 101;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};

if (_procedureName == "Store") then {
	_procedureCode = 202;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};
	
["INFORMATION", format ["CallDatabase.sqf: Called database with procedure: %1, parameters: %2, and got response: %3", _procedureName, _parameters, _response]] Call WFBE_CO_FNC_LogContent;
_response = compile _response;

if (typeName _response == "SCALAR") then {
	if (_response < 0) then {
		if (_response == -1) then {
			["ERROR", format ["CallDatabase.sqf: ERROR! Something went wrong with database, check it's error logs. Response code: %1", _response]] Call WFBE_CO_FNC_LogContent;
		};
		if (_response == -2) then {
			["ERROR", format ["CallDatabase.sqf: ERROR! Unusual activity detected with parameters: %1. Player is either a teamkiller or is possibly trying to cheat with the database. Response code: %1", _parameters, _response]] Call WFBE_CO_FNC_LogContent;
		};
	};
};

/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/

_response
