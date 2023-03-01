"WFBE_C_PLAYER_OBJECT" addPublicVariableEventHandler {
	(_this select 1) spawn {
		private ["_playerObject","_currentPlayerUID","_i","_arrayPosMatch","_iteratedPlayerUID","_matchFound"];

		_playerObject = _this select 0;
		_currentPlayerUID = _this select 1;

		_matchFound = false;
		_arrayPosMatch = 0;

		if (isNil "WFBE_SE_PLAYERLIST") then {
			WFBE_SE_PLAYERLIST = [[objNull, "0"]];
		};

		// diag_log format ["WFBE_SE_PLAYERLIST: %1", WFBE_SE_PLAYERLIST];

		{
			_i = 0;
			_iteratedPlayerUID = _x select 1;

			// diag_log format ["_iteratedPlayerUID: %1, _currentPlayerUID: %2", _iteratedPlayerUID, _currentPlayerUID];

			if (_iteratedPlayerUID == _currentPlayerUID) then {
				_matchFound = true;
				_arrayPosMatch = _i; 
			};

			_i = _i + 1;
		} forEach WFBE_SE_PLAYERLIST;

		if (_matchFound && !(isNull _playerObject)) then {
			WFBE_SE_PLAYERLIST set [_arrayPosMatch, [_playerObject, _currentPlayerUID]];
		} else {
			WFBE_SE_PLAYERLIST set [count WFBE_SE_PLAYERLIST, [_playerObject, _currentPlayerUID]];
		};

		// diag_log format ["WFBE_SE_PLAYERLIST after iterating: %1", WFBE_SE_PLAYERLIST];
		
	};
};