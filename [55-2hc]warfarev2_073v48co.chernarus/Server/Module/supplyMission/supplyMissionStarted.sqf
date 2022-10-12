"WFBE_Client_PV_SupplyMissionStarted" addPublicVariableEventHandler {
    (_this select 1) spawn {
        private ['_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer', '_friendlyCommandCenterInProximity','_playerObject','_match','_currentSupplyTruckDriverLeader'];
        _playerObject = objNull;
        _associatedSupplyTruck = _this select 1;
        _associatedSourceTown = _this select 2;

        _associatedSourceTown setVariable ['LastSupplyMissionRun', time];

        _friendlyCommandCenterInProximity = false;
        
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
                    if ((getPlayerUID (leader group _associatedSupplyTruck)) == _iteratedPlayerUID) then {
                        _playerObject = _x select 0;
                        diag_log format ["_x select 0: %1", _x select 0];
                        _match = true;
                    };
                } forEach (WFBE_SE_PLAYERLIST);

                _currentSupplyTruckDriverLeader = _playerObject;

                diag_log format ["_playerObject/_currentSupplyTruckDriverLeader: %1, _match: %2", _playerObject, _match];

				WFBE_Server_PV_SupplyMissionCompleted = [_currentSupplyTruckDriverLeader, _associatedSupplyTruck, side _currentSupplyTruckDriverLeader];
				publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";
            };

        };
    };
};
