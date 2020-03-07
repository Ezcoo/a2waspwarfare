/* 
	Author: Benny
	Name: AI_TownPatrol.sqf
	Parameters:
	  0 - Team
	  1 - Town
	  2 - (Radius)
	Description:
	  This file is called upon a resistance / occupation patrol, AI will randomly patrol in towns, including the camps and the depots.
*/

Private ['_camps','_insert','_insertObject','_insertStep','_items','_maxWaypoints','_pos','_radius','_rand1','_rand2','_sideID','_team','_town','_townPos','_type','_update','_usable','_wpcompletionRadius','_wpradius','_wps','_z'];
_team = _this select 0;
_town = _this select 1;
_radius = if (count _this > 2) then {_this select 2} else {30};
if (typeName _town != 'OBJECT') exitWith {["ERROR", Format ["AI_TownPatrol.sqf: Entitie expected, [%1] given", _town]] Call WFBE_CO_FNC_LogContent};
if (isNull _team) exitWith {["ERROR", Format ["AI_TownPatrol.sqf: The given group is null for town [%1]", _town]] Call WFBE_CO_FNC_LogContent};
_townPos = getPos _town;

_camps = _town getVariable 'camps';

_usable = [_town] + _camps;
_maxWaypoints = (missionNamespace getVariable "WFBE_C_TOWNS_PATROL_HOPS") + count(_usable);
_wps = [];

//--- Randomize the behaviours.
_items = ["DIAMOND", "STAG COLUMN", "ECH LEFT", "ECH RIGHT", "WEDGE", "COLUMN"];
_team setFormation (_items select floor(random count _items));
_items = ["YELLOW", "RED"];
_team setCombatMode (_items select floor(random count _items));
_items = ["AWARE", "AWARE", "COMBAT", "STEALTH"];
_team setBehaviour (_items select floor(random count _items));
_items = ["NORMAL", "NORMAL", "LIMITED"];
_team setSpeedMode (_items select floor(random count _items));

//--- Dyn insert.
_insertStep = if (count(_usable) != 0) then {floor(_maxWaypoints / count(_usable))} else {-1};
_insert = _insertStep;
_insertObject = objNull;
_wpradius = -1;
_wpcompletionRadius = -1;

for '_z' from 0 to _maxWaypoints-1 do {
	if (_z == _insert && count _usable > 0) then {
		_insert = _insert + _insertStep;
		_insertObject = _usable select floor(random count _usable);
		_usable = _usable - [_insertObject];
	};

	if (isNull _insertObject) then {
		_rand1 = random _radius - random _radius;
		_rand2 = random _radius - random _radius;
		_pos = [(_townPos select 0)+_rand1,(_townPos select 1)+_rand2,0];
		while {surfaceIsWater _pos} do {
			_rand1 = random _radius - random _radius;
			_rand2 = random _radius - random _radius;
			_pos = [(_townPos select 0)+_rand1,(_townPos select 1)+_rand2,0];
		};
		_wpradius = 32;
		_wpcompletionRadius = 44;
	} else {
		_pos = getPos _insertObject;
		_wpradius = 22;
		_wpcompletionRadius = 68;
	};
	
	_type = if (_z != _maxWaypoints) then {'MOVE'} else {'CYCLE'};
	_wps = _wps + [[_pos,_type,_wpradius,_wpcompletionRadius, "", []]];
};

["INFORMATION", Format ["AI_TownPatrol.sqf: [%1] Team [%2] is patrolling around [%3].", side _team,_team,_town]] Call WFBE_CO_FNC_LogContent;

[_team, true, _wps] Call AIWPAdd;