_bomb = "Bo_FAB_250" createVehicle [0,0,0];
_bomb setPos getPos WFBE_SK_V_SaboteurSatchel;

deleteVehicle WFBE_SK_V_SaboteurSatchel;
WFBE_SK_V_SaboteurSatchel = nil;