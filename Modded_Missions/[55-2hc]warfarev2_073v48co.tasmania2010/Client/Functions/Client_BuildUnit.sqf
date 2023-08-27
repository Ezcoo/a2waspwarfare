Private ["_building","_cpt","_commander","_crew","_currentUnit","_description","_direction","_distance","_driver","_extracrew","_factory","_factoryPosition","_factoryType","_group","_gunner","_index","_init","_isArtillery","_isMan","_locked","_longest","_position","_queu","_queu2","_ret","_show","_soldier","_waitTime","_txt","_type","_upgrades","_unique","_unit","_vehi","_vehicle","_vehicles"];
_building = _this select 0;
_unit = _this select 1;
_vehi = _this select 2;
_factory = _this select 3;
_cpt = _this select 4;

_isMan = if (_unit isKindOf "Man") then {true} else {false};

unitQueu = unitQueu + _cpt;

_distance = 0;
_direction = 0;
_longest = 0;
_position = 0;
_waitTime = 0;
_factoryType = "";
_description = "";

_currentUnit = missionNamespace getVariable _unit;
_waitTime = _currentUnit select QUERYUNITTIME;
_description = _currentUnit select QUERYUNITLABEL;
	
_spawnpaddir=2;


_type = typeOf _building;
_index = (missionNamespace getVariable Format ["WFBE_%1STRUCTURENAMES",sideJoinedText]) find _type;
if (_index != -1) then {
	_distance = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDISTANCES",sideJoinedText]) select _index;
	_direction = (missionNamespace getVariable Format ["WFBE_%1STRUCTUREDIRECTIONS",sideJoinedText]) select _index;
	_factoryType = (missionNamespace getVariable Format ["WFBE_%1STRUCTURES",sideJoinedText]) select _index;

	
if (_factoryType in ["Light"]) then {
	//--- Place Wheeled vehicles on Pads if avaiable.
	Private ["_pads","_free","_dir","_no","_selpad"];

	_pads = _building nearObjects ["HeliH", 250];

	// Filter out unwanted objects from _pads based on their names (because they inherit from HeliH)
    _filteredPads = [];
    {
        if (typeOf _x != "HeliHCivil" && typeOf _x != "HeliHRescue") then {
            _filteredPads set [count _filteredPads, _x];
        };
    } forEach _pads;
    _pads = _filteredPads;

	_free = [];
	_dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			_dir = getDir (_pads select _i);
			_free = _free + [[getpos (_pads select _i), _dir]];
		};
	};
	if (count _free > 0) then {
		_selpad =_free  call BIS_fnc_selectRandom;
		_position = [_selpad select 0 select 0,_selpad select 0 select 1,_selpad select 1];
		_position set [2, .5];
		_spawnpaddir=5;//dirswitch to prevent overwrite dir later
		_direction=_selpad select 1;

	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};

}else{//---------------------------------------------------------check for heavy


if (_factoryType in ["Heavy"]) then {
	//--- Place Wheeled vehicles on Pads if avaiable.
	Private ["_pads","_free","_dir","_no","_selpad"];
	_pads = _building nearObjects ["HeliHRescue", 250];
	_free = [];
	_dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			_dir = getDir (_pads select _i);
			_free = _free + [[getpos (_pads select _i), _dir]];
		};
	};
	if (count _free > 0) then {
		_selpad =_free  call BIS_fnc_selectRandom;
		_position = [_selpad select 0 select 0,_selpad select 0 select 1,_selpad select 1];
		_position set [2, .5];
		_spawnpaddir=5;//dirswitch to prevent overwrite dir later
		_direction=_selpad select 1;

	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};

}else{//--------------------------------------------------------check for air


if (_factoryType in ["Aircraft"]) then {
	//--- Place Wheeled vehicles on Pads if avaiable.
	Private ["_pads","_free","_dir","_no","_selpad"];
	_pads = _building nearObjects ["HeliHCivil", 250];
	_free = [];
	_dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			_dir = getDir (_pads select _i);
			_free = _free + [[getpos (_pads select _i), _dir]];
		};
	};
	if (count _free > 0) then {
		_selpad =_free  call BIS_fnc_selectRandom;
		_position = [_selpad select 0 select 0,_selpad select 0 select 1,_selpad select 1];
		_position set [2, .5];
		_spawnpaddir=5;//dirswitch to prevent overwrite dir later
		_direction=_selpad select 1;

	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};

}else{//-------------------------------------------its barracks,found only 3 marker in a2 for now

_position = [getPos _building,_distance,getDir _building + _direction] Call GetPositionFrom;

};};};

_longest = missionNamespace getVariable Format ["WFBE_LONGEST%1BUILDTIME",_factoryType];
	
	
} else {
	if (_type == WFBE_Logic_Depot) then {
		_distance = missionNamespace getVariable "WFBE_C_DEPOT_BUY_DISTANCE";
		_direction = missionNamespace getVariable "WFBE_C_DEPOT_BUY_DIR";
		_factoryType = "Depot";
	};
	if (_type == WFBE_Logic_Airfield) then {
		_distance = missionNamespace getVariable "WFBE_C_HANGAR_BUY_DISTANCE";
		_direction = missionNamespace getVariable "WFBE_C_HANGAR_BUY_DIR";
		_factoryType = "Airport";
	};
	_position = [getPos _building,_distance,getDir _building + _direction] Call GetPositionFrom;
	_longest = missionNamespace getVariable Format ["WFBE_LONGEST%1BUILDTIME",_factoryType];
};

_unique = varQueu;
varQueu = random(10)+random(100)+random(1000);
_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu = _queu + [_unique];
_building setVariable ["queu",_queu,true];

_ret = 0;
_queu2 = [0];

if (count _queu > 0) then {_queu2 = _building getVariable "queu"};

_show = false;
while {_unique != _queu select 0 && alive _building && !isNull _building} do {
	sleep 4;
	_show = true;
	_ret = _ret + 4;
	_queu = _building getVariable "queu";

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

if (_show) then {hint(parseText(Format [localize "STR_WF_INFO_BuyEffective",_description]))};

sleep _waitTime;

_queu = _building getVariable "queu";
_queu = _queu - [_unique];
_building setVariable ["queu",_queu,true];

_group = group player;
if (!alive _building || isNull _building) exitWith {
	unitQueu = unitQueu - _cpt;
	missionNamespace setVariable [Format["WFBE_C_QUEUE_%1",_factory],(missionNamespace getVariable Format["WFBE_C_QUEUE_%1",_factory])-1];
};

if (_isMan) then {
	_soldier = [_unit,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;

	//--- OA or CO, Since BIS will soon fix it... not!, we fix unit backpack attachment on creation.
	if (WF_A2_Arrowhead || WF_A2_CombinedOps) then {
		//--- Make sure that our unit is supposed to have a backpack.
		if (getText(configFile >> 'CfgVehicles' >> _unit >> 'backpack') != "") then {
			//--- Retrieve the unit gear config.
			_gear_config = (_unit) Call WFBE_CO_FNC_GetUnitConfigGear;
			_gear_backpack = _gear_config select 2;
			_gear_backpack_content = _gear_config select 3;

			//--- Backpack handling.
			if (_gear_backpack != "") then {[_soldier, _gear_backpack, _gear_backpack_content] Call WFBE_CO_FNC_EquipBackpack};
		};
	};

	[sideJoinedText,'UnitsCreated',1] Call UpdateStatistics;
} else {
	_driver = _vehi select 0;
	_gunner = _vehi select 1;
	_commander = _vehi select 2;
	_extracrew = _vehi select 3;
	_locked = _vehi select 4;

	_factoryPosition = getPos _building;
	
	
	if (_spawnpaddir==2) then {//there is no spawnpad
	_direction = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);//--- model to world that later on.
	};
	_vehicle = [_unit, _position, sideID, _direction, _locked] Call WFBE_CO_FNC_CreateVehicle;
	clientTeam reveal _vehicle;

	_vehicles = (WF_Logic getVariable "emptyVehicles") + [_vehicle];
	WF_Logic setVariable ["emptyVehicles",_vehicles,true];

	if (isHostedServer) then {_vehicle setVariable ["WFBE_Taxi_Prohib", true]};

	//--- Clear the vehicle.
	(_vehicle) call WFBE_CO_FNC_ClearVehicleCargo;

	/* Section: Local Init (Client Only) */

	//--- Lock / Unlock.
	_vehicle addAction [localize "STR_WF_Unlock","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && locked _target'];
	_vehicle addAction [localize "STR_WF_Lock","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && !(locked _target)'];

	//--- Salvage Truck.
	if (_unit in (missionNamespace getVariable Format['WFBE_%1SALVAGETRUCK',sideJoinedText])) then {[_vehicle] execVM 'Client\FSM\updatesalvage.sqf'};

	//--- Units Balancing.
	if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {(_vehicle) Call BalanceInit};

	if (_unit isKindOf "Air") then {
		//--- Countermeasures.
			if (getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "incommingmissliedetectionsystem") > 8) then {_vehicle addeventhandler ['IncomingMissile',{_this spawn HandleAlarm;}]};
		if !(WF_A2_Vanilla) then {
			switch (missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") do { //--- Remove CM if needed.
				case 0: {(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures}; //--- Disabled.
				case 1: { //--- Enabled with upgrades.
					if (((sideJoined Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_FLARESCM) == 0) then {
						(_vehicle) Call WFBE_CO_FNC_RemoveCountermeasures;
					};
				};
			};
		};

		//--- No AA missiles.
		switch (missionNamespace getVariable "WFBE_C_GAMEPLAY_AIR_AA_MISSILES") do {
			case 0: {(_vehicle) Call WFBE_CO_FNC_RemoveAAMissiles};
			case 1: {
				if (((sideJoined Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_AIRAAM) == 0) then {
					(_vehicle) Call WFBE_CO_FNC_RemoveAAMissiles;
				};
			};
		};
	};

	//--- Are we dealing with an artillery unit.

	_isArtillery = [_unit,sideJoinedText] Call IsArtillery;
	if (_isArtillery != -1) then {[_vehicle,_isArtillery,sideJoinedText] Call EquipArtillery;};

	/* Section: Creation */

	[sideJoinedText,'VehiclesCreated',1] Call UpdateStatistics;
	_built = 0;
	_group addVehicle _vehicle;

_vehicle allowCrewInImmobile true;
_vehicle addEventHandler ["Fired",{_this Spawn HandleRocketTraccer}];

if ((typeOf _vehicle ) in ['MLRS','GRAD','GRAD_CDF','MLRS_DES_EP1','M1129_MC_EP1','GRAD_TK_EP1','GRAD_CDF','GRAD_RU','GRAD_INS']) then {
	_vehicle setVariable ["restricted",false];_vehicle addEventHandler ["GetIn",{_this Spawn HandleArty}]
};

if(typeOf _vehicle in ['F35B','AV8B','AV8B2','A10','A10_US_EP1','Su25_TK_EP1','Su34','Su39','An2_TK_EP1','L159_ACR','L39_TK_EP1']) then {
	_vehicle addeventhandler ['Fired',{_this spawn HandleBombs;_this spawn HandleAAMissiles}];
};

if(typeOf _vehicle in ['2S6M_Tunguska','M6_EP1']) then {
	_vehicle addeventhandler ['Fired',{_this spawn HandleAAMissiles;}];
};

if(typeOf _vehicle in ['T90','BMP3']) then {
	_vehicle addeventhandler ['Fired',{_this spawn HandleATReload;}];
};

if ({(typeOf _vehicle) isKindOf _x} count ["LAV25_Base","M2A2_Base","BMP2_Base","BTR90_Base" ] != 0) then {_vehicle addeventhandler ["fired",{_this spawn HandleReload;}];};

if({(_vehicle isKindOf _x)} count ["Tank","Wheeled_APC"] !=0) then {_vehicle addeventhandler ['Engine',{_this execVM "Client\Module\Engines\Engine.sqf"}];
     _vehicle addAction ["<t color='"+"#00E4FF"+"'>STEALTH ON</t>","Client\Module\Engines\Stopengine.sqf", [], 7,false, true,"","alive _target &&(isEngineOn _target)"];};

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



	//--- Empty Vehicle.
	if (!_driver && !_gunner && !_commander) exitWith {};

	//--- Crew Management.
	_crew = missionNamespace getVariable Format ["WFBE_%1SOLDIER",sideJoinedText];
	
	// Marty : All crew members in tanks are replaced by engineers of their side. 
	// Russian side do not have engineer class so we use takistan class engineer for russian.
	//if (_unit isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["WFBE_%1CREW",sideJoinedText]};
	if (_unit isKindOf "Tank") then {
		if (sideJoinedText == "WEST")then 
		{
			// WEST side (american)
			_crew = "US_Soldier_Engineer_EP1" ;
			//player sideChat Format ["US_Soldier_Engineer_EP1 for %1",sideJoinedText];
		}
		else 
		{
			// EAST side (russian)
			_crew = "TK_Soldier_Engineer_EP1" ;
			//player sideChat Format ["TK_Soldier_Engineer_EP1 for %1",sideJoinedText];
		};
	};

	if (_unit isKindOf "Air") then {
		_crew = missionNamespace getVariable Format ["WFBE_%1PILOT",sideJoinedText];
	};

	_rearmor = {
   				_ammo = _this select 4;
   				_result = 0;

   				switch (_ammo) do {
                    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};   
     				default {_result = _this select 2;};
    			};
   				_result
  			};

	//--- Driver.
	if (_driver) then {
		_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
		//// add eventhandler

		[_soldier] allowGetIn true;
		_soldier addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
		_soldier moveInDriver _vehicle;
	};

	//--- Gunner.
	if (_gunner) then {
		_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
		//// add eventhandler
		_soldier addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];

		[_soldier] allowGetIn true;
		_soldier moveInGunner _vehicle;
	};

	//--- Commander.
	if (_commander) then {
		_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
		//// add eventhandler
		_soldier addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];

		[_soldier] allowGetIn true;
		_soldier moveInCommander _vehicle;
	};

	//--- Extra vehicle turrets.
	if (_extracrew) then {
		Private ["_turrets"];
		_turrets = _currentUnit select QUERYUNITTURRETS;

		{
			if (isNull (_vehicle turretUnit _x)) then {
				_soldier = [_crew,_group,_position,WFBE_Client_SideID] Call WFBE_CO_FNC_CreateUnit;
				_soldier addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
				[_soldier] allowGetIn true;
				_soldier moveInTurret [_vehicle, _x];
			};
		} forEach _turrets;
	};



	[sideJoinedText,'UnitsCreated',_cpt] Call UpdateStatistics;
};

unitQueu = unitQueu - _cpt;

missionNamespace setVariable [Format["WFBE_C_QUEUE_%1",_factory],(missionNamespace getVariable Format["WFBE_C_QUEUE_%1",_factory])-1];
hint parseText(Format [localize "STR_WF_INFO_Build_Complete",_description]);