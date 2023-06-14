Private ["_height","_object","_markerName","_side"];

_object = _this select 0;
_side = _this select 1;

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1",unitMarker];

createMarkerLocal [_markerName,[0,0,0]];
//_markerName setMarkerTypeLocal "Vehicle";
//_markerName setMarkerTypeLocal "mil_arrow2"; 	//Marty : draw marker as a filled arrow
_markerName setMarkerColorLocal "ColorRed";
_markerName setMarkerSizeLocal [5,5];
//_markerName setMarkerSizeLocal [1,1];			//Marty : same size value of the marker as for the updateTeamMarkers
_markerName setMarkerAlphaLocal 0;
_height = missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR_DETECTION";

while {alive _object && !(isNull _object)} do {
	if (antiAirRadarInRange) then {
		if (((getPos _object) select 2) > _height) then {
			_markerName setMarkerAlphaLocal 1;
			_markerName setMarkerPosLocal (getPos _object);
            _markerName setMarkerTextLocal (format ["%1km/h %2m", round(speed _object), round(getPosATL _object select 2)]);			
			_playerDirection = getDir _object; 				//Marty : get the player's angle direction (= azimut) in order to draw the arrow marker in the same direction. 
			_markerName setMarkerDirLocal _playerDirection;	//Marty : set the player's angle direction to the marker.

		} else {
			_markerName setMarkerAlphaLocal 0;
		};
	};
	
	sleep 0.01 ; //Marty : refresh frequency is same as the updateTeamMarker in order to refresh faster on map. (May be we should increase this value in case of performances issues !)
};

deleteMarkerLocal _markerName;