/*
	author: Net_2
	description: none
	returns: nothing
*/

"WFBE_SRV_VAR_RequestPlayerSkill" addPublicVariableEventHandler {

    _requestID = WFBE_SRV_VAR_RequestPlayerSkill;
    _playerSkill = profileNamespace getVariable "WFBE_CL_VAR_SKILLPLAYER";
    _playerSkillFinal = 0;

    if (isNil "_playerSkill" || count _playerSkill < 5) then {
        _playerSkillFinal = 100;
    } else {
        _i = 0;
        {
            _playerSkillFinal = _playerSkillFinal + _playerSkill select _i;
            _i = _i + 1;
        } forEach _playerSkill;

        _playerSkillFinal = _playerSkillFinal / count _playerSkill;
    };

    publicVariableServer format ["WFBE_CL_VAR_SKILL_%1_%2", side player, _requestID];

};