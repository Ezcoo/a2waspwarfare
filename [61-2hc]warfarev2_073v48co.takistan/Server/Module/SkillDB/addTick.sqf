/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_playerUID","_playerTotalTicks","_newPlayerTicks","_player"];

_playerUID = _this select 0;
_playerTotalTicks = [_playerUID] call IniDB_getTicks;

_playerTicksNew = _playerTotalTicks + 1;

[_playerUID, _playerTicksNew] spawn {
    _playerUID = _this select 0;
    _playerTicksNew = _this select 1;

    if (!(["WASP_playerSkills", _playerUID, "ticks", _playerTicksNew] call iniDB_write) ) then {
        ["WARNING", Format["AddTick.sqf: Failed to save tick number [%1] for player [%2] in database.",_playerTicksNew,_playerUID]] Call WFBE_CO_FNC_LogContent;
    };
};