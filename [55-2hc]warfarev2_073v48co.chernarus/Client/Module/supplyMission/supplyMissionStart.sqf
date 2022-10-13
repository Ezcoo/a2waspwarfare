private ['_sourceTown', '_TownSupplyLastMission', '_associatedSupplyTruck', '_supplyAmount','_supplyMissionAlreadyActiveInTown'];

_sourceTown = call GetClosestFriendlyLocation;
_associatedSupplyTruck = objNull;

missionNamespace setVariable ["WFBE_Client_PV_IsSupplyMissionActiveInTown", [player, _sourceTown]];
publicVariableServer "WFBE_Client_PV_IsSupplyMissionActiveInTown";

_supplyMissionAlreadyActiveInTown = _sourceTown getVariable "supplyMissionCoolDownEnabled";

if (_supplyMissionAlreadyActiveInTown) exitWith {
    diag_log format ["ERROR: Supply mission happened already during the last 30 minutes in %1!", _sourceTown];
    format ["This town doesn't have enough supplies to be collected yet! You can start a supply mission in towns that have [+SUPPLY] added after their SV on map."] call GroupChatMessage;
};

if (typeOf cursorTarget in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF', 'UralSupply_TK_EP1', 'MtvrSupply_DES_EP1']) then {
    _associatedSupplyTruck = cursorTarget;
    _associatedSupplyTruck setVariable ["SupplyFromTown", _sourceTown, true];

    _supplyAmount = (_sourceTown getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER;
    _associatedSupplyTruck setVariable ["SupplyAmount", _supplyAmount, true];

    format ["You loaded S %1 to your truck from %2. Note that supplies from one town only fit in your truck at a time!", _supplyAmount, str (_sourceTown)] call GroupChatMessage;

    /*
    WFBE_Client_PV_SupplyMissionStarted = [player, _associatedSupplyTruck, _sourceTown, sideJoined];
    publicVariableServer "WFBE_Client_PV_SupplyMissionStarted";
    */
};

diag_log "SupplyMissionStart: PHASE ONE";

[_associatedSupplyTruck] execVM "Client\Module\supplyMission\monitorCCProximity.sqf";


diag_log "SupplyMissionStart: PHASE TWO";

player addAction [
    "<t color='#00e83e'>" + 'UNLOAD SUPPLIES FROM TRUCK' + "</t>",
    'Client\Module\supplyMission\supplyMissionComplete.sqf',
    [_associatedSupplyTruck],
    70,
    false,
    true,
    "",
    "(WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY && (cursorTarget == _associatedSupplyTruck))"
];


diag_log "SupplyMissionStart: PHASE THREE";