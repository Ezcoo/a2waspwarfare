private ["_unit","_weapon","_rocket","_ammo","_missile","_currentMag","_ammoCount"];

_unit = _this select 0;
_weapon = currentWeapon _unit;
_ammo = _this select 4;
_rocket = nearestObject [_unit,_ammo];

if (isNull _rocket || ({isPlayer _x} count (crew _unit) == 0)) exitwith {};

_missile = ["M_TOW_AT"];

if (!(_ammo in _missile)) exitWith {};

_currentMag = currentMagazine (vehicle _u);
_ammocount = _unit ammo _weapon;
//hintsilent format ["%1",_ammocount];
(vehicle _unit) removeMagazine (_currentMag);
sleep 17;
(vehicle _unit) addMagazine [_currentMag,_ammocount];