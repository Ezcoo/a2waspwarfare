/*
	@author      Häz

	@description Calculate the player's skill.

	@params
		0:
			@paramName           _player
			@paramDescription    The player in which you want to perform the calculation on.
			@paramType           string

	@returns
		@returnDescription       Returns the calculated player's skill or the set 'default fallback'.
		@returnType			     <any>
*/

if (isDedicated || !hasInterface) exitWith {};

private ["_unit", "_score", "_playtime", "_playerSkill"];

_unit     = _this select 0;
_score    = _this select 1;
_playtime = _this select 2;

// Calculate the player's skill. The player's skill is their match score divided by their total playtime.
// The player's match score has to be greater than 100 or their playtime more than 15 minutes (900 seconds)
// in order for the calculation to be performed. The player UID is retrieved directly from the unit in case
// the code fails to retrieve it directly from the player object. Each skill of the player is stored in the
// mission namespace and later persisted to the server's profile at the end of the round.

if (_score == 0 || _playtime < 900) exitWith {};

_playerSkill = _score / _playtime;

missionNamespace setVariable [format ["playerSkill_%1", _unit getVariable ["playerUID"]]];

_playerSkill