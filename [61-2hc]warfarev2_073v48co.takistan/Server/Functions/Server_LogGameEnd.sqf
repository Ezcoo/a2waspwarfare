/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_winnerTeam","_loserTeam"];

_winnerTeam = _this select 0;
_loserTeam = "";

["INFORMATION", Format ["LogGameEnd.sqf: Team [%1] has won the match!", _winnerTeam]] Call WFBE_CO_FNC_LogContent;

if (_winnerTeam == west) then {
    _loserTeam = east;
} else {
    _loserTeam = west;
};

_winnerWins = profileNamespace getVariable format ["%1_WIN_TAKISTAN",_winnerTeam];
_loserWins = profileNamespace getVariable format ["%1_WIN_TAKISTAN", _loserTeam];

if (isNil "_winnerWins") then {
    profileNamespace setVariable [format ["%1_WIN_TAKISTAN",_winnerTeam], 1];

    if (isNil "_loserWins") then {
        profileNamespace setVariable [format ["%1_WIN_TAKISTAN",_loserTeam], 0];
    };

    saveProfileNamespace;
} else {
    profileNamespace setVariable [format ["%1_WIN_TAKISTAN",_winnerTeam], (_winnerWins + 1)];

    if (isNil "_loserWins") then {
        profileNamespace setVariable [format ["%1_WIN_TAKISTAN",_loserTeam], 0];
    };

    saveProfileNamespace;
};

["INFORMATION", Format ["LogGameEnd.sqf: Team BLUFOR has %1 wins and team OPFOR has %2 wins on Takistan since start of logging.", profileNamespace getVariable "WEST_WIN_TAKISTAN", profileNamespace getVariable "EAST_WIN_TAKISTAN"]] Call WFBE_CO_FNC_LogContent;
