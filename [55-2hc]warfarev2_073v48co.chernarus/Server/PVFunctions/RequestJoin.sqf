private ["_response","_dataRead","_totalFriendlyTeamSkill","_totalEnemyTeamSkill","_joinedTeam","_respFriendly","_respEnemy","_teamswapAndStackCheckReady","_canJoin","_get","_name","_player","_side","_sideOrigin","_uid","_skip","_otherside","_sidepros","_othersidepros","_playersinside","_playersinotherside"];

_player = _this select 0;
_side = _this select 1;
_name = name _player;

_skip = 0;
_otherside = west;
_playersinside = 0;
_playersinotherside = 0;
_sidepros = 0;
_othersidepros = 0;

_uid = getPlayerUID(_player);
_canJoin = true;

if (_side == west) then {_otherside = east;};

_playersinside = ({side _x == _side && isPlayer _x} count (playableUnits + switchableUnits));
_playersinotherside = ({side _x == _otherside && isPlayer _x} count (playableUnits + switchableUnits));
_get = missionNamespace getVariable Format["WFBE_JIP_USER%1",_uid];

_teamswapAndStackCheckReady = false;

[] spawn {
    _totalFriendlyTeamSkill = 0;
    _totalEnemyTeamSkill = 0;
    _joinedTeam = [];
    _respFriendly = "";
    _respEnemy = "";
    
    // Calculate total skill for each team
    switch (_side) do {
        case "WEST";
        {
            {
                if (side _x == "WEST" && isPlayer _x) then {
                    _respFriendly = ["RetrievePlayerSkill", "Retrieve", getPlayerUID _x] call persistent_fnc_callDatabase;
                    _friendlyPlayerScore = call compile _respFriendly;
                    _totalFriendlyTeamSkill = _totalFriendlyTeamSkill + _friendlyPlayerScore;
                };

                if (side _x == "EAST" && isPlayer _x) then {
                    _respEnemy = ["RetrievePlayerSkill", "Retrieve", getPlayerUID _x] call persistent_fnc_callDatabase;
                    _enemyPlayerScore = call compile _respEnemy;
                    _totalEnemyTeamSkill = _totalEnemyTeamSkill + _enemyPlayerScore;
                };
            } forEach (playableUnits + switchableUnits) - _player;
        };
        case "EAST";
            {
                        if (side _x == "EAST" && isPlayer _x) then {
                            _respFriendly = ["RetrievePlayerSkill", "Retrieve", getPlayerUID _x] call persistent_fnc_callDatabase;
                            _friendlyPlayerScore = call compile _respFriendly;
                            _totalFriendlyTeamSkill = _totalFriendlyTeamSkill + _friendlyPlayerScore;
                        };

                        if (side _x == "WEST" && isPlayer _x) then {
                            _respEnemy = ["RetrievePlayerSkill", "Retrieve", getPlayerUID _x] call persistent_fnc_callDatabase;
                            _enemyPlayerScore = call compile _respEnemy;
                            _totalEnemyTeamSkill = _totalEnemyTeamSkill + _enemyPlayerScore;
                        };
                } forEach (playableUnits + switchableUnits) - _player;
        };
        
        // If team skills have too much difference, prevent player from joining the better team
            if (_totalFriendlyTeamSkill > 1.2 * _totalEnemyTeamSkill) then {
                missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], nil];
                _canJoin = false;
                [_player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
                sleep 5;
                failMission "END1";
            } else {
                _canJoin = true;
            };

    if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.

		if (_sideOrigin != _side) then { //--- The joined side differs from the original one.

			_canJoin = false;

			[nil, "LocalizeMessage", ['Teamswap',_name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.

			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_LogContent;
            _get set [4,0];
		} else {
			_canJoin = true;
		};
/*
	_skip = _get select 4;
	_sideOrigin = _get select 2; //--- Get the original side.

	if (_skip == 0) then {

		_players_difference =  _playersinside - _playersinotherside;


		if(_players_difference > 2) then {
			missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], nil];
			[_player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamstacking,joined side [%3].", _name,_uid,_side]] Call WFBE_CO_FNC_LogContent;
			_get set [4,0];
		};

	};

*/
    } else {
        ["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;
    };

    _teamswapAndStackCheckReady = true;

};

waitUntil {_teamswapAndStackCheckReady};

["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, _canJoin]] Call WFBE_CO_FNC_LogContent;

if (WF_A2_Vanilla) then {
	[_uid, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClients;
} else {
	[_player, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClient;
};