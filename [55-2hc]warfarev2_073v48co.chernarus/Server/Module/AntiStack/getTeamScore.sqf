private ["_side","_sideMatches","_teamSkill","_playerStats","_playerScoreTotal","_playerTimePlayedTotal"];

_side = _this select 0;
_teamSkill = 0;

{
	_sideMatches = (_side == side _x);

	if (isPlayer _x && hasInterface && _sideMatches) then {
		_playerScore = score _x;
		_playerStats = ["Retrieve", getPlayerUID _x] call WFBE_SE_FNC_CallDatabase;
		_playerScoreTotal = _playerStats select 0;
		_playerTimePlayedTotal = _playerStats select 1;

		_playerSkill = _playerScoreTotal / _playerTimePlayedTotal;

		_teamSkill = _teamSkill + _playerSkill;
	};

} forEach allUnits;


_teamSkill