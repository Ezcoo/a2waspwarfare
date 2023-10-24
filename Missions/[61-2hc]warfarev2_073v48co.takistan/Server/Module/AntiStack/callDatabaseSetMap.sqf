// Call to database
private ["_procedureName","_procedureCode","_parameters","_map","_uid","_score","_response","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp"];

_procedureName = _this select 0;
_parameters = _this select 1;

_map = _parameters;

_response = {};

_procedureCode = "";

if (_procedureName == "SET_MAP") then {
	_procedureCode = 909;
	["INFORMATION", format ["CallDatabaseSetMap.sqf: Calling database with procedure: [%1]. Parameters: [%2].", _procedureName, _parameters]] Call WFBE_CO_FNC_LogContent;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_map];
};


// ["INFORMATION", format ["CallDatabaseSetMap.sqf: Called database with procedure: [%1], RESPONSE IS: [%2].", _procedureName, _response]] Call WFBE_CO_FNC_LogContent;

_response = call compile _response;

_responseCode = _response select 0;

if (typeName _responseCode == "SCALAR") then {
	if (_responseCode < 0) then {
		["ERROR", format ["CallDatabaseSetMap.sqf: Couldn't set map for the match! (Map attempted to be saved in database: [%1].)", _map]] Call WFBE_CO_FNC_LogContent;
	} else {
		if (_responseCode == 1) then {
			["INFORMATION", format ["CallDatabaseSetMap.sqf: Called database successfully with procedure: [%1].", _procedureName]] Call WFBE_CO_FNC_LogContent;
		};
	};
};

/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/

_responseCode