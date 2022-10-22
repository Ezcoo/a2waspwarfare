Private ["_logic", "_side", "_commander"];

_side = _this;
_commander = _this select 1;
_logic = (_side) Call WFBE_CO_FNC_GetSideLogic;


//--- Notify the clients.
[_side, "HandleSpecial", ["new-commander-assigned", _commander]] Call WFBE_CO_FNC_SendToClients;

//--- Process the AI Commander FSM if it's not running.
if !(isNull _commander) then {
	if (_logic getVariable "wfbe_aicom_running") then {_logic setVariable ["wfbe_aicom_running", false]};
};