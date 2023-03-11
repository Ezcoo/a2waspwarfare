
"WFBE_Server_PV_SupplyMissionCompleted" addPublicVariableEventHandler {

    private ['_namePlayer', '_associatedSupplyTruck', '_supplyAmount', '_sourceTown', '_sourceTownStr', '_sidePlayer', '_logMessage'];

    _namePlayer = name ((_this select 1) select 0);
    _associatedSupplyTruck = ((_this select 1) select 1);
    _supplyAmount = _associatedSupplyTruck getVariable "SupplyAmount";
    _sourceTown = _associatedSupplyTruck getVariable "SupplyFromTown";
    _sourceTownStr = str(_sourceTown);
    _sidePlayer = ((_this select 1) select 2);

    if (isNil "_supplyAmount") then {
        _supplyAmount = 0;
    };

    if (isNil "_sourceTown") then {
        _sourceTown = objNull;
    };

    if ((isNull _sourceTown) || (_supplyAmount <= 0)) exitWith {};


    WFBE_Server_PV_SupplyMissionCompletedMessage = [format ["%1 has transported S %2 to base from %3.", _namePlayer, _supplyAmount, _sourceTownStr], _sidePlayer];

    [_sidePlayer, _supplyAmount, format ["Supply mission completed by %1. S %2 brought from %3 for team %4. ",_namePlayer, _supplyAmount, _sourceTown, _sidePlayer]] Call ChangeSideSupply;
    _associatedSupplyTruck setVariable ["SupplyAmount", 0, true];
    _associatedSupplyTruck setVariable ["SupplyFromTown", objNull, true];

    _logMessage = format ["%1 has brought S %2 from %3 to base (SIDE: %4).", _namePlayer, _supplyAmount, _sourceTown, _sidePlayer];

    ["INFORMATION", _logMessage] call WFBE_CO_FNC_LogContent;

    publicVariable "WFBE_Server_PV_SupplyMissionCompletedMessage";
};