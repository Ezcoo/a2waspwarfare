"wfbe_supply_temp_west" addPublicVariableEventHandler {
	Private ['_amount','_change','_currentSupply','_side'];

	_side = _this select 1 select 0;
	_amount = _this select 1 select 1;
	_reason = if (_this select 1 select 2!= "") then {_this select 1 select 2} else {"No reason provided for supply value update! This might indicate a malicious supply update request. Check stuff if you see this message."};
	_maxSupplyLimit = missionNameSpace getvariable "WFBE_C_MAX_ECONOMY_SUPPLY_LIMIT";

	_currentSupply = (_side) Call GetSideSupply;
	if (isNil '_currentSupply') then {_currentSupply = 0};
	_change = _currentSupply + _amount;
	if (_change < 0) then {_change = _currentSupply - _amount};
	if (_change >= _maxSupplyLimit) then {_change = _maxSupplyLimit};

	// (_side Call WFBE_CO_FNC_GetSideLogic) setVariable ["wfbe_supply", _change, true];

	["INFORMATION", format ["Server_ChangeSideSupply.sqf: Changing supply value of team %1 with value: %2. New supply value for team: %3. Reason: %4 - Current commander of team: %5.", _side, _amount, _change, _reason, name leader ((_side) call WFBE_CO_FNC_GetCommanderTeam)]] call WFBE_CO_FNC_LogContent;

	missionNamespace setVariable [format ["wfbe_supply_%1", str _side],_change];

	publicVariable format ["wfbe_supply_%1", _side];

};

"wfbe_supply_temp_east" addPublicVariableEventHandler {
	Private ['_amount','_change','_currentSupply','_side'];

	_side = _this select 1 select 0;
	_amount = _this select 1 select 1;
	_reason = if (_this select 1 select 2 != "") then {_this select 1 select 2} else {"No reason provided for supply value update! This might indicate a malicious supply update request. Check stuff if you see this message."};
	_maxSupplyLimit = missionNameSpace getvariable "WFBE_C_MAX_ECONOMY_SUPPLY_LIMIT";

	_currentSupply = (_side) Call GetSideSupply;
	if (isNil '_currentSupply') then {_currentSupply = 0};
	_change = _currentSupply + _amount;
	if (_change < 0) then {_change = _currentSupply - _amount};
	if (_change >= _maxSupplyLimit) then {_change = _maxSupplyLimit};

	// (_side Call WFBE_CO_FNC_GetSideLogic) setVariable ["wfbe_supply", _change, true];

	["INFORMATION", format ["Server_ChangeSideSupply.sqf: Changing supply value of team %1 with value: %2. New supply value for team: %3. Reason: %4 - Current commander of team: %5.", _side, _amount, _change, _reason, name leader ((_side) call WFBE_CO_FNC_GetCommanderTeam)]] call WFBE_CO_FNC_LogContent;

	missionNamespace setVariable [format ["wfbe_supply_%1", str _side],_change];

	publicVariable format ["wfbe_supply_%1", _side];

};