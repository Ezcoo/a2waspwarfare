Private ["_buildings","_closest","_defense","_direction","_distance","_index","_position","_side","_team","_type","_unit","_commander"];
_defense = _this select 0;
_side = _this select 1;
_team = _this select 2;
_closest = _this select 3;

while {alive _defense} do {
	if (isNull(gunner _defense) || !alive gunner _defense) then {

		sleep 7;

		if (alive _closest && !(isNull _closest )) then {
			_type = typeOf _closest;
			_index = (missionNamespace getVariable Format["WFBE_%1STRUCTURENAMES",str _side]) find _type;
			_distance = (missionNamespace getVariable Format["WFBE_%1STRUCTUREDISTANCES",str _side]) select _index;
			_direction = (missionNamespace getVariable Format["WFBE_%1STRUCTUREDIRECTIONS",str _side]) select _index;
			_position = [getPos _closest,_distance,getDir (_closest) + _direction] Call GetPositionFrom;

			_HC = missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID";
			if (count _HC > 0) then {
				_groups = [] + [missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side]];
				_positions = [] + [_position];
				[_side, _groups, _positions, _team, _defense, false] Call WFBE_CO_FNC_DelegateAIStaticDefenceHeadless;
			}else{
			    _sideID = (_side) Call WFBE_CO_FNC_GetSideID;
                _type = missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side];
                _soldier = [_type,_team,getPosATL _defense,_sideID] Call WFBE_CO_FNC_CreateUnit;
                [_soldier] allowGetIn true;
                _soldier assignAsGunner _defense;
                [_soldier] orderGetIn true;
                _soldier moveInGunner _defense;
                [_team, 1000, getPosATL _defense] spawn WFBE_CO_FNC_RevealArea;
			};

			[str _side,'UnitsCreated',1] Call UpdateStatistics;
			["INFORMATION", Format ["Server_HandleDefense.sqf: [%1] Unit has been dispatched to a [%2] defense.", str _side,_type]] Call WFBE_CO_FNC_LogContent;

		} else {
			["INFORMATION", "Server_HandleDefense.sqf: Canceled auto manning, the barracks is destroyed."] Call WFBE_CO_FNC_LogContent;
		};
	};
	sleep 420;
};