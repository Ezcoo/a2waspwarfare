/*
	@author Häz

	@params
		0:
			@paramName           _name
			@paramDescription    The name of the data in which you want to retrieve.
			@paramType           string

		1:
			@paramName           _defaultFallback
			@paramDescription    The default fallback to return if no data could be retrieved.
			@paramType           any

	@returns
		@returnDescription       Returns the retrieved persisted or the set 'default fallback'.
		@returnType			     boolean
*/

if (!isServer) exitWith {};

private ["_name", "_fallback"];

_name = _this select 0;
_data = _this select 1;

profileNamespace setVariable [_name, _data];