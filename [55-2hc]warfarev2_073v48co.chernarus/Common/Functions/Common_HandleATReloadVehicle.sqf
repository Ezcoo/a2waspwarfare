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

(vehicle _unit) removeMagazineTurret [_currentMag, [0]];

for "_i" from 25 to 1 step -1 do {
    hintSilent format ["%1 missiles left, %2 seconds left to reload", _ammoCount, _i];
    sleep 1;
};

(vehicle _unit) addMagazineTurret [_currentMag, [0], _ammoCount];
// (vehicle _unit) loadMagazine [[0], _weapon, _currentMag];