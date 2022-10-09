"WFBE_Client_PV_SupplyMissionStarted" addPublicVariableEventHandler {
    (_this select 1) spawn {
        private ['_associatedPlayer', '_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer', '_friendlyCommandCenterInProximity'];
        _associatedPlayer = _this select 0;
        _associatedSupplyTruck = _this select 1;
        _associatedSourceTown = _this select 2;
        _sidePlayer = _this select 3;

        _associatedSourceTown setVariable ['LastSupplyMissionRun', time];

        _friendlyCommandCenterInProximity = false;

        while { alive _associatedSupplyTruck } do {
			diag_log format ["This is a test: WFBE_Client_PV_SupplyMissionStarted, line 14. _associatedSupplyTruck: %1", _associatedSupplyTruck];
			{
       			if (_x isKindOf "Base_WarfareBUAVterminal") then {
            	_friendlyCommandCenterInProximity = true;
        		};
    		} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

            if (_friendlyCommandCenterInProximity) exitWith {
				diag_log "_friendlyCommandCenterInProximity: true, PVing WFBE_Server_PV_SupplyMissionCompleted...";
				WFBE_Server_PV_SupplyMissionCompleted = [_associatedPlayer, _associatedSupplyTruck, _sidePlayer];
				publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";
            };

            sleep 2;
        };
    };
};
