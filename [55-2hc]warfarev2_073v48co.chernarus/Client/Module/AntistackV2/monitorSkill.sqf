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

        if (count _lastSkillValuesPlayer > 15) then {
            _oldLastSkillValuesPlayer = _lastSkillValuesPlayer;

            for "_j" from 0 to (count _oldLastSkillValuesPlayer - 2) step 1 do {
                        _lastSkillValuesPlayer set [_j, (_oldLastSkillValuesPlayer select (_j + 1))];
            };
        };

        ["INFORMATION", format ["monitorSkill.sqf: _newScorePlayer: %1, _lastSkillValuesPlayer: %2, count _lastSkillValuesPlayer: %3", _newScorePlayer, _lastSkillValuesPlayer, count _lastSkillValuesPlayer]] Call WFBE_CO_FNC_LogContent;

        if ((_i mod 15) == 0) then {

            _lastSkillValuesPlayerProfile = profileNamespace getVariable "WFBE_CL_VAR_SKILLPLAYER";

            if (isNil "_lastSkillValuesPlayerProfile") then {

                profileNamespace setVariable ["WFBE_CL_VAR_SKILLPLAYER", [_newScorePlayer]];

                ["INFORMATION", format ["monitorSkill.sqf: Attempting to save skill information to profileNamespace..."]] Call WFBE_CO_FNC_LogContent;

                saveProfileNamespace;

                ["INFORMATION", format ["monitorSkill.sqf: Saved skill info to profileNamespace!"]] Call WFBE_CO_FNC_LogContent;

            } else {

                _lastSkillValuesPlayerTotal = 0;

                for "_j" from 0 to (count _lastSkillValuesPlayer) step 1 do {
                    _lastSkillValuesPlayerTotal = _lastSkillValuesPlayerTotal + (_lastSkillValuesPlayer select _j);
                };

                ["INFORMATION", format ["monitorSkill.sqf: Calculating latest skill value of the player to be saved into profileNamespace... _lastSkillValuesPlayerTotal: %1", _lastSkillValuesPlayerTotal]] Call WFBE_CO_FNC_LogContent;

                _lastSkillValuesPlayerProfile set [count _lastSkillValuesPlayerProfile, _lastSkillValuesPlayerTotal];
                
                if (count _lastSkillValuesPlayerProfile > 30) then {
                    _oldLastSkillValuesPlayerProfile = _lastSkillValuesPlayerProfile;

                    for "_j" from 0 to (count _oldLastSkillValuesPlayerProfile - 2) step 1 do {
                        _lastSkillValuesPlayerProfile set [_j, (_oldLastSkillValuesPlayerProfile select (_j + 1))];
                    };
                };

                profileNamespace setVariable ["WFBE_CL_VAR_SKILLPLAYER", _lastSkillValuesPlayerProfile];

                ["INFORMATION", format ["monitorSkill.sqf: Attempting to save skill information to profileNamespace... _lastSkillValuesPlayerProfile: %1", _lastSkillValuesPlayerProfile]] Call WFBE_CO_FNC_LogContent;

                saveProfileNamespace;

                ["INFORMATION", format ["monitorSkill.sqf: Saved skill info to profileNamespace!"]] Call WFBE_CO_FNC_LogContent;
            };

        };

    };
};