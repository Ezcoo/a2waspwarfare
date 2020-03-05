/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID", "_playerTicks","_playerScore","_playerSkill"];

_playerUID = _this select 0;

_playerScore = [_playerUID] call IniDB_getScore;
_playerTicks = [_playerUID] call IniDB_getTicks;

// Make sure we don't count new players in skill calculation (to prevent inaccurate results)
// and prevent zero divisor error as well (when _playerTicks = 0 for new player)
if (_playerTicks < 60) then {
    _playerTicks = 1000;
};

_playerSkill = _playerScore / _playerTicks;

if (_playerSkill > 25) then {
    _playerSkill = 25;
};

_playerSkill