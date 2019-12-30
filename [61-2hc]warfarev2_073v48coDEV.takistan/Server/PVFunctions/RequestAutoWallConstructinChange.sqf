Private ['_isAutoWallConstructingEnabled'];

_isAutoWallConstructingEnabled = _this select 0;
_player = _this select 1;

isAutoWallConstructingEnabled = _isAutoWallConstructingEnabled;
[_player, "HandleSpecial", ["auto-wall-constructing-changed", isAutoWallConstructingEnabled]] Call WFBE_CO_FNC_SendToClient;