private ["_playerCount", "_logMatchWinPlayerCountThreshold"];

_logMatchWinPlayerCountThreshold = _this select 0;

sleep 120;

_playerCount = 0;

{
	if (isPlayer _x) then {
		_playerCount = _playerCount + 1;
	}
} forEach allUnits;

if (_playerCount >= _logMatchWinPlayerCountThreshold) then {
	WFBE_Server_LogMatchWin = true;
}