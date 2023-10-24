private["_side","_name","_uid","_totalSkillBLUFOR","_totalSkillOPFOR","_canJoin"];

_side = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_player = _this select 3;
_totalSkillBLUFOR = _this select 4;
_totalSkillOPFOR = _this select 5;

_canJoin = true;

if (_side == west) then {
	if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
		_canJoin = false;
		["INFORMATION", Format["CompareTeamScores.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
		[leader group _player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
	};
} else {
	if (_side == east) then {
		if (_totalSkillOPFOR > _totalSkillBLUFOR) then {
			_canJoin = false;
			["INFORMATION", Format["CompareTeamScores.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
			[leader group _player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
		};
	};
};

_canJoin