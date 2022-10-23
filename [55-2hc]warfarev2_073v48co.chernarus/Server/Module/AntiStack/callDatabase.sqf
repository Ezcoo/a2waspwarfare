// Call to database
private ["_procedureName","_parameters","_response"];

_procedureName = _this select 0;
_parameters = _this select 1;
_response = {};

	["INFORMATION", format ["CallDatabase.sqf: Calling database with procedure: %1, parameters: %2.", _procedureName, _parameters]] Call WFBE_CO_FNC_LogContent;

	if (_procedureName == "Retrieve") then {
		_response = "A2WaspDatabaseRetrieve" callExtension format ["%1",_parameters];
	};

	if (_procedureName == "Store") then {
		_response = "A2WaspDatabaseStore" callExtension format ["%1",_parameters];
	};
	
	["INFORMATION", format ["CallDatabase.sqf: Called database with procedure: %1, parameters: %2, and got response: %3", _procedureName, _parameters, _response]] Call WFBE_CO_FNC_LogContent;
	_response = compile _response;

/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/

_response
