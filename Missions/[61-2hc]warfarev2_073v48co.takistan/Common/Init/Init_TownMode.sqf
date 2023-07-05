Private ['_towns','_value'];

waitUntil {WFBE_Parameters_Ready};

TownTemplate = [];
switch (missionNamespace getVariable "WFBE_C_TOWNS_AMOUNT") do {
	case 0: {TownTemplate = WF_Logic getVariable "Towns_RemovedXSmall"};
	case 1: {TownTemplate = WF_Logic getVariable "Towns_RemovedSmall"};
	case 2: {TownTemplate = WF_Logic getVariable "Towns_RemovedMedium"};
	case 3: {TownTemplate = WF_Logic getVariable "Towns_RemovedLarge"};
	case 5: {TownTemplate = WF_Logic getVariable "Towns_RemovedBigTowns"};
	case 6: {TownTemplate = WF_Logic getVariable "Towns_RemovedCentralLine"};
	case 7: {TownTemplate = WF_Logic getVariable "Towns_RemovedSmallTowns"};
};

if (isNil "TownTemplate") then {TownTemplate = []};//--- The field is not defined, we use the default island setting.

_towns = [7000,7500,0] nearEntities [["LocationLogicDepot"], 30000];
totalTowns = (count _towns) - (count TownTemplate);

townModeSet = true;

["INITIALIZATION", Format["Init_TownMode.sqf: Towns mode initialization is done for island [%1].",worldName]] Call WFBE_CO_FNC_LogContent;