"REQUEST_SUPPLY_VALUE" addPublicVariableEventHandler {
	private ["_player"];

	_player = _this;

	diag_log "Player:";
	diag_log _player;

	diag_log "Side _player:";
	diag_log (side _player);

	SUPPLY_VALUE_REQUESTED = (side _player) call WFBE_CO_FNC_GetSideSupply;

	_player publicVariableClient "SUPPLY_VALUE_REQUESTED";
};