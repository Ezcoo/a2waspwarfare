Private["_client","_locked","_side","_vehicle"];

_vehicle = _this select 0;
_locked = _this select 1;

_vehicle lock _locked;

[nil, "SetVehicleLock", [_vehicle,_locked]] Call WFBE_CO_FNC_SendToClients;