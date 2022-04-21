private ["_namePlayer","_supplyAmount","_sourceTown","_sidePlayer","_logMessage"];

"WFBE_Client_PV_SupplyMissionCompleted" addPublicVariableEventHandler {

    _namePlayer = ((_this select 1) select 0);
    _supplyAmount = ((_this select 1) select 1);
    _sourceTown = ((_this select 1) select 2);
    _sourceTownStr = str(_sourceTown);
    _sidePlayer = ((_this select 1) select 3);

    WFBE_Server_PV_SupplyMissionCompletedMessage = [format ["%1 has brought our team S %2 from %3.", _namePlayer, _supplyAmount, _sourceTownStr], _sidePlayer];

    _sourceTown setVariable ["LastSupplyRun", time, true];

    [_sidePlayer, _supplyAmount] Call ChangeSideSupply;

    _logMessage= format ["%1 has brought S %2 from %3 to base (SIDE: %4).", _namePlayer, _supplyAmount, _sourceTown, _sidePlayer];

    ["INFORMATION", _logMessage] call WFBE_CO_FNC_LogContent;

    publicVariable "WFBE_Server_PV_SupplyMissionCompletedMessage";
};