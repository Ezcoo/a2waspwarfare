// Call to database
private ["_procedureName","_procedureCode","_parameters","_uid","_score","_response","_responseCode","_responseTotalScore","_responseTicks","_playerSkill","_responseStats","_isArray","_parametersTemp","_side"];

_procedureName = _this select 0;
_parameters = _this select 1;
_isArray = typeName _parameters == "ARRAY";

_parametersTemp = "";

if (_isArray) then {

	{
		_guid = _x select 0;
		_side = _x select 1;
		
		_parametersTemp = _parametersTemp + "," + _guid;

		if (_side == west) then {
			_side = 1;
		};

		if (_side == east) then {
			_side = 2;
		};

		_parametersTemp = _parametersTemp + "," + _side;

	} forEach _parameters;
};

_parameters = _parametersTemp;

_response = {};

_procedureCode = "";

if (_procedureName == "SEND_PLAYERLIST") then {
	_procedureCode = 303;
	["INFORMATION", format ["CallDatabase.sqf: Calling database with procedure: [%1]. Parameters: %2", _procedureName, _parameters]] Call WFBE_CO_FNC_LogContent;
	_response = "A2WaspDatabase" callExtension format ["%1,%2",_procedureCode,_parameters];
};

["INFORMATION", format ["CallDatabase.sqf: Called database with procedure: [%1], RESPONSE IS: [%2]", _procedureName, _response]] Call WFBE_CO_FNC_LogContent;

_response = call compile _response;

_responseCode = _response select 0;

if (_responseCode < 0) then {
	["ERROR", format ["CallDatabase.sqf: CRITICAL ERROR! Something went wrong with database, check it's error logs. Procedure name: [%1], response code: [%2]", _procedureName, _responseCode]] Call WFBE_CO_FNC_LogContent;
};