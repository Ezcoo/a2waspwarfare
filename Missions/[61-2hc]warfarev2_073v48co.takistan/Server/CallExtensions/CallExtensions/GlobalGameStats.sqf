Private ["_cSharpClassName","_scoreSideWest","_scoreSideEast"];
_cSharpClassName = "GLOBALGAMESTATS";
_scoreSideWest = scoreSide west;
_scoreSideEast = scoreSide east;

while {true} do {
    ["INFORMATION", Format ["Running %1: %2 | %3",_cSharpClassName,_sideScoreWest,_sideScoreEast]] Call WFBE_CO_FNC_LogContent;
    "a2waspwarfare_Extension" callExtension format ["%1,%2,%3",_cSharpClassName,_scoreSideWest,_scoreSideEast];
    ["INFORMATION", Format ["Done %1: %2 | %3",_cSharpClassName,_sideScoreWest,_sideScoreEast]] Call WFBE_CO_FNC_LogContent;
    sleep 60;
};