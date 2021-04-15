/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_REQUESTID" addPublicVariableEventHandler {

    private ["_requestID", "_side","_handleSidePlayer","_handleOpposingSidePlayer"];

    WFBE_SRV_VAR_RequestPlayerSkill = WFBE_CL_VAR_REQUESTID select 0;

    _requestID = WFBE_SRV_VAR_RequestPlayerSkill;
    _side = WFBE_CL_VAR_REQUESTID select 1;
    _playerSkill = WFBE_CL_VAR_REQUESTID select 2;


    _handleSidePlayer = [_requestID, _side, _playerSkill] execVM "Server\AntistackV2\MonitorHandleSkills.sqf";

    publicVariable "WFBE_SRV_VAR_RequestPlayerSkill";

    if (_side == west) then {
        _side == east;
    } else {
        _side == west;
    };

    _handleOpposingSidePlayer = [_requestID, _side, 0] execVM "Server\AntistackV2\MonitorHandleSkills.sqf";

    waitUntil {scriptDone _handleSidePlayer && scriptDone _handleOpposingSidePlayer};

};

