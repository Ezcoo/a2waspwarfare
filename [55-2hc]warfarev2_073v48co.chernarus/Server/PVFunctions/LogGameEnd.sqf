/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_winnerTeam"];

_winnerTeam = _this;

["INFORMATION", Format ["LogGameEnd.sqf: Team %1_WIN_CHERNARUS!", _winnerTeam]] Call WFBE_CO_FNC_LogContent;

_logTeamWin = format ["%1_WIN_CHERNARUS", _winnerTeam];

if (isNil (profileNamespace getVariable _winnerTeam)) then {
    profileNamespace setVariable ["_winnerTeam", 1];
    saveProfileNamespace;
} else {
    profileNamespace setVariable ["_winnerTeam", (profileNamespace getVariable _winnerTeam) + 1];
    saveProfileNamespace;
};

_westWins = profileNamespace getVariable WEST_WIN_CHERNARUS;
_eastWins = profileNamespace getVariable EAST_WIN_CHERNARUS;

["INFORMATION", Format ["LogGameEnd.sqf: Team BLUFOR has %1 wins and team OPFOR has %2 wins on Chernarus since start of logging.", _westWins, _eastWins]] Call WFBE_CO_FNC_LogContent;
