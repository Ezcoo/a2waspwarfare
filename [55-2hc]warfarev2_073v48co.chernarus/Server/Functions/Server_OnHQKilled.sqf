/*
	Triggered whenever the HQ is killed.
	 Parameters:
		- HQ
		- Shooter
*/

Private ["_building","_dammages","_dammages_current","_get","_killer","_points","_side","_killer_group","_logik","_origin","_structure","_structure_kind","_hqCopy","_HQwreck"];

_structure = _this select 0;
_killer = _this select 1;

_structure_kind = typeOf _structure;
_side = _structure getVariable "wfbe_side";
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

_killer_group = group _killer;
// HQ kill price ($30,000) / 100 * building kill coef
_points = 30000 / 100 * WFBE_C_BUILDINGS_SCORE_COEF;
_hqCopy = nil;

//--- If HQ was mobibilized, spawn a dead hq.
if ((_side) Call WFBE_CO_FNC_GetSideHQDeployStatus) then {
	Private ["_hq"];
	_hq = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _side], getPos _structure, (_side) Call WFBE_CO_FNC_GetSideID, getDir _structure, false, false, false] Call WFBE_CO_FNC_CreateVehicle;
	_hq setPos (getPos _structure);
	_hq setVariable ["wfbe_trashable", false];
	_hq setVariable ["wfbe_side", _side];
	_hq setDamage 1;
	_hqCopy = hq;

	//--- HQ is now considered mobilized.
	_logik setVariable ["wfbe_hq_deployed", false, true];
	_logik setVariable ["wfbe_hq",_hq,true];

	//--- Remove the structure after the burial.
	(_structure) Spawn {sleep 10; deleteVehicle _this};
};

_HQwreck = createMarker ["WFBE_HQ_Wreck", getPos _hqCopy];
_HQwreck setMarkerShape "ICON";
_HQwreck setMarkerType "Dot";
_HQwreck setMarkerColor "ColorOrange";


if (isServer) then {
	['SRVFNCREQUESTCHANGESCORE',[leader _killer_group, (score leader _killer_group) + _points]] Spawn WFBE_SE_FNC_HandlePVF;
} else {
	["RequestChangeScore", [leader _killer_group, (score leader _killer_group) + _points]] Call WFBE_CO_FNC_SendToServer;
};

//--- Spawn a radio message.
[_side, "Destroyed", ["Base", _structure]] Spawn SideMessage;

//--- Teamkill? [_side, "SendMessage", ["command", "tkill", [name _killer, _structure_kind]]] Call WFBE_CO_FNC_SendToClients
_teamkill = if (side _killer == _side) then {true} else {false};


_killer_uid = getPlayerUID _killer;
//if (!paramShowUID) then {_killer_uid = "xxxxxxx"};

if ((!isNull _killer) && (isPlayer _killer)) then
{
    if (_teamkill) then
    {
        [_side, "LocalizeMessage", ["BuildingTeamkill", name _killer, _killer_uid, _structure_kind]] call WFBE_CO_FNC_SendToClients;
    }
    else
    {
        [nil, "LocalizeMessage", ["HeadHunterReceiveBounty", (name _killer), 30000, _structure_kind, _side]] call WFBE_CO_FNC_SendToClients;
    };
};



["INFORMATION", Format["Server_OnHQKilled.sqf : [%1] HQ [%2] has been destroyed by [%3], Teamkill? [%4], Side Teamkill? [%5]", _side, _structure_kind, name _killer, _teamkill, side _killer]] Call WFBE_CO_FNC_LogContent;

/*
_msg = format ["Server_OnHQKilled.sqf: _this = %1", _this];
player sideChat _msg;
diag_log _msg;
*/