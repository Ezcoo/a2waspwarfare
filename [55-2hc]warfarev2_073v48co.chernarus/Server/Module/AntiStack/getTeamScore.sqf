private ["_side","_sideMatches","_teamSkill","_playerStats","_playerScoreTotal","_playerTimePlayedTotal","_uid"];

_side = _this select 0;
_uid = _this select 1;
_teamSkill = 0;

["INFORMATION", Format ["GetTeamScore.sqf: _side: %1. UID: %2.", _side, _uid]] Call WFBE_CO_FNC_LogContent;

{
	_sideMatches = (_side == side _x);

	// We must exclude the player itself from score counting.
	if (isPlayer _x && _sideMatches && (getPlayerUID _x != _uid)) then {
		_playerScore = score _x;
		["INFORMATION", Format["GetTeamScore.sqf: Calling database: RETRIEVE: player UID: %1, _playerScore: %2", getPlayerUID _x, _playerScore]] Call WFBE_CO_FNC_LogContent;
		_playerStats = ["Retrieve", getPlayerUID _x] call WFBE_SE_FNC_CallDatabase;
		["INFORMATION", Format["GetTeamScore.sqf: Called database! RETRIEVE: results: _playerStats: %1", _playerStats]] Call WFBE_CO_FNC_LogContent;
		_playerScoreTotal = _playerStats select 0;
		_playerTimePlayedTotal = _playerStats select 1;

		_playerSkill = _playerScoreTotal / _playerTimePlayedTotal;

		_teamSkill = _teamSkill + _playerSkill;
	};

} forEach allUnits;


_teamSkill