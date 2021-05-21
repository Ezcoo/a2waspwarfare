private["_playerUID","_nickName","_result","_resultCreateNew"];

_playerUID = _this select 0;
_nickname = _this select 1;

_result = [1,"getPlayerStats",[_playerUID]] call WFBE_CO_FNC_DatabaseRW;

if (_result isEqualTo []) then {
	_resultCreateNew = [_playerUID, _nickName] call WFBE_DB_createNewPlayer;
	_result = 0;
};

_result