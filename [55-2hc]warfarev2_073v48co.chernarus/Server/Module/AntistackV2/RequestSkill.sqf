/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_REQUESTID" addPublicVariableEventHandler {

    private ["_requestID", "_side","_handleSidePlayer","_handleOpposingSidePlayer","_opposingSide"];

    WFBE_SRV_VAR_RequestPlayerSkill = WFBE_CL_VAR_REQUESTID select 0;

    _requestID = WFBE_SRV_VAR_RequestPlayerSkill;
    _side = WFBE_CL_VAR_REQUESTID select 1;
    _playerSkill = WFBE_CL_VAR_REQUESTID select 2;


    _handleSidePlayer = [_requestID, _side, _playerSkill] execVM "Server\AntistackV2\MonitorHandleSkills.sqf";

    publicVariable "WFBE_SRV_VAR_RequestPlayerSkill";

    if (_side == west) then {
        _opposingSide == east;
    } else {
        _opposingSide == west;
    };

    _handleOpposingSidePlayer = [_requestID, _side, 0] execVM "Server\AntistackV2\MonitorHandleSkills.sqf";

    waitUntil {scriptDone _handleSidePlayer && scriptDone _handleOpposingSidePlayer};

    if ((missionNamespace getVariable format ["WFBE_SRV_VAR_TOTALSKILL_%1", _opposingSide]) >= (missionNamespace getVariable format ["WFBE_SRV_VAR_TOTALSKILL_%1", _side])) then {
        missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player], true];
        missionNamespace setVariable [format ["WFBE_JOIN_RESULT_ARRIVED_%1", getPlayerUID player], true];
    } else {
        missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player], false];
        missionNamespace setVariable [format ["WFBE_JOIN_RESULT_ARRIVED_%1", getPlayerUID player], true];
    }

