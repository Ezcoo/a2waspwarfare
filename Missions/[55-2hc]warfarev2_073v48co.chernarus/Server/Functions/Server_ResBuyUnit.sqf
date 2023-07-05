Private ["_building","_built","_config","_crew","_direction","_dir","_distance","_factoryPosition","_factoryType","_id","_index","_isVehicle","_longest","_position","_queu","_queu2","_ret","_side","_sideID","_sideText","_soldier","_team","_turrets","_type","_unitType","_vehicle","_waitTime"];

_id = _this select 0;
_building = _this select 1;
_unitType = _this select 2;
_side = _this select 3;
_sideID = (_side) Call GetSideID;
_team = _this select 4;

_sideText = str _side;
_ai_delegation_enabled = missionNamespace getVariable "WFBE_C_AI_DELEGATION";

if !(alive _building) exitWith {["INFORMATION", Format ["Server_ResBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};

diag_log Format["[WFBE (INFORMATION)][frameno:%3 | ticktime:%4] Server_ResBuyUnit: AI Team %1 has purchased a '%2'",_team,_unitType,diag_frameno,diag_tickTime];
["INFORMATION", Format ["Server_ResBuyUnit.sqf: [%1] Team has purchased a [%1] unit.",_team, _unitType]] Call WFBE_CO_FNC_LogContent;

_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu = _queu + [_id select 0];
_building setVariable ["queu",_queu];

_type = typeOf _building;
if (_type == "Gue_WarfareBBarracks") then {_type = Call Compile Format ["%1BAR",str _side]};

_index = (missionNamespace getVariable Format ["WFBE_%1STRUCTURENAMES",_sideText]) find _type;
_distance = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDISTANCES",_sideText]) select _index;
_direction = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDIRECTIONS",_sideText]) select _index;
_factoryType = (missionNamespace getVariable Format ["WFBE_%1STRUCTURES",_sideText]) select _index;

_waitTime = (missionNamespace getVariable _unitType) select QUERYUNITTIME;
_position = [getPos _building,_distance,getDir _building + _direction] Call GetPositionFrom;
_longest = missionNamespace getVariable Format ["WFBE_LONGEST%1BUILDTIME",_factoryType];

_ret = 0;
_queu2 = [0];

if (count _queu > 0) then {
	_queu2 = _building getVariable "queu";
};

while {_id select 0 != _queu select 0} do {
	sleep 4;
	_ret = _ret + 4;
	_queu = _building getVariable "queu";

	if (!(alive _building)||(isNull _building)) exitWith {
		_queu = _building getVariable "queu";
		_queu = _queu - [_queu select 0];
		_building setVariable ["queu",_queu];
		["INFORMATION", Format ["Server_ResBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent;
	};

	if (_queu select 0 == _queu2 select 0) then {
		if (_ret > _longest) then {
			if (count _queu > 0) then {
				_queu = _building getVariable "queu";
				_queu = _queu - [_queu select 0];
				_building setVariable ["queu",_queu];
			};
		};
	};
	if (count _queu != count _queu2) then {
		_ret = 0;
		_queu2 = _building getVariable "queu";
	};
};

sleep _waitTime;

_queu = _building getVariable "queu";
_queu = _queu - [_id select 0];
_building setVariable ["queu",_queu];

if !(alive _building) exitWith {["INFORMATION", Format ["Server_ResBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};

if (_unitType isKindOf "Man") then {

	_use_server = true;

	if(_ai_delegation_enabled > 0)then{
		switch (_ai_delegation_enabled) do {
			case 2: { //--- Headless Client delegation.
				if !(isServer) exitWith{};
				_HC = missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID";
				if (count _HC > 0) then {
					_groups = [];
					[_groups, missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side]] call WFBE_CO_FNC_ArrayPush;
					_positions = [];
					[_positions, _position] call WFBE_CO_FNC_ArrayPush;

					[_side, [_unitType], _position, [_team]] Call WFBE_CO_FNC_DelegateAIHeadless;
					_use_server = false;
				};
			};
		};
	};

	if(_use_server)then{
		_soldier = [_unitType,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
		[_sideText,'UnitsCreated',1] Call UpdateStatistics;
	};
};