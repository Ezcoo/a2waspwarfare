MenuAction = -1;

_type = (missionNamespace getVariable 'WFBE_EASA_Vehicles') find (typeOf (vehicle player));
if (_type == -1) exitWith {["ERROR", Format ["GUI_Menu_EASA.sqf: Player vehicle [%1] was not found within the list.", vehicle player]] Call WFBE_CO_FNC_LogContent};
_data = ((missionNamespace getVariable 'WFBE_EASA_Loadouts') select _type);

_listBox = 23003;

_u = 0;
_upgrades = sideJoined Call WFBE_CO_FNC_GetSideUpgrades;
for '_i' from 0 to count(_data)-1 do {
	_row = _data select _i;
	// _add = if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_AIR_AA_MISSILES") < 1 && (_row select 3)) then {false} else {true};
	_add = true;
	switch (missionNamespace getVariable "WFBE_C_GAMEPLAY_AIR_AA_MISSILES") do {
		case 0: {if (_row select 3) then {_add = false}};
		case 1: {
			if ((_upgrades select WFBE_UP_AIRAAM) == 0 && (_row select 3)) then {_add = false};
		};
	};
	
	if (_add) then {
		lnbAddRow [_listBox, [Format["$%1.", _row select 0], _row select 1]];
		lnbSetValue[_listBox, [_u, 0], _i];
		_u = _u + 1;
	};
};

if (((lnbSize _listBox) select 0) > 0) then {lnbSetCurSelRow [_listBox,0]} else {lnbSetCurSelRow [_listBox,-1]};

while {alive player && dialog} do {
	sleep 0.1;
	
	if (side group player != sideJoined) exitWith {closeDialog 0};
	if !(dialog) exitWith {};
	
	//--- Command AI.
	if (MenuAction == 101) then {
		MenuAction = -1;
		_funds = Call GetPlayerFunds;
		
		_index = lnbCurSelRow _listBox;
		if (_index != -1 && ((lnbSize _listBox) select 0) > 0) then {
			_index = lnbValue[_listBox, [_index, 0]]; //--- Retrieve the real index.
			
			_row = _data select _index; //--- Get the row from the data array.
			if (_funds > (_row select 0)) then {
				[vehicle player, _index, true] Call EASA_Equip;
				-(_row select 0) Call ChangePlayerFunds;
				hint parseText(Format[localize 'STR_WF_INFO_EASA_Purchase', _row select 1]);
				closeDialog 0;
			} else {
				hint parseText(Format[localize 'STR_WF_INFO_Funds_Missing',(_row select 0) - _funds, _row select 1]);
			};
		};
	};
};