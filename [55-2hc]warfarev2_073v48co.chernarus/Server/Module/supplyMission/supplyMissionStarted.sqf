"WFBE_Client_PV_SupplyMissionStarted" addPublicVariableEventHandler {
    (_this select 1) spawn {
        private ['_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer', '_friendlyCommandCenterInProximity','_playerObject','_match','_currentSupplyTruckDriverLeader','_playerIsDrivingSupplyTruck','_playerisInProximityOfSupplyTruck'];
        _playerObject = objNull;
        _associatedSupplyTruck = _this select 1;
        _associatedSourceTown = _this select 2;

        _associatedSourceTown setVariable ['LastSupplyMissionRun', time];

        _friendlyCommandCenterInProximity = false;
        _playerIsDrivingSupplyTruck = false;
        _playerisInProximityOfSupplyTruck = false;
        
        _match = false;

        while { alive _associatedSupplyTruck } do {
            
            sleep 2;
			
            {
       			if (_x isKindOf "Base_WarfareBUAVterminal") then {
            	    _friendlyCommandCenterInProximity = true;
        		};
    		} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

            if (_friendlyCommandCenterInProximity) exitWith {
                {
                    _iteratedPlayerUID = _x select 1;
                    diag_log format ["_associatedSupplyTruck: %1, leader group: %2, getPlayerUID leader group _associatedSupplyTruck: %3, _iteratedPlayerUID: %4, _playerObject: %5", _associatedSupplyTruck, leader group _associatedSupplyTruck, getPlayerUID leader group _associatedSupplyTruck, _iteratedPlayerUID, _playerObject];
                    
                    {
                        if ((isPlayer leader group _x) && (getPlayerUID (leader group _x) == _iteratedPlayerUID)) then {
                            _playerisInProximityOfSupplyTruck = true;
                            _playerObject = _x select 0;
                            diag_log format ["_x select 0 (_playerIsInProximityOfSupplyTruck): %1", _x select 0];
                        };
                    } forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 30]);


                    _playerIsDrivingSupplyTruck = ((getPlayerUID (leader group _associatedSupplyTruck)) == _iteratedPlayerUID);

                    if (_playerIsDrivingSupplyTruck) then {
                        _playerObject = _x select 0;
                        diag_log format ["_x select 0 (_playerIsDrivingSupplyTruck): %1", _x select 0];
                    };
                } forEach (WFBE_SE_PLAYERLIST);

                _currentSupplyTruckDriverLeader = _playerObject;

                diag_log format ["_playerObject/_currentSupplyTruckDriverLeader: %1, _match: %2", _playerObject, _match];

                _match = !(isNull _playerObject);

                if (_match) then {
				    WFBE_Server_PV_SupplyMissionCompleted = [_currentSupplyTruckDriverLeader, _associatedSupplyTruck, side _currentSupplyTruckDriverLeader];
				    publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";
                };
            };

        };
    };
};
