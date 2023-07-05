
private ["_obj","_initCMD"];
_obj = _this select 0;
_initCMD = _this select 1;

_obj setVehicleInit _initCMD;
processInitCommands;
clearVehicleInit _obj;