// [_var, _action] call persistent_fnc_convertFormat
//
/* "ARRAY",
"BOOL",
"CODE",
"CONFIG",
"CONTROL",
"DISPLAY",
"GROUP",
"LOCATION",
"OBJECT",
"SCALAR",
"SCRIPT",
"SIDE",
"STRING",
"TEXT". */
// write action Converts to STRING for entry to database
// read action Converts from STRING to SQF
private ["_var", "_action", "_origvar"];

_origvar = _this select 0;
_action = _this select 1;


	diag_log format["Running conversion function... on %1 type %2", _origvar, typeName _origvar];


if (_action == "write") then {

	if (typename _origvar == "OBJECT") then {
		_var = str(_origvar);
	};

	if (typename _origvar == "ARRAY") then {
		_var = str(_origvar);
		_var = [_var, ",", "|"] call CBA_fnc_replace;
		if ([_var] call CBA_fnc_strLen < 2) then {_var = "";};
	};

	if (typename _origvar == "SIDE") then {
		_var = str(_origvar);
	};

	if (typename _origvar == "BOOL") then {
		_var = str(_origvar);
		if (isNil _var) then {_var = "false";};
	};

	if (typename _origvar == "SCALAR") then {
		_var =  str(_origvar);
		if ([_var,","] call CBA_fnc_find !=-1) then {
			_var = [_var,",","."] call CBA_fnc_replace;
		};
	};

	if (typename _origvar == "STRING") then {
		_var =  _origvar;
	};


	diag_log format["Converted %1 (%2) to %3 (%4) for DB", _origvar, typeName _origvar, _var, typeName _var];

};

if (_action == "read") then {

	if ([_origvar, "|"] call CBA_fnc_find != -1) then {		// If string was array convert to array
		_var = [_origvar, "|", ","] call CBA_fnc_replace;
		//_var = "[" + _var + "]";
		_var = call compile _var;
	} else {
		if ((parseNumber _origvar == 0) && ([_origvar] call CBA_fnc_strLen > 1)) then {	// Check to see if string was originally a string. This will not work properly if an attribute is a 1 character letter or if string is a set of numbers
			_var = _origvar;
		} else {
			if (_origvar == "") then {
				_var = "";
			} else {
				_var =  parseNumber _origvar; // If not array or string, must be number.
			};
		};
	};


	diag_log format["Converted %1 (%2) to %3 (%4) for SQF", _origvar, typeName _origvar, _var, typeName _var];

};


_var