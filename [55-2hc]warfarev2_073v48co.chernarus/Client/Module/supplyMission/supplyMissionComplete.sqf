private ['_associatedSupplyTruck'];

_associatedSupplyTruck = _this select 3;

WFBE_Server_PV_SupplyMissionCompleted = [player, _associatedSupplyTruck, side player];
publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";