Private ['_addin','_c','_currentUpgrades','_filler','_filter','_i','_listBox','_listNames','_u','_value','_checkIfBRDMIglaAA'];
_listNames = _this select 0;
_filler = _this select 1;
_listBox = _this select 2;
_value = _this select 3;

_u = 0;
_i = 0;

_currentUpgrades = (sideJoined) Call WFBE_CO_FNC_GetSideUpgrades;
_filter = missionNamespace getVariable Format["WFBE_%1%2CURRENTFACTIONSELECTED",sideJoinedText,_filler];
if (isNil '_filter') then {_filter = "nil"} else {
	if (_filter == 0) then {
		_filter = 'nil';
	} else {
		_filter = ((missionNamespace getVariable Format["WFBE_%1%2FACTIONS",sideJoinedText,_filler]) select _filter);
	};
};

lnbClear _listBox;
{
	_addin = true;
	_c = missionNamespace getVariable _x;
	if (_filter != "nil") then {
		if ((_c select QUERYUNITFACTION) != _filter) then {_addin = false};
	};
	
	_addit = false;
		if(_filler == 'Depot') then
		{
		    _UpBar = ((sideJoined) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_BARRACKS; 
			if ((_x in ['Ins_Soldier_MG', 'USMC_Soldier_MG']) && _UpBar>=1)then{_addit  = true;};
			if ((_x in ['RU_Soldier_AT', 'USMC_Soldier_LAT']) && _UpBar>=1)then{_addit = true;};
			if ((_x in ['TK_Soldier_Engineer_EP1', 'BAF_Soldier_EN_W']) && _UpBar>=1)then{_addit = true;};
			if ((_x in ['RU_Soldier_AA','USMC_Soldier_AA']) && _UpBar>=3)then{_addit = true;};
		};
	

	if (((_c select QUERYUNITUPGRADE) <= (_currentUpgrades select _value) && _addin) || (_addit&&_addin)) then {
		_checkIfBRDMIglaAA = if ((_c select QUERYUNITLABEL == "BRDM-2 (ATGM)") && (_c select QUERYUNITFACTION == "Insurgents")) then {"BRDM (Igla AA)"} else {_c select QUERYUNITLABEL};
		lnbAddRow [_listBox,['$'+str (_c select QUERYUNITPRICE),(_checkIfBRDMIglaAA)]];
		lnbSetData [_listBox,[_i,0],_filler];
		lnbSetValue [_listBox,[_i,0],_u];
		if (_x in (missionNamespace getVariable Format ["WFBE_%1AMBULANCES", sideJoinedText])) then {lnbSetColor [_listBox,[_i,1],[1.0, 1.0, 0.0, 1.0]]};
		if (_x in (missionNamespace getVariable Format ['WFBE_%1REPAIRTRUCKS', sideJoinedText])) then {lnbSetColor [_listBox,[_i,1],[0.25, 0.75, 0.25, 1.0]]};
		if (_x in (missionNamespace getVariable Format ["WFBE_%1SUPPLYTRUCKS", sideJoinedText])) then {lnbSetColor [_listBox,[_i,1],[1.0, 0.5, 0.25, 1.0]]};
		if ([([[missionNamespace getVariable Format ['WFBE_%1_ARTILLERY_CLASSNAMES', sideJoinedText]], _x] call BIS_fnc_arrayFindDeep), -1] call BIS_fnc_areEqual) then {lnbSetColor [_listBox,[_i,1],[1.0, 0.25, 0.25, 1.0]]};
		/*
		diag_log(_x);
		diag_log("BIS_fnc_findNestedElement result: " + str (([[missionNamespace getVariable Format ['WFBE_%1_ARTILLERY_CLASSNAMES', sideJoinedText]], _x] call BIS_fnc_findNestedElement) != -1));
		diag_log("BIS_fnc_findNestedElement (str _x):" + str (([[missionNamespace getVariable Format ['WFBE_%1_ARTILLERY_CLASSNAMES', sideJoinedText]], str _x] call BIS_fnc_findNestedElement) != -1));
		diag_log(missionNamespace getVariable Format ['WFBE_%1_ARTILLERY_CLASSNAMES', sideJoinedText]);
		*/
		_i = _i + 1;
	};
	_u = _u + 1;
} forEach _listNames;

if (_i > 0) then {lnbSetCurSelRow [_listBox,0]} else {lnbSetCurSelRow [_listBox,-1]};