Private ["_get", "_index", "_loadout", "_loadout_old", "_type", "_vehicle"];

_vehicle = _this select 0;
_index = _this select 1;

if (typeName _vehicle != 'OBJECT') exitWith {["ERROR", Format ["EASA_Equip.sqf: Invalid Parameter (_vehicle), expected object instead of [%1]", _vehicle]] Call WFBE_CO_FNC_LogContent};

_type = (missionNamespace getVariable 'WFBE_EASA_Vehicles') find (typeOf _vehicle);

//--- EASA Loadout was found.
if (_type != -1) then {
	//--- Do we have something on the vehicle yet?
	_get = _vehicle getVariable 'WFBE_EASA_Setup';
	
	if (isNil '_get') then { //--- Vehicle has no EASA setup yet.
		[_vehicle, (missionNamespace getVariable 'WFBE_EASA_Default') select _type] Call EASA_RemoveLoadout; //--- Remove the default loadout.
		_get = -1;
	} else { //--- Vehicle already had an EASA loadout.
		_loadout_old = (((missionNamespace getVariable 'WFBE_EASA_Loadouts') select _type) select _get) select 2;
		[_vehicle, _loadout_old] Call EASA_RemoveLoadout;
	};
	
	//--- Now we load the new EASA setup.
	_loadout = (((missionNamespace getVariable 'WFBE_EASA_Loadouts') select _type) select _index) select 2;
	{_vehicle addMagazine _x} forEach (_loadout select 1);
	{_vehicle addWeapon _x} forEach (_loadout select 0);
	
	//--- We update the EASA setup on the vehicle for everyone if needed.
	if (_get != _index) then {_vehicle setVariable ["WFBE_EASA_Setup", _index, true]};
 
};