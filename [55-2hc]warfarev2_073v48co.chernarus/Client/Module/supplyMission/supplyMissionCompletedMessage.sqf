
"WFBE_Server_PV_SupplyMissionCompletedMessage" addPublicVariableEventHandler {
    
    private ["_message", "_side"];

    _message = (_this select 1) select 0;
    _side = (_this select 1) select 1;

    if ((side player) == _side) then {
        _message call CommandChatMessage;
    };
};