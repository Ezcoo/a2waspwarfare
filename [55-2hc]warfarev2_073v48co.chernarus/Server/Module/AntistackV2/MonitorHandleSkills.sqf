/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_requestID","_side","_skillsTeam","_totalSkillTeam","_i"];

_requestID = _this select 0;
_side = _this select 1;
_playerSkill = _this select 2;

_skillsTeam = format ["WFBE_CL_VAR_SKILL_%1_REQUESTID_%2", _side, _requestID];

// Wait until skill of all players on given side have been calculated
waitUntil {(count _skillsTeam) >= ({isPlayer _x && side _x == (format ["%1", _side])} count allUnits)};

_totalSkillTeam = 0;
_i = 0;

for "_i" from 0 to (count _skillsTeam - 1) step 1 do {
	_totalSkillTeam = _totalSkillTeam + _skillsTeam select _i;
}

_totalSkillTeam = _totalSkillTeam + _playerSkill;

missionNamespace setVariable [format ["WFBE_SRV_VAR_TOTALSKILL_%1", _side], _totalSkillTeam];

publicVariableServer format ["WFBE_SRV_VAR_TOTALSKILL_%1", _side];