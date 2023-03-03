private ["_friendlyCommandCenterInProximity","_associatedSupplyTruck"];

_friendlyCommandCenterInProximity = false;
_associatedSupplyTruck = _this select 0;

{
		if (_x isKindOf "Base_WarfareBUAVterminal") then {
    	    _friendlyCommandCenterInProximity = true;
		};
	} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

_friendlyCommandCenterInProximity