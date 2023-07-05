private["_pside","_is","_ii"];

_pside = _this;

_is = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM";
_ii = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_INTERVAL";

while {!gameOver} do {
	_income = 0;

	//--- Income Getter.
	{
		_side = (_x getVariable "sideID") Call GetSideFromID;
		_supply = _x getVariable "supplyValue";
		if (_side == _pside) then {_income = _income + (_supply / _is)};
	} forEach towns;

	//--- Only change the funds if needed.
	if (_income > 0) then {
		(_income) Call ChangePlayerFunds;
	};
	
	sleep _ii;
};