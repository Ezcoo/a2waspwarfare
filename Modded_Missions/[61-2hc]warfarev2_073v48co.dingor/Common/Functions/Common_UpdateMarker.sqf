/* 
	Original Author: Marty
	Name: Common_UpdateMarker.sqf
	Parameters:
	0 - _markerObject 	: object - corresponds to the object we want to track the position.
	1 - _markerName		: string - correspond to the name of the marker we want to update.
	
	Description: This function is meant to update the marker position on map attached to a moving object (car, wreck, etc...)
	    
*/

[_markerObject, _markerName] spawn
{
	_markerObject 	= _this select 0;
	_markerName		= _this select 1;

	sleep 2 ; //waiting for marker to be created 

	while {!isnil (getPos _markerName)} do // we test if the marker still exist and is not deleted.
	{
		_markerPosition = getPos _markerObject ;
		_markerName setMarkerPos _markerPosition ;
		sleep 1 ; // Update marker refresh rate. We can increase this value in order to reduce cpu usage if we want.
	};
};