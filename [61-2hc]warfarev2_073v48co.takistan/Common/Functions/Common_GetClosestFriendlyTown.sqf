Private["_friendlyTowns","_object","_nearest","_side"];

_friendlyTowns = (side player) Call GetSideTowns;

// diag_log ((side player) Call GetSideTowns);

_nearest = objNull;

if ((count _friendlyTowns) > 0) then {
	_nearests = [player,_friendlyTowns] Call SortByDistance;
	_nearest = _nearests select 0;
};

_nearest