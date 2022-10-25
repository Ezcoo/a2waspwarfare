"WFBE_CLIENT_HAS_CONNECTED_AT_LAUNCH" addPublicVariableEventHandler {
	private ["_uid"];

	_uid = _this;

	diag_log format ["(Supposed) UID: %1", _uid];

	missionNamespace setVariable [format ["WFBE_PLAYER_%1_CONNECTED_AT_LAUNCH", _uid], true];
};