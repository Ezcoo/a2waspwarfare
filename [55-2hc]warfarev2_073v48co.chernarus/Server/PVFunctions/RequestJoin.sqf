private ["_get","_name","_player","_side","_sideOrigin","_uid","_skip","_otherside","_sidepros","_othersidepros","_playersinside","_playersinotherside","_skillPlayer","_canJoin"];

_player = _this select 0;
_side = _this select 1;
_name = name _player;

_skip = 0;
_otherside = west;
_playersinside = 0;
_playersinotherside = 0;
_sidepros = 0;
_othersidepros = 0;

_uid = getPlayerUID(_player);

missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player], false];
missionNamespace setVariable [format ["WFBE_JOIN_RESULT_ARRIVED_%1", getPlayerUID player], false];

if (_side == west) then {_otherside = east;};

_playersinside = ({side _x == _side && isPlayer _x} count (playableUnits + switchableUnits));
_playersinotherside = ({side _x == _otherside && isPlayer _x} count (playableUnits + switchableUnits));
_get = missionNamespace getVariable Format["WFBE_JIP_USER%1",_uid];

if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.

	_skip = _get select 4;
	_sideOrigin = _get select 2; //--- Get the original side.

	if (_skip == 0) then {

		_skillPlayer = profileNamespace getVariable "WFBE_CL_VAR_SKILLPLAYER";
		
		if (isNil "_skillPlayer") then {
			_skillPlayer = 100;
		};
		
		["INFORMATION", format ["RequestJoin.sqf: WFBE_CL_VAR_SKILLPLAYER value is: %1", (_skillPlayer)]] Call WFBE_CO_FNC_LogContent;

	    WFBE_CL_VAR_REQUESTID = [getPlayerUID player, _sideOrigin, _skillPlayer];

        publicVariableServer "WFBE_CL_VAR_REQUESTID";

		["INFORMATION", format ["RequestJoin.sqf: Waiting until both teams' scores have been calculated..."]] Call WFBE_CO_FNC_LogContent;

		scopeName "canPlayerJoin";

		while {true} do {
			_canJoin = missionNamespace getVariable format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player];

			if (!isNil _canJoin) then {
				breakOut "canPlayerJoin";
			};
		};

		["INFORMATION", format ["RequestJoin.sqf: Both teams' scores arrived!"]] Call WFBE_CO_FNC_LogContent;

	}else{
		if (_sideOrigin != _side) then { //--- The joined side differs from the original one.

			missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player], false];

			[nil, "LocalizeMessage", ['Teamswap',_name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.

			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_LogContent;
		}else {
			missionNamespace setVariable [format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player], true];
		};
	};

} else {
	["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;
};


["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, missionNamespace getVariable format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player]]] Call WFBE_CO_FNC_LogContent;

if (WF_A2_Vanilla) then {
	[_uid, "HandleSpecial", ["join-answer", missionNamespace getVariable format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player]]] Call WFBE_CO_FNC_SendToClients;
} else {
	[_player, "HandleSpecial", ["join-answer", missionNamespace getVariable format ["WFBE_SRV_VAR_CANJOIN_%1", getPlayerUID player]]] Call WFBE_CO_FNC_SendToClients;
};