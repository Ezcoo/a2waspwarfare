private ['_friendlyCommandCenterInProximity','_sourceTown','_supplyAmount','_playerInSupplyTruck'];


WFBE_Client_SupplyMissionActive = true;


_friendlyCommandCenterInProximity = false;
_sourceTown = _this select 3 select 0;
_supplyAmount = _this select 3 select 1;

while {!WFBE_Client_IsRespawning} do {
    
    {
        if (_x isKindOf "Base_WarfareBUAVterminal") then {
            _friendlyCommandCenterInProximity = true;
        }
    } forEach (nearestObjects [getPos player, ["All"], 50]);

    _playerInSupplyTruck = typeOf vehicle player in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF'];

    if ((_friendlyCommandCenterInProximity) && (_playerInSupplyTruck)) then {
        WFBE_Client_PV_SupplyMissionCompleted = [name player, _supplyAmount, _sourceTown, sideJoined];
        publicVariableServer "WFBE_Client_PV_SupplyMissionCompleted";
    };

    sleep 2;
};

WFBE_Client_SupplyMissionActive = false;