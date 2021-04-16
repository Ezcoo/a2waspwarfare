/*
	author: Net_2
	description: none
	returns: nothing
*/

_handle = [] spawn {
    _i = 0;
    _oldScorePlayer = score player;
    _newScorePlayer = 0;
    _scoreDiffPlayer = 0;

    _lastSkillValuesPlayer = [];

    while {!gameOver} do {


        _sleep = 60 call GetSleepFPS;
        sleep _sleep;

        _newScorePlayer = score player;
        _scoreDiffPlayer = _newScorePlayer - _oldScorePlayer;
        _oldScorePlayer = _newScorePlayer;

        _lastSkillValuesPlayer set [count _lastSkillValuesPlayer, _scoreDiffPlayer];

        _i = _i + 1;

        ["INFORMATION", format ["monitorSkill.sqf: _newScorePlayer: %1, _lastSkillValuesPlayer: %2", _newScorePlayer, _lastSkillValuesPlayer]] Call WFBE_CO_FNC_LogContent;

        if ((_i mod 10) == 0) then {

            _lastSkillValuesPlayerProfile = profileNamespace getVariable "WFBE_CL_VAR_SKILLPLAYER";

            if (isNil "_lastSkillValuesPlayerProfile") then {
                profileNamespace setVariable ["WFBE_CL_VAR_SKILLPLAYER", [_newScorePlayer]];

                saveProfileNamespace;
            } else {
                _lastSkillValuesPlayer set [count _lastSkillValuesPlayer, _scoreDiffPlayer];

                if (count _lastSkillValuesPlayer > 30) then {
                    _oldLastSkillValuesPlayer = _lastSkillValuesPlayer;

                    for "_j" from 0 to (count _oldLastSkillValuesPlayer - 2) step 1 do {
                        _lastSkillValuesPlayer set [_j, (_oldLastSkillValuesPlayer count (_j + 1))];
                    };
                };

                profileNamespace setVariable ["WFBE_CL_VAR_SKILLPLAYER", _lastSkillValuesPlayer];

                ["INFORMATION", format ["monitorSkill.sqf: Attempting to save skill information to profileNamespace..."]] Call WFBE_CO_FNC_LogContent;

                saveProfileNamespace;

                ["INFORMATION", format ["monitorSkill.sqf: Saved skill info to profileNamespace!"]] Call WFBE_CO_FNC_LogContent;
            };

        };

    };
};