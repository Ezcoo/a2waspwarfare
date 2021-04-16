/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_SKILL_EAST" addPublicVariableEventHandler {

    private ["_skillEastRequest","_skillEastRequestID","_skillEastRequestIDplayerSkill","_skillEast"];

    _skillEastRequest = WFBE_CL_VAR_SKILL_EAST;
    _skillEastRequestID = WFBE_CL_VAR_SKILL_EAST select 0;
    _skillEastRequestIDplayerSkill = WFBE_CL_VAR_SKILL_EAST select 1;

    _skillEast = missionNamespace getVariable format ["WFBE_CL_VAR_SKILL_EAST_REQUESTID_%1", _skillEastRequestID];

    if (isNil "_skillEast") then {
        missionNamespace setVariable [format ["WFBE_CL_VAR_SKILL_EAST_REQUESTID_%1", _skillEastRequestID], _skillEastRequestIDplayerSkill];
    } else {
        _skillEast set [count _skillEast, _skillEastRequestIDplayerSkill];

        missionNamespace setVariable format [["WFBE_CL_VAR_SKILL_EAST_REQUESTID_%1", _skillEastRequestID], _skillEast];
    }

    ["INFORMATION", format ["HandleSkillsEast.sqf: %1 value is: %2", format ["WFBE_CL_VAR_SKILL_EAST_REQUESTID_%1", _skillEastRequestID], missionNamespace getVariable format ["WFBE_CL_VAR_SKILL_EAST_REQUESTID_%1", _skillEastRequestID]]] Call WFBE_CO_FNC_LogContent;
};