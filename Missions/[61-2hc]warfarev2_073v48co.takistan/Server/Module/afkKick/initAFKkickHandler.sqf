/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_name"];

"AFKthresholdExceededName" addPublicVariableEventHandler {
    _name = _this select 1;

    ["INFORMATION", format ["initAFKkickHandler.sqf: Player %1 has been kicked from game for being AFK.",_name]] Call WFBE_CO_FNC_LogContent;
};