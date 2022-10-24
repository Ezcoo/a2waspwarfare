// Call to database
private ["_procedureName","_procedureCode","_parameters","_uid","_score","_response","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp"];

_procedureName = _this select 0;
_parameters = _this select 1;
_isArray = false;

_uid =  if (typeName _parameters == "ARRAY") then {_parameters select 0; _isArray = true;} else {_parameters};
_score = if (typeName _parameters == "ARRAY") then {_parameters select 1} else {0};

_parametersTemp = "";

// We need to change the data type from 'ARRAY' to 'STRING' before sending the data to database
if (_isArray) then {
	{
		_parametersTemp = _parametersTemp + str _x;
	} forEach _parameters;
};

_parameters = _parametersTemp;

_response = {};

_procedureCode = "";

if (_procedureName == "RETRIEVE") then {
	_procedureCode = 101;
	["INFORMATION", format ["CallDatabase.sqf: Calling database with procedure: [%1], UID being checked against database is: [%2]. Parameters: %3", _procedureName, _uid, _parameters]] Call WFBE_CO_FNC_LogContent;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};

if (_procedureName == "STORE") then {
	_procedureCode = 202;
	["INFORMATION", format ["CallDatabase.sqf: Calling database with procedure: [%1], score difference: [%2], UID being checked against database is: [%3]. Parameters: %4", _procedureName, _score, _uid, _parameters]] Call WFBE_CO_FNC_LogContent;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};

["INFORMATION", format ["CallDatabase.sqf: Called database with procedure: [%1], RESPONSE IS: [%2]", _procedureName, _response]] Call WFBE_CO_FNC_LogContent;

_response = call compile _response;

_responseCode = _response select 0;
_responseTotalScore = _response select 1;
_responseTicks = _response select 2;
_playerSkill = _responseTotalScore / _responseTicks;

_responseStats = [_responseTotalScore, _responseTicks];

if (typeName _responseCode == "SCALAR") then {
	if (_responseCode < 0) then {
		if (_responseCode == -111) then {
			["ERROR", format ["CallDatabase.sqf: ERROR! Something went wrong with database, check it's error logs. UID: [%1], score attempted to be saved: [%2]. Response code: [%3]",_uid, _score, _responseCode]] Call WFBE_CO_FNC_LogContent;
		};
		if (_responseCode == -222) then {
			["WARNING", format ["CallDatabase.sqf: WARNING! Unusual activity detected by UID: [%1], score difference triggering this alert is [%2]. Player is either a teamkiller or is possibly trying to cheat with the database. Check the logs carefully especially if the score difference is high. Response code: [%3]", _uid, _score, _responseCode]] Call WFBE_CO_FNC_LogContent;
		};
	} else {
		if (_responseCode == 1) then {
			["INFORMATION", format ["CallDatabase.sqf: Called database successfully with procedure: [%1], UID: [%2] with score difference of [%3], and got response: [%4]. Player skill: [%5]).", _procedureName, _uid, _score, _response, _playerSkill]] Call WFBE_CO_FNC_LogContent;
		}
	};
};

/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/

_responseStats
