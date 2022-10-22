/*
	Attempt to load the client gear.
	 Parameters:
		- Profile gear templates.
*/

Private ["_profile_templates","_side_equipment","_templates"];

_templates = _this;
_profile_templates = [];

_side_equipment = missionNamespace getVariable Format ["WFBE_%1_All", WFBE_Client_SideJoinedText];

//--- Browse each templates in the profile.
{
	if (typeName _x == "ARRAY") then {
		if (count _x >= 6) then {
			Private ["_backpack","_can_load","_item","_label","_magazines","_picture","_prefix","_price","_price_total","_upgrade","_upgrade_max","_weapons"];
			_picture = _x select 0;
			_label = _x select 1;
			_price = _x select 2;
			_upgrade = _x select 3;
			_weapons = _x select 4;
			_magazines = _x select 5;
			_backpack = _x select 6;
			
			//--- Make sure that the format is standard.
			if (typeName _picture == "STRING" && typeName _label == "STRING" && typeName _price == "SCALAR" && typeName _upgrade == "SCALAR" && typeName _weapons == "ARRAY" && typeName _magazines == "ARRAY" && typeName _backpack == "ARRAY") then {
				//--- Alright it's settled, the format is ok.
				_upgrade_max = 0;
				_price_total = 0;
				_can_load = true;
				
				//--- Weapon check.
				{
					if (typeName _x == "STRING") then {
						_item = _x;
						_get = missionNamespace getVariable _item;
						
						//--- Try to get the highest upgrade and get the total price.
						if !(isNil '_get') then {
							if ((_get select 3) > _upgrade_max) then {_upgrade_max = (_get select 3)};
							_price_total = _price_total + (_get select 2);
						} else {
							_can_load = false;
						};
						
						//--- Belong to side next.
						if ({_x == _item} count _side_equipment == 0) then {_can_load = false};
					} else { _can_load = false };
					
					if !(_can_load) exitWith {};
				} forEach _weapons;
				
				//--- Magazines check. Check the format too.
				if (_can_load) then {
					if (count _magazines >= 2) then {
						_magazines_class = _magazines select 0;
						_magazines_count = _magazines select 1;
						
						if (typeName _magazines_class == "ARRAY" && typeName _magazines_count == "ARRAY") then {
							if (count _magazines_count == count _magazines_class) then {
								for '_i' from 0 to count(_magazines_class)-1 do {
									_magazine = _magazines_class select _i;
									_magazine_count = _magazines_count select _i;
									
									if (typeName _magazine == "STRING" && typeName _magazine_count == "SCALAR") then {
										_get = missionNamespace getVariable Format["Mag_%1", _magazine];
										
										//--- Try to get the highest upgrade and get the total price.
										if !(isNil '_get') then {
											if ((_get select 3) > _upgrade_max) then {_upgrade_max = (_get select 3)};
											_price_total = _price_total + ((_get select 2)*_magazine_count);
										} else {
											_can_load = false;
										};
									} else { _can_load = false };;
									
									if !(_can_load) exitWith {};
								};
							} else { _can_load = false };
						} else { _can_load = false };
					} else { _can_load = false };
					
					//--- Backpack check. Check the format too. Backpack is [] when empty.
					if (_can_load) then {
						if (count _backpack >= 2) then {
							_prefix = "";
							
							//--- Start by the weapon, magazine next.
							for '_i' from 0 to 1 do {
								_content = _backpack select _i;
								
								if (typeName _content == "ARRAY") then {
									if (count _content >= 2) then {
										_items_class = _content select 0;
										_items_count = _content select 1;
										
										if (typeName _items_class == "ARRAY" && typeName _items_count == "ARRAY") then {
											if (count _items_count == count _items_class) then {
												for '_j' from 0 to count(_items_class)-1 do {
													_item = _items_class select _j;
													_item_count = _items_count select _j;
													
													//--- Try to get the highest upgrade and get the total price.
													if (typeName _item == "STRING" && typeName _item_count == "SCALAR") then {
														_get = missionNamespace getVariable Format["%1%2", _prefix, _item];
														
														if !(isNil '_get') then {
															if ((_get select 3) > _upgrade_max) then {_upgrade_max = (_get select 3)};
															_price_total = _price_total + ((_get select 2)*_item_count);
														} else {
															_can_load = false;
														};
													} else { _can_load = false };
												};
											} else { _can_load = false };
										} else { _can_load = false };
									} else { _can_load = false };
								} else { _can_load = false };
								
								_prefix = "Mag_";
							};
						};
					};
				};
				
				if (_can_load) then {
					//--- Check that the price match, otherwise update.
					if (_upgrade != _upgrade_max) then {_x set [3, _upgrade_max]};
					//--- Check that the upgrade level match, otherwise update.
					if (_price != _price_total) then {_x set [2, _price_total]};
					
					[_profile_templates, _x] Call WFBE_CO_FNC_ArrayPush;
				};
			};
		};
	};
} forEach _templates;

if (count _profile_templates > 0) then {
	//--- If we have something then we override the default templates.
	missionNamespace setVariable [Format ["WFBE_%1_Template", WFBE_Client_SideJoinedText], _profile_templates];
};