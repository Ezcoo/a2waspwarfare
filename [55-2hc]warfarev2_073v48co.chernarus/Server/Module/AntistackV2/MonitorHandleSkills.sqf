/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_requestID","_side","_skillsTeam","_totalSkillTeam","_i"];

_requestID = _this select 0;
_side = _this select 1;

_skillsTeam = format ["WFBE_CL_VAR_SKILL_%1_REQUESTID_%2", _side, _requestID];

["INFORMATION", format ["MonitorHandleSkills.sqf: Waiting for players to respond to the server request to send player skill value... _requestID: %1", _requestID]] Call WFBE_CO_FNC_LogContent;

// Wait until skill of all players on given side have been calculated
waitUntil {(count _skillsTeam) >= ({isPlayer _x && side _x == (format ["%1", _side])} count allUnits)};

["INFORMATION", format ["MonitorHandleSkills.sqf: All players have sent their skill values! Starting to calculate team [%1] score... _requestID: %2", _side, _requestID]] Call WFBE_CO_FNC_LogContent;

_totalSkillTeam = 0;
_i = 0;

for "_i" from 0 to (count _skillsTeam - 1) step 1 do {
	_totalSkillTeam = _totalSkillTeam + _skillsTeam select _i;
};

missionNamespace setVariable [format ["WFBE_SRV_VAR_TOTALSKILL_%1", _side], _totalSkillTeam];

["INFORMATION", format ["MonitorHandleSkills.sqf: Total skill of team [%1] is: %2. _requestID: %3. Sending publicVariable to server itself...", _totalSkillTeam, _side, _requestID]] Call WFBE_CO_FNC_LogContent;

publicVariableServer format ["WFBE_SRV_VAR_TOTALSKILL_%1", _side];