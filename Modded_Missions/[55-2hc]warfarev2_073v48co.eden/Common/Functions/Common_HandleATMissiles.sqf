private ["_u","_wpn","_rkt","_am","_sspd","_msl","_acc","_sltd"];

_u = _this select 0;
_wpn = currentWeapon _u;
_am = _this select 1;
_rkt = nearestObject [_u,_am];
_sspd=0;
_sltd = 900;
_acc = 0.5;
if (isNull _rkt ||({isPlayer _x} count (crew _u) == 0)) exitwith {};

_msl = ["M_AT10_AT","M_AT11_AT"];

if (!(_am in _msl)) exitWith{};

Switch (true) do {
	case (_am isKindOf "M_AT10_AT") : {_sltd = 860;_acc = 0.6;};
	case (_am isKindOf "M_AT11_AT") : {_sltd = 900;_acc = 0.5;};
};

_fp = getPosASL _rkt;
_sspd = (velocity _rkt) distance [0,0,0];
_spd = _sspd;

_wpdr=_u weapondirection _wpn;
While {!isNull _rkt} do {
	 _trvldis = _fp distance _rkt;
	 _wpdrn=_wpdr distance [0,0,0];
	 _wp=[(_wpdr select 0)/_wpdrn,(_wpdr select 1)/_wpdrn,(_wpdr select 2)/_wpdrn];
	 _t = _trvldis/_spd;
	 _spd = _sltd - (_sltd-_sspd) * exp( (-1)*_acc*(_t));
    _rkt setvectorDirandUp [[(_wp select 0),(_wp select 1),(_wp select 2)],[0,0,1]];
    _rkt setVelocity [(_wp select 0)*_spd,(_wp select 1)*_spd,(_wp select 2)*_spd];
};
exit;


