private ["_unit","_weapon","_reduction","_affected"];

_unit = _this select 0;
_weapon = currentMuzzle (commander (vehicle _unit));
_reloadTime = 1;
_affected = ["M242BC","M242"];

if !(_weapon in _affected) exitWith {};

switch (_weapon) do {
	case ("M242BC"): {_reloadTime = 0.5};
	case ("M242"): {_reloadTime = 0.5};
};

(vehicle _unit) setWeaponReloadingTime [commander ( vehicle _unit), _weapon, _reloadTime];


