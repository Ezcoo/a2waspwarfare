private["_arrPlayersTeam","_totalScoreTeam"];

// Player UIDs
_arrPlayersTeam = _this select 0;

_totalScoreTeam = 0;

{
	_totalScoreTeam = _totalScoreTeam + [_x] call WFBE_DB_getPlayerStats;
} forEach _arrPlayersTeam;

_totalScoreTeam