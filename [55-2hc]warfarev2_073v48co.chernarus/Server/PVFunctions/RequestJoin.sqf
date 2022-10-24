private ["_canJoin","_name","_player","_side","_uid","_totalSkillBLUFOR","_totalSkillOPFOR"];

_player = _this select 0;
_side = _this select 1;
_name = name _player;

_uid = getPlayerUID(_player);
_canJoin = true;

_teamJoinedConfirmed = missionNamespace getVariable Format["WFBE_JIP_USER%1_TEAM_JOINED", _uid];

if ( !(isNil "_teamJoinedConfirmed") ) then { //--- Retrieve JIP Information if there's any.

	if (_teamJoinedConfirmed != _side) then {

		_canJoin = false;
		[nil, "LocalizeMessage", ['Teamswap',_name,_uid,_teamJoinedConfirmed,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.
		["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_teamJoinedConfirmed,_side]] Call WFBE_CO_FNC_LogContent;

	} else {

		_canJoin = true;

	};

} else {

	["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;

	_canJoin = [_side, _name, _uid] call WFBE_SE_FNC_CompareTeamScores;

};


["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, _canJoin]] Call WFBE_CO_FNC_LogContent;

if (WF_A2_Vanilla) then {

	[_uid, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClients;

} else {

	[_player, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClient;

};

if (_canJoin) then {

	missionNamespace setVariable [Format["WFBE_JIP_USER%1_TEAM_JOINED", _uid], _side];

};