/*
This script allows the player to adjust view distance with the custom action keys 19 and 20.

TODO: Adjustable by slider that how much the view distance will change per key press

Author: Miksuu
*/
Private ["_key","_adjustViewDistanceBy","_newViewDistance"];
_key = _this select 1;
_adjustViewDistanceBy = 1000;

//--- Decrease View Distance
if (_key in (actionKeys "User19")) then {
    _newViewDistance = viewDistance - _adjustViewDistanceBy max 1;
    setViewDistance _newViewDistance;
    (format ["View distance decreased to: %1", str(_newViewDistance)]) call GroupChatMessage;
};

//--- Increase View Distance
if (_key in (actionKeys "User20")) then {
    _newViewDistance = viewDistance + _adjustViewDistanceBy min WFBE_C_ENVIRONMENT_MAX_VIEW;
    setViewDistance _newViewDistance;
    (format ["View distance increased to: %1", str(_newViewDistance)]) call GroupChatMessage;
};