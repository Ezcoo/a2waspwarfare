/*
	Custom Module Initialization. Marked Target (MARTA).
*/

//--- We'll work with the WF_Logic here.
_logic = WF_Logic;

_logic setvariable ["allgroups",[]];
_logic setvariable ["zones",[]];
_logic setvariable ["WPgroups_current",[]];

//--- Wait until the server PV the logic.
waitUntil {!isNil 'BIS_MARTA_mainScope'};

//--- Make sure that the BIS function module is loaded.
if (isnil "bis_fnc_init") then {
	_logicFnc = (group _logic) createunit ["FunctionsManager",position player,[],0,"none"];
};

//--- Wait until the framework initialization.
waitUntil {!isnil "BIS_fnc_init"};

//--- [MARTA Parameters]. ---\\

//--- Rules
_logic setvariable ["rules", [["o_",[1,0,0,1]],["b_",[0,0,1,1]],["n_",[0,0.7,0,1]],["n_",[0.8,0.8,0,0]]]];

//--- Pause
_logic setvariable ["pause", false];

//--- Delay
_logic setvariable ["delay", 0.5];

//--- Step
_logic setvariable ["step", 0.5];

//--- Duration of no longer known markers
_logic setvariable ["duration", 300];

//--- Minimal squad size
_logic setvariable ["minsize", 1];

//--- Offset
_logic setvariable ["offset", 50];

//--- Groups with displayed waypoints
_logic setvariable ["WPgroups", []];

//--- Codes which executes when is group detected and hidden
_logic setvariable ["codein", []];
_logic setvariable ["codeout", []];

//--- Show MARTA Markers only for the player's side (no enemies are shown).
_logic setvariable ["showOnlySideMarkers", true];

//--- Execute the custom MARTA FSM.
execFSM "Client\FSM\marta_local.fsm";