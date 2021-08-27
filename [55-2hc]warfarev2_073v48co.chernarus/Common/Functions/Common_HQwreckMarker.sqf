Private ["_deathMarkerColor","_deathMarkerSize","_deathMarkerType","_delete","_deletePrevious","_markerColor","_markerName","_markerSize","_markerType","_markerText","_refreshRate","_trackDeath","_tracked","_side","_hqWreck"];

waitUntil {commonInitComplete};

_markerType = _this select 0;
_markerColor = _this select 1;
_markerText = _this select 2;
_markerName = _this select 3;
_side = _this select 4;
_hqWreck = _this select 5;
_markerSize = [1,1];

if (_side != side player) exitWith {};

createMarkerLocal [_markerName, getPos _hqWreck];
if (_markerText != "") then {_markerName setMarkerTextLocal _markerText};
_markerName setMarkerTypeLocal _markerType;
_markerName setMarkerColorLocal _markerColor;
_markerName setMarkerSizeLocal _markerSize;

missionNamespace setVariable format [["WFBE_C_HQWRECK_EXISTS_SIDE_%1", _side], true];
waitUntil {!(missionNamespace getVariable format ["WFBE_C_HQWRECK_EXISTS_SIDE_%1", _side])};

deleteMarkerLocal _markerName;