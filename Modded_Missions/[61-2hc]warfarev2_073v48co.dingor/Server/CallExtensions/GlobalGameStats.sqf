Private ["_cSharpClassName","_scoreSideWest","_scoreSideEast","_currentMap","_uptime","_playerCount"];
_cSharpClassName = "GLOBALGAMESTATS";
_currentMap = worldName;

while {true} do {
    _scoreSideWest = scoreSide west;
    _scoreSideEast = scoreSide east;
    _uptime = round(time);
    _playerCount = 0;

    ["INFORMATION", Format ["Running with old vars %1: %2 | %3 | %4 | %5 | %6",_cSharpClassName,_scoreSideWest,_scoreSideEast,_currentMap,_uptime,_playerCount]] Call WFBE_CO_FNC_LogContent;

    // Count the actual players, skip bots that are in the deadspawns
    {
        if (isPlayer _x) then {
            _playerCount = _playerCount + 1;
        }
    } forEach call BIS_fnc_listPlayers;

    _playerCount = abs(_playerCount - 1); // Exclude headless client

    "a2waspwarfare_Extension" callExtension format ["%1,%2,%3,%4,%5,%6",_cSharpClassName,_scoreSideWest,_scoreSideEast,_currentMap,_uptime,_playerCount];
    ["INFORMATION", Format ["Done %1: %2 | %3 | %4 | %5 | %6",_cSharpClassName,_scoreSideWest,_scoreSideEast,_currentMap,_uptime,_playerCount]] Call WFBE_CO_FNC_LogContent;
    sleep 60;
};