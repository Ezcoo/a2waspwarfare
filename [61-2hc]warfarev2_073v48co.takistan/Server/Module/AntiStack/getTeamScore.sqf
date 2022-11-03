private ["_side","_sideMatches","_teamSkill","_playerStats","_playerScoreTotal","_playerTimePlayedTotal","_uid"];

_side = _this select 0;
_uid = _this select 1;
_teamSkill = 0;

["INFORMATION", Format ["GetTeamScore.sqf: The UID of client who requested the info: [%1]. Checking stats of side: [%2].", _uid, _side]] Call WFBE_CO_FNC_LogContent;

{
	_sideMatches = (_side == side _x);

	// We must exclude the player itself from score counting.
	if (isPlayer _x && _sideMatches && (getPlayerUID _x != _uid)) then {
		_playerScore = score _x;
		// ["INFORMATION", Format["GetTeamScore.sqf: Calling database: RETRIEVE: player UID: %1, _playerScore: %2", getPlayerUID _x, _playerScore]] Call WFBE_CO_FNC_LogContent;
		_playerStats = ["RETRIEVE", getPlayerUID _x] call WFBE_SE_FNC_CallDatabaseRetrieve;
		// ["INFORMATION", Format["GetTeamScore.sqf: Called database! RETRIEVE: results: _playerStats: %1", _playerStats]] Call WFBE_CO_FNC_LogContent;
		_playerScoreTotal = _playerStats select 0;
		_playerTimePlayedTotal = _playerStats select 1;

		_playerSkill = _playerScoreTotal / _playerTimePlayedTotal;

		_teamSkill = _teamSkill + _playerSkill;
	};

} forEach allUnits;

["INFORMATION", Format["GetTeamScore.sqf: Team [%1] total skill is: [%2].", _side, _teamSkill]] Call WFBE_CO_FNC_LogContent;

_teamSkill