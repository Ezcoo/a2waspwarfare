/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_sleepTime"];

while {!gameOver} do {

	// Start code block for storing player scores
	{

	    if (isPlayer _x) then {
	        if (isNil format ["WFBE_OLD_SCORE_UID_%1", getPlayerUID _x]) then {
	            missionNamespace setVariable [format ["WFBE_OLD_SCORE_UID_%1", getPlayerUID _x], 0];
	        } else {
                missionNamespace setVariable [format ["WFBE_SCORE_UID_%1", getPlayerUID _x], score _x];
            };

	        [_x] call IniDB_AddScore;
	        [getPlayerUID _x] call IniDB_AddTick;
	    };

	    missionNamespace setVariable [format ["WFBE_OLD_SCORE_UID_%1", getPlayerUID _x], missionNamespace getVariable format ["WFBE_SCORE_UID_%1", getPlayerUID _x]];

	} forEach (playableUnits + switchableUnits);

	{
	    _x = _x - (_x * 0.1);

	    if (_x < 0) then {
            _x = 0;
        };
	} forEach WFBE_CO_VAR_DISCONNECTED_SKILL_WEST;

	WFBE_CO_VAR_DISCONNECTED_SKILL_WEST = WFBE_CO_VAR_DISCONNECTED_SKILL_WEST - [0];

	{
    	_x = _x - (_x * 0.1);

    	if (_x < 0) then {
    	    _x = 0;
    	};
    } forEach WFBE_CO_VAR_DISCONNECTED_SKILL_EAST;

    WFBE_CO_VAR_DISCONNECTED_SKILL_EAST = WFBE_CO_VAR_DISCONNECTED_SKILL_EAST - [0];

    _sleepTime = (60) call GetSleepFPS;
    sleep _sleepTime;
};