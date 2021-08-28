private ["_vehicle", "_hq", "_currency_system", "_repairPrice", "_currency", "_currencySym", "_counter"];

_vehicle = _this select 0;

_hq = sideJoined call WFBE_CO_FNC_GetSideHQ;

if (alive _hq || _hq distance _vehicle > 30) exitWith {
    hintSilent (localize "STR_WF_INFO_Repair_MHQ_None");
};

if (WFBE_Client_Logic getVariable "wfbe_hq_repairing") exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_BeingRepaired")};

_currency_system = missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM";

switch (missionNamespace getVariable format ['WFBE_C_BASE_HQ_REPAIR_COUNT_%1', sideJoined]) do {
    case 1: {
        missionNamespace setVariable [format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined], missionNamespace getVariable "WFBE_C_BASE_HQ_REPAIR_PRICE_2ND"];
    };

    case 2: {
        missionNamespace setVariable [format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined], missionNamespace getVariable "WFBE_C_BASE_HQ_REPAIR_PRICE_3RD"];
    };
};

if (missionNamespace getVariable format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined] == (missionNamespace getVariable "WFBE_C_BASE_HQ_REPAIR_PRICE_3RD")) exitWith {
    hintSilent format [localize "STR_WF_INFO_MHQ_Repairs_Used"];
};

_repairPrice = (missionNamespace getVariable format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined]);
_currency = if (_currency_system == 0) then {sideJoined call GetSideSupply} else {call GetPlayerFunds};
_currencySym = if (_currency_system == 0) then {"S"} else {"$"};

if (_currency < _repairPrice) exitWith {
    hintSilent format [localize "STR_WF_INFO_Repair_MHQ_Funds", _currencySym, _repairPrice - _currency];
};

if (_currency_system == 0) then {
	[sideJoined,-_repairPrice] call ChangeSideSupply;
} else {
	-(_repairPrice) call ChangePlayerFunds;
};

["RequestMHQRepair", sideJoined] call WFBE_CO_FNC_SendToServer;

WF_Logic setVariable [format ["%1MHQRepair", sideJoinedText], true, true];

_counter = missionNamespace getVariable format ['WFBE_C_BASE_HQ_REPAIR_COUNT_%1', sideJoined];
missionNamespace setVariable [format ['WFBE_C_BASE_HQ_REPAIR_COUNT_%1', sideJoined], _counter + 1];

hintSilent (localize "STR_WF_INFO_Repair_MHQ_Repair");