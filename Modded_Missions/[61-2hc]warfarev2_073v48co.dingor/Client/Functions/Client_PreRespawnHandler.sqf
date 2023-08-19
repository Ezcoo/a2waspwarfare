Private ["_hq","_unit","_rearmor"];

_unit = _this;

(_unit) Call WFBE_SK_FNC_Apply;
[] execFSM "Client\FSM\updateactions.fsm";

Options = _unit addAction ["<t color='#42b6ff'>" + (localize "STR_WF_Options") + "</t>","Client\Action\Action_Menu.sqf", "", 1, false, true, "", "_target == player"];
[] execVM "WASP\actions\OnKilled.sqf";
player call Compile preprocessFileLineNumbers "WASP\rpg_dropping\DropRPG.sqf";
(vehicle player) addEventHandler ["Fired",{_this Spawn HandleAT}];

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
			
player addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];

if (!isNull commanderTeam) then {
	_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
	if (commanderTeam == group _unit) then {HQAction = _unit addAction [localize "STR_WF_BuildMenu","Client\Action\Action_Build.sqf", [_hq], 100, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"]};
};

[sideJoinedText,'UnitsCreated',1] Call UpdateStatistics;