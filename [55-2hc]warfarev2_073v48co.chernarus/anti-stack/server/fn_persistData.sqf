/*
	@author Häz

	@params
		0:
			@paramName           _name
			@paramDescription    The name which was used to reference the persisted data.
			@paramType           string

		1:
			@paramName           _data
			@paramDescription    The data to be persisted.
			@paramType           <any>

		2:
			@paramName           _duration
			@paramDescription    The duration (in seconds) of how long the data is retained for.
			@paramType           integer

	@returns
		@returnDescription       Returns the status of whether the data was successfully persisted (saved).
		@returnType			     boolean
*/

if (!isServer) exitWith {};

private ["_name", "_data", "_duration"];

_name = _this select 0;
_data = _this select 1;
_duration = _this select 2;

profileNamespace setVariable [_name, _data];