Private ["_a", "_distance_node", "_nodes", "_nodes_a", "_places", "_places_water", "_town", "_water_percent"];

_town = _this;

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
_places_water = [];
{
	_places = selectBestPlaces [_x, 200, "(1 * sea) * (1 - meadow) * (1 - hills) * (1 - houses) * (1 - forest) * (1 - trees)", 8, 3]; //--- 0 to 1. 1 is full sea.
	{if ((_x select 1) == 1) then {[_places_water, _x select 0] Call WFBE_CO_FNC_ArrayPush}} forEach _places;
} forEach _nodes_a;

//--- Get the percentage of water from our nodes.
_water_percent = (count(_places_water) / (4 * _nodes)) * 100;

//--- Return the water positions and the percentage of water available.
[_places_water, _water_percent]