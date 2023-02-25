// Call to database
private ["_procedureName","_procedureCode","_attemptsMax","_attempts","_responseReceived","_parameters","_uid","_score","_requestID","_response","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp"];

_procedureName = _this select 0;
_parameters = _this select 1;
_sleep = if (count _this > 2) then {_this select 2} else {0.05};

_uid = _parameters;

// We need to change the data type from 'ARRAY' to 'STRING' before sending the data to database

_requestID= {};

_procedureCode = "";

if (_procedureName == "RETRIEVE") then {
	_procedureCode = 101;
	["INFORMATION", format ["CallDatabaseRetrieve.sqf: Calling database with procedure: [%1], UID being checked against database is: [%2]. Parameters: %3", _procedureName, _uid, _parameters]] Call WFBE_CO_FNC_LogContent;
	_requestID= "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};


["INFORMATION", format ["CallDatabaseRetrieve.sqf: Called database with procedure: [%1], RESPONSE (REQUEST ID) IS: %2", _procedureName, _requestID]] Call WFBE_CO_FNC_LogContent;

_requestID = call compile _requestID;

diag_log _requestID;

// Strip request ID from the response body
diag_log "Stripping request ID from the response body...";
_requestID = _requestID select 1;

diag_log _requestID;

_procedureCodeTryRetrieve = 505;
_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCodeTryRetrieve,_requestID];
_response = call compile _response;
_responseCode = _response select 0;
_attemptsMax = 120;
_attempts = 0;

while { (_responseCode < 0) && (_attempts < _attemptsMax) } do 
{
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCodeTryRetrieve,_requestID];
	
	_response = call compile _response;
	
	_responseCode = _response select 0;

	_attempts = _attempts + 1;
	sleep _sleep;
};

if (_responseCode < 0) then {
	["ERROR", format ["CallDatabaseRetrieve.sqf: CRITICAL ERROR! Something went wrong with database. Couldn't retrieve player UID [%1] stats. Request ID: %2",_uid, _requestID]] Call WFBE_CO_FNC_LogContent;
	_responseStats = [1, 1];
	_responseStats;
} else {
	_responseTotalScore = _response select 1;
	_responseTicks = _response select 2;
	
	_responseStats = [_responseTotalScore, _responseTicks];
	_responseStats;
};

/*
_responseCode = _response select 0;
_responseTotalScore = _response select 1;
_responseTicks = _response select 2;
_playerSkill = _responseTotalScore / _responseTicks;

_responseStats = [_responseTotalScore, _responseTicks];

if (typeName _responseCode == "SCALAR") then {
	if (_responseCode < 0) then {
		if (_responseCode == -111) then {
			["ERROR", format ["CallDatabaseRetrieve.sqf: CRITICAL ERROR! Something went wrong with database, check it's error logs. UID: [%1]. Response code: %3",_uid, _responseCode]] Call WFBE_CO_FNC_LogContent;
		};
	} else {
		if (_responseCode == 1) then {
			["INFORMATION", format ["CallDatabaseRetrieve.sqf: Called database successfully with procedure: [%1], UID: [%2], and got response code: %3. Player skill: [%4].", _procedureName, _uid, _response, _playerSkill]] Call WFBE_CO_FNC_LogContent;
		};
	};
};
*/
/*
if (count _response > 0) then {
	_response = _response select 0;
};
*/