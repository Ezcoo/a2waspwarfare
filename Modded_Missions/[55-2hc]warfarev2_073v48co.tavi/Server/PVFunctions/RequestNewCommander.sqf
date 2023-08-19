Private["_commanderTeam","_logik","_name","_side","_team"];

_side = _this select 0;
_assigned_commander = _this select 1;

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

if ((_logik getVariable "wfbe_votetime") <= 0) then {
	_team = -1;

	//--- Set the commander
	_logik setVariable ["wfbe_commander", _assigned_commander, true];
	[_side, _assigned_commander] Spawn WFBE_SE_FNC_AssignForCommander;
	[_side, "HandleSpecial", ["new-commander-assigned", _assigned_commander]] Call WFBE_CO_FNC_SendToClients;

};