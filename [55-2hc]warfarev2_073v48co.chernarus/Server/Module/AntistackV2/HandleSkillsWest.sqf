/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_SKILL_WEST" addPublicVariableEventHandler {

    private ["_skillWestRequest","_skillWestRequestID","_skillWestRequestIDplayerSkill","_skillWest"];

    _skillWestRequest = _this;
    _skillWestRequestID = _this select 0;
    _skillWestRequestIDplayerSkill = _this select 1;

    _skillWest = missionNamespace getVariable format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID];

    if (isNil "_skillWest") then {
        missionNamespace setVariable [format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID], _skillWestRequestIDplayerSkill];
    } else {
        _skillWest set [count _skillWest, _skillWestRequestIDplayerSkill];

        missionNamespace setVariable format [["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID], _skillWest];
    };

    ["INFORMATION", format ["HandleSkillsWest.sqf: %1 value is: %2", format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID], missionNamespace getVariable format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID]]] Call WFBE_CO_FNC_LogContent;
};