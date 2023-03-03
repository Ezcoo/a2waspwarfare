private ["_associatedSupplyTruck"];

// Don't set _friendlyCommandCenterInProximity variable to private (innermost) scope!
_friendlyCommandCenterInProximity = _this select 0;

_associatedSupplyTruck = _this select 1;

{
		if (_x isKindOf "Base_WarfareBUAVterminal") then {
    	    _friendlyCommandCenterInProximity = true;
		};
	} forEach (nearestObjects [(getPos _associatedSupplyTruck), [], 100]);

_friendlyCommandCenterInProximity