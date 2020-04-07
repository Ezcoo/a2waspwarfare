/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_key","_handled","_moveButtons"];

_key = _this select 1;
_handled = false;
_moveButtons = actionKeys "MoveBack" + actionKeys "MoveDown" + actionKeys "MoveForward" + actionKeys "MoveFastForward" + actionKeys "MoveLeft" + actionKeys "MoveRight" + actionKeys "HideMap" + actionKeys "showMap";

if (_key in _moveButtons) then {
    WFBE_CO_VAR_NotAFK_update = true;
    _handled = true;
};

_handled;