private["_is","_ii","_awaits","_incomeCoef","_divisor","_commander_enabled","_currency_system","_logik","_playerOldScore","_playerNewScore","_scoreDiff","_income","_income_player","_income_commander","_supply","_comTeam","_paycheck"];

_is = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM";
_ii = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_INTERVAL";

_awaits = _ii;
_incomeCoef = 1;
_divisor = 0;
_commander_enabled = if ((missionNamespace getVariable "WFBE_C_AI_COMMANDER_ENABLED") > 0) then {true} else {false};
_currency_system = missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM";
_suppluy_max_limit = missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_MAX_TEAM_LIMIT";
_playerOldScore = 0;
_playerNewScore = 0;

if (_is == 3) then {
	_incomeCoef = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_COEF";
	_divisor = missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_DIVIDED";
};

while {!gameOver} do {

	{
		_logik = (_x) Call WFBE_CO_FNC_GetSideLogic;
		_income = 0;
		_income_player = 0;
		_income_commander = 0;
		_supply = 0;

		_supply =  (_x) Call WFBE_CO_FNC_GetTownsSupply;
		//////
		if(_supply  < _suppluy_max_limit) then {

			_income = if (_is != 3) then {_supply} else {round(_supply * _incomeCoef)};

			switch (_is) do {
				case 2: {_income = round(_income / 2)};
				case 3: {
					_income_player = round(_income * (((100 - (_logik getVariable "wfbe_commander_percent"))/100)/(_logik getVariable "wfbe_teams_count")));
					_income_commander = round((_income * ((_logik getVariable "wfbe_commander_percent")/100)) / _divisor) + _income_player;
				};
				case 4: {
					_income_player = round(_income * 1.5 * (100 - (_logik getVariable "wfbe_commander_percent"))/100);
					_income_commander = round((_income * 1.5 - _income_player)*(_logik getVariable "wfbe_teams_count")) + _income_player;
				};
			};

			if (_income > 0) then {
				// diag_log format ["Calling update tick (town supply income) for team %1, supply addition: %2",_x, _supply];
				if (_currency_system == 0) then {[_x, _supply, format ["Update tick (town supply income) for team %1.",_x]] Call ChangeSideSupply};

				_comTeam = (_x) Call WFBE_CO_FNC_GetCommanderTeam;
				if (isNull _comTeam) then {_comTeam = grpNull};

				{
					if !(isNil '_x') then {
						_paycheck = 0;
						switch (_is) do {
							case 3: {_paycheck = if (_comTeam != _x) then {_income_player} else {_income_commander}};
							case 4: {_paycheck = if (_comTeam != _x) then {_income_player} else {_income_commander}};
							default {if !(isPlayer (leader _x)) then {_paycheck = _income}};
						};

						if (_paycheck != 0) then {[_x, _paycheck] Call WFBE_CO_FNC_ChangeTeamFunds};
					};
				} forEach (_logik getVariable "wfbe_teams");

				if (isNull(_x Call WFBE_CO_FNC_GetCommanderTeam) && _commander_enabled) then {[_x, _income] Call ChangeAICommanderFunds};
			};

		};

	} forEach WFBE_PRESENTSIDES;

	_awaits = (_ii) Call GetSleepFPS;
	sleep _awaits;
};