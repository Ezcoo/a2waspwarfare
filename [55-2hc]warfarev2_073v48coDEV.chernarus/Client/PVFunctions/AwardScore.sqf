/*
	author: Net_2
	description: none
	returns: nothing
*/

Private["_points","_get","_name"];

_points = _this select 0;
_get = _this select 1;

_name = _get select QUERYUNITLABEL;

sleep (random 3);

Format["You got %1 points for neutralizing %2", _points, _name] Call GroupChatMessage;