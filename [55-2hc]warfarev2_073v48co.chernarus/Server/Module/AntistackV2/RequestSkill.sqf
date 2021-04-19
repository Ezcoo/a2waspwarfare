/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_CL_VAR_REQUESTID" addPublicVariableEventHandler {

    [] spawn {

    private ["_requestID", "_side","_handleSidePlayer","_handleOpposingSidePlayer","_opposingSide"];

    WFBE_SRV_VAR_RequestPlayerID = (_this select 1) select 0;

    _requestID = WFBE_SRV_VAR_RequestPlayerID;
    _side = (_this select 1) select 1;
    _opposingSide = east;
    
    ["INFORMATION", format ["RequestSkill.sqf: Contents of WFBE_CL_VAR_REQUESTID: %1, initializing score calculation monitoring...", _this select 1]] Call WFBE_CO_FNC_LogContent;

    _handleSidePlayer = [_requestID, _side] spawn WFBE_CO_FNC_MonitorHandleSkills;

    if (_side == west) then {
        _opposingSide = east;
    } else {
        _opposingSide = west;
    };

    _handleOpposingSidePlayer = [_requestID, _side] spawn WFBE_CO_FNC_MonitorHandleSkills;

    publicVariable "WFBE_SRV_VAR_RequestPlayerSkill";

    ["INFORMATION", format ["RequestSkill.sqf: Waiting for the team score calculation threads to finish... _requestID: %1", _requestID]] Call WFBE_CO_FNC_LogContent;
 
    waitUntil {(scriptDone _handleSidePlayer) && (scriptDone _handleOpposingSidePlayer)};

    ["INFORMATION", format ["RequestSkill.sqf: Team score calculation threads finished! _requestID: %1", _requestID]] Call WFBE_CO_FNC_LogContent;

    if ((missionNamespace getVariable format ["WFBE_SRV_VAR_TOTALSKILL_%1", _opposingSide]) >= (missionNamespace getVariable format ["WFBE_SRV_VAR_TOTALSKILL_%1", _side])) then {
        missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", _requestID], true];
        missionNamespace setVariable [format ["WFBE_JOIN_RESULT_ARRIVED_%1", _requestID], true];

        publicVariableServer format ["WFBE_JOIN_RESULT_ARRIVED_%1", _requestID];
        publicVariableServer format ["WFBE_SRV_VAR_CANJOIN_%1", _requestID];

        ["INFORMATION", format ["RequestSkill.sqf: _requestID: %1. CANJOIN: %2, RESULT_ARRIVED: %3", _requestID, missionNamespace getVariable format ["WFBE_SRV_VAR_CANJOIN_%1", _requestID], missionNamespace getVariable format ["WFBE_JOIN_RESULT_ARRIVED_%1", _requestID]]] Call WFBE_CO_FNC_LogContent;
    } else {
        missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", _requestID], false];
        missionNamespace setVariable [format ["WFBE_JOIN_RESULT_ARRIVED_%1", _requestID], true];

        publicVariableServer format ["WFBE_JOIN_RESULT_ARRIVED_%1", _requestID];
        publicVariableServer format ["WFBE_SRV_VAR_CANJOIN_%1", _requestID];

        ["INFORMATION", format ["RequestSkill.sqf: _requestID: %1. CANJOIN: %2, RESULT_ARRIVED: %3", _requestID, missionNamespace getVariable format ["WFBE_SRV_VAR_CANJOIN_%1", _requestID], missionNamespace getVariable format ["WFBE_JOIN_RESULT_ARRIVED_%1", _requestID]]] Call WFBE_CO_FNC_LogContent;
    };

    };

};