private ["_unit","_weapon","_rocket","_ammo","_missile","_currentMag","_ammoCount"];

_unit = _this select 0;
_weapon = currentWeapon _unit;
_muzzle = currentMuzzle (gunner (vehicle _unit));
_ammo = _this select 4;
_rocket = nearestObject [_unit,_ammo];
_reloadTime = 0;

if (isNull _rocket || ({isPlayer _x} count (crew _unit) == 0)) exitwith {};

_missile = ["M_TOW_AT"];

if (!(_ammo in _missile)) exitWith {};

_currentMag = currentMagazine (vehicle _unit);
_ammoCount = _unit ammo _weapon;

(vehicle _unit) removeMagazine (_currentMag);
(vehicle _unit) setWeaponReloadingTime [gunner (vehicle _unit), _muzzle, _reloadTime];
(vehicle _unit) addMagazine [_currentMag, _ammoCount];
(vehicle _unit) setWeaponReloadingTime [gunner (vehicle _unit), _muzzle, _reloadTime];

reload (vehicle _unit);