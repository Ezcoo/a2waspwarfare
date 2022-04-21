private ["_namePlayer","_supplyAmount","_sourceTown","_sidePlayer"];

"WFBE_Client_PV_SupplyMissionCompleted" addPublicVariableEventHandler {

    _namePlayer = ((_this select 1) select 0);
    _supplyAmount = ((_this select 1) select 1);
    _sourceTown = ((_this select 1) select 2);
    _sidePlayer = ((_this select 1) select 3);

    WFBE_Server_PV_SupplyMissionCompletedMessage = [format ["%1 has brought our team S %2 from %3.", _namePlayer, _supplyAmount, _sourceTown], _sidePlayer];

    publicVariable "WFBE_Server_PV_SupplyMissionCompletedMessage";
};