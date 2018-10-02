/*
	Save the client gear template in it's profile if applicable.
*/

Private ["_profile_templates", "_side_equipment", "_templates", "_upgrade_barracks", "_upgrade_gear", "_upgrades"];

_profile_templates = [];

_templates = missionNamespace getVariable Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText];
_side_equipment = missionNamespace getVariable Format ["WFBE_%1_All", WFBE_Client_SideJoinedText];
_upgrades = (WFBE_Client_SideJoined) Call WFBE_CO_FNC_GetSideUpgrades;

_upgrade_barracks = _upgrades select WFBE_UP_BARRACKS;
_upgrade_gear = _upgrades select WFBE_UP_GEAR;

{
	Private ["_can_save", "_get", "_item", "_prefix", "_template_backpack", "_template_magazines", "_template_upgrade", "_template_weapons"];
	
	_template_upgrade = _x select 3;
	_template_weapons = _x select 4;
	_template_magazines = (_x select 5) select 0;
	_template_backpack = _x select 6;
	
	_can_save = true;
	
	//--- We check the weapons first.
	{
		_item = _x;
		
		//--- Upgrade level first.
		_get = missionNamespace getVariable _item;
		if !(isNil '_get') then {
			if ((_get select 3) > _upgrade_barracks && _u_upgrade > _upgrade_gear) then {_can_save = false};
		} else {
			_can_save = false;
		};
		
		//--- Belong to side next.
		if ({_x == _item} count _side_equipment == 0) then {_can_save = false};
		
		if !(_can_save) exitWith {};
	} forEach _template_weapons;
	
	if (_can_save) then {
		//--- The magazines next.
		{
			_item = _x;
			
			//--- Upgrade level first.
			_get = missionNamespace getVariable Format["Mag_%1", _item];
			if !(isNil '_get') then {
				if ((_get select 3) > _upgrade_barracks && _u_upgrade > _upgrade_gear) then {_can_save = false};
			} else {
				_can_save = false;
			};
			
			//--- Belong to side next.
			if ({_x == _item} count _side_equipment == 0) then {_can_save = false};
			
			if !(_can_save) exitWith {};
		} forEach _template_magazines;
		
		//--- Do we have a backpack content?
		if (count _template_backpack > 0 && _can_save) then {
			//--- Start by the weapon, magazine next.
			_prefix = "";
			for '_j' from 0 to 1 do {
				
				{
					_item = _x;
					
					//--- Upgrade level first.
					_get = missionNamespace getVariable Format["%1%2", _prefix, _item];
					if !(isNil '_get') then {
						if ((_get select 3) > _upgrade_barracks && _u_upgrade > _upgrade_gear) then {_can_save = false};
					} else {
						_can_save = false;
					};
					
					//--- Belong to side next.
					if ({_x == _item} count _side_equipment == 0) then {_can_save = false};
				} forEach ((_template_backpack select _j) select 0);
				
				_prefix = "Mag_";
			};
		};	
	};
	
	//--- This template can be saved.
	if (_can_save) then {[_profile_templates, _x] Call WFBE_CO_FNC_ArrayPush};
} forEach _templates;

//--- Finally save the gear.
profileNamespace setVariable [Format["WFBE_PERSISTENT_%1_GEAR_TEMPLATE", WFBE_Client_SideJoinedText], _profile_templates];
saveProfileNamespace;