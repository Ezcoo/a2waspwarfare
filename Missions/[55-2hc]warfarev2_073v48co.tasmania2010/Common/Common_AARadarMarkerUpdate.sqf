Private ["_height","_object","_markerName","_side","_speed","_altitude","_aircraftName","_aarUpgradeLevel","_updateFrequency","_oppositeSide"];

_object = _this select 0;
_side = _this select 1;
_sideID = _this select 2;

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
if (_sideID == 0) then {
    _oppositeSide = (1) Call GetSideFromID;
};
if (_sideID == 1) then {
    _oppositeSide = (0) Call GetSideFromID;
};

// Place any aircraft warning logic here before the loop (done once)?

// The main update loop
while {alive _object && !(isNull _object)} do {
    _updateFrequency = 5; // AAR0: 5, AAR1: 3, AAR2: 1

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
                _updateFrequency = 3;
            };

            // Get the aircraft name (AAR2)
            if (_aarUpgradeLevel > 1) then {
                Private ["_typeOfObject"];
                _typeOfObject = typeOf _object;

                _aircraftName = [_typeOfObject, 'displayName'] Call GetConfigInfo;

                if (_typeOfObject == "A10") then {
                    _aircraftName = "A-10A";
                };

                if (_typeOfObject == "A10_US_EP1") then {
                    _aircraftName = "A-10C";
                };

                if (_typeOfObject == "AH64D") then {
                    _aircraftName = "AH-64D (TOW)";
                };

                if (_typeOfObject == "AH64D_EP1") then {
                    _aircraftName = "AH-64D (Hellfire)";
                };

                if (_typeOfObject == "Su25_TK_EP1") then {
                    _aircraftName = "Su-25T";
                };

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