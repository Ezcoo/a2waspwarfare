
"WFBE_Server_PV_SupplyMissionCompletedMessage" addPublicVariableEventHandler {
    
    private ["_sideEquals","_message"];

    _sideEquals = if (side player == WFBE_Server_PV_SupplyMissionCompletedMessage select 1) then {true} else {false};
    _message = WFBE_Server_PV_SupplyMissionCompletedMessage select 0;

    if (_sideEquals) then {
        _message call CommandChatMessage;
    };
};