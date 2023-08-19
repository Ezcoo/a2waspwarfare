Private ["_side","_sideID","_unit","_unit_kind"];

_unit 				= _this select 0;
_sideID 	 		= _this select 1;
_unit_kind = typeOf _unit;

_side = (_sideID) Call GetSideFromID;

waitUntil {clientInitComplete}; //--- Wait for the client part.

sleep 2; //--- Wait a bit.

if(side _unit == east && !(_unit hasWeapon "NVGoggles")) then {
	_unit addWeapon "NVGoggles";
};

// --- 				[Side specific initialization] (Run on the desired client team).
if (sideID != _sideID) exitWith {};

Private ["_color","_markerName","_params","_size","_txt","_type"];

//--- Map Marker tracking.
_type = "Vehicle";
_color = missionNamespace getVariable (Format ["WFBE_C_%1_COLOR", _side]);
_size = [5,5];
_txt = "";
_params = [];

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1", unitMarker];

_type = "mil_dot";
_size = [0.5,0.5];
if (group _unit == group player) then {
    _color = "ColorOrange";
	_txt = (_unit) Call GetAIDigit;
};
_params = [_type,_color,_size,_txt,_markerName,_unit,1,true,"DestroyedVehicle",_color,false,_side,[1,1]];

_params Spawn MarkerUpdate;