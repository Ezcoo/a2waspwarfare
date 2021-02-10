/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_SKILL_EAST" addPublicVariableEventHandler {

    private ["_skillWestRequestID"];

    _skillWestRequestID = WFBE_CL_VAR_SKILL_EAST;

    missionNamespace setVariable [format ["WFBE_CL_VAR_SKILL_WEST_REQUESTID_%1", _skillWestRequestID select 0], _skillWestRequestID select 1];

};