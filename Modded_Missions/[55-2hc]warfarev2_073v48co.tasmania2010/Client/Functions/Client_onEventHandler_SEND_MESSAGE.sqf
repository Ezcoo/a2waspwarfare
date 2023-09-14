/* 
	Author: Marty
	Name: Client_onEventHandler_SEND_MESSAGE.sqf
	Parameters:
	Parameters are given by the EH "SEND_MESSAGE" addPublicVariableEventHandler
	0 - string - correspond to the name of the public variable braodcasted, here it is "SEND_MESSAGE"
	1 - _SEND_MESSAGE_infos : array containing all the value given by the addPublicVariableEventHandler, here it the infos about the message to be send.

	Description: This function is meant to create a message only visible and heard for a specific side (west or east).
	    
*/

//[_messageText, _messageSoundName, _side_who_receive_message ] call WF_sendMessage ;

_SEND_MESSAGE_infos = _this select 1; // select 1 not 0 to get the value !

// Extract the value from the array to get specific infos for the message creation :
_messageText				= _SEND_MESSAGE_infos select 0;
_messageSoundName			= _SEND_MESSAGE_infos select 1;
_side_who_receive_message	= _SEND_MESSAGE_infos select 2;

if (playerSide == _side_who_receive_message) then 
{
	// Send a text and audio message to all clients who are supposed to receive it.
	systemChat _messageText; 
	playSound _messageSoundName;
};


