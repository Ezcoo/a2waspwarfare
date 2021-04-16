/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_SRV_VAR_RequestPlayerSkill" addPublicVariableEventHandler {

    _requestID = WFBE_SRV_VAR_RequestPlayerSkill;
    _playerSkill = profileNamespace getVariable "WFBE_CL_VAR_SKILLPLAYER";
    _playerSkillFinal = 0;

    ["INFORMATION", format ["SendPlayerSkill.sqf: Triggered! _requestID: %1, _playerSkill: %2", _requestID, _playerSkill]] Call WFBE_CO_FNC_LogContent;

    if (isNil "_playerSkill" || count _playerSkill < 5) then {
        _playerSkillFinal = 30;
    } else {
        {
            _playerSkillFinal = _playerSkillFinal + _x;
        } forEach _playerSkill;

        _playerSkillFinal = _playerSkillFinal / count _playerSkill;
    };

    missionNamespace setVariable [format ["WFBE_CL_VAR_SKILL_%1", side player], [_requestID, _playerSkillFinal]];

    publicVariableServer format ["WFBE_CL_VAR_SKILL_%1", side player];

};