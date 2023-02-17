WFBE_CO_fnc_findVariableInNestedArray = {
	// Get parameters
	_arrArray = (_this select 0);
	_iArraySize = (count _arrArray);
	_varValue = (_this select 1);

	_iRetVal = -1;

	// Loop trough arrArray
	for "_i" from 0 to (_iArraySize - 1) do {
		// If array in nested array return val = position in nested array
		if (_varValue in (_arrArray select _i)) then {
			_iRetVal = _i;
		};
	};

	// Return val
	_iRetVal
};