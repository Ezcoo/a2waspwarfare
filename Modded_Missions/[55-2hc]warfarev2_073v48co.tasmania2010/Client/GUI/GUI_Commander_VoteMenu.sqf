scriptName "Client\GUI\GUI_Commander_VoteMenu.sqf";

//--- Register the UI.
uiNamespace setVariable ["wfbe_display_vote", _this select 0];

_u = 1;
lnbClear 509100;
lnbAddRow[509100, ["No Commander", "0"]];
lnbSetValue[509100, [0, 0], -1];
for '_i' from 0 to count(WFBE_Client_Teams)-1 do {
	if (isPlayer leader (WFBE_Client_Teams select _i)) then {
		lnbAddRow[509100, [name leader (WFBE_Client_Teams select _i), "0"]];
		lnbSetValue[509100, [_u, 0], _i];
		_u = _u + 1;
	};
};

WFBE_MenuAction = -1;
_voteArray = [];
_index = 0;
_voted_commander = "No Commander";
while {alive player && dialog} do {

	//--- The client has selected a new com.
	if (WFBE_MenuAction == 1) then {
		WFBE_MenuAction = -1;
		_index = lnbCurSelRow 509100;
	};

	if (WFBE_MenuAction == 2) then{
		WFBE_MenuAction = -1;

		_player_name = lnbText [509100,[_index, 0]];

		{
			if (isPlayer leader _x) then {
				if(_player_name == name leader (_x)) exitWith {
					_voted_commander =  group leader (_x);
				};
				if(_player_name == "No Commander") exitWith {
					_voted_commander = objNull;
				};
			};
		} forEach WFBE_Client_Teams;

		["RequestNewCommander", [side group player, _voted_commander]] Call WFBE_CO_FNC_SendToServer;
		voted = true;
		closeDialog 0;
	};

	_list_present = [];
	for '_i' from 1 to ((lnbSize 509100) select 0)-1 do { //--- Remove potential non-player controlled slots.
		_value = lnbValue [509100,[_i, 0]];
		_team = WFBE_Client_Teams select _value;
		if !(isPlayer leader _team) then {lnbDeleteRow [509100, _i]} else {[_list_present, _value] Call WFBE_CO_FNC_ArrayPush};
	};

	for '_i' from 0 to WFBE_Client_Teams_Count do { //--- Add potential new player controlled slots.
		_team = WFBE_Client_Teams select _i;
		if(!(isNil "_team"))then{
			if (isPlayer leader _team && !(_i in _list_present)) then {
				lnbAddRow[509100, [name leader _team, "0"]];
				lnbSetValue[509100, [((lnbSize 509100) select 0)-1, 0], _i];
			};
		};
	};
	sleep 0.05;
};

//--- Release the UI.
uiNamespace setVariable ["wfbe_display_vote", nil];