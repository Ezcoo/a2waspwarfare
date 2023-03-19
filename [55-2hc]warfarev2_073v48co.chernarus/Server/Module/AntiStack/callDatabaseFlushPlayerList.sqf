// Call to database
private ["_procedureName","_procedureCode","_parameters","_uid","_score","_response","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp"];

_procedureName = _this select 0;

_response = {};

_procedureCode = "";

if (_procedureName == "FLUSH_PLAYERLIST") then {
	_procedureCode = 808;
	["INFORMATION", format ["CallDatabaseFlushPlayerList.sqf: Calling database with procedure: [%1].", _procedureName]] Call WFBE_CO_FNC_LogContent;
	_response = "A2WaspDatabase" callExtension format ["%1",_procedureCode];
};


// ["INFORMATION", format ["CallDatabaseFlushPlayerList.sqf: Called database with procedure: [%1], RESPONSE IS: [%2].", _procedureName, _response]] Call WFBE_CO_FNC_LogContent;

_response = call compile _response;

_responseCode = _response select 0;

if (typeName _responseCode == "SCALAR") then {
	if (_responseCode == 1) then {
		["INFORMATION", format ["CallDatabaseFlushPlayerList.sqf: Called database successfully with procedure: [%1].", _procedureName]] Call WFBE_CO_FNC_LogContent;
	};
};

/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/

_responseCode
