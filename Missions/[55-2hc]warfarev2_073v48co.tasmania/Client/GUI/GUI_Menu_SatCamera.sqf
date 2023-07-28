disableSerialization;
_display = _this select 0;
MenuAction = -1;
mouseButtonUp = -1;
SatelliteHeight = 1500;

SatelliteTarget = "Logic" createVehicleLocal (getPos player);
SatelliteTarget setDir 0;

_camera = "camera" camCreate (getPos player);
_camera camSetFov 0.2;
_camera cameraEffect ["internal","back"];
_camera camPrepareTarget [
	((getPos SatelliteTarget) select 0) - 1,
	((getPos SatelliteTarget) select 1) + 1,
	(getPos SatelliteTarget) select 2
];

_camera camSetPos [
	(getPos SatelliteTarget) select 0,
	(getPos SatelliteTarget) select 1,
	((getPos SatelliteTarget) select 2) + SatelliteHeight
];

_camera camCommitPrepared 0;

_map = _display displayCtrl 32002;
// _map ctrlMapAnimAdd [0,.25, getPos _posTarget];
// ctrlMapAnimCommit _map;

while {alive player && dialog} do {
	sleep 0.1;
	//--- Map click.
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		_near = _map PosScreenToWorld[mouseX,mouseY];
		deleteVehicle SatelliteTarget;
		SatelliteTarget = "Logic" createVehicleLocal _near;
		SatelliteTarget setDir 0;
		_camera camPrepareTarget
		[
			((getPos SatelliteTarget) select 0) - 1,
			((getPos SatelliteTarget) select 1) + 1,
			(getPos SatelliteTarget) select 2
		];
		_camera camSetPos
		[
			(getPos SatelliteTarget) select 0,
			(getPos SatelliteTarget) select 1,
			((getPos SatelliteTarget) select 2) + SatelliteHeight
		];
		_camera camCommitPrepared 0;
	};	
};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
deleteVehicle SatelliteTarget;
closeDialog 0;