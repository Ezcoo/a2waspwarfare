"REQUEST_SUPPLY_VALUE" addPublicVariableEventHandler {
	private ["_player"];

	_player = _this select 1;

	SUPPLY_VALUE_REQUESTED = (side _player) call WFBE_CO_FNC_GetSideSupply;

	(owner _player) publicVariableClient "SUPPLY_VALUE_REQUESTED";
};