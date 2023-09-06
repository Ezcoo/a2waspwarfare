/* 
	Author: Marty
	Name: ICBM_Message.sqf
	Parameters:
	  0 - none
	Description:
	    Send a specific message + sound to each team when ICBM is launched. The client who launch the order is considered in the friendly_side
*/

private["_friendly_side", "_enemy_side", "_time_before_ICBM_impact", "_text_message_to_friendly_players", "_text_message_to_enemy_players"];

//_friendly_side = _this select 0; 
_friendly_side = playerSide;

_friendly_side = west; // For testing purpose only.
if (_friendly_side == west) then 
{
    _enemy_side = east;
} else 
{
    _enemy_side = west;
};

// Send a text message to the friendly team 
_time_before_ICBM_impact = missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";
_text_message_to_friendly_players = localize "STR_WF_CHAT_ICBM_Launch_BY_OUR_TEAM";
_text_message_to_friendly_players = format[_text_message_to_friendly_players, _time_before_ICBM_impact];
//["DEBUG", format ["ICMB_Message.sqf: Debug info [_text_message_to_friendly_players] = %1 | type is %2", _text_message_to_friendly_players, typeName _text_message_to_friendly_players]] call WFBE_CO_FNC_logContent;
[_friendly_side, "HQ"] commandChat _text_message_to_friendly_players; 

// Send sound to the friendly team 
[_friendly_side, "HQ"] sideRadio "ICBM_message_to_friendly_players";

// Send a text message to the enemy team 
_text_message_to_enemy_players = localize "STR_WF_CHAT_ICBM_Launch_BY_ENEMY_TEAM";
_text_message_to_enemy_players = format[_text_message_to_enemy_players, _time_before_ICBM_impact];
//["DEBUG", format ["ICMB_Message.sqf: Debug info [_text_message_to_enemy_players] = %1 | type is %2", _text_message_to_enemy_players, typeName _text_message_to_enemy_players]] call WFBE_CO_FNC_logContent;
[_enemy_side, "HQ"] commandChat _text_message_to_enemy_players; 

// Send sound to the enemy team 
[_enemy_side, "HQ"] sideRadio "ICBM_message_to_enemy_players"; 



