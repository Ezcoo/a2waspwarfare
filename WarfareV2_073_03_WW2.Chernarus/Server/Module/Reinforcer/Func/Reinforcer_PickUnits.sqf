Private ["_array", "_eligible", "_row", "_sv", "_town", "_units"];

_units = _this select 0;
_town = _this select 1;

_sv = _town getVariable "supplyValue";

//--- First, retrieve the units that we can retrieve.
_eligible = [];
for '_i' from 0 to count(_units)-1 do {
	_row = _units select _i;
	if (_sv >= (_row select 1)) then {
		[_eligible, _row] Call WFBE_CO_FNC_ArrayPush;
	};
};

if (count _eligible < 1) exitWith {[]};

//--- Now we create a force array.
_array = [];
{
	for '_i' from 1 to (_x select 2) do {[_array, _x] Call WFBE_CO_FNC_ArrayPush};
} forEach _eligible;

_array = (_array) Call WFBE_CO_FNC_ArrayShuffle;

(_array select floor(random count _array)) select 0