"WFBE_SE_MASH_MARKER_SENT" addPublicVariableEventHandler {

	private ["_markerPos","_sideDeployer","_deployer"];

	_markerPos = _this select 1 select 0;
	_sideDeployer = _this select 1 select 1;
	_deployer = _this select 1 select 2;
	_tentObject = _this select 1 select 3;

	if (_sideDeployer != side player) exitWith {};

	_marker = Format["%1Mash%2Marker",side player, round random 50000];
	createMarkerLocal [_marker,[0,0,0]];
	_marker setMarkerTypeLocal "n_med";
	_marker setMarkerColorLocal "ColorYellow";
	_marker setMarkerTextLocal (format ["MASH - %1", name player]);
	_marker setMarkerDirLocal 0;
	_marker setMarkerPosLocal _markerPos;
	_marker setMarkerSizeLocal [1,1];

	[_tentObject, _marker] spawn {
		_tent = _this select 0;
		_marker = _this select 1;

		waitUntil {not alive _tent};

		deleteMarker _marker;
	};
};