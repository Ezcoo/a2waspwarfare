/* 
	Author: Marty
	Name: Client_onEventHandler_MARKER_CREATION.sqf
	Parameters:
	Parameters are given by the EH "MARKER_CREATION" addPublicVariableEventHandler
	0 - string - correspond to the name of the public variable braodcasted, here it is "MARKER_CREATION"
	1 - _MARKER_infos : array containing all the value given by the addPublicVariableEventHandler, here it the infos about the marker to be created.


	Description: This function is meant to create a marker only visible for specific side (west or east).
	    
*/

_MARKER_infos = _this select 1; // select 1 not 0 to get the value !

// Extract the value from the array to get specific infos for the marker creation :
_markerName 	= _MARKER_infos select 0;
_markerPosition	= _MARKER_infos select 1;
_markerType		= _MARKER_infos select 2;
_markerText		= _MARKER_infos select 3;
_markerColor	= _MARKER_infos select 4;
_side_who_see_marker = _MARKER_infos select 5;

if (playerSide == _side_who_see_marker) then 
{
	// Construction of the marker : 
	//_markerName = createMarkerLocal [_markerName, _markerPosition];
	_markerName setMarkerTypeLocal _markerType;
	_markerName setMarkerTextLocal _markerText;
	_markerName setMarkerColorLocal _markerColor;	
};
