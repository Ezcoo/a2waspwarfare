"SUPPLY_VALUE_REQUESTED" addPublicVariableEventHandler {

	private ["_supplyValueRequested"];

	_supplyValueRequested = _this select 1;

	missionNamespace setVariable [format ["wfbe_supply_%1", str (side player)], _supplyValueRequested];
};