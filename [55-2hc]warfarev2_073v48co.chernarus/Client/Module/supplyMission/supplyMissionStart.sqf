private ['_sourceTown', '_TownSupplyLastMission', '_associatedSupplyTruck', '_supplyAmount','_supplyMissionAlreadyActiveInTown'];

_sourceTown = call GetClosestFriendlyLocation;
WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK = objNull;

missionNamespace setVariable ["WFBE_Client_PV_IsSupplyMissionActiveInTown", [player, _sourceTown]];
publicVariableServer "WFBE_Client_PV_IsSupplyMissionActiveInTown";

_supplyMissionAlreadyActiveInTown = _sourceTown getVariable "supplyMissionCoolDownEnabled";

diag_log format ["_supplyMissionAlreadyActiveInTown: %1, in town: %2", _supplyMissionAlreadyActiveInTown, _sourceTown];

if (_supplyMissionAlreadyActiveInTown) exitWith {
    diag_log format ["ERROR: Supply mission happened already during the last 30 minutes in %1!", _sourceTown];
    format ["This town doesn't have enough supplies to be collected yet! You can start a supply mission in towns that have [+SUPPLY] added after their SV on map."] call GroupChatMessage;
};

if (typeOf cursorTarget in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF', 'UralSupply_TK_EP1', 'MtvrSupply_DES_EP1']) then {
    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK = cursorTarget;
    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK setVariable ["SupplyFromTown", _sourceTown, true];

    _supplyAmount = (_sourceTown getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER;
    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK setVariable ["SupplyAmount", _supplyAmount, true];

    format ["You loaded S %1 to your truck from %2. Note that supplies from one town only fit in your truck at a time!", _supplyAmount, str (_sourceTown)] call GroupChatMessage;

    WFBE_Client_PV_SupplyMissionStarted = [player, WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK, _sourceTown, sideJoined];
    publicVariableServer "WFBE_Client_PV_SupplyMissionStarted";
    
};

sleep 2;

publicVariableServer "WFBE_Client_PV_IsSupplyMissionActiveInTown";

/*
diag_log "SupplyMissionStart: PHASE ONE";

diag_log "SupplyMissionStart: PHASE TWO";

player addAction [
    "<t color='#00e83e'>" + 'UNLOAD SUPPLIES FROM TRUCK' + "</t>",
    'Client\Module\supplyMission\supplyMissionComplete.sqf',
    [WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK],
    70,
    false,
    true,
    "",
    "(count (nearestObjects [(getPos WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK), ['Base_WarfareBUAVterminal'], 100]) > 0) && (cursorTarget == WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK)"
];

diag_log format ["SupplyMissionStart: cursorTarget == WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK: %1", (cursorTarget == WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK)];
diag_log format ["SupplyMissionStart: WFBE_CL_FNC_CheckCCProximity: %1", WFBE_CL_FNC_CheckCCProximity];

diag_log "SupplyMissionStart: PHASE THREE";
*/