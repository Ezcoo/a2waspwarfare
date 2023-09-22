private["_side", "_template", "_templateRequire", "_buildings", "_status", "_barrack", "_light", "_heavy", "_air",
"_destination", "_lastDestination", "_orderComplete", "_end", "_inf_group"];


_side = _this select 0;
_template = _this select 1;
_templateRequire = _this select 2;
_buildings = _this select 3;
_status = _this select 4;
_action_type = _this select 5;

_barrack = _buildings select 0;

_destination = objNull;
_lastDestination = objNull;
_orderComplete = true;
_end = false;
_alives = [];
_inf_group = createGroup _side;

if(count _alives == 0) then{
	{
		_buyFrom = objNull;
		_kindDetail = missionNamespace getVariable _x;
		_unitType = _kindDetail select QUERYUNITFACTORY;
		_buyFrom = _barrack;

		if !(isNull _buyFrom) then {
			_IDS = [];
			[_IDS,_buyFrom,_x,_side,_inf_group] call ResBuyUnit;
		};
	} forEach _template;
};

while{!_end}do{
	sleep 120;
	_alives = (units _inf_group) Call GetLiveUnits;

	if(count _alives > 0)then{
		WF_Logic setVariable [_status,true];

		_end = false;
	}else{
		WF_Logic setVariable [_status,false];
		_end = true;
	};



	if(_action_type == "moveto")then{

		// Marty : fixing source of the bug when function SortByDistance is called. We need to give objects or positions BUT NOT strings :
		_WestBaseStructures = (west) Call WFBE_CO_FNC_GetSideStructures;
		_EastBaseStructures = (east) Call WFBE_CO_FNC_GetSideStructures;
		//_WestBaseStructures = missionNamespace getVariable Format["WFBE_%1STRUCTURES",west];
		//_EastBaseStructures = missionNamespace getVariable Format["WFBE_%1STRUCTURES",east];

		_WestMHQ = (west) Call WFBE_CO_FNC_GetSideHQ;
		_EastMHQ = (east) Call WFBE_CO_FNC_GetSideHQ;
				
		_buildings = (_WestBaseStructures) + (_EastBaseStructures) + [_EastMHQ,_WestMHQ];

		// Marty : debugging Common_SortByDistance.sqf
		diag_log format["7.0. DEBUG Common_SortByDistance.sqf CALLED BY res_team.sqf"]; 
		//diag_log format[ "7.1. DEBUG res_team.sqf _buildings = %1 | type = %2", _buildings, typeName _buildings ];
		//diag_log format[ "7.2. DEBUG res_team.sqf _barrack = %1 | type = %2", _barrack, typeName _barrack ];
		
		_near = [_barrack, _buildings] Call SortByDistance;

		//diag_log format[ "7.3. DEBUG res_team.sqf _near = %1 | type = %2", _near, typeName _near ]; // Marty debugging.

		_target = _near select 0;
		[_inf_group, true, [[_target, 'SAD', 100, 60, "", []]]] Call AIWPAdd;

	}else{
		if (_orderComplete) then {
			_orderComplete = false;
			_destination = [leader _inf_group, [_barrack]] Call WFBE_CO_FNC_GetClosestEntity;
			[_inf_group,_destination,90] Call AIPatrol;

		};

	};


};

