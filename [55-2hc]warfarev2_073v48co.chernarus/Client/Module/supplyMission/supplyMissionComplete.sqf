private ['_associatedSupplyTruck'];

_associatedSupplyTruck = _this select 3 select 0;

diag_log format ["SupplyMissionComplete.sqf: _associatedSupplyTruck: %1", _associatedSupplyTruck];

WFBE_Server_PV_SupplyMissionCompleted = [player, _associatedSupplyTruck, side player];
publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";

diag_log format ["SupplyMissionComplete.sqf: publicVariable WFBE_Server_PV_SupplyMissionCompleted sent to server. Player: %1, _associatedSupplyTruck: %2, side player: %3", player, _associatedSupplyTruck, side player];