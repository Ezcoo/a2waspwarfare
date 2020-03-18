/* BAF (MTP) Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['I44_Man_B_Army_PIAT'];
_i = _i + [['','',700,5,-1,3,0,1,'British Armed Forces',[]]];

_c = _c + ['I44_Man_B_Army_Sniper_SMLENo4Mk1T'];
_i = _i + [['','',320,6,-1,2,0,1,'British Armed Forces',[]]];

_c = _c + ['I44_Man_B_Army_Engr_GrenadeNo75'];
_i = _i + [['','',225,5,-1,0,0,1,'British Armed Forces',[]]];


/* Light Vehicles */

_c = _c + ['I44_Car_B_WillysAB_VGO_Army'];
_i = _i + [['','',2200,25,-2,0,2,0,'British Armed Forces',[]]];

_c = _c + ['I44_Car_B_WillysAB_Army'];
_i = _i + [['','',2200,25,-2,0,2,0,'British Armed Forces',[]]];

_c = _c + ['I44_Car_B_WillysAB_Medic_Army'];
_i = _i + [['','',4000,22,-2,2,1,0,'British Armed Forces',[]]];

/* Heavy Vehicles */

_c = _c + ['I44_Tank_B_ShermanIV_Army'];
_i = _i + [['','',4200,25,-2,0,2,0,'British Armed Forces',[]]];

_c = _c + ['I44_Tank_B_ShermanVC_Army'];
_i = _i + [['','',4200,25,-2,0,2,0,'British Armed Forces',[]]];

_c = _c + ['I44_Tank_B_Cromwell_Army'];
_i = _i + [['','',4200,25,-2,0,2,0,'British Armed Forces',[]]];

_c = _c + ['I44_Tank_B_Army_UC'];
_i = _i + [['','',4200,25,-2,0,2,0,'British Armed Forces',[]]];

_c = _c + ['I44_Veh_B_Army_MKIV_Churchill'];
_i = _i + [['','',4200,25,-2,0,2,0,'British Armed Forces',[]]];

/* Air Vehicles */

_c = _c + ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
_i = _i + [['','',17000,50,-2,0,3,0,'British RAF',[]]];

_c = _c + ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
_i = _i + [['','',20000,70,-2,0,3,0,'British RAF',[]]];

_c = _c + ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];
_i = _i + [['','',20000,70,-2,0,3,0,'British RAF',[]]];

for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		_get = missionNamespace getVariable (_c select _z);
		if (isNil '_get') then {
			if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call GetConfigInfo]};
			if (typeName ((_i select _z) select 4) == 'SCALAR') then {
				if (((_i select _z) select 4) == -2) then {
					_ret = (_c select _z) Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleCrewSlot.sqf";
					(_i select _z) set [4, _ret select 0];
					(_i select _z) set [9, _ret select 1];
				};
			};
			if (WF_Debug) then {(_i select _z) set [3,1]};
			_p = if ((_c select _z) isKindOf 'Man') then {'portrait'} else {'picture'};
			(_i select _z) set [1, [_c select _z,_p] Call GetConfigInfo];
			missionNamespace setVariable [_c select _z, _i select _z];
		} else {
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_BAF: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_BAF: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_BAF: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];