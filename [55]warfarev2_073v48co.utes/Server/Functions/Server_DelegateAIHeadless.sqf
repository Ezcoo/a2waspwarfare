/*
	Delegate town AI creation to an headless client.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_clients", "_groups", "_positions", "_side", "_teams"];

_side = _this select 0;
_unitType = +(_this select 1);
_position = +(_this select 2);
_team = +(_this select 3);

//--- Delegate The groups to the miscelleanous headless clients.

	_clients = missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID";

	if (count _clients > 0) then {
	[leader(_clients select floor(random count _clients)), "HandleSpecial", ['delegate-ai', _side, [_unitType], [_position], [_team]]] Call WFBE_CO_FNC_SendToClient;
};