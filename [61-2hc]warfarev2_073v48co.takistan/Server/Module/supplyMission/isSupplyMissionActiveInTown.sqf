"WFBE_Client_PV_IsSupplyMissionActiveInTown" addPublicVariableEventHandler {

	private ["_player", "_sourceTown", "_lastActivationTime", "_supplyMissionCooldownOn"];

	_player = ((_this select 1) select 0);
	_sourceTown = ((_this select 1) select 1);

	_lastActivationTime = _sourceTown getVariable "LastSupplyMissionRun";

	_supplyMissionCooldownEnabled = false;

	if (((_lastActivationTime + WFBE_CO_VAR_SupplyMissionRegenInterval) > time) && (_lastActivationTime != 0)) then {
		_supplyMissionCooldownEnabled = true;
	};

	missionNamespace setVariable ["WFBE_Server_PV_IsSupplyMissionActiveInTown", [_sourceTown, _supplyMissionCooldownEnabled]];

	publicVariable "WFBE_Server_PV_IsSupplyMissionActiveInTown";

};