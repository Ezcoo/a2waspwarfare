/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_winnerTeam"];

_winnerTeam = _this select 0;

["INFORMATION", Format ["Client_EndGame.sqf: Team %1_WIN_TAKISTAN!", _winnerTeam]] Call WFBE_CO_FNC_LogContent;

_logTeamWin = format ["%1_WIN_TAKISTAN", _winnerTeam];

if (_winnerTeam == west) then {
    if (isNil (profileNamespace getVariable "EAST_WIN_TAKISTAN")) then {
        profileNamespace setVariable ["EAST_WIN_TAKISTAN",0];
    };
} else {
    if (isNil (profileNamespace getVariable "WEST_WIN_TAKISTAN")) then {
        profileNamespace setVariable ["WEST_WIN_TAKISTAN",0];
    };
};

if (isNil (profileNamespace getVariable "_logTeamWin")) then {
    profileNamespace setVariable ["_logTeamWin", 1];
    saveProfileNamespace;
} else {
    profileNamespace setVariable ["_logTeamWin", (profileNamespace getVariable "_logTeamWin") + 1];
    saveProfileNamespace;
};

_westWins = profileNamespace getVariable WEST_WIN_TAKISTAN;
_eastWins = profileNamespace getVariable EAST_WIN_TAKISTAN;

["INFORMATION", Format ["Client_EndGame.sqf: Team BLUFOR has %1 wins and team OPFOR has %2 wins on Takistan since start of logging.", _westWins, _eastWins]] Call WFBE_CO_FNC_LogContent;