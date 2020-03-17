/*
	author: Net_2
	description: none
	returns: alpha value for ctrl
*/

private _distance = player distance cursorTarget;
private _zoom = call WFBE_CL_FNC_NET_KK_fnc_TrueZoom;

private _alpha = 0;

if ((_distance / _zoom) < 60) then {
    _alpha = -(_distance / _zoom / 30) + 2;
};

if (_alpha < 0) then {
    _alpha = 0;
};

if (_alpha > 1) then {
    _alpha = 1;
};

_alpha;