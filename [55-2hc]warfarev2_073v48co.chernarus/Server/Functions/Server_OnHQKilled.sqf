private ["_structure", "_killer", "_structure_kind", "_side", "_killer", "_logic", "_killer_group", "_points", "_hq", "_hq"];

_structure = _this select 0;
_killer = _this select 1;

_structure_kind = typeOf _structure;
_side = _structure getVariable "wfbe_side";
_logic = (_side) call WFBE_CO_FNC_GetSideLogic;

_killer_group = group _killer;
_points = 30000 / 100 * WFBE_C_BUILDINGS_SCORE_COEF;

[nil, nil, rSPAWN, [_structure], {
	_structure = _this select 0;
	
	systemChat "Create HQ Wreck Marker";

	if (sideJoined != (_structure getVariable "wfbe_side")) exitWith {};

	hqWreckMarker = createMarkerLocal ["hqWreckMkr", getPos _structure];
	hqWreckMarker setMarkerShapeLocal "ICON";
	hqWreckMarker setMarkerTypeLocal "Warning";
	hqWreckMarker setMarkerSizeLocal [0.5, 0.5];
	hqWreckMarker setMarkerColorLocal "ColorRed";
	hqWreckMarker setMarkerTextLocal "HQ Wreck";
}] call RE;

if (_side call WFBE_CO_FNC_GetSideHQDeployStatus) then {
	_hq = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _side], getPos _structure, (_side) Call WFBE_CO_FNC_GetSideID, getDir _structure, false, false, false] Call WFBE_CO_FNC_CreateVehicle;
	_hq setPos (getPos _structure);
	_hq setVariable ["wfbe_trashable", false];
	_hq setVariable ["wfbe_side", _side];
	_hq setDamage 1;

	_logic setVariable ["wfbe_hq_deployed", false, true];
	_logic setVariable ["wfbe_hq",_hq,true];

	(_structure) Spawn {sleep 10; deleteVehicle _this};
};

if (isServer) then {
	['SRVFNCREQUESTCHANGESCORE', [leader _killer_group, (score leader _killer_group) + _points]] spawn WFBE_SE_FNC_HandlePVF;
} else {
	["RequestChangeScore", [leader _killer_group, (score leader _killer_group) + _points]] call WFBE_CO_FNC_SendToServer;
};

[_side, "Destroyed", ["Base", _structure]] spawn SideMessage;

_teamkill = if (side _killer == _side) then {true} else {false};
_killer_uid = getPlayerUID _killer;

if (!isNull _killer && isPlayer _killer) then {
    if (_teamkill) then {
        [_side, "LocalizeMessage", ["BuildingTeamkill", name _killer, _killer_uid, _structure_kind]] call WFBE_CO_FNC_SendToClients;
    } else {
        [nil, "LocalizeMessage", ["HeadHunterReceiveBounty", (name _killer), 30000, _structure_kind, _side]] call WFBE_CO_FNC_SendToClients;
    };
};

["INFORMATION", format ["Server_OnHQKilled.sqf : [%1] HQ [%2] has been destroyed by [%3], Teamkill? [%4], Side Teamkill? [%5]", _side, _structure_kind, name _killer, _teamkill, side _killer]] Call WFBE_CO_FNC_LogContent;