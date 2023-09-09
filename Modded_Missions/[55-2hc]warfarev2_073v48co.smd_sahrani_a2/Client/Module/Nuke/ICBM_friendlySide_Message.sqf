/* 
	Author: Marty
	Name: ICBM_Message.sqf
	Parameters:
	  0 - none
	Description:
	    Play a text and audio message destined to the players who launched the ICBM order = friendly side.
*/

private ["_time_before_ICBM_impact", "_text_message_to_friendly_side"];

["FUNCTION CALLED", "ICBM_friendlySide_Message.sqf"] Call WFBE_CO_FNC_LogContent;

// Prepare and send the text message for the friendly team (the team who launch the nuke)
_time_before_ICBM_impact = missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";

_text_message_to_friendly_side = localize "STR_WF_CHAT_ICBM_Launch_BY_OUR_TEAM";
_text_message_to_friendly_side = format[_text_message_to_friendly_side, _time_before_ICBM_impact];

systemChat _text_message_to_friendly_side; // Send text

// Send sound to the friendly team (the team who launch the nuke)
playSound "ICBM_message_to_friendly_players";
