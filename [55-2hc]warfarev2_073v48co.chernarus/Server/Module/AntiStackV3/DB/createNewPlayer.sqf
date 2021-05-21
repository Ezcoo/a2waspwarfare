private["_playerUID","_nickName","_result"];

_playerUID = _this select 0;
_nickName = _this select 1;

_result = [1,"createPlayerAccount",[_playerUID,_nickName]] call WFBE_CO_FNC_DatabaseRW;

_result