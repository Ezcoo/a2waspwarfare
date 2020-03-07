if !(isNil 'WFBE_SK_V_SaboteurSatchel') then { //--- Remove the old one.
	if !(isNull WFBE_SK_V_SaboteurSatchel) then {deleteVehicle WFBE_SK_V_SaboteurSatchel; WFBE_SK_V_SaboteurSatchel = nil};
};

//--- Retrieve the side structures.
_side_structures = (WFBE_Client_SideJoined Call WFBE_CO_FNC_GetSideStructures) + [WFBE_Client_SideJoined Call WFBE_CO_FNC_GetSideHQ];

//--- Get the closest structure.
_closest = [player, _side_structures] Call WFBE_CO_FNC_GetClosestEntity;

//--- Check the distance between the player and the closest friendly building.
if (_closest distance player < 25) exitWith {
	//--- Show ID?
	_uid = if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_UID_SHOW") == 0) then {"xxxxxxx"} else {getPlayerUID player};
	
	//--- Notify about the TK attempt.
	[nil, "LocalizeMessage", ['StructureTK', name player, _uid, _closest, WFBE_Client_SideJoinedText]] Call WFBE_CO_FNC_SendToClients;
};

WFBE_SK_V_LastUse_SuperSatchel = time;

sleep 0.5;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 0.5;
waitUntil {animationState player == "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon" || !alive player || vehicle player != player};
if (!alive player || vehicle player != player) exitWith {};

for '_i' from 1 to 2 do {player removeMagazine "PipeBomb"};

_bomb = "PipeBomb" createVehicle position player;
_bomb setPosATL getPosATL player;

WFBE_SK_V_SaboteurSatchel = _bomb;
["RequestSpecial", ["track-playerobject", getPlayerUID player, _bomb]] Call WFBE_CO_FNC_SendToServer;