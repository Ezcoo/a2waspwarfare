Private ["_loadout", "_vehicle"];

_vehicle = _this select 0;
_loadout = _this select 1;

{_vehicle removeMagazine _x} forEach (_loadout select 1);
{_vehicle removeWeapon _x} forEach (_loadout select 0);