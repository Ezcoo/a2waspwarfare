
"WFBE_Server_PV_SupplyMissionCompletedMessage" addPublicVariableEventHandler {
    
    private ["_message"];

    _message = (WFBE_Server_PV_SupplyMissionCompletedMessage select 0);

    if ((side player) == (WFBE_Server_PV_SupplyMissionCompletedMessage select 1)) then {
        _message call CommandChatMessage;
    };
};