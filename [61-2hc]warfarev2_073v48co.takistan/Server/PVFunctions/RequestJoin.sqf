private ["_canJoin","_get","_name","_player","_side","_sideOrigin","_uid","_skip","_otherside","_sidepros","_othersidepros","_skillJoiningPlayer","_playersinside","_playersinotherside","_skillDifference","_totalSkillPlayerSide","_totalSkillPlayerOtherSide","_playerSkill","_playerSkillFriendly","_playerSkillEnemy"];

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
_totalSkillPlayerSide = 0;
_totalSkillPlayerOtherSide = 0;
_skillDifference = 0;
_skillJoiningPlayer = 0;
_playerSkillFriendly = 0;
_playerSkillEnemy = 0;
_scoreCalcFinished = false;

_get = missionNamespace getVariable Format["WFBE_JIP_USER%1",_uid];

if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.

	_skip = _get select 4;
	_sideOrigin = _get select 2; //--- Get the original side.

	if (_skip == 0) then {

		// _players_difference =  _playersinside - _playersinotherside;

        [] spawn {
            {
                if (side _x == _side && isPlayer _x) then {
                    _playerSkillFriendly = [getPlayerUID _x] call IniDB_CalcSkill;
                    _totalSkillPlayerSide = _totalSkillPlayerSide + _playerSkill;
                };

                if (side _x == _otherside && isPlayer _x) then {
                    _playerSkillEnemy = [getPlayerUID _x] call IniDB_CalcSkill;
                    _totalSkillPlayerOtherSide = _totalSkillPlayerOtherSide + _playerSkill;
                };
            } forEach (playableUnits + switchableUnits);

            _skillJoiningPlayer = [getPlayerUID _player] call IniDB_CalcSkill;

            if (_side == west) then {
                {
                    _totalSkillPlayerSide = _totalSkillPlayerSide + _x;
                } forEach WFBE_CO_VAR_DISCONNECTED_SKILL_WEST;

                {
                    _totalSkillPlayerOtherSide = _totalSkillPlayerOtherSide + _x;
                } forEach WFBE_CO_VAR_DISCONNECTED_SKILL_EAST;
            };

            if (_side == east) then {
                {
                    _totalSkillPlayerSide = _totalSkillPlayerSide + _x;
                } forEach WFBE_CO_VAR_DISCONNECTED_SKILL_EAST;

                {
                    _totalSkillPlayerOtherSide = _totalSkillPlayerOtherSide + _x;
                } forEach WFBE_CO_VAR_DISCONNECTED_SKILL_WEST;
            };

            _skillDifference = _totalSkillPlayerSide / _totalSkillPlayerOtherSide;

            _scoreCalcFinished = true;
		};

		waitUntil {_scoreCalcFinished};

		// If skill difference is too high (more than 10 % difference) and there are enough players online, prevent player from joining to team
		if((_skillDifference > 1.1) && (_totalSkillPlayerSide - _totalSkillPlayerOtherSide > 5)) then {
	        _canJoin = false;
			missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], nil];
			[_player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamstacking,joined side [%3].", _name,_uid,_side]] Call WFBE_CO_FNC_LogContent;
			_get set [4,0];
			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] tried to join team [%3], skill of player: %4 skill of the friendly team: %5, skill of enemy team: %6.", _name,_uid,_side,_skillJoiningPlayer,_totalSkillPlayerSide,_totalSkillPlayerOtherSide]] Call WFBE_CO_FNC_LogContent;
		} else {
		    _canJoin = true;
		    ["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] joined team [%3], skill of player: %4 skill of the friendly team: %5, skill of enemy team: %6.", _name,_uid,_side,_skillJoiningPlayer,_totalSkillPlayerSide,_totalSkillPlayerOtherSide]] Call WFBE_CO_FNC_LogContent;
		};

	}else{
        if (_sideOrigin != _side) then { //--- The joined side differs from the original one.

            _canJoin = false;

            [nil, "LocalizeMessage", ['Teamswap',_name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.

            ["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_LogContent;
        } else {
            _canJoin = true;
        };
	};

} else {
	["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;
};


["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, _canJoin]] Call WFBE_CO_FNC_LogContent;

if (WF_A2_Vanilla) then {
	[_uid, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClients;
} else {
	[_player, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClient;
};

// Set variable to store player side (Net_2)
missionNamespace setVariable [format ["WFBE_CO_VAR_SIDE_UID_%1", _uid], _side];
["INFORMATION", Format["RequestJoin.sqf: Player %1 was assigned to side %2? [%3]",_name,missionNamespace getVariable format ["WFBE_CO_VAR_SIDE_UID_%1", _uid],_canJoin]] Call WFBE_CO_FNC_LogContent;