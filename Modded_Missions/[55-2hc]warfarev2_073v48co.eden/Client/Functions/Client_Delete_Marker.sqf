/* 
	Author: Marty
	Name: Client_Delete_LocalMarker.sqf
	Parameters:
	  0 - marker created with the createMarkerLocal command. 
	  1 - Number of seconds as a type number to wait before removing.
	Description:
	     Delete the specified local marker after a specified time on the client calling it. It is asynchronized thanks to the use of the spawn command, then it doesnt make sleep the calling script. 
		
*/

private ["_marker_name", "_deleteTime"];

_marker_name = _this select 0;
_deleteTime = _this select 1;

[_marker_name,_deleteTime]spawn 
{
	_marker_name = _this select 0;
	_deleteTime = _this select 1;
	
	sleep _deleteTime;
	
	//deleteMarkerLocal _marker_name;
	deleteMarker _marker_name;
};		