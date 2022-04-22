private ['_sourceTown', '_TownSupplyLastMission', '_associatedSupplyTruck', '_supplyAmount'];

_sourceTown = call GetClosestFriendlyLocation;
_TownSupplyLastMission = _sourceTown getVariable ['LastSupplyMissionRun', 0];

if (((_lastActivationTime + 1800) > time) && (_lastActivationTime != 0)) exitWith {
    diag_log format ["ERROR: Supply mission happened in the last 30 minutes in %1!", _sourceTown];
    (format ["Supply mission can't happen for the next %1 minute(s) in this town!", round (((_lastActivationTime + 1800) - time) / 60)]) call GroupChatMessage;
};

_associatedSupplyTruck = cursorObject;
_associatedSupplyTruck setVariable ["SupplyFromTown", _sourceTown, true];

_supplyAmount = (_sourceTown getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER;
_associatedSupplyTruck setVariable ["SupplyAmount", _supplyAmount, true];


WFBE_Client_PV_SupplyMissionStarted = [player, _associatedSupplyTruck, _sourceTown, sideJoined];
publicVariableServer "WFBE_Client_PV_SupplyMissionStarted";
