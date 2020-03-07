/* Spetsnaz Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['I44_Man_G_SS_Medic'];
_i = _i + [['','',240,6,-1,2,0,0.90,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_RTO'];
_i = _i + [['','',230,6,-1,2,0,0.91,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_K98k'];
_i = _i + [['','',200,6,-1,2,0,0.92,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_K98k_GGrGer'];
_i = _i + [['','',210,6,-1,2,0,0.93,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_K98kZf41'];
_i = _i + [['','',245,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Sniper_K98kZf42'];
_i = _i + [['','',270,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_G43'];
_i = _i + [['','',225,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Sniper_G43Zf4'];
_i = _i + [['','',290,6,-1,2,0,0.96,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_MG34'];
_i = _i + [['','',265,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_MG42'];
_i = _i + [['','',285,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_K98k_PzF30'];
_i = _i + [['','',235,6,-1,2,0,0.93,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_K98k_PzF60'];
_i = _i + [['','',255,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_K98k_PzF100'];
_i = _i + [['','',275,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_ATCrew_G43'];
_i = _i + [['','',255,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_RPzB54'];
_i = _i + [['','',315,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_MP40'];
_i = _i + [['','',245,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_MP43'];
_i = _i + [['','',275,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_NCO_K98k'];
_i = _i + [['','',250,6,-1,2,0,0.96,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_NCO_MP40'];
_i = _i + [['','',280,6,-1,2,0,0.96,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_NCO_MP43'];
_i = _i + [['','',310,6,-1,2,0,0.96,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_CO_P08'];
_i = _i + [['','',295,6,-1,2,0,0.97,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_CO_MP40'];
_i = _i + [['','',325,6,-1,2,0,0.97,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Engr_FmW35'];
_i = _i + [['','',310,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Engr_GbLadung10kg'];
_i = _i + [['','',305,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Engr_GbLadung3kg'];
_i = _i + [['','',285,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Engr_Rohrladung'];
_i = _i + [['','',285,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Engr_SprB24'];
_i = _i + [['','',285,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_Engr_TMi42'];
_i = _i + [['','',265,6,-1,2,0,0.95,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_MCrew_G'];
_i = _i + [['','',170,6,-1,2,0,0.93,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_MCrew_C'];
_i = _i + [['','',170,6,-1,2,0,0.93,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_GunCrew_K98k'];
_i = _i + [['','',205,6,-1,2,0,0.94,'Waffen-SS',[]]];

_c = _c + ['I44_Man_G_SS_GunCrew_NCO_P38'];
_i = _i + [['','',215,6,-1,2,0,0.94,'Waffen-SS',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_Spetsnaz: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_Spetsnaz: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_Spetsnaz: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];