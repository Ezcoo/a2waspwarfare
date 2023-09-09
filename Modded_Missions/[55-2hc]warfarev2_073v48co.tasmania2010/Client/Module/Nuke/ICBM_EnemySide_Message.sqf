/* 
	Author: Marty
	Name: ICBM_Message.sqf
	Parameters:
	  0 - none
	Description:
	    Play a text and audio message destined to the players who will get nuked = enemy side.
*/

private ["_time_before_ICBM_impact", "_text_message_to_enemy_players"];

["FUNCTION CALLED", "ICBM_EnemySide_Message.sqf"] Call WFBE_CO_FNC_LogContent;

// Prepare and send the text message for the enemy team (the team who will be fried by nuke)
_time_before_ICBM_impact = missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";

_text_message_to_enemy_players = localize "STR_WF_CHAT_ICBM_Launch_BY_ENEMY_TEAM";
_text_message_to_enemy_players = format[_text_message_to_enemy_players, _time_before_ICBM_impact];

systemChat _text_message_to_enemy_players; // Send text

// Send sound to the enemy team (the team who will be fried by nuke)
playSound "ICBM_message_to_enemy_players"; //playSound is executed only on the client who call it

