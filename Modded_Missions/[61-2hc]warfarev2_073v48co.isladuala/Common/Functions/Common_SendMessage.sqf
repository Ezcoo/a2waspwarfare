/* 
	Original Author: Marty
	Name: Common_SendMessage.sqf
	Parameters:
	0 - _messageText				: string 		- correspond to the text to be sent using the systemChat command. It could also be message format as in stringTable.xml.
	1 - _messageSoundName			: string 		- Name sound from CfgSounds defined in description.ext.
	2 - _side_who_receive_message	: side object 	- can be east or west.
	3 - _is_multi_language_message	: boolean 		- In case of a multi language message, this parameter is set to true and the message text must be sent as code compiled to format the message.
	
	Description: This function is meant to broadcast an audio and text message to all clients, by triggering the SEND_MESSAGE EH on every client.
	This message will be only visible and heard for a specific side (west or east).
	IMPORTANT NOTE : You need to restart arma2ao when you add a new class in the stringrable file. Same with audio in the description.ext. This is not related to this function but its a bohemian limitation.
	    
*/

// Extract the value from the array to get specific infos for the marker creation :
_messageText				= _this select 0;
_messageSoundName			= _this select 1;
_side_who_receive_message	= _this select 2;
_is_multi_language_message	= _this select 3;

if (playerSide == _side_who_receive_message) then 
{
	if _is_multi_language_message then 
	{
		_messageText = call compile _messageText //if the message is builded as a multi-language string code, then we compile this code in order to format the message with the correct client localizer string and variables. 
	};

	systemChat _messageText; 
	playSound _messageSoundName;
};

// Broadcasting the publicVariable SEND_MESSAGE in order to trigger the EH running on every client.
_SEND_MESSAGE_infos =  _this ; 	// get the array containing all the parameters values given during the call of this function.

missionNamespace setVariable ["SEND_MESSAGE", _SEND_MESSAGE_infos];
publicVariable "SEND_MESSAGE"; // will trigger the SEND_MESSAGE addPublicVariableEventHandler 
