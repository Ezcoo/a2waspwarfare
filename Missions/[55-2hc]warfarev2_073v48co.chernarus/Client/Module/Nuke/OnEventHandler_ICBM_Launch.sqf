/* 
	Author: Marty
	Name: OnEventHandler_ICBM_Launch.sqf
	Parameters:
	0 - the name of the publicvalue montitored by the EH : ICBM_launched
	1 - the value of the publicvalue montitored by the EH set in the namespace. Here the _ICBM_infos_Array containing [_ICBM_position,_ICBM_side].
	
	Description: This function responds to the "ICBM_launched" variable, performs actions based on the player's side, such as displaying a message, creating a map marker, and delete automatically the marker.
	When a commander trigger the ICBM launch, it automatically run the ICBM_launched addPublicVariableEventHandler code on all client EXCEPTING the client who trigger it.
	That's why we MUST create another marker for the commander client. Check the addPublicVariableEventHandler wiki official for more details.
	    
*/
private["_ICBM_infos", "_ICBM_postion","_ICBM_side","_nukeMarker","_time_before_ICBM_impact"];

["DEBUG", "OnEventHandler_ICBM_Launch.sqf: ICBM_launched addPublicVariableEventHandler"] Call WFBE_CO_FNC_LogContent;

// The two first paramaters in the _this array given by addPublicVariableEventHandler are : the name of the publicvalue montitored by the EH, and the 2nd parameter correspond to its value set in the namespace.
//_ICBM_infos = _this select 0; //NONNNNN 0 take only the name variable not its value !! 
_ICBM_infos = _this select 1; //This is fine : Value is in select 1.

_ICBM_postion = _ICBM_infos select 0 ;
_ICBM_side = _ICBM_infos select 1 ;

if (playerSide == _ICBM_side) then 
{ 
	call ICBM_FriendySide_Message;
	// Create de ICBM marker on map for each client of the west team :
	_nukeMarker = createMarkerLocal ["icbmstrike", _ICBM_postion];
	_nukeMarker setMarkerTypeLocal "mil_warning";
	_nukeMarker setMarkerTextLocal "ICBM";
	_nukeMarker setMarkerColorLocal "ColorRed";	

	// Delete automatically the marker after the ICBM elapsed time is done : 
	_time_before_ICBM_impact = missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";  //time in minutes.
	_time_before_ICBM_impact = _time_before_ICBM_impact * 60 ; 							 //time in seconds.
	[_nukeMarker,_time_before_ICBM_impact] call WFBE_CL_FNC_Delete_Marker ;				
} else 
{
	call ICBM_EnemySide_Message;
};
