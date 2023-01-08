"WFBE_Client_PV_IsSupplyMissionActiveInTown" addPublicVariableEventHandler {

	private ["_player", "_sourceTown", "_lastActivationTime", "_supplyMissionCooldownOn"];

	_player = ((_this select 1) select 0);
	_sourceTown = ((_this select 1) select 1);

	_lastActivationTime = _sourceTown getVariable "LastSupplyMissionRun";

	_supplyMissionCooldownEnabled = false;

	if (((_lastActivationTime + 1800) > time) && (_lastActivationTime != 0)) then {
		_supplyMissionCooldownEnabled = true;
	};

	diag_log format ["_supplyMissionCooldownEnabled: %1 for town: %2", _supplyMissionCooldownEnabled, _sourceTown];

	missionNamespace setVariable ["WFBE_Server_PV_IsSupplyMissionActiveInTown", [_sourceTown, _supplyMissionCooldownEnabled]];

	(owner _player) publicVariableClient "WFBE_Server_PV_IsSupplyMissionActiveInTown";

};