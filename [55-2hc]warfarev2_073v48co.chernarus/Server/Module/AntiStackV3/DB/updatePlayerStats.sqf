private["_playerUID","_nickName","_result","_score","_timePlayed"];

_playerUID = _this select 0;
_nickname = _this select 1;
_score = _this select 2;
_timePlayed = _this select 3;

_result = [1,"updatePlayerStats",[_score, _timePlayed, _playerUID]] call WFBE_CO_FNC_DatabaseRW;