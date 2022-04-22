"WFBE_Client_PV_SupplyMissionStarted" addPublicVariableEventHandler {
    (_this select 1) spawn {
        private ['_associatedPlayer', '_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer', '_friendlyCommandCenterInProximity'];
        _associatedPlayer = _this select 0;
        _associatedSupplyTruck = _this select 1;
        _associatedSourceTown = _this select 2;
        _sidePlayer = _this select 3;

        _sourceTown setVariable ['LastSupplyMissionRun', time, true];

        _friendlyCommandCenterInProximity = false;

        while {!WFBE_Client_IsRespawning} do {
            if (isNull _associatedSupplyTruck) exitWith {};

            _friendlyCommandCenterInProximity = ((count (nearestObjects [(getPos _associatedSupplyTruck), ["Base_WarfareBUAVterminal"], 100])) < 0);

            if (_friendlyCommandCenterInProximity) exitWith {
                WFBE_Client_PV_SupplyMissionCompleted = [name player, _associatedSupplyTruck, sideJoined];
                publicVariableServer "WFBE_Client_PV_SupplyMissionCompleted";
            };

            sleep 2;
        };
    };
};

"WFBE_Client_PV_SupplyMissionCompleted" addPublicVariableEventHandler {
    private ['_namePlayer', '_associatedSupplyTruck', '_supplyAmount', '_sourceTown', '_sourceTownStr', '_sidePlayer', '_logMessage'];

    _namePlayer = ((_this select 1) select 0);
    _associatedSupplyTruck = ((_this select 1) select 1);
    _supplyAmount = _associatedSupplyTruck getVariable ["SupplyAmount", 0];
    _sourceTown = _associatedSupplyTruck getVariable ["SupplyFromTown", objNull];
    _sourceTownStr = str(_sourceTown);
    _sidePlayer = ((_this select 1) select 2);

    if ((isNull _sourceTown) || (_supplyAmount <= 0)) exitWith {};

    WFBE_Server_PV_SupplyMissionCompletedMessage = [format ["%1 has brought our team S %2 from %3.", _namePlayer, _supplyAmount, _sourceTownStr], _sidePlayer];

    [_sidePlayer, _supplyAmount] Call ChangeSideSupply;
    _associatedSupplyTruck setVariable ["SupplyAmount", 0, true];
    _associatedSupplyTruck setVariable ["SupplyFromTown", objNull, true];

    _logMessage = format ["%1 has brought S %2 from %3 to base (SIDE: %4).", _namePlayer, _supplyAmount, _sourceTown, _sidePlayer];

    ["INFORMATION", _logMessage] call WFBE_CO_FNC_LogContent;

    publicVariable "WFBE_Server_PV_SupplyMissionCompletedMessage";
};