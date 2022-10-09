
"WFBE_Server_PV_SupplyMissionCompleted" addPublicVariableEventHandler {

    private ['_namePlayer', '_associatedSupplyTruck', '_supplyAmount', '_sourceTown', '_sourceTownStr', '_sidePlayer', '_logMessage'];

    _namePlayer = name ((_this select 1) select 0);
    _associatedSupplyTruck = ((_this select 1) select 1);
    _supplyAmount = _associatedSupplyTruck getVariable ["SupplyAmount", 0];
    _sourceTown = _associatedSupplyTruck getVariable ["SupplyFromTown", objNull];
    _sourceTownStr = str(_sourceTown);
    _sidePlayer = ((_this select 1) select 2);

    diag_log "Successfully called WFBE_SE_FNC_SupplyMissionCompleted.";

    if ((isNull _sourceTown) || (_supplyAmount <= 0)) exitWith {};

    diag_log "_sourceTown is not null and _supplyAmount is higher than 0.";

    WFBE_Server_PV_SupplyMissionCompletedMessage = [format ["%1 has brought our team S %2 from %3.", _namePlayer, _supplyAmount, _sourceTownStr], _sidePlayer];

    [_sidePlayer, _supplyAmount] Call ChangeSideSupply;
    _associatedSupplyTruck setVariable ["SupplyAmount", 0, true];
    _associatedSupplyTruck setVariable ["SupplyFromTown", objNull, true];

    _logMessage = format ["%1 has brought S %2 from %3 to base (SIDE: %4).", _namePlayer, _supplyAmount, _sourceTown, _sidePlayer];

    ["INFORMATION", _logMessage] call WFBE_CO_FNC_LogContent;

    publicVariable "WFBE_Server_PV_SupplyMissionCompletedMessage";

    diag_log "Called/sent publicVariable: WFBE_Server_PV_SupplyMissionCompletedMessage."
};