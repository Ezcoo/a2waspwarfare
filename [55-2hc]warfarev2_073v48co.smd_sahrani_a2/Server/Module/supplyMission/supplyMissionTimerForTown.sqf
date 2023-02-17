private ["_sourceTown"];

_sourceTown = _this select 0;

uiSleep WFBE_CO_VAR_SupplyMissionRegenInterval;

missionNamespace setVariable ["WFBE_Server_PV_IsSupplyMissionActiveInTown", [_sourceTown, false]];

publicVariable "WFBE_Server_PV_IsSupplyMissionActiveInTown";