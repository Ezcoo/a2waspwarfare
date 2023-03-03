private ['_associatedSupplyTruck','_friendlyCommandCenterInProximity'];

_associatedSupplyTruck = _this select 0;
_friendlyCommandCenterInProximity = false;

// diag_log format ["monitorCCproximity.sqf: _friendlyCommandCenterInProximity: %1, _associatedSupplyTruck: %2", _friendlyCommandCenterInProximity, _associatedSupplyTruck];

{
    if (_x isKindOf "Base_WarfareBUAVterminal") then {
        _friendlyCommandCenterInProximity = true;
    };
} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

// diag_log format ["monitorCCproximity.sqf: after iteration, _friendlyCommandCenterInProximity: %1, _associatedSupplyTruck: %2", _friendlyCommandCenterInProximity, _associatedSupplyTruck];

_friendlyCommandCenterInProximity