/* RU Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

/* Infantry */
_c = _c + ['RU_Soldier'];
_i = _i + [['','',150,4,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier2'];
_i = _i + [['','',120,4,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_LAT'];
_i = _i + [['','',220,5,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_AT'];
_i = _i + [['','',310,5,-1,1,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_HAT'];
_i = _i + [['','',1050,6,-1,3,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_AA'];
_i = _i + [['','',425,6,-1,1,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_AR'];
_i = _i + [['','',210,5,-1,1,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_MG'];
_i = _i + [['','',220,5,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_GL'];
_i = _i + [['','',160,5,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_Marksman'];
_i = _i + [['','',290,5,-1,1,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_Spotter'];
_i = _i + [['','',295,5,-1,2,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_Sniper'];
_i = _i + [['','',300,5,-1,2,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_SniperH'];
_i = _i + [['','',330,5,-1,3,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_Medic'];
_i = _i + [['','',190,4,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_Crew'];
_i = _i + [['','',120,4,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_Pilot'];
_i = _i + [['','',120,4,-1,0,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_TL'];
_i = _i + [['','',240,5,-1,1,0,1,'Russians',[]]];

_c = _c + ['RU_Soldier_SL'];
_i = _i + [['','',220,5,-1,2,0,1,'Russians',[]]];

/* Light Vehicles */
_c = _c + ['UAZ_RU'];
_i = _i + [['','',260,15,-2,0,1,0,'Russians',[]]];

_c = _c + ['PBX'];
_i = _i + [['','',225,15,-2,0,1,0,'Russians',[]]];

_c = _c + ['UAZ_AGS30_RU'];
_i = _i + [['','',685,18,-2,1,1,0,'Russians',[]]];

_c = _c + ['Kamaz'];
_i = _i + [['','',500,15,-2,1,1,0,'Russians',[]]];

_c = _c + ['WarfareSalvageTruck_RU'];
_i = _i + [['','',750,18,-2,1,1,0,'Russians',[]]];

_c = _c + ['KamazRepair'];
_i = _i + [['','',2500,21,-2,2,1,0,'Russians',[]]];

_c = _c + ['WarfareReammoTruck_RU'];
_i = _i + [['','',750,21,-2,1,1,0,'Russians',[]]];

_c = _c + ['KamazRefuel'];
_i = _i + [['','',500,21,-2,1,1,0,'Russians',[]]];

_c = _c + ['WarfareSupplyTruck_RU'];
_i = _i + [['','',550,21,-2,1,1,0,'Russians',[]]];

_c = _c + ['GAZ_Vodnik_MedEvac'];
_i = _i + [['','',3200,25,-2,3,1,0,'Russians',[]]];

_c = _c + ['GAZ_Vodnik'];
_i = _i + [['','',900,22,-2,2,1,0,'Russians',[]]];

_c = _c + ['GAZ_Vodnik_HMG'];
_i = _i + [['','',1450,24,[false,true,2,0],3,1,0,'Russians',[[0]]]];

_c = _c + ['BTR90'];
_i = _i + [['','',3450,25,-2,4,1,0,'Russians',[]]];

_c = _c + ['GRAD_RU'];
_i = _i + [['','',5300,25,-2,4,1,0,'Russians',[]]];

/* Heavy Vehicles */
_c = _c + ['BMP3'];
_i = _i + [['','',4600,35,-2,if (WF_A2_Vanilla) then {1} else {3},2,0,'Russians',[]]];

_c = _c + ['T72_RU'];
_i = _i + [['','',5200,40,-2,if (WF_A2_Vanilla) then {2} else {3},2,0,'Russians',[]]];

_c = _c + ['T90'];
_i = _i + [['','',6500,40,-2,if (WF_A2_Vanilla) then {3} else {4},2,0,'Russians',[]]];

_c = _c + ['2S6M_Tunguska'];
_i = _i + [['','',8800,35,-2,4,2,0,'Russians',[]]];

/* Air Vehicles */
_c = _c + ['Mi17_medevac_RU'];
_i = _i + [['','',9120,35,-2,1,3,0,'Russians',[]]];

_c = _c + ['Mi17_rockets_RU'];
_i = _i + [['','',16904,45,-2,3,3,0,'Russians',[]]];

_c = _c + ['Mi24_V'];
_i = _i + [['','',28800,50,-2,3,3,0,'Russians',[]]];

_c = _c + ['Mi24_P'];
_i = _i + [['','',35600,52,-2,3,3,0,'Russians',[]]];

_c = _c + ['Su34'];
_i = _i + [['','',50240,55,-2,5,3,0,'Russians',[]]];

_c = _c + ['Su39'];
_i = _i + [['SU-39 (KH29)','',42640,55,-2,4,3,0,'Russians',[]]];

_c = _c + ['Ka52'];
_i = _i + [['','',if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {48800} else {75000},55,-2,4,3,0,'Russians',[]]];

_c = _c + ['Ka52Black'];
_i = _i + [['','',if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {51800} else {75000},55,-2,5,3,0,'Russians',[]]];

/* Special */
_c = _c + ['Pchela1T'];
_i = _i + [['','',9000,35,-2,1,3,0,'Russians',[]]];

/* Static Defenses */
_c = _c + ['RU_WarfareBMGNest_PK'];
_i = _i + [['','',300,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['KORD'];
_i = _i + [['KORD','',200,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['KORD_high'];
_i = _i + [['KORD Minitripod','',225,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['SearchLight_RUS'];
_i = _i + [['','',125,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['AGS_RU'];
_i = _i + [['','',650,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['Metis'];
_i = _i + [['Metis-M 9K115-2','',1200,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['Igla_AA_pod_East'];
_i = _i + [['Igla AA POD launcher','',3000,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['2b14_82mm'];
_i = _i + [['Podnos 2B14','',1025,0,1,0,'Defense',0,'Russians',[]]];

_c = _c + ['D30_RU'];
_i = _i + [['','',2800,0,1,0,'Defense',0,'Russians',[]]];

/* Defense Structures */
_c = _c + ['Land_CamoNet_EAST'];
_i = _i + [['','',35,0,0,0,'Strategic',0,'Russians',[]]];

_c = _c + ['Land_CamoNetVar_EAST'];
_i = _i + [['','',45,0,0,0,'Strategic',0,'Russians',[]]];

_c = _c + ['Land_CamoNetB_EAST'];
_i = _i + [['','',55,0,0,0,'Strategic',0,'Russians',[]]];

_c = _c + ['RUOrdnanceBox'];
_i = _i + [['','',850,0,0,0,'Ammo',0,'Russians',[]]];

_c = _c + ['RUVehicleBox'];
_i = _i + [['','',1200,0,0,0,'Ammo',0,'Russians',[]]];

_c = _c + ['RUBasicAmmunitionBox'];
_i = _i + [['','',1950,0,0,0,'Ammo',0,'Russians',[]]];

_c = _c + ['RUBasicWeaponsBox'];
_i = _i + [['','',2975,0,0,0,'Ammo',0,'Russians',[]]];

_c = _c + ['RULaunchersBox'];
_i = _i + [['','',6250,0,0,0,'Ammo',0,'Russians',[]]];

_c = _c + ['RUSpecialWeaponsBox'];
_i = _i + [['','',7200,0,0,0,'Ammo',0,'Russians',[]]];



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
			diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_RU: Duplicated Element found '%1'",(_c select _z),diag_frameno,diag_tickTime];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_RU: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_RU: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];