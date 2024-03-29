Private ['_current','_find','_killer','_logik','_structure','_structures','_side','_tked','_type','_killer_uid','_side_killer','_bounty','_score'];
_structure = _this select 0;
_killer = _this select 1;
_type = _this select 2;

_killer_group = group _killer;

_side = _structure getVariable "wfbe_side";
if(_side != resistance)then{
  _logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
};
//--- Teamkill?
_teamkill = if (side _killer == _side) then {true} else {false};
_side_killer = side _killer;
_killer_uid = getPlayerUID _killer;
if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_UID_SHOW") == 0) then {_killer_uid = "xxxxxxx"};

if (!(isNull _killer) && (isPlayer _killer)) then {
    if (_teamkill) then {
        [_side, "LocalizeMessage", ["BuildingTeamkill", name _killer, _killer_uid, _type]] call WFBE_CO_FNC_SendToClients;
    } else {
        _supplies = 0;
		_bounty = switch (true) do {
        case ( _structure isKindOf "Base_WarfareBBarracks"):{3000};
        case ( _structure isKindOf "Base_WarfareBLightFactory"):{4500};
        case ( _structure isKindOf "Base_WarfareBHeavyFactory"):{7000};
        case ( _structure isKindOf "Base_WarfareBAircraftFactory"):{8000};
        case ( _structure isKindOf "Base_WarfareBUAVterminal"):{5000};
	    case ( _structure isKindOf "Base_WarfareBVehicleServicePoint"):{3000};
	    case ( _structure isKindOf "BASE_WarfareBAntiAirRadar"):{8000};
        default {3000};
        };

        _score = switch (true) do {
        case ( _structure isKindOf "Base_WarfareBBarracks"):{3000 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        case ( _structure isKindOf "Base_WarfareBLightFactory"):{4500 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        case ( _structure isKindOf "Base_WarfareBHeavyFactory"):{7000 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        case ( _structure isKindOf "Base_WarfareBAircraftFactory"):{8000 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        case ( _structure isKindOf "Base_WarfareBUAVterminal"):{5000 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        case ( _structure isKindOf "Base_WarfareBVehicleServicePoint"):{3000 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        case ( _structure isKindOf "BASE_WarfareBAntiAirRadar"):{8000 * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100};
        default {145};
	    };

        if (typeof _structure == "Gue_WarfareBBarracks") then {
            _bounty = 3000;
            _supplies = 500;
            _score = _bounty * (missionNamespace getVariable "WFBE_C_BUILDINGS_SCORE_COEF") / 100;
            [_side_killer, "LocalizeMessage", ["HeadHunterReceiveBountyInSupplies", _side_killer, _type, _supplies, _side]] call WFBE_CO_FNC_SendToClients;
            [_side_killer, "LocalizeMessage", ["HeadHunterReceiveBounty", (name _killer), _bounty, _type, _side]] call WFBE_CO_FNC_SendToClients;
            [_side_killer, _supplies,format["Guerilla Barracks destroyed by %1.", (name _killer)]] Call ChangeSideSupply;
            ['SRVFNCREQUESTCHANGESCORE',[leader _killer_group, (score leader _killer_group) + _score]] Spawn WFBE_SE_FNC_HandlePVF;
        } else {
            [_side_killer, "LocalizeMessage", ["HeadHunterReceiveBounty", (name _killer), _bounty, _type, _side]] call WFBE_CO_FNC_SendToClients;
            ['SRVFNCREQUESTCHANGESCORE',[leader _killer_group, (score leader _killer_group) + _score]] Spawn WFBE_SE_FNC_HandlePVF;

        };
	};

};

if (_teamkill) then
{
    ["INFORMATION", Format ["Server_BuildingKilled.sqf: [%1] [%2] has teamkilled a friendly structure.", name _killer, _killer_uid]] Call WFBE_CO_FNC_LogContent;
}
else
{
    ["INFORMATION", Format ["Server_BuildingKilled.sqf: [%1] Structure [%2] has been destroyed by [%3].", str _side, _type, _killer]] Call WFBE_CO_FNC_LogContent;
};

//--- Decrement building limit.
if(_side != resistance)then{
    _find = (missionNamespace getVariable Format ['WFBE_%1STRUCTURENAMES',_side]) find _type;
    if (_find != -1) then {
    	_current = _logik getVariable "wfbe_structures_live";
    	_current set [_find - 1, (_current select (_find-1)) - 1];
    	_logik setVariable ["wfbe_structures_live", _current, true];
    };

    _logik setVariable ["wfbe_structures", (_logik getVariable "wfbe_structures") - [_structure, objNull], true];

    [_side, "Destroyed", ["Base", _structure]] Spawn SideMessage;
};
sleep 10;

deleteVehicle _structure;
