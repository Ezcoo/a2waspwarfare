/*
This script allows air vehicles and Linebacker and Tunguska to use Tablock, but prohibits anything else doing so
return value: true (tablock disabled), false (tablock enabled for Air and ground vehicles Linebacker/Tunguska with their rockets)

TODO: Add vehicles such as Avenger, BRDM AA (later) to this script

Author: Die neunte Seele / Midnattsol, Miksuu
*/

private ["_key", "_handled", "_tabbuttons", "_vehicle"];

_key = _this select 1;
_handled = false;
_tabbuttons = actionKeys "VehLockTargets";

_vehicle = vehicle player;

if ((vehicle player isKindOf "Air") ||
    ((typeOf _vehicle == "M6_EP1") && (currentWeapon _vehicle == "9M311Laucher")) ||
    ((typeOf _vehicle == "2S6M_Tunguska") && (currentWeapon _vehicle == "9M311Laucher"))) then
{
    _handled = false
}
else
{
    if (_key in _tabbuttons) then
    {
        // hintsilent "Tablock was disabled";
        _handled = true
    }
};

_handled