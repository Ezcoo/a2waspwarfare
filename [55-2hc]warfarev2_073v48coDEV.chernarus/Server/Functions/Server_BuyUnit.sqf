Private ["_building","_built","_config","_crew","_direction","_dir","_distance","_factoryType","_factoryPosition","_gbq","_id","_index","_isVehicle","_longest","_position","_queu","_queu2","_ret","_side","_sideID","_sideText","_soldier","_team","_turrets","_type","_unitType","_vehicle","_waitTime"];
_id = _this select 0;
_building = _this select 1;
_unitType = _this select 2;
_side = _this select 3;
_sideID = (_side) Call GetSideID;
_team = _this select 4;
_isVehicle = _this select 5;

_sideText = str _side;

if (!(alive _building)||(isPlayer (leader _team))) exitWith {
	_gbq = (_team getVariable "wfbe_queue") - _id;
	_team setVariable ["wfbe_queue",_gbq];
	if !(alive _building) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};
	if (isPlayer (leader _team)) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] has been canceled, player [%2] has replace the ai.", _unitType, name (leader _team)]] Call WFBE_CO_FNC_LogContent};
};

["INFORMATION", Format ["Server_BuyUnit.sqf: [%1] Team [%2] has purchased [%3].", _side,_team,_unitType]] Call WFBE_CO_FNC_LogContent;

_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu = _queu + [_id select 0];
_building setVariable ["queu",_queu,true];

_type = typeOf _building;
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

	if (!(alive _building)||(isNull _building)||(isPlayer (leader _team))) exitWith {
		_gbq = (_team getVariable "wfbe_queue") - _id;
		_team setVariable ["wfbe_queue",_gbq];
		_queu = _building getVariable "queu";
		_queu = _queu - [_queu select 0];
		_building setVariable ["queu",_queu,true];
		if !(alive _building) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};
		if (isPlayer (leader _team)) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] has been canceled, player [%2] has replace the ai.", _unitType, name (leader _team)]] Call WFBE_CO_FNC_LogContent};
	};

	if (_queu select 0 == _queu2 select 0) then {
		if (_ret > _longest) then {
			if (count _queu > 0) then {
				_queu = _building getVariable "queu";
				_queu = _queu - [_queu select 0];
				_building setVariable ["queu",_queu,true];
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
_building setVariable ["queu",_queu,true];

if (!(alive _building)||(isPlayer (leader _team))) exitWith {
	_gbq = (_team getVariable "wfbe_queue") - _id;
	_team setVariable ["wfbe_queue",_gbq];
	if !(alive _building) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call WFBE_CO_FNC_LogContent};
	if (isPlayer (leader _team)) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] has been canceled, player [%2] has replace the ai.", _unitType, name (leader _team)]] Call WFBE_CO_FNC_LogContent};
};

if (_unitType isKindOf "Man") then {
	_soldier = [_unitType,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
	[_sideText,'UnitsCreated',1] Call UpdateStatistics;
} else {
	_factoryPosition = getPos _building;
	_dir = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);

	_crew = missionNamespace getVariable Format ["WFBE_%1SOLDIER",_sideText];
	if (_unitType isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["WFBE_%1CREW",_sideText]};
	if (_unitType isKindOf "Air") then {_crew = missionNamespace getVariable Format ["WFBE_%1PILOT",_sideText]};

	_special = if (_unitType isKindOf "Plane") then {"FLY"} else {"NONE"};
	_vehicle = [_unitType, _position, _sideID, _dir, true, true, true, _special] Call WFBE_CO_FNC_CreateVehicle;
	_vehicle addEventHandler ["Fired",{_this Spawn HandleRocketTraccer}];
	if(typeOf _vehicle in ['F35B','AV8B','AV8B2','A10','A10_US_EP1','Su25_TK_EP1','Su34','Su39','An2_TK_EP1']) then {_vehicle addeventhandler ['Fired',{_this spawn HandleBombs;_this spawn HandleAAMissiles}];};
    if(typeOf _vehicle in ['AH1Z','BAF_Apache_AH1_D','AH64D_EP1','AH64D','Ka52Black','Ka52','Mi24_P','L39_TK_EP1','2S6M_Tunguska','M6_EP1']) then {_vehicle addeventhandler ['Fired',{_this spawn HandleAAMissiles;}];};
	if ({(typeOf _vehicle) isKindOf _x} count ["LAV25_Base","M2A2_Base","BMP2_Base","BTR90_Base"] != 0) then {_vehicle addeventhandler ["fired",{_this spawn HandleReload;}];
	if(typeOf _vehicle in ['T90','BMP3']) then {_vehicle addeventhandler ['Fired',{_this spawn HandleATReload;}];};

// IRS MODULE
if ((typeOf _vehicle) isKindOf "Tank" || (typeOf _vehicle) isKindOf "Car") then {


	_vehicle addeventhandler ['incomingMissile',{_this spawn HandleATMissiles}];


	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_IRSMOKE") > 0) then { //--- IR Smoke
		if (((sideJoined) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_IRSMOKE > 0) then { //--- Make sure that the unit is defined in IRS_Init and that the upgrade is available.
			_get = missionNamespace getVariable Format ["%1_IRS", (typeOf _vehicle)];
			if !(isNil '_get') then {
				_vehicle setVariable ["wfbe_irs_flares", _get select 1, true];
				_vehicle addEventHandler ["incomingMissile", {_this spawn WFBE_CO_MOD_IRS_OnIncomingMissile}];
			};
		};
	};
};

	emptyQueu = emptyQueu + [_vehicle];
	[_vehicle] Spawn WFBE_SE_FNC_HandleEmptyVehicle;
	if (_vehicle distance (leader _team) < 200) then {(units _team) allowGetIn true;_team addVehicle _vehicle};

	//--- Clear the vehicle.
	(_vehicle) call WFBE_CO_FNC_ClearVehicleCargo;

	_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;


	[_soldier] allowGetIn true;
	[_soldier] orderGetIn true;
	if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {(_vehicle) Call BalanceInit};

	if (_unitType isKindOf "Air") then {

		//--- Countermeasures.
		if !(WF_A2_Vanilla) then {
			switch (missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") do { //--- Remove CM if needed.
				case 0: {(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures}; //--- Disabled.
				case 1: { //--- Enabled with upgrades.
					if (((_side Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_FLARESCM) == 0) then {
						(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures;
					};
				};
			};
		};

		//--- No AA missiles.
		switch (missionNamespace getVariable "WFBE_C_GAMEPLAY_AIR_AA_MISSILES") do {
			case 0: {(_vehicle) Call WFBE_CO_FNC_RemoveAAMissiles};
			case 1: {
				if (((_side Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_AIRAAM) == 0) then {
					(_vehicle) Call WFBE_CO_FNC_RemoveAAMissiles;
				};
			};
		};
	};

	_soldier assignAsDriver _vehicle;
	_soldier moveInDriver _vehicle;
	[_sideText,'VehiclesCreated',1] Call UpdateStatistics;
	_built = 1;
	if (_isVehicle select 1) then {
		_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		[_soldier] orderGetIn true;
		_soldier assignAsGunner _vehicle;
		_soldier moveInGunner _vehicle;
		_built = _built + 1;
	};
	if (_isVehicle select 2) then {
		if (vehicle leader _team == leader _team && leader _team distance _vehicle < 200 && alive leader _team) then {
			[leader _team] allowGetIn true;
			[leader _team] orderGetIn true;
			(leader _team) assignAsCommander _vehicle;
			(leader _team) moveInCommander _vehicle;
		} else {
			_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
			[_soldier] allowGetIn true;
			[_soldier] orderGetIn true;
			_soldier assignAsCommander _vehicle;
			_soldier moveInCommander _vehicle;
		};
		_built = _built + 1;
	};

	if (_isVehicle select 3) then {
		Private ["_get","_turrets"];
		_get = missionNamespace getVariable _unitType;
		_turrets = _get select QUERYUNITTURRETS;

		{
			if (isNull (_vehicle turretUnit _x)) then {
				_soldier = [_crew,_team,_position,_sideID] Call WFBE_CO_FNC_CreateUnit;
				[_soldier] allowGetIn true;
				_soldier moveInTurret [_vehicle, _x];
				_built = _built + 1;
			};
		} forEach _turrets;
	};

_vehicle allowCrewInImmobile true;
	[_sideText,'UnitsCreated',_built] Call UpdateStatistics;
};

_gbq = (_team getVariable "wfbe_queue") - _id;
_team setVariable ["wfbe_queue",_gbq];