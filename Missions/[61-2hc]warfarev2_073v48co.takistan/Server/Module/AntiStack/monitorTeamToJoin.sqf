private["_side","_name","_uid","_totalSkillBLUFOR","_totalSkillOPFOR","_canJoin"];

_side = west;

_totalSkillBLUFOR = 0;
_totalSkillOPFOR = 0;

_totalSkillBLUFOR = [west] call WFBE_SE_FNC_GetTeamScoreMonitor;
_totalSkillOPFOR = [east] call WFBE_SE_FNC_GetTeamScoreMonitor;

if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
	_side = east;
} else {
	_side = west;
};
