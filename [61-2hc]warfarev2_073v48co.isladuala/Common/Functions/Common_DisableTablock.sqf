/*
Author: Die neunte Seele / Midnattsol
Edited by Net_2
*/

private ["_key","_handled","_tabbuttons"];

_key = _this select 1;
_handled = false;
_tabbuttons = actionKeys "VehLockTargets";

if ((vehicle player isKindOf "Air") || ((typeOf vehicle player == "2S6M_Tunguska") && (currentWeapon (vehicle player) == "9M311Laucher")) || ((typeOf vehicle player == "M6_EP1") && (currentWeapon (vehicle player) == "9M311Laucher")) || (vehicle player == player)) then {
    _handled = false;

} else {
    if (_key in _tabbuttons) then {
            _handled = true;
    };
};

_handled