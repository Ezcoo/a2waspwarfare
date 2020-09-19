private ["_unit","_weapon","_reduction","_affected"];


_unit = _this select 0;
_weapon = currentMuzzle (gunner (vehicle _unit));
_reloadTime = 1;
_affected = ["AT5LauncherSingle","M242BC","M242","2A46MRocket","M_TOW_AT","M_TOW_AT2"];

if !(_weapon in _affected) exitWith {};

switch (_weapon) do {
	case ("AT5LauncherSingle"): {_reloadTime = 0.3};
	case ("M242BC"): {_reloadTime = 0.5};
	case ("M242"): {_reloadTime = 0.5};
	case ("M_TOW_AT"): {_reloadTime = 25};
	case ("M_TOW_AT2"): {_reloadTime = 25};

};

(vehicle _unit) setWeaponReloadingTime [gunner ( vehicle _unit), _weapon, _reloadTime];


