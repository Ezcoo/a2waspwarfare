/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_PLAYERID" addPublicVariableEventHandler {

    private ["_requestID", "_side"];

    WFBE_SRV_VAR_RequestPlayerSkill = WFBE_CL_VAR_REQUESTID select 0;
    _requestID = WFBE_SVR_VAR_RequestPlayerSkill;
    _side = WFBE_CL_VAR_REQUESTID select 1;

    publicVariable "WFBE_SRV_VAR_RequestPlayerSkill";

    [_requestID, _side] execVM "Server\AntistackV2\MonitorHandleSkills.sqf";

};

