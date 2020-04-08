/* USMC Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */

/* Light Vehicles */

/* Heavy Vehicles */

/* Air Vehicles */

/* Special */
_c = _c + ['MQ9PredatorB'];
_i = _i + [['','',30000,35,2,2,3,0,'USMC',[]]];

/* Static Defenses */
_c = _c + ['I44_GunMG_A_M2HB_TripodAA_Army'];
_i = _i + [['','',300,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M2HD_mini_TriPod'];
_i = _i + [['','',200,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M2StaticMG'];
_i = _i + [['','',225,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['SearchLight'];
_i = _i + [['','',125,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['MK19_TriPod'];
_i = _i + [['','',700,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['TOW_TriPod'];
_i = _i + [['','',2000,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['Stinger_Pod'];
_i = _i + [['','',3000,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M252'];
_i = _i + [['','',1150,0,1,0,'Defense',0,'USMC',[]]];

_c = _c + ['M119'];
_i = _i + [['','',2800,0,1,0,'Defense',0,'USMC',[]]];

/* Defense Structures */
_c = _c + ['Land_CamoNet_NATO'];
_i = _i + [['','',35,0,0,0,'Strategic',0,'USMC',[]]];

_c = _c + ['Land_CamoNetVar_NATO'];
_i = _i + [['','',45,0,0,0,'Strategic',0,'USMC',[]]];

_c = _c + ['Land_CamoNetB_NATO'];
_i = _i + [['','',55,0,0,0,'Strategic',0,'USMC',[]]];

_c = _c + ['USOrdnanceBox'];
_i = _i + [['','',850,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USVehicleBox'];
_i = _i + [['','',1200,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USBasicAmmunitionBox'];
_i = _i + [['','',1950,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USBasicWeaponsBox'];
_i = _i + [['','',2975,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USLaunchersBox'];
_i = _i + [['','',6250,0,0,0,'Ammo',0,'USMC',[]]];

_c = _c + ['USSpecialWeaponsBox'];
_i = _i + [['','',7200,0,0,0,'Ammo',0,'USMC',[]]];



for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		missionNamespace getVariable (_c select _z);
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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_USMC: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_USMC: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_USMC: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];