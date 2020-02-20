private["_tcarm","_units"];

_tcarm = missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_TOWN_RANGE";

while {!gameOver} do {
	_units = (Units Group player) Call GetLiveUnits;

	{
		_town = _x;
		_range = (_town getVariable "range") * _tcarm;
		_visible = false;
		if ((_town getVariable "sideID") == sideID) then {_visible = true} else {{if (_town distance _x < _range) then {_visible = true}} forEach _units};
		_marker = Format ["WFBE_%1_CityMarker", str _town];
		if (_visible) then {_marker setMarkerTextLocal Format["  SV: %1/%2",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"]} else {_marker setMarkerTextLocal ""};
	} forEach towns;
	sleep 5;
};