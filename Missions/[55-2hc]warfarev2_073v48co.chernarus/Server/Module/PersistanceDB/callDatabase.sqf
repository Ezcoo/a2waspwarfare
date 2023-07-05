// Call to database
private ["_procedureName","_parameters","_response","_databaseName"];

_databaseName = "arma2warfare";

_procedureName = _this select 0;
_parameters = _this select 1;

	_response = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['%1','%2','%3']", _databaseName,_procedureName,_parameters];
	_response = call compile _response;


if (count _response > 0) then {
	_response = _response select 0;
};



_response
