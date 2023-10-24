Private ["_currency","_currencySym","_currency_system","_hq","_repairPrice","_vehicle","_commander","_towns","_logik","_get"];

_vehicle = _this select 0;
_commander = (sidejoined) call GetCommanderTeam;
_logik = (sidejoined) Call WFBE_CO_FNC_GetSideLogic;
_get = _logik getVariable "cashrepaired";
_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
if (alive _hq ) exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_None")};
if (_get) exitWith {hint "HQ cannot be repaired using cash twice!"};
//--- Is HQ already being fixed?
if (WFBE_Client_Logic getVariable "wfbe_hq_repairing") exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_BeingRepaired")};

_currency_system = missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM";
_repairPrice = (missionNameSpace getVariable "WFBE_C_BASE_HQ_REPAIR_PRICE_CASH");
_currency = Call GetPlayerFunds;
_currencySym = "$";
if (_currency < _repairPrice) exitWith {hint Format [localize "STR_WF_INFO_Repair_MHQ_Funds",_currencySym,_repairPrice - _currency]};

-(_repairPrice) Call ChangePlayerFunds;

["RequestMHQRepair", sideJoined] Call WFBE_CO_FNC_SendToServer;

WF_Logic setVariable [Format ["%1MHQRepair",sideJoinedText],true,true];
_logik setVariable ['cashrepaired',true,true];
hint (localize "STR_WF_INFO_Repair_MHQ_Repair");
_hq setPos [((getPos player) select 0) + 5, (getPos player) select 1,((getPos player) select 2)+300];
_towns =(sideJoined) call GetSideTowns;
{_x setVariable ["supplyvalue", 10, true]} forEach _towns;
hint "ALL TOWNS' SV ARE SET TO MINIMUM ...";
sleep 5;
hint "New HQ has been parachuted over your location !";
