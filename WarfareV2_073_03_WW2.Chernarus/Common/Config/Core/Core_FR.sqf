/* FR Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['I44_Man_A_Army_AB_82_Medic'];
_i = _i + [['','',285,6,-1,3,0,0.97,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_RTO_M1A1Carbine'];
_i = _i + [['','',340,6,-1,3,0,0.98,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1903A3'];
_i = _i + [['','',380,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1903A3_M1'];
_i = _i + [['','',285,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_Sniper_M1903A4'];
_i = _i + [['','',285,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1Garand'];
_i = _i + [['','',260,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1Garand_M7'];
_i = _i + [['','',260,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1A1Carbine'];
_i = _i + [['','',305,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1918A2'];
_i = _i + [['','',310,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1919A4'];
_i = _i + [['','',340,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1919A6'];
_i = _i + [['','',365,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_ATCrew_M3'];
_i = _i + [['','',305,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_M1A1Bazooka'];
_i = _i + [['','',285,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_M1A1Thompson'];
_i = _i + [['','',340,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_M3Greasegun'];
_i = _i + [['','',340,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_NCO_M1Garand'];
_i = _i + [['','',380,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_NCO_M1A1Carbine'];
_i = _i + [['','',310,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_NCO_M1A1Thompson'];
_i = _i + [['','',340,6,-1,3,0,0.99,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_CO_M1911A1'];
_i = _i + [['','',310,6,-1,3,0,1.00,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_CO_M1A1Carbine'];
_i = _i + [['','',380,6,-1,3,0,1.00,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_Engr_M2_2'];
_i = _i + [['','',310,6,-1,3,0,0.98,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_MCrew_C'];
_i = _i + [['','',305,6,-1,3,0,0.98,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_MCrew_G'];
_i = _i + [['','',260,6,-1,3,0,0.98,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_GunCrew_NCO_M1911A1'];
_i = _i + [['','',310,6,-1,3,0,0.98,'US Army Airborne',[]]];

_c = _c + ['I44_Man_A_Army_AB_82_GunCrew_M1A1Carbine'];
_i = _i + [['','',340,6,-1,3,0,0.98,'US Army Airborne',[]]];

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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_FR: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_FR: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_FR: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];