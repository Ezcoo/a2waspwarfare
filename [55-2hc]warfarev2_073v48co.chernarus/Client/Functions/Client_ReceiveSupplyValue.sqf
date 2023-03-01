"SUPPLY_VALUE_REQUESTED" addPublicVariableEventHandler {
	missionNamespace setVariable format [["wfbe_supply_%1", str (side player)], SUPPLY_VALUE_REQUESTED];
};