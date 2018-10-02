/*
Author: Die neunte Seele / Midnattsol
*/

private ["_key","_handled","_tabbuttons"];

_key = _this select 1;
_handled = false;
_tabbuttons = actionKeys "VehLockTargets";

if (_key in _tabbuttons) then 
  {
     _handled = true;
     //hintsilent ("Tablock was disabled");
  };

_handled