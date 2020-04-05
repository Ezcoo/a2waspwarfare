/*
	author: Net_2
	description: none
	returns: cursorTarget or player in cursorTarget vehicle if the cursorTarget is visible to player
*/

_visibleTarget = objNull;

player reveal cursorTarget;

if (vehicle cursorTarget == cursorTarget) then {
    _cursorTarget = cursorTarget;
} else {
    _cursorTarget = effectiveCommander cursorTarget;
};

if (!(lineIntersects [eyePos player, eyePos _cursorTarget, vehicle player, vehicle _cursorTarget])) then {
    _visibleTarget = _cursorTarget;
};

_visibleTarget;