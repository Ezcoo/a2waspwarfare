// Call to database
private ["_procedureName","_procedureCode","_parameters","_uid","_score","_response","_requestID","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp","_side","_responseTotalSkill","_sleep","_procedureCodeRequestTotalSkill","_attempts","_attemptsMax","_sideAsNumber"];

_procedureName = _this select 0;
_side = _this select 1;
_sleep = 0.50;

_sideAsNumber = 0;

if (_side == west) then {
	_sideAsNumber = 1;
};

if (_side == east) then {
	_sideAsNumber = 2;
};

_requestID = {};

_procedureCode = "";

if (_procedureName == "REQUEST_SIDE_SKILL") then {
	_procedureCode = 606;
	["INFORMATION", format ["CallDatabaseRequestSideTotalSkill.sqf: Calling database with procedure: [%1]. Side: %2", _procedureName, _side]] Call WFBE_CO_FNC_LogContent;
	_requestID = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_sideAsNumber];
};

_requestID = call compile _requestID;

// Strip request ID from the response body
_requestID = _requestID select 1;

// ["INFORMATION", format ["CallDatabaseRequestSideTotalSkill.sqf: Called database with procedure: [%1], RESPONSE (REQUEST ID) IS: %2", _procedureName, _requestID]] Call WFBE_CO_FNC_LogContent;

["INFORMATION", format ["CallDatabaseRequestSideTotalSkill.sqf: Procedure: [%1]. Request ID is: %2, starting to poll the database for result with the ID.",_procedureName,_requestID]] Call WFBE_CO_FNC_LogContent;

_procedureCodeRequestTotalSkill = 707;
_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCodeRequestTotalSkill,_requestID];
_response = call compile _response;
_responseCode = _response select 0;
_attemptsMax = 20;
_attempts = 0;

while { (_responseCode < 0) && (_attempts < _attemptsMax) } do 
{
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCodeRequestTotalSkill,_requestID];
	
	_response = call compile _response;
	
	_responseCode = _response select 0;

	_attempts = _attempts + 1;
	sleep _sleep;
};

if (_responseCode < 0) then {
	["ERROR", format ["CallDatabaseRequestSideTotalSkill.sqf: CRITICAL ERROR! Something went wrong with database. Couldn't retrieve team: [%1] stats. Request ID: %2",_side, _requestID]] Call WFBE_CO_FNC_LogContent;
	_responseStats = [1, 1];
	_responseStats;
} else {
	["INFORMATION", format ["CallDatabaseRequestSideTotalSkill.sqf: Received requested data from database with request ID: %1.",_requestID]] Call WFBE_CO_FNC_LogContent;
	_responseTotalSkill = _response select 1;

	["INFORMATION", format ["CallDatabaseRequestSideTotalSkill.sqf: Response from database with request ID: %1 is: Total team skill is: %2",_requestID,_responseTotalSkill]] Call WFBE_CO_FNC_LogContent;
	_responseTotalSkill;
};