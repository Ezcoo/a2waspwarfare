"WFBE_Client_PV_SupplyMissionStarted" addPublicVariableEventHandler {
    (_this select 1) spawn {
        private ['_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer','_iteratedObject','_friendlyCommandCenterInProximity','_playerObject','_match','_currentSupplyTruckDriverLeader','_playerIsDrivingSupplyTruck','_playerisInProximityOfSupplyTruck'];
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
                        _iteratedObject = _x;

                        if ((isPlayer leader group _iteratedObject) && (getPlayerUID (leader group _iteratedObject) == _iteratedPlayerUID)) then {
                            _playerisInProximityOfSupplyTruck = true;
                            _playerObject = _iteratedObject;
                            diag_log format ["_iteratedObject (_playerIsInProximityOfSupplyTruck): %1", _iteratedObject];
                        };
                    } forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 30]);


                    _playerIsDrivingSupplyTruck = ((getPlayerUID (leader group _associatedSupplyTruck)) == _iteratedPlayerUID);

                    if (_playerIsDrivingSupplyTruck) then {
                        _playerObject = _x select 0;
                        diag_log format ["_playerObject (_playerIsDrivingSupplyTruck): %1", _playerObject];
                    };
                } forEach (WFBE_SE_PLAYERLIST);

                diag_log format ["_playerObject/_currentSupplyTruckDriverLeader: %1", _playerObject];

                _match = !(isNull _playerObject);

                if (_match) then {
				    WFBE_Server_PV_SupplyMissionCompleted = [_playerObject, _associatedSupplyTruck, side _playerObject];
				    publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";
                };
            };

        };
    };
};
