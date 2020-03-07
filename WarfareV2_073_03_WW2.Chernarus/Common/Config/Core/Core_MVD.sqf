/* MVD Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['I44_Man_G_WL_FJ_Medic'];
_i = _i + [['','',270,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_NCO_K98k'];
_i = _i + [['','',230,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_RTO'];
_i = _i + [['','',260,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_K98k_GGrGer'];
_i = _i + [['','',240,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_K98kZf41'];
_i = _i + [['','',275,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_Sniper_K98kZf42'];
_i = _i + [['','',300,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_G43'];
_i = _i + [['','',255,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_Sniper_G43Zf4'];
_i = _i + [['','',320,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_FG42'];
_i = _i + [['','',295,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_FG42_Zf4'];
_i = _i + [['','',360,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_MP40'];
_i = _i + [['','',275,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_MP43'];
_i = _i + [['','',305,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_MG34'];
_i = _i + [['','',295,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_MG42'];
_i = _i + [['','',315,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_K98k_PzF30'];
_i = _i + [['','',265,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_K98k_PzF60'];
_i = _i + [['','',285,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_K98k_PzF100'];
_i = _i + [['','',305,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_ATCrew_G43'];
_i = _i + [['','',285,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_RPzB54'];
_i = _i + [['','',345,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_MCrew_G'];
_i = _i + [['','',200,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_MCrew_C'];
_i = _i + [['','',200,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_CO_P08'];
_i = _i + [['','',325,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_CO_MP40'];
_i = _i + [['','',355,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

_c = _c + ['I44_Man_G_WL_FJ_NCO_MP43'];
_i = _i + [['','',375,7,-1,3,0,1.0,'Fallschirmjaeger',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_MVD: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_MVD: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_RU: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];