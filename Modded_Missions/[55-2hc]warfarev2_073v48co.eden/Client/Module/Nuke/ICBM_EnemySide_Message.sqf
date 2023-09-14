/* 
	Author: Marty
	Name: ICBM_Message.sqf
	Parameters:
	  0 - _side : 	side object - side who must receive the message. Can be east or west
	Description:
	    Play a text and audio message destined to the players who will get nuked = enemy side.
*/
_side = _this select 0 ;

_time_before_ICBM_impact 			= missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";
_enemy_Message_Text 				= localize "STR_WF_CHAT_ICBM_Launch_BY_ENEMY_TEAM";
_enemy_Message_Text 				= format[_enemy_Message_Text, _time_before_ICBM_impact];
_enemy_Message_SoundName			= "ICBM_message_to_enemy_players";

// We use the magic function WF_sendMessage to broadcast text and audio to the corresponding side :
[_enemy_Message_Text, _enemy_Message_SoundName, _side ] call WF_sendMessage ;
