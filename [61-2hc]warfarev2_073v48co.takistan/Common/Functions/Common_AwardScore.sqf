/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_killed_type", "_get"];

_killed_type = _this select 0;

if (count _this > 1) then {
    _get = _this select 1;
} else {
    _get = missionNamespace getVariable _killed_type;
};

_points = switch (true) do {
    case (_killed_type isKindOf "Man"): {ceil((_get select QUERYUNITPRICE) *0.7* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "Car"): {round((_get select QUERYUNITPRICE) *0.45* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "Ship"): {round((_get select QUERYUNITPRICE) *0.4* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "Motorcycle"): {round((_get select QUERYUNITPRICE) *0.7* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
    case (_killed_type isKindOf "Tank"): {round((_get select QUERYUNITPRICE) *0.4* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "Helicopter"): {round((_get select QUERYUNITPRICE) *0.4* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "Plane"): {round((_get select QUERYUNITPRICE) *0.35* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "StaticWeapon"): {round((_get select QUERYUNITPRICE) *0.5* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100);};
	case (_killed_type isKindOf "Building"): {round((_get select QUERYUNITPRICE) *0.55* (missionNamespace getVariable "WFBE_C_UNITS_BOUNTY_COEF") / 100 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF"));};
	default {2};
};

_points