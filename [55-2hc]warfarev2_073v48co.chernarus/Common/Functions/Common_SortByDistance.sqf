/*
	Return a list of entity or position sorted according to a center.
	 Parameters:
		- Entity.
		- List.
*/

Private["_current","_nearest","_nearestDistance","_object","_objects","_sorted","_distance","_index"];

_object = _this select 0;
_objects = +(_this select 1);

_sorted = [];
for '_i' from 0 to count(_objects)-1 do {
	_nearest = ObjNull;
	_nearestDistance = 100000;
	_index = -1;

	for '_j' from count(_objects)-1 to 0 step -1 do {
		_current = _objects select _j;

		diag_log format ["_current value: %1, type: %2",_current, typeName _current];
		diag_log format ["_object value: %1, type: %2",_object, typeName _object];

		_distance = _current distance _object;
		if (_distance < _nearestDistance) then {_nearest = _current;_nearestDistance = _distance;_index = _j};
	};

	[_sorted, _nearest] Call WFBE_CO_FNC_ArrayPush;
	_objects set [_index, "!"];
	_objects = _objects - ["!"];
};

_sorted