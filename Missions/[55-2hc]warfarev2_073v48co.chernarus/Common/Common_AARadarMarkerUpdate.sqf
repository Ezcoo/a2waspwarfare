Private ["_height","_object","_markerName","_side","_speed","_altitude","_aircraftName","_aarUpgradeLevel","_updateFrequency","_oppositeSide"];

_object = _this select 0;
_side = _this select 1;

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1",unitMarker];

createMarkerLocal [_markerName,[0,0,0]];
//_markerName setMarkerTypeLocal "Vehicle";
_markerName setMarkerTypeLocal "mil_arrow2"; 	//Marty : draw marker as a filled arrow
_markerName setMarkerColorLocal "ColorRed";
_markerName setMarkerSizeLocal [0.5, 0.5]; // Made the marker a bit smaller still, might need adjustmenets
_markerName setMarkerAlphaLocal 0;
_height = missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR_DETECTION";

// Need to flip the logic for getting the upgrade level
if (_side == BLUFOR) then {
    _oppositeSide == OPFOR;
};
if (_side == OPFOR) then {
    _oppositeSide == BLUFOR;
};

// Place any aircraft warning logic here before the loop (done once)?

// The main update loop
while {alive _object && !(isNull _object)} do {
    _updateFrequency = 3; // AAR0: 3, AAR1: 2, AAR2: 1

	if (antiAirRadarInRange) then {
		if (((getPos _object) select 2) > _height) then {

		    // Get the AAR upgrade level from the _oppositeSite variable
            _upgrades = (_oppositeSide) Call WFBE_CO_FNC_GetSideUpgrades;
            _aarUpgradeLevel = _upgrades select WFBE_UP_AAR;

            _speed = str(round(speed _object)) + "km/h"; // Get the speed (AAR0)
            _altitude = " "; // Defined empty (AAR1)
            _aircraftName = " "; // Defined empty (AAR2)

            // Get the aircraft altitude (AAR1)
            if (_aarUpgradeLevel > 0) then {
                _altitude = str(round(getPosATL _object select 2)) + "m";
                _updateFrequency = 2;
            };

            // Get the aircraft name (AAR2)
            if (_aarUpgradeLevel > 1) then {
                _aircraftName = typeOf _object;
                _updateFrequency = 1;
            };

			_markerName setMarkerAlphaLocal 1;
			_markerName setMarkerPosLocal (getPos _object);
            _markerName setMarkerTextLocal (format ["%1 %2 %3", _speed, _altitude, _aircraftName]);
			_playerDirection = getDir _object; 				//Marty : get the player's angle direction (= azimut) in order to draw the arrow marker in the same direction.
			_markerName setMarkerDirLocal _playerDirection;	//Marty : set the player's angle direction to the marker.

		} else {
			_markerName setMarkerAlphaLocal 0;
		};
	};

	sleep _updateFrequency; //Marty : refresh frequency is same as the updateTeamMarker in order to refresh faster on map. (May be we should increase this value in case of performances issues !)
};

deleteMarkerLocal _markerName;