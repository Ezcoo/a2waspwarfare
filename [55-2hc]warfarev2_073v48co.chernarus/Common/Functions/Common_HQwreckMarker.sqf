_hq = (sideJoined) call WFBE_CO_FNC_GetSideHQ;

hintSilent "mofo swedish";

_hq addEventHandler ["Killed", {
	_hq = _this select 0;

	hintSilent "oh no!!! the hq was destroyed... oh noooo, I know...";

	_markerType = "mil_dot";
	_markerColour = "ColorOrange";
	_markerText = "HQ Wreck";
	_markerName = format ["WF_hqwreck_side_%1", side player];
	_markerSize = [1, 1];

	createMarkerLocal [_markerName, position _hq];
}];