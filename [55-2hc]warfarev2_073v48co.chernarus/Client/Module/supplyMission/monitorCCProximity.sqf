private ['_associatedSupplyTruck'];

_associatedSupplyTruck = _this select 0;

while { alive _associatedSupplyTruck } do {

    sleep 2;

    WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY = false;

    diag_log format ["monitorCCproximity.sqf: WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY: %1", WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY];

    {
        if (_x isKindOf "Base_WarfareBUAVterminal") then {
            WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY = true;
        };
    } forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

    diag_log format ["monitorCCproximity.sqf: WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY after iteration: %1", WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY];
};