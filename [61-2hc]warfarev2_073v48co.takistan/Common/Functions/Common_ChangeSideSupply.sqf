Private ['_amount','_change','_currentSupply','_side'];

_side = _this select 0;
_amount = _this select 1;
_reason = "";

if (count _this > 2) then {
	_reason = _this select 2;
};

_maxSupplyLimit = missionNameSpace getvariable "WFBE_C_MAX_ECONOMY_SUPPLY_LIMIT";

_currentSupply = (_side) Call GetSideSupply;
if (isNil '_currentSupply') then {_currentSupply = 0};
_change = _currentSupply + _amount;
if (_change < 0) then {_change = _currentSupply - _amount};
if (_change >= _maxSupplyLimit) then {_change = _maxSupplyLimit};

missionNamespace setVariable [format ["wfbe_supply_temp_%1", _side], [_side, _amount, _reason]];

publicVariableServer format ["wfbe_supply_temp_%1", _side];

// (_side Call WFBE_CO_FNC_GetSideLogic) setVariable ["wfbe_supply", _change, true];