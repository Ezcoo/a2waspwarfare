/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_winnerTeam"];

_winnerTeam = _this;

["INFORMATION", Format ["Client_EndGame.sqf: Team %1_WIN_TAKISTAN!", _winnerTeam]] Call WFBE_CO_FNC_LogContent;

_logTeamWin = format ["%1_WIN_TAKISTAN", _winnerTeam];

if (isNil (profileNamespace getVariable _winnerTeam)) then {
    profileNamespace setVariable ["_winnerTeam", 1];
    saveProfileNamespace;
} else {
    profileNamespace setVariable ["_winnerTeam", (profileNamespace getVariable _winnerTeam) + 1];
    saveProfileNamespace;
};

_westWins = profileNamespace getVariable WEST_WIN_TAKISTAN;
_eastWins = profileNamespace getVariable EAST_WIN_TAKISTAN;

["INFORMATION", Format ["Client_EndGame.sqf: Team BLUFOR has %1 wins and team OPFOR has %2 wins on Takistan since start of logging.", _westWins, _eastWins]] Call WFBE_CO_FNC_LogContent;