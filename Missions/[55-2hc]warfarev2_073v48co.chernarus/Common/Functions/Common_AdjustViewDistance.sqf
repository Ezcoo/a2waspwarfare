/*
This script allows the player to adjust view distance with the custom action keys 19 and 20.

TODO: Adjustable by slider that how much the view distance will change per key press

Author: Miksuu
*/
Private ["_key","_adjustViewDistanceBy","_newViewDistanceToBeSet"];
_key = _this select 1;

_adjustViewDistanceBy = 1000;

//--- Decrease View Distance
if (_key in (actionKeys "User19")) then {
    //_adjustViewDistanceTimerScript = compile preprocessFile "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";

    if (newViewDistance == 0) then
    {
        _newViewDistanceToBeSet = viewDistance;
    } else {
        _newViewDistanceToBeSet = newViewDistance;
    };

    newViewDistance = _newViewDistanceToBeSet - _adjustViewDistanceBy max 1;
    (format ["Setting view distance to: %1", str(newViewDistance)]) call GroupChatMessage;
    execVm "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";
};

//--- Increase View Distance
if (_key in (actionKeys "User20")) then {
    //_adjustViewDistanceTimerScript = compile preprocessFile "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";

    if (newViewDistance == 0) then
    {
        _newViewDistanceToBeSet = viewDistance;
    } else {
        _newViewDistanceToBeSet = newViewDistance;
    };

    newViewDistance = _newViewDistanceToBeSet + _adjustViewDistanceBy min WFBE_C_ENVIRONMENT_MAX_VIEW;
    (format ["Setting view distance to: %1", str(newViewDistance)]) call GroupChatMessage;
    [] execVm "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";
};

false