private ["_u","_wpn","_rkt","_am","_msl","_cmag","_ammocount"];

_u = _this select 0;
_wpn = currentWeapon _u;
_am = _this select 4;
_rkt = nearestObject [_u,_am];

if (isNull _rkt ||({isPlayer _x} count (crew _u) == 0)) exitwith {};
_msl = ["M_AT10_AT","M_AT11_AT"];
if (!(_am in _msl)) exitWith{};

_cmag= currentMagazine (vehicle _u);
_ammocount=_u ammo _wpn;
//hintsilent format ["%1",_ammocount];
(vehicle _u) removeMagazine (_cmag);
sleep 20;
(vehicle _u) addMagazine [_cmag,_ammocount];