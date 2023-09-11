/* 
	Author: Marty
	Name: Common_SendMessage.sqf
	Parameters:
	0 - _messageText				: string - correspond to the text to be sent using the systemChat command. 
	1 - _messageSoundName			: Name sound from CfgSounds defined in description.ext.
	2 - _side_who_receive_message	: side object - can be east or west.
	
	Description: This function is meant to broadcast an audio and text message to all clients, by triggering the SEND_MESSAGE EH on every client.
	This message will be only visible and heard for a specific side (west or east).
	    
*/

// Extract the value from the array to get specific infos for the marker creation :
_messageText				= _this select 0;
_messageSoundName			= _this select 1;
_side_who_receive_message	= _this select 2;

if (playerSide == _side_who_receive_message) then 
{
	systemChat _messageText; 
	playSound _messageSoundName;
};

// Broadcasting the publicVariable SEND_MESSAGE in order to trigger the EH running on every client.
_SEND_MESSAGE_infos =  _this ; 	// get the array containing all the parameters values given during the call of this function.

missionNamespace setVariable ["SEND_MESSAGE", _SEND_MESSAGE_infos];
publicVariable "SEND_MESSAGE"; // will trigger the SEND_MESSAGE addPublicVariableEventHandler 
