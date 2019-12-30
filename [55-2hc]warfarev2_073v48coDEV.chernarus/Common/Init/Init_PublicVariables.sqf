/*
	Global Public Variable Functions Initialization, this file initialize PVF files for both the client and the server
*/

scriptName "Common\Init\Init_PublicVariables.sqf";

Private ['_clientCommandPV','_l','_serverCommandPV'];

_l		= ["RequestVehicleLock"];
_l = _l + ["RequestChangeScore"];
_l = _l + ["RequestCommanderVote"];
_l = _l + ["RequestNewCommander"];
_l = _l + ["RequestStructure"];
_l = _l + ["RequestDefense"];
_l = _l + ["RequestJoin"];
_l = _l + ["RequestMHQRepair"];
_l = _l + ["RequestSpecial"];
_l = _l + ["RequestTeamUpdate"];
_l = _l + ["RequestUpgrade"];
_l = _l + ["RequestAutoWallConstructinChange"];

_serverCommandPV = _l;

_l =      ["AllCampsCaptured"];
_l = _l + ["AwardBounty"];
_l = _l + ["AwardBountyPlayer"];
_l = _l + ["AwardScore"];
_l = _l + ["CampCaptured"];
_l = _l + ["ChangeScore"];
_l = _l + ["DatabaseDebug"];
_l = _l + ["HandleSpecial"];
_l = _l + ["LocalizeMessage"];
_l = _l + ["SetTask"];
_l = _l + ["SetVehicleLock"];
_l = _l + ["TownCaptured"];
_l = _l + ["SetMHQLock"];
_l = _l + ["Available"];
_l = _l + ["RequestBaseArea"];

_clientCommandPV = _l;

{
	Call Compile Format["CLTFNC%1 = compile preprocessFileLineNumbers 'Client\PVFunctions\%1.sqf'", _x];
	if (!isServer || local player) then {Format['WFBE_PVF_%1',_x] addPublicVariableEventHandler {(_this select 1) Spawn WFBE_CL_FNC_HandlePVF}};
} forEach _clientCommandPV;

{
	Call Compile Format["SRVFNC%1 = compile preprocessFileLineNumbers 'Server\PVFunctions\%1.sqf'", _x];
	if (isServer) then {Format['WFBE_PVF_%1',_x] addPublicVariableEventHandler {(_this select 1) Spawn WFBE_SE_FNC_HandlePVF}};
} forEach _serverCommandPV;

["INITIALIZATION", Format ["Init_PublicVariables.sqf : Initialized [%1] Client PV and [%2] Server PV", count _clientCommandPV, count _serverCommandPV]] Call WFBE_CO_FNC_LogContent;