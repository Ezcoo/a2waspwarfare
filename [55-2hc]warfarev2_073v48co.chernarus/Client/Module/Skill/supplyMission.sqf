private ['_friendlyCommandCenterInProximity','_sourceTown','_supplyAmount','_playerInSupplyTruck'];

if (WFBE_Client_SupplyMissionActive) exitWith {
    diag_log "ERROR: Supply mission already active!";
    "Supply mission is already active!" call GroupChatMessage;
};

WFBE_Client_SupplyMissionActive = true;

_friendlyCommandCenterInProximity = false;
_sourceTown = call GetClosestFriendlyLocation;

_lastActivationTime = _sourceTown getVariable ["LastSupplyRun", 0];

if (((((call GetClosestFriendlyLocation) getVariable ['LastSupplyRun', 0]) + 1800) < time) || (((call GetClosestFriendlyLocation) getVariable ['LastSupplyRun', 0]) == 0)) exitWith {
    diag_log "ERROR: Supply mission happened in the last 30 minutes!";
    (format ["Supply mission can't happen for the next %1 minute(s)!", ((time - (_lastActivationTime + 1800)) / 60)]) call GroupChatMessage;
};

_supplyAmount = ((call GetClosestFriendlyLocation) getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER;

while {!WFBE_Client_IsRespawning} do {

    {
        if (_x isKindOf "Base_WarfareBUAVterminal") then {
            _friendlyCommandCenterInProximity = true;
        };
    } forEach (nearestObjects [(getPos player), [], 100]);

    _playerInSupplyTruck = typeOf (vehicle player) in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF'];

    if ((_friendlyCommandCenterInProximity) && (_playerInSupplyTruck) && (WFBE_Client_SupplyMissionActive)) then {
        WFBE_Client_PV_SupplyMissionCompleted = [name player, _supplyAmount, _sourceTown, sideJoined];
        publicVariableServer "WFBE_Client_PV_SupplyMissionCompleted";
        WFBE_Client_SupplyMissionActive = false;
    };

    sleep 2;
};

WFBE_Client_SupplyMissionActive = false;
