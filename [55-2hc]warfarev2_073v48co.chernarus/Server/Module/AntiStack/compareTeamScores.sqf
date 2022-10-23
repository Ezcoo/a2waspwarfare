private["_side","_name","_uid","_totalSkillBLUFOR","_totalSkillOPFOR","_canJoin"];

_side = this select 0;
_name = _this select 1;
_uid = _this select 2;

_totalSkillBLUFOR = 0;
_totalSkillOPFOR = 0;

_totalSkillBLUFOR = [west, _uid] call WFBE_SE_FNC_GetTeamScore;
_totalSkillOPFOR = [east, _uid] call WFBE_SE_FNC_GetTeamScore;

if (_side == west) then {
	if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
		_canJoin = false;
		["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
		[nil, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClients;
	};
} else {
	if (_side == east) then {
		if (_totalSkillOPFOR > _totalSkillBLUFOR) then {
			_canJoin = false;
			["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
			[nil, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClients;
		};
	};
};

_canJoin