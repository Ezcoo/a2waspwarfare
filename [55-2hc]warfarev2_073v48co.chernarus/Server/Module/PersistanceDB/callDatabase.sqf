// Call to database
private ["_className","_procedureName","_response","_uid"];

_className = _this select 0;
_procedureName = _this select 1;
_uid = _this select 2;

	_response = "Arma2Net.Unmanaged" callExtension format["%1 [%2,%3]",_classname,_procedureName,_uid];
	_response = call compile _response;


if (count _response > 0) then {
	_response = _response select 0;
};

_response
