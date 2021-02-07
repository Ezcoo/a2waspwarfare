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

        if ((_i mod 10) == 0) then {

            _lastSkillValuesPlayerProfile = profileNamespace getVariable "WFBE_CL_VAR_SKILLPLAYER";

            if (isNil "_lastSkillValuesPlayerProfile") then {
                profileNamespace setVariable ["WFBE_CL_VAR_SKILLPLAYER", [_newScorePlayer]];

                saveProfileNamespace;
            } else {
                _lastSkillValuesPlayer set [count _lastSkillValuesPlayer, _scoreDiffPlayer];

                if (count _lastSkillValuesPlayer > 30) then {
                    _oldLastSkillValuesPlayer = _lastSkillValuesPlayer;

                    {
                        _j = 0;
                        if (count _lastSkillValuesPlayer <= 30) then {
                            _lastSkillValuesPlayer set [_j, _oldLastSkillValuesPlayer select _j];
                        };
                        _j = _j + 1;
                    } forEach _oldLastSkillValuesPlayer;
                };

                profileNamespace setVariable ["WFBE_CL_VAR_SKILLPLAYER", _lastSkillValuesPlayer];

                saveProfileNamespace;
            };

        };

    };
};