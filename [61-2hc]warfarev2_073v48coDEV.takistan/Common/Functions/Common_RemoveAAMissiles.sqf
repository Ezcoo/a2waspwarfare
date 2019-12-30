/*
	Remove AA missiles from the given vehicle..
	 Parameters:
		- Unit
*/

Private ["_cms","_magazines","_unit","_weapons"];

_unit = _this;

_weapons = weapons _unit;
_magazines = magazines _unit;

_weapons_remove = [];
_magazines_remove = [];

//--- Find AA Lock weapons.
{
	_remove = false;
	
	{
		_ammo = getText(configFile >> "CfgMagazines" >> _x >> "ammo"); //--- We grab the ammo used by the magazine.
		
		if (_ammo != "") then {
			//--- We check if the ammo is air-lock based and that in inherits from the missile class.
			if (getNumber(configFile >> "CfgAmmo" >> _ammo >> "airLock") == 1 && configName(inheritsFrom(configFile >> "CfgAmmo" >> _ammo)) == "MissileBase") then {_remove = true; _magazines_remove = _magazines_remove + [_x]};
		};
	} forEach getArray(configFile >> "CfgWeapons" >> _x >> "magazines"); //--- We check the magazines array of the weapon.
	
	if (_remove) then {_weapons_remove = _weapons_remove + [_x]};
} forEach _weapons;

{if (_x in _magazines_remove) then {_unit removeMagazine _x}} forEach _magazines; //--- Remove AA magazines if found.
{_unit removeWeapon _x} forEach _weapons_remove; //--- Remove all weapons linked to AA lock.