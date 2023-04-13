private ['_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer','_iteratedObject','_friendlyCommandCenterInProximity','_playerObject','_match','_currentSupplyTruckDriverLeader','_playerIsDrivingSupplyTruck','_playerisInProximityOfSupplyTruck'];

_playerObject = _this select 0;
_associatedSupplyTruck = _this select 1;
_associatedSourceTown = _this select 2;
_associatedSourceTown setVariable ['LastSupplyMissionRun', time];
_friendlyCommandCenterInProximity = false;
_playerisInProximityOfSupplyTruck = false;
_playerIsDrivingSupplyTruck = false;
_supplyMissionForThisTownCompleted = false;

_match = false;
// diag_log format ["Player %1 started supply mission in town %2.", (name leader group _playerObject), _associatedSourceTown];
[_associatedSourceTown] spawn WFBE_SE_FNC_SupplyMissionTimerForTown;

while { alive _associatedSupplyTruck && !_supplyMissionForThisTownCompleted} do {
    
    sleep 2;
	
    {
		if (_x isKindOf "Base_WarfareBUAVterminal") then {
    	    _friendlyCommandCenterInProximity = true;
		};
	} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

    if (_friendlyCommandCenterInProximity) exitWith {
        {
            _iteratedPlayerUID = _x select 1;
            // diag_log format ["_associatedSupplyTruck: %1, leader group: %2, getPlayerUID leader group _associatedSupplyTruck: %3, _iteratedPlayerUID: %4, _playerObject: %5", _associatedSupplyTruck, leader group _associatedSupplyTruck, getPlayerUID leader group _associatedSupplyTruck, _iteratedPlayerUID, _playerObject];
            
            {
                _iteratedObject = _x;
                _leaderGroupIteratedObject = leader group _iteratedObject;
                if ((isPlayer _leaderGroupIteratedObject) && (getPlayerUID (_leaderGroupIteratedObject) == _iteratedPlayerUID)) then {
                    _playerisInProximityOfSupplyTruck = true;
                    _playerObject = _leaderGroupIteratedObject;
                    // diag_log format ["_playerIsInProximityOfSupplyTruck, _iteratedObject: %1, _leaderGroupIteratedObject: %2", _iteratedObject, _leaderGroupIteratedObject];
                };
            } forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 8]);

            _playerIsDrivingSupplyTruck = ((getPlayerUID (leader group _associatedSupplyTruck)) == _iteratedPlayerUID);

            if (_playerIsDrivingSupplyTruck && (isNull _playerObject)) then {
                _iteratedObjectDriver = _x select 0;
                if (!(isNull _iteratedObjectDriver)) then {
                    _playerObject = _iteratedObjectDriver;
                };
                // diag_log format ["_playerObject (_iteratedObjectDriver): %1", _playerObject];
            };
            
        } forEach (WFBE_SE_PLAYERLIST);
        
        // diag_log format ["_playerObject/_currentSupplyTruckDriverLeader: %1", _playerObject];
        _match = !(isNull _playerObject);
        if (_match) then {
		    WFBE_Server_PV_SupplyMissionCompleted = [_playerObject, _associatedSupplyTruck, side _playerObject];
		    publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";
            _supplyMissionForThisTownCompleted = true;
        };
    };
};