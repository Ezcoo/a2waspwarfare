Private ["_cSharpClassName","_scoreSideWest","_scoreSideEast","_currentMap","_uptime"];
_cSharpClassName = "GLOBALGAMESTATS";
_currentMap = worldName;

while {true} do {
    ["INFORMATION", Format ["Running %1: %2 | %3 | %4 | %5",_cSharpClassName,_scoreSideWest,_scoreSideEast]] Call WFBE_CO_FNC_LogContent;

    _scoreSideWest = scoreSide west;
    _scoreSideEast = scoreSide east;
    _uptime = Call GetTime;

    "a2waspwarfare_Extension" callExtension format ["%1,%2,%3,%4,%5",_cSharpClassName,_scoreSideWest,_scoreSideEast,_currentMap,_uptime];
    ["INFORMATION", Format ["Done %1: %2 | %3 | %4 | %5",_cSharpClassName,_scoreSideWest,_scoreSideEast]] Call WFBE_CO_FNC_LogContent;
    sleep 60;
};