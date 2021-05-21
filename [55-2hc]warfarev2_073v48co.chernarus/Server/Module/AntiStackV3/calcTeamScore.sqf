private["_arrPlayersBLUFOR","_arrPlayersOPFOR","_scoreBLUFOR","_scoreOPFOR"];

_arrPlayersBLUFOR = _this select 0;
_arrPlayersOPFOR = _this select 1;

_scoreBLUFOR = [_arrPlayersBLUFOR] spawn WFBE_DB_countTeamScore;
_scoreOPFOR = [_arrPlayersOPFOR] spawn WFBE_DB_countTeamScore;