Private["_localize","_txt","_totalSkillBLUFOR","_totalSkillOPFOR","_attempts"];

_localize = _this select 0;
_commandChat = true;
_txt = "";
_totalSkillBLUFOR = "";
_totalSkillOPFOR = "";

switch (_localize) do {
	case "BuildingTeamkill": {_txt = Format [Localize "STR_WF_CHAT_Teamkill_Building",_this select 1, _this select 2, [_this select 3, 'displayName'] Call GetConfigInfo]};
	case "Teamswap": {_txt = Format [Localize "STR_WF_CHAT_Teamswap",_this select 3, _this select 4]};
	case "Teamstack": 
    {
        /*_attempts = 0;
        while {(_totalSkillBLUFOR == "") || (_totalSkillOPFOR == "") || (isNil "_totalSkillBLUFOR") || (isNil "_totalSkillOPFOR") || _attempts < 40} do {
            _totalSkillBLUFOR = missionNamespace getVariable "WFBE_BLUFOR_SCORE_JOIN";
            _totalSkillOPFOR = missionNamespace getVariable "WFBE_OPFOR_SCORE_JOIN";

            diag_log _totalSkillBLUFOR;
	        diag_log _totalSkillOPFOR;

            _attempts = _attempts + 1;
            sleep 0.5;
        };*/

        waitUntil { !(isNil {missionNamespace getVariable "WFBE_BLUFOR_SCORE_JOIN"}) && !(isNil {missionNamespace getVariable "WFBE_OPFOR_SCORE_JOIN"}) };

        _totalSkillBLUFOR = missionNamespace getVariable "WFBE_BLUFOR_SCORE_JOIN";
        _totalSkillOPFOR = missionNamespace getVariable "WFBE_OPFOR_SCORE_JOIN";

        _totalSkillBLUFOR = [_totalSkillBLUFOR, 2] call BIS_fnc_cutDecimals;
        _totalSkillOPFOR = [_totalSkillOPFOR, 2] call BIS_fnc_cutDecimals;

        _txt = Format [Localize "STR_WF_CHAT_Teamstack",str _totalSkillBLUFOR, str _totalSkillOPFOR];

        /*
        if (_attempts >= 40) then {
            diag_log "Couldn't retrieve team skill values to show them for player upon joining ingame!";
            _txt = "ERROR! Couldn't retrieve team skill values for some reason. Try joining again and contact server admin if this happens again.";
        };
        */
    };
	case "CommanderDisconnected": {_txt = Localize "strwfcommanderdisconnected"};
	case "TacticalLaunch": {_txt = Localize "STR_WF_CHAT_ICBM_Launch"};
	case "Teamkill": {_txt = Format [Localize "STR_WF_CHAT_Teamkill",(missionNamespace getVariable "WFBE_C_PLAYERS_PENALTY_TEAMKILL")]; -(missionNamespace getVariable "WFBE_C_PLAYERS_PENALTY_TEAMKILL") Call ChangePlayerFunds};
	case "FundsTransfer": {_txt = Format [Localize "STR_WF_CHAT_FundsTransfer",_this select 1,_this select 2];_commandChat = false;};
	case "StructureSold": {_txt = Format [Localize "STR_WF_CHAT_Structure_Sold",([_this select 1,'displayName'] Call GetConfigInfo)]};
	case "StructureSell": {_txt = Format [Localize "STR_WF_CHAT_Structure_Sell",([_this select 1,'displayName'] Call GetConfigInfo),_this select 2]};
	case "SecondaryAward": {_txt = Format [Localize "STR_WF_CHAT_Secondary_Award",_this select 1, _this select 2];(_this select 2) Call ChangePlayerFunds};
	case "StructureTK": {_txt = Format [Localize "STR_WF_CHAT_SatchelTK",_this select 1, _this select 2, [_this select 3, 'displayName'] Call GetConfigInfo, _this select 4]};


    case "HeadHunterReceiveBounty":
    {
        _killer_name = _this select 1; // _killer
        _bounty = _this select 2;
        _structure_kind = _this select 3;
        _structure_side = _this select 4;

        if ((name player) == _killer_name) then
        {
            _txt = format [localize "STR_WF_HeadHunterReceiveBounty", _bounty, ([_structure_kind, "displayName"] call GetConfigInfo)];
            _bounty call ChangePlayerFunds;
            _commandChat = false;
        }
        else
        {
            if ((side player) == _structure_side) then
            {
                _txt = format [localize "STR_WF_HeadHunterReceiveBountyFriendly", _killer_name, _bounty, ([_structure_kind, "displayName"] call GetConfigInfo)];
            }
            else
            {
                _txt = format [localize "STR_WF_HeadHunterReceiveBountyEnemy", _killer_name, _bounty, ([_structure_kind, "displayName"] call GetConfigInfo)];
            };
            _commandChat = true;
        };
    };
    case "HeadHunterReceiveBountyInSupplies":{
        _side_killer = _this select 1;
        _structure_kind = _this select 2;
        _supplies_bounty = _this select 3;
        _structure_side = _this select 4;

        diag_log format ["_side_killer: %1", _side_killer];
        diag_log format ["_structure_kind: %1", _structure_kind];
        diag_log format ["_supplies_bounty: %1", _supplies_bounty];
        diag_log format ["_structure_side: %1", _structure_side];

        if (_side_killer != _structure_side) then{
            if(_supplies_bounty > 0)then{
                _txt = format [localize "STR_WF_HeadHunterReceiveSuppliesEnemy", _side_killer, _supplies_bounty, ([_structure_kind, "displayName"] call GetConfigInfo)];
                _commandChat = true;
            };
        }

    };

    case "BuildingKilledByError":
    {
        _structure_kind = _this select 1;
        _structure_side = _this select 2;

        if ((side player) == _structure_side) then
        {
            _txt = format [localize "STR_WF_BuildingKilledByErrorFriendly", ([_structure_kind, "displayName"] call GetConfigInfo)];
        }
        else
        {
            _txt = format [localize "STR_WF_BuildingKilledByErrorEnemy", ([_structure_kind, "displayName"] call GetConfigInfo)];
        };
        _commandChat = true;
    };
};

if (_commandChat) then {
	_txt Call CommandChatMessage;
} else {
	_txt Call GroupChatMessage;
};