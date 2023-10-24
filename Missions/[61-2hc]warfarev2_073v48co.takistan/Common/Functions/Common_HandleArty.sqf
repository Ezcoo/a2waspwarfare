private ["_vehicle","_unit","_isrestricted"];

_unit = _this select 2;
_vehicle = _this select 0;
_isrestricted = _vehicle getVariable "restricted";

waituntil {_isrestricted && ({isPlayer _x} count (crew _vehicle) != 0)};
_unit action  ["getOut", _vehicle];hintsilent "ARTILLERY MISSION RUNNING";

