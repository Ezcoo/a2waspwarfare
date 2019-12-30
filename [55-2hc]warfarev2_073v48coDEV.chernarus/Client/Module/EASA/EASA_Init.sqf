Private ["_ammo","_easaDefault","_easaLoadout","_easaVehi","_is_AAMissile","_loadout","_loadout_line","_vehicle"];

EASA_Equip = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_Equip.sqf';
EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_RemoveLoadout.sqf';

_easaDefault = [];
_easaLoadout = [];
_easaVehi = [];

/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */
_easaVehi = 	_easaVehi + ['Su25_TK_EP1'];
_easaDefault = 	_easaDefault + [[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [1200,'R-73 (6)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [1400,'R-73 (4) | FAB-250 (2)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_FAB_250']]],
  [1600,'R-73 (2) | FAB-250 (4)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250']]],
  [1900,'FAB-250 (6)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250']]]
 ]
} else {
 [
  [1900,'Ch-29 (6)',[['Ch29Launcher_Su34','S8Launcher'],['6Rnd_Ch29']]],
  [1900,'FAB-250 (18)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [1800,'FAB-250 (12) | R-73 (2)',[['AirBombLauncher','R73Launcher_2','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],
  [1800,'Ch-29 (4) | R-73 (2)',[['Ch29Launcher_Su34','R73Launcher_2','S8Launcher'],['4Rnd_Ch29','2Rnd_R73']]],
  [1800,'Ch-29 (4) | FAB-250 (6)',[['Ch29Launcher_Su34','AirBombLauncher','S8Launcher'],['4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [3400,'Ch-29 (4) | S-8 (+40)',[['Ch29Launcher_Su34','S8Launcher'],['4Rnd_Ch29','40Rnd_S8T']]],
  [3400,'FAB-250 (12) | S-8 (+40)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
  [3400,'FAB-250 (6) | R-73 (2) | S-8 (+40)',[['AirBombLauncher','R73Launcher_2','S8Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','40Rnd_S8T']]],  
  [6200,'R-73 (2) | S-8 (+80)',[['R73Launcher_2','S8Launcher'],['2Rnd_R73','80Rnd_S8T']]],
  [6200,'FAB-250 (6) | S-8 (+80)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','80Rnd_S8T']]],
  [12900,'S-8 (+120)',[['S8Launcher'],['40Rnd_S8T','80Rnd_S8T']]]
 ]
}
];

_easaVehi = 	_easaVehi + ['Su25_Ins'];
_easaDefault = 	_easaDefault + [[['Ch29Launcher','R73Launcher_2'],['4Rnd_Ch29','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
  [1900,'Ch-29 (6)',[['Ch29Launcher_Su34','S8Launcher'],['6Rnd_Ch29']]],
  [1900,'FAB-250 (18)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [1800,'FAB-250 (12) | R-73 (2)',[['AirBombLauncher','R73Launcher_2','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],
  [1800,'Ch-29 (4) | R-73 (2)',[['Ch29Launcher_Su34','R73Launcher_2','S8Launcher'],['4Rnd_Ch29','2Rnd_R73']]],
  [1800,'Ch-29 (4) | FAB-250 (6)',[['Ch29Launcher_Su34','AirBombLauncher','S8Launcher'],['4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [3400,'Ch-29 (4) | S-8 (+40)',[['Ch29Launcher_Su34','S8Launcher'],['4Rnd_Ch29','40Rnd_S8T']]],
  [3400,'FAB-250 (12) | S-8 (+40)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
  [3400,'FAB-250 (6) | R-73 (2) | S-8 (+40)',[['AirBombLauncher','R73Launcher_2','S8Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','40Rnd_S8T']]],  
  [6200,'R-73 (2) | S-8 (+80)',[['R73Launcher_2','S8Launcher'],['2Rnd_R73','80Rnd_S8T']]],
  [6200,'FAB-250 (6) | S-8 (+80)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','80Rnd_S8T']]],
  [12900,'S-8 (+120)',[['S8Launcher'],['40Rnd_S8T','80Rnd_S8T']]]
 ]
];

_easaVehi = 	_easaVehi + ['Su39'];
_easaDefault = 	_easaDefault + [[['Ch29Launcher','R73Launcher_2'],['4Rnd_Ch29','2Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [
 [1900,'Ch-29 (6)',[['Ch29Launcher_Su34','S8Launcher'],['6Rnd_Ch29']]],
  [1900,'FAB-250 (18)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [1800,'FAB-250 (12) | R-73 (2)',[['AirBombLauncher','R73Launcher_2','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],
  [1800,'Ch-29 (4) | R-73 (2)',[['Ch29Launcher_Su34','R73Launcher_2','S8Launcher'],['4Rnd_Ch29','2Rnd_R73']]],
  [1800,'Ch-29 (4) | FAB-250 (6)',[['Ch29Launcher_Su34','AirBombLauncher','S8Launcher'],['4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [3400,'Ch-29 (4) | S-8 (+40)',[['Ch29Launcher_Su34','S8Launcher'],['4Rnd_Ch29','40Rnd_S8T']]],
  [3400,'FAB-250 (12) | S-8 (+40)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
  [3400,'FAB-250 (6) | R-73 (2) | S-8 (+40)',[['AirBombLauncher','R73Launcher_2','S8Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','40Rnd_S8T']]],  
  [6200,'R-73 (2) | S-8 (+80)',[['R73Launcher_2','S8Launcher'],['2Rnd_R73','80Rnd_S8T']]],
  [6200,'FAB-250 (6) | S-8 (+80)',[['AirBombLauncher','S8Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','80Rnd_S8T']]],
  [12900,'S-8 (+120)',[['S8Launcher'],['40Rnd_S8T','80Rnd_S8T']]]
 ]
];

_easaVehi = 	_easaVehi + ['Su34'];
_easaDefault = 	_easaDefault + [[['Ch29Launcher_Su34','R73Launcher'],['6Rnd_Ch29','4Rnd_R73']]];
_easaLoadout = 	_easaLoadout + [
 [  
  [2200,'R-73 (10)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [2900,'Ch-29 (4) | R-73 (6)',[['Ch29Launcher_Su34','R73Launcher_2','80mmLauncher'],['4Rnd_Ch29','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],  
  [2900,'Ch-29 (4) | R-73 (4) | FAB-250 (6)',[['Ch29Launcher_Su34','AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','2Rnd_R73']]],
  [2900,'Ch-29 (4) | R-73 (2) | FAB-250 (12)',[['Ch29Launcher_Su34','AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_Ch29','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],  
  [2900,'Ch-29 (4) | FAB-250 (18)',[['Ch29Launcher_Su34','AirBombLauncher','80mmLauncher'],['4Rnd_Ch29','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [2900,'Ch-29 (6) | R-73 (4)',[['Ch29Launcher_Su34','R73Launcher_2','80mmLauncher'],['6Rnd_Ch29','2Rnd_R73','2Rnd_R73']]],  
  [2900,'Ch-29 (6) | R-73 (2) | FAB-250 (6)',[['Ch29Launcher_Su34','AirBombLauncher','R73Launcher_2','80mmLauncher'],['6Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73']]],
  [2900,'Ch-29 (6) | FAB-250 (12)',[['Ch29Launcher_Su34','AirBombLauncher','80mmLauncher'],['6Rnd_Ch29','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],  
  [2900,'Ch-29 (8) | R-73 (2)',[['Ch29Launcher_Su34','R73Launcher_2','80mmLauncher'],['4Rnd_Ch29','4Rnd_Ch29','2Rnd_R73']]],  
  [2900,'Ch-29 (8) | FAB-250 (6)',[['Ch29Launcher_Su34','AirBombLauncher','80mmLauncher'],['4Rnd_Ch29','4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250']]],    
  [3500,'Ch-29 (10)',[['Ch29Launcher_Su34','80mmLauncher'],['6Rnd_Ch29','4Rnd_Ch29']]],  
  [2900,'FAB-250 (6) | R-73 (8)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [2900,'FAB-250 (12) | R-73 (6)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
  [2900,'FAB-250 (18) | R-73 (4)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','2Rnd_R73']]],
  [2900,'FAB-250 (24) | R-73 (2)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],
  [3500,'FAB-250 (30)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
  [5800,'R-73 (8) | S-8 (+40)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T']]],
  [6100,'Ch-29 (4) | R-73 (4) | S-8 (+40)',[['Ch29Launcher_Su34','R73Launcher_2','80mmLauncher'],['4Rnd_Ch29','2Rnd_R73','2Rnd_R73','40Rnd_S8T']]],
  [6100,'Ch-29 (4) | R-73 (2) | FAB-250 (6) | S-8 (+40)',[['Ch29Launcher_Su34','AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','40Rnd_S8T']]],
  [6100,'Ch-29 (4) | FAB-250 (12) | S-8 (+40)',[['Ch29Launcher_Su34','AirBombLauncher','80mmLauncher'],['4Rnd_Ch29','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
  [6500,'Ch-29 (6) | R-73 (2) | S-8 (+40)',[['Ch29Launcher_Su34','R73Launcher_2','80mmLauncher'],['6Rnd_Ch29','2Rnd_R73','40Rnd_S8T']]],
  [6500,'Ch-29 (6) | FAB-250 (6) | S-8 (+40)',[['Ch29Launcher_Su34','AirBombLauncher','80mmLauncher'],['6Rnd_Ch29','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
  [6900,'Ch-29 (8) | S-8 (+40)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','4Rnd_Ch29','40Rnd_S8T']]],
  [5700,'FAB-250 (6) | R-73 (6) | S-8 (+40)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','2Rnd_R73','40Rnd_S8T']]],
  [6100,'FAB-250 (12) | R-73 (4) | S-8 (+40)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73','2Rnd_R73','40Rnd_S8T']]],
  [6500,'FAB-250 (18) | R-73 (2) | S-8 (+40)',[['AirBombLauncher','R73Launcher_2','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','40Rnd_S8T']]],
  [6900,'FAB-250 (24) | S-8 (+40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]]
 ]
];

_easaVehi = 	_easaVehi + ['L39_TK_EP1'];
_easaDefault = 	_easaDefault + [[['57mmLauncher','64Rnd_57mm']]];
_easaLoadout = 	_easaLoadout + [
 [
  [1000,'S-5 (64)',[['57mmLauncher'],['64Rnd_57mm']]],
  [1000,'S-8 (40)',[['80mmLauncher'],['40Rnd_S8T']]],
  [2800,'R-73 (2)',[['R73Launcher_2'],['2Rnd_R73']]]
 ]
];

_easaVehi = 	_easaVehi + ['Mi24_P'];
_easaDefault = 	_easaDefault + [[['HeliBombLauncher'],['2Rnd_FAB_250']]];
_easaLoadout = 	_easaLoadout + [
 [
  [2500,'FAB-250 (6)',[['HeliBombLauncher'],['2Rnd_FAB_250','2Rnd_FAB_250','2Rnd_FAB_250']]],
  [2800,'R-73 (2)',[['R73Launcher_2'],['2Rnd_R73']]]
 ]
];

_easaVehi = 	_easaVehi + ['Mi24_V'];
_easaDefault = 	_easaDefault + [[['AT9Launcher'],['4Rnd_AT9_Mi24P']]];
_easaLoadout = 	_easaLoadout + [
 [
  [2800,'Ataka-V (8)',[['AT9Launcher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
  [3400,'Ataka-V (4) | Igla-V (2)',[['AT9Launcher','Igla_twice'],['4Rnd_AT9_Mi24P','2Rnd_Igla']]]
 ]
];

if ((missionNamespace getVariable "WFBE_C_UNITS_BALANCING") > 0) then {
	_easaVehi = 	_easaVehi + ['Ka52'];
	_easaDefault = 	_easaDefault + [[['VikhrLauncher'],['12Rnd_Vikhr_KA50']]];
	_easaLoadout = 	_easaLoadout + [
	[
	  [8500,'AT (12) | R-73 (2)',[['VikhrLauncher','R73Launcher_2'],['12Rnd_Vikhr_KA50','2Rnd_R73']]]	 
	 ]
	];

	_easaVehi = 	_easaVehi + ['Ka52Black'];
	_easaDefault = 	_easaDefault + [[['VikhrLauncher','R73Launcher_2'],['12Rnd_Vikhr_KA50','2Rnd_R73']]];
	_easaLoadout = 	_easaLoadout + [
	 [
	  [9800,'AT (12) | R-73 (4)',[['VikhrLauncher','R73Launcher_2'],['12Rnd_Vikhr_KA50','2Rnd_R73','2Rnd_R73']]]	  
	 ]
	];
};

_easaVehi = 	_easaVehi + ['F35B'];
_easaDefault = 	_easaDefault + [[['BombLauncherF35','SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10']]];
_easaLoadout = 	_easaLoadout + [
 [
  [1950,'GBU-12 (6)',[['BombLauncherF35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
  [1950,'GBU-12 (4) | AIM-9L (2)',[['BombLauncherF35','SidewinderLaucher_F35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_F35']]],
  [1950,'GBU-12 (4) | AGM-65 (2)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10']]],
  [1500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10']]],
  [1750,'GBU-12 (2) | AGM-65 (4)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [1750,'GBU-12 (2) | AIM-9L (4)',[['BombLauncherF35','SidewinderLaucher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B']]],
  [1750,'AGM-65 (2) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher'],['2Rnd_Maverick_A10','4Rnd_Sidewinder_AV8B']]],
  [1750,'AGM-65 (4) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_F35'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_F35']]],
  [2250,'AGM-65 (6)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [1200,'AIM-9L (6)',[['SidewinderLaucher_F35'],['2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35']]]
  
 ]
];

_easaVehi = 	_easaVehi + ['AV8B'];
_easaDefault = 	_easaDefault + [[['BombLauncher'],['6Rnd_GBU12_AV8B']]];
_easaLoadout = 	_easaLoadout + [
 [
  [3500,'GBU-12 (6)',[['BombLauncher'],['6Rnd_GBU12_AV8B']]],
  [6500,'GBU-12 (4) | Hydra(+38)',[['BombLauncherA10','FFARLauncher'],['4Rnd_GBU12','38Rnd_FFAR']]],
  [6400,'Gau-12 (300) | GBU-12 (6)',[['GAU12','BombLauncher'],['300Rnd_25mm_GAU12','6Rnd_GBU12_AV8B']]],
  [6400,'Gau-12 (300) | GBU-12 (4) | Hydra(+38)',[['GAU12','BombLauncherA10','FFARLauncher'],['300Rnd_25mm_GAU12','4Rnd_GBU12','38Rnd_FFAR']]]
 ]
];

_easaVehi = 	_easaVehi + ['AV8B2'];
_easaDefault = 	_easaDefault + [[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4100,'GBU-12 (6) | AGM-65 (2)',[['BombLauncher','MaverickLauncher'],['6Rnd_GBU12_AV8B','2Rnd_Maverick_A10']]],
  [3800,'GBU-12 (6) | AIM-9L (2)',[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_GBU12_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherA10','SidewinderLaucher'],['4Rnd_GBU12','4Rnd_Sidewinder_AV8B']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [3200,'GBU-12 (2) | AIM-9L (4) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher','MaverickLauncher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Maverick_A10']]],
  [3500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3100,'GBU-12 (2) | AIM-9L (6)',[['BombLauncherF35','SidewinderLaucher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_F35']]],
  [3600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [4600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3700,'AGM-65 (4) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','4Rnd_Sidewinder_AV8B']]],
  [3900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [3200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [3100,'AIM-9L (8)',[['SidewinderLaucher'],['4Rnd_Sidewinder_AV8B','4Rnd_Sidewinder_AV8B']]],
  [3300,'AIM-9L (6) | AGM-65 (2)',[['SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10']]], 
  [4200,'MK-82 (24)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
  [4100,'MK-82 (18) | AGM-65 (2)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [3800,'MK-82 (18) | AIM-9L (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [4300,'MK-82 (12) | AGM-65 (4)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'MK-82 (12) | AIM-9L (4)',[['Mk82BombLauncher_6','SidewinderLaucher'],['6Rnd_Mk82','6Rnd_Mk82','4Rnd_Sidewinder_AV8B']]],
  [3600,'MK-82 (12) | AIM-9L (2) | AGM-65 (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [3200,'MK-82 (6) | AIM-9L (4) | AGM-65 (2)',[['Mk82BombLauncher_6','SidewinderLaucher','MaverickLauncher'],['6Rnd_Mk82','4Rnd_Sidewinder_AV8B','2Rnd_Maverick_A10']]],
  [3500,'MK-82 (6) | AIM-9L (2) | AGM-65 (4)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3100,'MK-82 (6) | AIM-9L (6)',[['Mk82BombLauncher_6','SidewinderLaucher'],['6Rnd_Mk82','4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_F35']]],
  [3600,'MK-82 (6) | AGM-65 (6)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]], 
  [7100,'GBU-12 (6) | Hydra(+38)',[['BombLauncher','FFARLauncher'],['6Rnd_GBU12_AV8B','38Rnd_FFAR']]], 
  [7300,'GBU-12 (4) | AGM-65 (2) | Hydra(+38)',[['BombLauncherA10','MaverickLauncher','FFARLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','38Rnd_FFAR']]],
  [6400,'GBU-12 (4) | AIM-9L (2) | Hydra(+38)',[['BombLauncherA10','SidewinderLaucher_AH1Z','FFARLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [6600,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['BombLauncherF35','MaverickLauncher','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]], 
  [6100,'GBU-12 (2) | AIM-9L (4) | Hydra(+38)',[['BombLauncherF35','SidewinderLaucher','FFARLauncher'],['2Rnd_GBU12','4Rnd_Sidewinder_AV8B','38Rnd_FFAR']]],
  [6600,'GBU-12 (2) | AGM-65 (4) | Hydra(+38)',[['BombLauncherF35','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],  
  [7100,'MK-82 (18) | Hydra(+38)',[['Mk82BombLauncher_6','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','38Rnd_FFAR']]], 
  [7300,'MK-82 (12) | AGM-65 (2) | Hydra(+38)',[['Mk82BombLauncher_6','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10','38Rnd_FFAR']]],
  [6400,'MK-82 (12) | AIM-9L (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [6600,'MK-82 (6) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6100,'MK-82 (6) | AIM-9L (4) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher','FFARLauncher'],['6Rnd_Mk82','4Rnd_Sidewinder_AV8B','38Rnd_FFAR']]],
  [6600,'MK-82 (6) | AGM-65 (4) | Hydra(+38)',[['Mk82BombLauncher_6','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],  
  [7600,'AGM-65 (6) | Hydra(+38)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6900,'AGM-65 (4) | AIM-9L (2) | Hydra(+38)',[['MaverickLauncher','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [6100,'AIM-9L (6) | Hydra(+38)',[['SidewinderLaucher','FFARLauncher'],['4Rnd_Sidewinder_AV8B','2Rnd_Sidewinder_F35','38Rnd_FFAR']]],
  [6300,'AIM-9L (4) | AGM-65 (2) | Hydra(+38)',[['SidewinderLaucher_F35','SidewinderLaucher_F35','MaverickLauncher','FFARLauncher'],['2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10','38Rnd_FFAR']]]
  
 ]
];

_easaVehi = 	_easaVehi + ['A10'];
_easaDefault = 	_easaDefault + [[['BombLauncherA10','MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','4Rnd_GBU12','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4100,'GBU-12 (6) | AGM-65 (2)',[['BombLauncher','MaverickLauncher'],['6Rnd_GBU12_AV8B','2Rnd_Maverick_A10']]],
  [3800,'GBU-12 (6) | AIM-9L (2)',[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_GBU12_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],  
  [3500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],  
  [3600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [4600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [3200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [7100,'GBU-12 (6) | Hydra(+38)',[['BombLauncher','FFARLauncher'],['6Rnd_GBU12_AV8B','38Rnd_FFAR']]], 
  [6400,'GBU-12 (4) | AIM-9L (2) | Hydra(+38)',[['BombLauncherA10','SidewinderLaucher_AH1Z','FFARLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [7300,'GBU-12 (4) | AGM-65 (2) | Hydra(+38)',[['BombLauncherA10','MaverickLauncher','FFARLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','38Rnd_FFAR']]],
  [6600,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['BombLauncherF35','2Rnd_GBU12'],['SidewinderLaucher_AH1Z','2Rnd_Sidewinder_AH1Z'],['MaverickLauncher','2Rnd_Maverick_A10'],['FFARLauncher','38Rnd_FFAR']]], 
  [6600,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['BombLauncherF35','MaverickLauncher','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]], 
  [7600,'AGM-65 (6) | Hydra(+38)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6900,'AGM-65 (4) | AIM-9L (2) | Hydra(+38)',[['MaverickLauncher','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [4200,'MK-82 (24)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
  [4100,'MK-82 (18) | AGM-65 (2)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [3800,'MK-82 (18) | AIM-9L (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [4100,'MK-82 (18) | GBU-12 (2)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_GBU12']]],
  [4300,'MK-82 (12) | AGM-65 (4)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [4300,'MK-82 (12) | GBU-12 (4)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_GBU12','2Rnd_GBU12']]],
  [6400,'MK-82 (12) | AIM-9L (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [3500,'MK-82 (6) | AIM-9L (2) | AGM-65 (4)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3600,'MK-82 (6) | AGM-65 (6)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]], 
  [7100,'MK-82 (18) | Hydra(+38)',[['Mk82BombLauncher_6','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','38Rnd_FFAR']]], 
  [6400,'MK-82 (12) | AIM-9L (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [7300,'MK-82 (12) | AGM-65 (2) | Hydra(+38)',[['Mk82BombLauncher_6','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10','38Rnd_FFAR']]],
  [6600,'MK-82 (6) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6600,'MK-82 (6) | AGM-65 (4) | Hydra(+38)',[['Mk82BombLauncher_6','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]]  
 ]
];

_easaVehi = 	_easaVehi + ['A10_US_EP1'];
_easaDefault = 	_easaDefault + [[['BombLauncherA10','MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','4Rnd_GBU12','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3400,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherA10','SidewinderLaucher_AH1Z'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
  [4600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3700,'AGM-65 (4) | AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [3900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [3200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [3100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [3300,'AIM-9L (6) | AGM-65 (2)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]]
 ]
} else {
 [
  [4200,'GBU-12 (8)',[['BombLauncherA10'],['4Rnd_GBU12','4Rnd_GBU12']]],
  [4100,'GBU-12 (6) | AGM-65 (2)',[['BombLauncher','MaverickLauncher'],['6Rnd_GBU12_AV8B','2Rnd_Maverick_A10']]],
  [3800,'GBU-12 (6) | AIM-9L (2)',[['BombLauncher','SidewinderLaucher_AH1Z'],['6Rnd_GBU12_AV8B','2Rnd_Sidewinder_AH1Z']]],
  [4300,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherA10','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherA10','SidewinderLaucher_AH1Z','MaverickLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],  
  [3500,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],  
  [3600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [4600,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3900,'AGM-65 (6) | AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [3200,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [7100,'GBU-12 (6) | Hydra(+38)',[['BombLauncher','FFARLauncher'],['6Rnd_GBU12_AV8B','38Rnd_FFAR']]], 
  [6400,'GBU-12 (4) | AIM-9L (2) | Hydra(+38)',[['BombLauncherA10','SidewinderLaucher_AH1Z','FFARLauncher'],['4Rnd_GBU12','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [7300,'GBU-12 (4) | AGM-65 (2) | Hydra(+38)',[['BombLauncherA10','MaverickLauncher','FFARLauncher'],['4Rnd_GBU12','2Rnd_Maverick_A10','38Rnd_FFAR']]],
  [6600,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6600,'GBU-12 (2) | AGM-65 (4) | Hydra(+38)',[['BombLauncherF35','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],  
  [7600,'AGM-65 (6) | Hydra(+38)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6900,'AGM-65 (4) | AIM-9L (2) | Hydra(+38)',[['MaverickLauncher','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [4200,'MK-82 (24)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
  [4100,'MK-82 (18) | AGM-65 (2)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [3800,'MK-82 (18) | AIM-9L (2)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [4100,'MK-82 (18) | GBU-12 (2)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','2Rnd_GBU12']]],
  [4300,'MK-82 (12) | AGM-65 (4)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [4300,'MK-82 (12) | GBU-12 (4)',[['Mk82BombLauncher_6','BombLauncherF35'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_GBU12','2Rnd_GBU12']]],
  [6400,'MK-82 (12) | AIM-9L (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [3500,'MK-82 (6) | AIM-9L (2) | AGM-65 (4)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [3600,'MK-82 (6) | AGM-65 (6)',[['Mk82BombLauncher_6','MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]], 
  [7100,'MK-82 (18) | Hydra(+38)',[['Mk82BombLauncher_6','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','38Rnd_FFAR']]], 
  [6400,'MK-82 (12) | AIM-9L (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
  [7300,'MK-82 (12) | AGM-65 (2) | Hydra(+38)',[['Mk82BombLauncher_6','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','6Rnd_Mk82','2Rnd_Maverick_A10','38Rnd_FFAR']]],
  [6600,'MK-82 (6) | AIM-9L (2) | AGM-65 (2) | Hydra(+38)',[['Mk82BombLauncher_6','SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]], 
  [6600,'MK-82 (6) | AGM-65 (4) | Hydra(+38)',[['Mk82BombLauncher_6','MaverickLauncher','FFARLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]]  
 ]
}
];

_easaVehi = 	_easaVehi + ['AH64D'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher'],['8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [3100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 ]
} else {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8500,'AGM-114 (8) | Sidewinder(2)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z']]]
 ]
}
];
_easaVehi = 	_easaVehi + ['AH64D_EP1'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher'],['8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [3100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 ]
} else {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8500,'AGM-114 (8) | Sidewinder(2)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z']]]
 ]
}
];


_easaVehi = 	_easaVehi + ['BAF_Apache_AH1_D'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher'],['8Rnd_Hellfire']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Arrowhead) then {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [3100,'AIM-9L (8)',[['SidewinderLaucher_AH1Z'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 ]
} else {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8500,'AGM-114 (8) | Sidewinder(2)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z']]]
 ]
}
];

_easaVehi = 	_easaVehi + ['AH1Z'];
_easaDefault = 	_easaDefault + [[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
if (WF_A2_Vanilla) then {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8500,'AGM-114 (8) | Sidewinder(4)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 ]
} else {
 [
  [2900,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]],
  [8500,'AGM-114 (8) | Sidewinder(4)',[['HellfireLauncher','SidewinderLaucher_AH1Z'],['8Rnd_Hellfire','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]]
 ]
}
];

//--- Now we check for AA-based loadouts.
for '_i' from 0 to count(_easaVehi)-1 do {
	_loadout = _easaLoadout select _i;
	
	for '_j' from 0 to count(_loadout)-1 do {
		_loadout_line = _loadout select _j;
		_is_AAMissile = false;
		
		//--- Browse each EASA magazines and check the ammunition kind.
		{
			_ammo = getText(configFile >> "CfgMagazines" >> _x >> "ammo"); //--- We grab the ammo used by the magazine.
			
			if (_ammo != "") then {
				//--- We check if the ammo is air-lock based and that in inherits from the missile class.
				if (getNumber(configFile >> "CfgAmmo" >> _ammo >> "airLock") == 1 && configName(inheritsFrom(configFile >> "CfgAmmo" >> _ammo)) == "MissileBase") exitWith {_is_AAMissile = true};
			};
		} forEach ((_loadout_line select 2) select 1);
		
		_loadout_line set [3, if (_is_AAMissile) then {true} else {false}];
	};
};


missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];
missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];
missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];