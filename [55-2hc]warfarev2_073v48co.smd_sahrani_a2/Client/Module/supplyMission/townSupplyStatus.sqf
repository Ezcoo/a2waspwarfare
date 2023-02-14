"WFBE_Server_PV_IsSupplyMissionActiveInTown" addPublicVariableEventHandler {

	private ["_sourceTown", "_supplyMissionCooldownOnInTown"];

	_sourceTown = ((_this select 1) select 0);
	_supplyMissionCooldownOnInTown = ((_this select 1) select 1);

	_sourceTown setVariable ["supplyMissionCoolDownEnabled", _supplyMissionCooldownOnInTown];
};