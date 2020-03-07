Private ["_a", "_distance_node", "_nodes", "_nodes_a", "_town"];

_town = _this;

_position = position _town;

//--- Prepare the scan area.
_nodes_a = [];
_distance_node = (missionNamespace getVariable "REINFORCER_RANGE_SPAWN_AIR_RANGE") + (missionNamespace getVariable "REINFORCER_RANGE_RANDOMIZE") - (missionNamespace getVariable "REINFORCER_RANGE_RANDOMIZE");
_nodes = round(4.14375 * _distance_node) / 255; //--- Todo find a better solution (or a mathematician wizard)!
_angle = 360/_nodes;
for '_i' from 0 to _nodes-1 do {
	_a = (_angle*_i) mod 360;
	_nodes_a = _nodes_a + [[(_position select 0) + _distance_node * sin(_a),(_position select 1) + _distance_node * cos(_a)]];
};

_nodes_a