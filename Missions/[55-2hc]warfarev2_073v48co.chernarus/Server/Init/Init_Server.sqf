[] execVM "Server\Module\serverFPS\monitorServerFPS.sqf";

[] execVM "Server\Module\AntiStack\countPlayerScores.sqf";

[] execVM "Server\Module\AntiStack\monitorTeamToJoin.sqf";

// 0 = NONE
// 1 = CHERNARUS
// 2 = TAKISTAN
["SET_MAP", 1] call WFBE_SE_FNC_CallDatabaseSetMap;