/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_winnerTeam","_loserTeam","_winnerWins","_loserWins"];

_winnerTeam = _this select 0;
_loserTeam = "";

["INFORMATION", Format ["LogGameEnd.sqf: Team [%1] has won the match! Log match win? [%2]", _winnerTeam, WFBE_Server_LogMatchWin]] Call WFBE_CO_FNC_LogContent;

if (_winnerTeam == west) then {
    _loserTeam = east;
} else {
    _loserTeam = west;
};


if (WFBE_Server_LogMatchWin) then {
    _winnerWins = profileNamespace getVariable format ["%1_WIN_CHERNARUS",_winnerTeam];
    _loserWins = profileNamespace getVariable format ["%1_WIN_CHERNARUS", _loserTeam];

    if (isNil "_winnerWins") then {
        profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_winnerTeam], 1];

        if (isNil "_loserWins") then {
            profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_loserTeam], 0];
        };

        saveProfileNamespace;
    } else {
        profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_winnerTeam], (_winnerWins + 1)];

        if (isNil "_loserWins") then {
            profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_loserTeam], 0];
        };

        saveProfileNamespace;
    };

    ["INFORMATION", Format ["LogGameEnd.sqf: Team BLUFOR has %1 wins and team OPFOR has %2 wins on Chernarus since start of logging.", profileNamespace getVariable "WEST_WIN_CHERNARUS", profileNamespace getVariable "EAST_WIN_CHERNARUS"]] Call WFBE_CO_FNC_LogContent;
};