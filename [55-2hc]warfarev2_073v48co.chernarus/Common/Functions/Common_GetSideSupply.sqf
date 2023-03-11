/*
	Return side's supply.
	 Parameters:
		- Side.
*/

private ["_supplyTeam"];

switch (_this) do {
	case west: {
		_supplyTeam = missionNamespace getVariable format ["wfbe_supply_%1", str _this];

		if (isNil "_supplyTeam") then {
			REQUEST_SUPPLY_VALUE = player;
			publicVariableServer "REQUEST_SUPPLY_VALUE";

			waitUntil {!isNil {missionNamespace getVariable format ["wfbe_supply_%1", str _this];}};
			_supplyTeam = missionNamespace getVariable format ["wfbe_supply_%1", str _this];
		};

		_supplyTeam
	};
	case east: {
		_supplyTeam = missionNamespace getVariable format ["wfbe_supply_%1", str _this];

		if (isNil "_supplyTeam") then {
			REQUEST_SUPPLY_VALUE = player;
			publicVariableServer "REQUEST_SUPPLY_VALUE";

			waitUntil {!isNil {missionNamespace getVariable format ["wfbe_supply_%1", str _this];}};
			_supplyTeam = missionNamespace getVariable format ["wfbe_supply_%1", str _this];
		};

		_supplyTeam
	};
	case resistance: {
		_supplyTeam = missionNamespace getVariable format ["wfbe_supply_%1", str _this];

		if (isNil "_supplyTeam") then {
			REQUEST_SUPPLY_VALUE = player;
			publicVariableServer "REQUEST_SUPPLY_VALUE";

			waitUntil {!isNil {missionNamespace getVariable format ["wfbe_supply_%1", str _this];}};
			_supplyTeam = missionNamespace getVariable format ["wfbe_supply_%1", str _this];
		};

		_supplyTeam
	};
	default {objNull};
}