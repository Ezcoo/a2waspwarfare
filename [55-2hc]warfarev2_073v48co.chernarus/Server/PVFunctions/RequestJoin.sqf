private ["_canJoin","_get","_name","_player","_side","_sideOrigin","_uid","_skip","_otherside","_sidepros","_othersidepros","_playersinside","_playersinotherside","_skillDifference","_totalSkillPlayerSide","_totalSkillPlayerOtherSide","_playerSkill"];

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
_get = missionNamespace getVariable Format["WFBE_JIP_USER%1",_uid];

if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.

	_skip = _get select 4;
	_sideOrigin = _get select 2; //--- Get the original side.

	if (_skip == 0) then {

		// _players_difference =  _playersinside - _playersinotherside;

		{
		    if (side _x == _side && isPlayer _x) then {
		        _playerSkill = [getPlayerUID _x] call IniDB_CalcSkill;
		        _totalSkillPlayerSide = _totalSkillPlayerSide + _playerSkill;
		    };

		    if (side _x == _otherside && isPlayer _x) then {
		        _playerSkill = [getPlayerUID _x] call IniDB_CalcSkill;
		        _totalSkillPlayerOtherSide = _totalSkillPlayerOtherSide + _playerSkill;
		    };
		} forEach (playableUnits + switchableUnits);

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

		// If skill difference is too high (more than 20 % difference) and there are enough players online, prevent player from joining to team
		if((_skillDifference > 1.2 && _totalSkillPlayerSide - _totalSkillPlayerOtherSide > 5) || (_skillDifference > 1.2 && _totalSkillPlayerOtherSide - _totalSkillPlayerSide > 5)) then {
	        _canJoin = false;
			missionNamespace setVariable [format["WFBE_JIP_USER%1",_uid], nil];
			[_player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamstacking,joined side [%3].", _name,_uid,_side]] Call WFBE_CO_FNC_LogContent;
			_get set [4,0];
		};

	}else{
		if (_sideOrigin != _side) then { //--- The joined side differs from the original one.

			_canJoin = false;

			[nil, "LocalizeMessage", ['Teamswap',_name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.

			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_LogContent;
		}else {
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
missionNamespace setVariable [format [WFBE_CO_VAR_SIDE_UID_%1, _uid], side _player];