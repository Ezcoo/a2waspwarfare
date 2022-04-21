private ['_friendlyCommandCenterInProximity','_sourceTown','_supplyAmount','_playerInSupplyTruck'];

diag_log "Supply Mission Script";
diag_log str(_this);

WFBE_Client_SupplyMissionActive = true;

_friendlyCommandCenterInProximity = false;
_sourceTown = _this select 3 select 0;
_supplyAmount = _this select 3 select 1;

while {!WFBE_Client_IsRespawning} do {

    {
        if (_x isKindOf "Base_WarfareBUAVterminal") then {
            _friendlyCommandCenterInProximity = true;
        };
    } forEach (nearestObjects [(getPos player), [], 100]);

    _playerInSupplyTruck = typeOf (vehicle player) in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF'];

    if ((_friendlyCommandCenterInProximity) && (_playerInSupplyTruck) && (WFBE_Client_SupplyMissionActive)) then {
      diag_log "WF Mission - Success";
        WFBE_Client_PV_SupplyMissionCompleted = [name player, _supplyAmount, _sourceTown, sideJoined];
        publicVariableServer "WFBE_Client_PV_SupplyMissionCompleted";
        WFBE_Client_SupplyMissionActive = false;

    };

    sleep 2;
};

WFBE_Client_SupplyMissionActive = false;
