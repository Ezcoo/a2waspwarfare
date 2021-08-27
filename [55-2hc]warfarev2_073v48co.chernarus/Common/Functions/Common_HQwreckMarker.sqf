Private ["_deathMarkerColor","_deathMarkerSize","_deathMarkerType","_delete","_deletePrevious","_markerColor","_markerName","_markerSize","_markerType","_markerText","_refreshRate","_trackDeath","_tracked","_side","_hqWreck","_hq"];

waitUntil {commonInitComplete};

_side = side player;
_markerType = "mil_dot";
_markerColor = "ColorOrange";
_markerText = "HQ Wreck";
_markerName = format ["WF_hqwreck_side_%1", _side];
_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
_markerSize = [1,1];

missionNamespace setVariable format [["WFBE_C_HQWRECK_EXISTS_SIDE_%1", _side], false];

while {!WFBE_GameOver} do {
	if (_side != side player) exitWith {};

	if (!(alive _hq)) then {

		createMarkerLocal [_markerName, getPos _hq];
		if (_markerText != "") then {_markerName setMarkerTextLocal _markerText};
		_markerName setMarkerTypeLocal _markerType;
		_markerName setMarkerColorLocal _markerColor;
		_markerName setMarkerSizeLocal _markerSize;

		missionNamespace setVariable format [["WFBE_C_HQWRECK_EXISTS_SIDE_%1", _side], true];
	};

	waitUntil {!(missionNamespace getVariable format ["WFBE_C_HQWRECK_EXISTS_SIDE_%1", _side])};

	deleteMarkerLocal _markerName;

	sleep 5;
};
