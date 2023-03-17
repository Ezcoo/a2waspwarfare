private ["_side","_sideMatches","_teamSkill","_playerStats","_playerScoreTotal","_playerTimePlayedTotal","_uid","_miniSleep","_playersOnSide"];

_side = _this select 0;
_uid = _this select 1;
_teamSkill = 0;
_miniSleep = 0.10;

["INFORMATION", Format ["GetTeamScore.sqf: The UID of client who requested the info: [%1]. Checking stats of side: [%2].", _uid, _side]] Call WFBE_CO_FNC_LogContent;
/*
{
	_sideMatches = (_side == side _x);

	// We must exclude the player itself from score counting.
	if (isPlayer _x && _sideMatches && (getPlayerUID _x != _uid)) then {
		_playersOnSide = [];
		uiSleep _miniSleep;
		
		_confirmedSide = missionNamespace getVariable Format["WFBE_JIP_USER%1_TEAM_JOINED", getPlayerUID _x];
		if (!(isNil "_confirmedSide")) then {
			_playersOnSide set [count _playersOnSide, [getPlayerUID _x, _confirmedSide]];
		} else {
			_hasConnectedAtLaunch = missionNamespace getVariable format ["WFBE_PLAYER_%1_CONNECTED_AT_LAUNCH", getPlayerUID _x];
			if (!(isNil "_hasConnectedAtLaunch")) then {
				// diag_log format ["UID: %1 _hasConnectedAtLaunch: %2", getPlayerUID _x, _hasConnectedAtLaunch];
				_playersOnSide set [count _playersOnSide, [getPlayerUID _x, side _x]];
			};
		};
	};
} forEach allUnits;
*/

_teamSkill = ["REQUEST_SIDE_SKILL", _side] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;

["INFORMATION", Format["GetTeamScore.sqf: Team [%1] total skill is: [%2].", _side, _teamSkill]] Call WFBE_CO_FNC_LogContent;

_teamSkill