private ['_associatedSupplyTruck'];

_associatedSupplyTruck = _this select 0;

while { alive _associatedSupplyTruck } do {

    sleep 2;

    WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY = false;

    {
        if (_x isKindOf "Base_WarfareBUAVterminal") then {
            WFBE_C_VAR_FRIENDLYCOMMANDCENTERINPROXIMITY = true;
        };
    } forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

};