/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_winnerTeam","_loserTeam"];

_winnerTeam = _this;
_loserTeam = "";

["INFORMATION", Format ["LogGameEnd.sqf: Team [%1] has won the match!", _winnerTeam]] Call WFBE_CO_FNC_LogContent;

if (_winnerTeam == west) then {
    _loserTeam = east;
} else {
    _loserTeam = west;
};

if (isNil (profileNamespace getVariable format ["%1_WIN_CHERNARUS",_winnerTeam])) then {
    profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_winnerTeam], 1];

    if (isNil (profileNamespace getVariable format ["%1_WIN_CHERNARUS", _loserTeam])) then {
        profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_loserTeam], 0];
    };

    saveProfileNamespace;
} else {
    profileNamespace setVariable [profileNamespace getVariable format ["%1_WIN_CHERNARUS",_winnerTeam], profileNamespace getVariable format ["%1_WIN_CHERNARUS",_winnerTeam] + 1];

    if (isNil (profileNamespace getVariable format ["%1_WIN_CHERNARUS", _loserTeam])) then {
            profileNamespace setVariable [format ["%1_WIN_CHERNARUS",_loserTeam], 0];
    };
};

_westWins = profileNamespace getVariable WEST_WIN_CHERNARUS;
_eastWins = profileNamespace getVariable EAST_WIN_CHERNARUS;

["INFORMATION", Format ["LogGameEnd.sqf: Team BLUFOR has %1 wins and team OPFOR has %2 wins on Chernarus since start of logging.", _westWins, _eastWins]] Call WFBE_CO_FNC_LogContent;
