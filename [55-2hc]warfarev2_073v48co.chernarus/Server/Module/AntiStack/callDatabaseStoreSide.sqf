// Call to database
private ["_procedureName","_procedureCode","_parameters","_uid","_side","_response","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp"];

_procedureName = _this select 0;
_parameters = _this select 1;

_uid =  _parameters select 0;
_side = _parameters select 1;
_sideAsNumber = 1;

if (_side == west) then {
	_sideAsNumber = 1;
};

if (_side == east) then {
	_sideAsNumber = 2;
};

// We need to change the data type from 'ARRAY' to 'STRING' before sending the data to database
_parameters = _uid + "," + str _sideAsNumber;

_response = {};

_procedureCode = "";

if (_procedureName == "STORE_SIDE") then {
	_procedureCode = 404;
	["INFORMATION", format ["CallDatabaseStoreSide.sqf: Calling database with procedure: [%1], side: [%2], UID being checked against database is: [%3]. Parameters: %4", _procedureName, _side, _uid, _parameters]] Call WFBE_CO_FNC_LogContent;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};


["INFORMATION", format ["CallDatabaseStoreSide.sqf: Called database with procedure: [%1], RESPONSE IS: [%2]", _procedureName, _response]] Call WFBE_CO_FNC_LogContent;

_response = call compile _response;

_responseCode = _response select 0;

if (typeName _responseCode == "SCALAR") then {
	if (_responseCode < 0) then {
		if (_responseCode == -111) then {
			["ERROR", format ["CallDatabaseStoreSide.sqf: CRITICAL ERROR! Something went wrong with database, check it's error logs. UID: [%1], side attempted to be saved: [%2]. Response code: [%3]",_uid, _side, _responseCode]] Call WFBE_CO_FNC_LogContent;
		};
	} else {
		if (_responseCode == 1) then {
			["INFORMATION", format ["CallDatabaseStoreSide.sqf: Called database successfully with procedure: [%1], UID: [%2], and got response: [%3]. Player skill: [%4]).", _procedureName, _uid, _response, _playerSkill]] Call WFBE_CO_FNC_LogContent;
		};
	};
};

/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/

_responseStats
