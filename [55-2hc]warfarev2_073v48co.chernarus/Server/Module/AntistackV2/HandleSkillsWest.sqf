/*
	author: Net_2
	description: none
	returns: nothing
*/


"WFBE_CL_VAR_SKILL_WEST" addPublicVariableEventHandler {

    private ["_skillWestRequest","_skillWestRequestID","_skillWestRequestIDplayerSkill","_skillWest"];

    _skillWestRequest = WFBE_CL_VAR_SKILL_WEST;
    _skillWestRequestID = WFBE_CL_VAR_SKILL_WEST select 0;
    _skillWestRequestIDplayerSkill = WFBE_CL_VAR_SKILL_WEST select 1;

    _skillWest = format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID];

    missionNamespace setVariable [format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID], _skillWest set [count _skillWest, _skillWestRequestIDplayerSkill]];

};