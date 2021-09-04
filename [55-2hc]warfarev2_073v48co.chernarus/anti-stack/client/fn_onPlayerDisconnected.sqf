/*
	@author      Häz

	@description Handle the use case for when a player disconnects.

	@params
		0:
			@paramName           _id
			@paramDescription    The id of the player that disconnected.
			@paramType           integer
			
		1:
			@paramName           _name
			@paramDescription    The name of the player that disconnected.
			@paramType           string
			
		2:
			@paramName           _uid
			@paramDescription    The uid of the player that disconnected.
			@paramType           integer
*/

private ["_id", "_name", "_uid"];

_id   = _this select 0; 
_name = _this select 1;
_uid  = _this select 2;