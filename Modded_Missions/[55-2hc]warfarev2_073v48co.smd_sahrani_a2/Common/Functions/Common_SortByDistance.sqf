/*
	Return a list of entity or position sorted according to a center.
	 Parameters:
		- Entity.
		- List.
*/

Private["_current","_nearest","_nearestDistance","_object","_objects","_sorted"];

_object = _this select 0;
_objects = +(_this select 1);

_sorted = [];
for '_i' from 0 to count(_objects)-1 do {
	_nearest = ObjNull;
	_nearestDistance = 100000;
	_index = -1;

	for '_j' from count(_objects)-1 to 0 step -1 do {
		_current = _objects select _j;
		
		// Marty : debugging Common_SortByDistance.sqf
		//diag_log format[ "DEBUG Common_SortByDistance.sqf _current = %1 | type = %2", _current, typeName _current ]; // Marty debugging.
		//diag_log format[ "DEBUG Common_SortByDistance.sqf _object = %1 | type = %2", _object, typeName _object ]; // Marty debugging.

		_distance = _current distance _object;

		//diag_log format[ "DEBUG Common_SortByDistance.sqf _distance = %1 | type = %2", _distance, typeName _distance ]; // Marty debugging.
		
		if (_distance < _nearestDistance) then {_nearest = _current;_nearestDistance = _distance;_index = _j};
	};

	[_sorted, _nearest] Call WFBE_CO_FNC_ArrayPush;
	_objects set [_index, "!"];
	_objects = _objects - ["!"];
};

_sorted