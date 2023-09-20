/* 
	Original Author: Marty
	Contributors :
	Name: ICBM_friendlySide_Message.sqf
	Parameters:
	  0 - _side : 	side object - side who must receive the message. Can be east or west
	Description:
	    Play a text and audio message destined to the players who launched the ICBM order = friendly side.
		IMPORTANT : BE AWARE THAT YOU HAVE TO RESTART ARMA2OA TO TAKE SOUND INTO ACCOUNT IF YOU ADD A NEW SOUND (thats what i experienced is not related to the function but to bohemian) 
*/
_side = _this select 0 ;

_time_before_ICBM_impact 					= missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";
_friendly_Compile_Multi_language_message 	= " format[localize ""STR_WF_CHAT_ICBM_Launch_BY_OUR_TEAM"", _time_before_ICBM_impact]; " ; //contain de code that will be processed in the WF_sendMessage and the onEventHandler functions to customize the message.

_friendly_Message_SoundName			= "ICBM_message_to_friendly_players";

_is_multi_language_message = true;

// We use the magic function WF_sendMessage to broadcast text and audio to the corresponding side :
[_friendly_Compile_Multi_language_message, _friendly_Message_SoundName, _side, _is_multi_language_message] call WF_sendMessage ;