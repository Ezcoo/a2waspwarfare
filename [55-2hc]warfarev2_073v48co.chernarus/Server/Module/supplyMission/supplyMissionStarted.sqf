"WFBE_Client_PV_SupplyMissionStarted" addPublicVariableEventHandler {
    (_this select 1) spawn {
        private ['_associatedPlayer', '_associatedSupplyTruck', '_associatedSourceTown', '_sidePlayer', '_friendlyCommandCenterInProximity'];
        // _associatedPlayer = _this select 0;
        _associatedSupplyTruck = _this select 1;
        _associatedSourceTown = _this select 2;
        // _sidePlayer = _this select 3;

        _associatedSourceTown setVariable ['LastSupplyMissionRun', time];

        _friendlyCommandCenterInProximity = false;

        while { alive _associatedSupplyTruck } do {
			{
       			if (_x isKindOf "Base_WarfareBUAVterminal") then {
            	_friendlyCommandCenterInProximity = true;
        		};
    		} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

            if (_friendlyCommandCenterInProximity) exitWith {
				WFBE_Server_PV_SupplyMissionCompleted = [owner _associatedSupplyTruck, _associatedSupplyTruck, side (owner _associatedSupplyTruck)];
				publicVariableServer "WFBE_Server_PV_SupplyMissionCompleted";
            };

            sleep 2;
        };
    };
};
