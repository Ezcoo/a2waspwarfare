/*
Author: Die neunte Seele / Midnattsol
Edited by Net_2
*/

private ["_key","_handled","_tabbuttons"];

_key = _this select 1;
_handled = false;
_tabbuttons = actionKeys "VehLockTargets";

if (!(vehicle player isKindOf "Air")) then {
    if (_key in _tabbuttons)  then
        {
            _handled = true;
            hintsilent ("Tablock is disabled for ground vehicles");
    };
};

_handled