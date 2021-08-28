private ["_side", "_sideText", "_sideID", "_hq", "_position", "_direction", "_commanderTeam", "_logic", "_MHQ"];

_side = _this select 0;

_sideText = str _side;
_sideID = _side call GetSideID;

_hq = _side call WFBE_CO_FNC_GetSideHQ;

_position = getPos _hq;
_direction = getDir _hq;

_commanderTeam = _side call WFBE_CO_FNC_GetCommanderTeam;
_logic = _side call WFBE_CO_FNC_GetSideLogic;

if (!isNull _commanderTeam) then {
	if (isPlayer (leader _commanderTeam)) then {
		if (WF_A2_Vanilla) then {
			[getPlayerUID (leader _commanderTeam), "HandleSpecial", ["hq-setstatus", false]] call WFBE_CO_FNC_SendToClients;
		} else {
			[leader _commanderTeam, "HandleSpecial", ["hq-setstatus", false]] call WFBE_CO_FNC_SendToClient;
		};
	};
};

_logic setVariable ["wfbe_hq_repairing", true, true];


_MHQ = [missionNamespace getVariable format ["WFBE_%1MHQNAME", _sideText], _position, _sideID, _direction, true, false] call WFBE_CO_FNC_CreateVehicle;

_MHQ setVariable ["WFBE_Taxi_Prohib", true];
_MHQ setVariable ["wfbe_trashed", false];
_MHQ setVariable ["wfbe_side", _side];
_MHQ setVariable ["wfbe_structure_type", "Headquarters"];

_MHQ addEventHandler ["Killed", {
	_this spawn WFBE_SE_FNC_OnHQKilled;
}];

_MHQ setVelocity [0, 0, -1];
_MHQ setVariable ["wfbe_trashable", false];
_MHQ addEventHandler ["hit", {
	_this spawn BuildingDamaged;
}];

_logic setVariable ["wfbe_hq", _MHQ, true];

if (isMultiplayer) then {
	[_side, "HandleSpecial", ["set-hq-killed-eh", _mhq]] call WFBE_CO_FNC_SendToClients;
};

_logic setVariable ["wfbe_hq_deployed", false, true];
_logic setVariable ["wfbe_hq_repairing", false, true];
_logic setVariable ["wfbe_hq_repair_count", (_logic getVariable "wfbe_hq_repair_count") + 1, true];

 _commanderTeam = (_side) call WFBE_CO_FNC_GetCommanderTeam;
[leader _commanderTeam, "SetMHQLock", _MHQ] call WFBE_CO_FNC_SendToClient;	

[_side, "Mobilized", ["Base", _MHQ]] spawn SideMessage;

deleteVehicle _hq;

[nil, nil, rSPAWN, [_MHQ], {
	_MHQ = _this select 0;

	if (sideJoined != (_MHQ getVariable "wfbe_side")) exitWith {};
	
	deleteMarkerLocal hqWreckMarker;
}] call RE;

["INFORMATION", format ["Server_MHQRepair.sqf: [%1] MHQ has been repaired.", _sideText]] call WFBE_CO_FNC_LogContent;