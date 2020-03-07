Private ["_a", "_distance_node", "_nodes", "_nodes_a", "_places", "_places_meadow", "_side", "_town", "_water_percent"];

_town = _this select 0;
_side = _this select 1;

_position = position _town;

//--- Prepare the scan area.
_nodes_a = [];
_distance_node = (missionNamespace getVariable "REINFORCER_RANGE_SPAWN_SEA_RANGE") + (missionNamespace getVariable "REINFORCER_RANGE_RANDOMIZE") - (missionNamespace getVariable "REINFORCER_RANGE_RANDOMIZE");
_nodes = round(4.14375 * _distance_node) / 255; //--- Todo find a better solution (or a mathematician wizard)!
_angle = 360/_nodes;
for '_i' from 0 to _nodes-1 do {
	_a = (_angle*_i) mod 360;
	_nodes_a = _nodes_a + [[(_position select 0) + _distance_node * sin(_a),(_position select 1) + _distance_node * cos(_a)]];
};

//--- Let's try to grab some water!
_places_meadow = [];
{
	_places = selectBestPlaces [_x, 200, "(1 * meadow) * (1 - sea) * (1 - hills) * (1 - houses) * (1 - forest) * (1 - trees)", 8, 2]; //--- 0 to 1. 1 is full meadow. Anything above 0.1 can be -safely- used!
	{if ((_x select 1) > 0.1) then {[_places_meadow, _x select 0] Call WFBE_CO_FNC_ArrayPush}} forEach _places;
} forEach _nodes_a;

//--- We try to remove the places which may be too close of another town or too close to some enemies.
_temp = +_places_meadow;
for '_i' from 0 to count(_places_meadow)-1 do {
	_near = ((_temp select _i) nearEntities [WFBE_Logic_Depot, 550]) - [_town];
	if (count _near > 0) then {
		if ({isNil{_x getVariable "wfbe_inactive"}} count _near > 0) then {_temp set [_i, false]};
	};
	if (typeName(_temp select _i) != "BOOL") then {
		if (([(_temp select _i) nearEntities [["Man","Car","Motorcycle","Tank","Ship"], 275], _side] Call WFBE_CO_FNC_GetAreaEnemiesCount) > 0)
	};
};
_temp = _temp - [false];

//--- If we can't spawn them due to towns! we spawn them anyway!
if (count _temp > 0) then {_places_meadow = _temp};

//--- Get the percentage of water from our nodes.
_meadow_percent = (count(_places_meadow) / (4 * _nodes)) * 100;

//--- Return the water positions and the percentage of water available.
[_places_meadow, _meadow_percent]