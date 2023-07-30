Private ["_ammo","_easaDefault","_easaLoadout","_easaVehi","_is_AAMissile","_loadout","_loadout_line","_vehicle"];

EASA_Equip = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_Equip.sqf';
EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_RemoveLoadout.sqf';

_easaDefault = [];
_easaLoadout = [];
_easaVehi = [];

/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */
_easaVehi = _easaVehi + ['Su34'];
_easaDefault = _easaDefault +
[[['Ch29Launcher_Su34','R73Launcher_2'],['6Rnd_Ch29','4Rnd_R73']]];
_easaLoadout = _easaLoadout + [
[
[4000,'FAB-250 (40)',[['AirBombLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[5800,'R-73 (2) | FAB-250 (32)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[6200,'FAB-250 (24) | Kh-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_Ch29']]],
[6600,'R-73 (4) | FAB-250 (24)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[6800,'FAB-250 (16) | Kh-29 (6)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','4Rnd_FAB_250','6Rnd_Ch29']]],[7000,'Kh-29 (10)',[['Ch29Launcher_Su34'],['6Rnd_Ch29','4Rnd_Ch29']]],
[7400,'R-73 (6) | FAB-250 (16)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250']]],
[7400,'FAB-250 (8) | Kh-29 (8)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','4Rnd_Ch29','4Rnd_Ch29']]],
[8000,'R-73 (10)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
[8000,'R-73 (2) | FAB-250 (16) | Kh-29 (4)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_Ch29']]],
[8200,'R-73 (8) | FAB-250 (8)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250']]],
[8200,'R-73 (2) | Kh-29 (8)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_Ch29','4Rnd_Ch29']]],
[8400,'R-73 (4) | Kh-29 (6)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','6Rnd_Ch29']]],
[8600,'R-73 (6) | Kh-29 (4)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_Ch29']]],
[8600,'R-73 (2) | FAB-250 (8) | Kh-29 (6)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_FAB_250','6Rnd_Ch29']]],
[8800,'R-73 (4) | FAB-250 (8) | Kh-29 (4)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','4Rnd_Ch29']]],
[10400,'FAB-250 (32) | S-8 (40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
[12200,'R-73 (2) | FAB-250 (24) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
[12400,'FAB-250 (32) | GBU-12 (2)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12']]],
[12600,'FAB-250 (16) | Kh-29 (4) | S-8 (40)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T']]],
[12800,'Kh-29 (8) | S-8 (40)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','4Rnd_Ch29','40Rnd_S8T']]],
[13000,'R-73 (4) | FAB-250 (16) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
[13200,'FAB-250 (8) | Kh-29 (6) | S-8 (40)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','6Rnd_Ch29','40Rnd_S8T']]],
[13600,'R-73 (8) | S-8 (40)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T']]],
[13800,'R-73 (6) | FAB-250 (8) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T']]],
[14000,'R-73 (2) | Kh-29 (6) | S-8 (40)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','6Rnd_Ch29','40Rnd_S8T']]],
[14200,'R-73 (4) | Kh-29 (4) | S-8 (40)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_Ch29','40Rnd_S8T']]],
[14200,'R-73 (2) | FAB-250 (24) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12']]],
[14400,'R-73 (2) | FAB-250 (8) | Kh-29 (4) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T']]],
[14600,'FAB-250 (16) | Kh-29 (4) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12']]],
[14800,'Kh-29 (8) | GBU-12 (2)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','4Rnd_Ch29','2Rnd_GBU12']]],
[15000,'R-73 (4) | FAB-250 (16) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12']]],
[15200,'FAB-250 (8) | Kh-29 (6) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','6Rnd_Ch29','2Rnd_GBU12']]],
[15600,'R-73 (8) | GBU-12 (2)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_GBU12']]],
[15800,'R-73 (6) | FAB-250 (8) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_GBU12']]],
[15800,'FAB-250 (24) | S-8 (80)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[16000,'R-73 (2) | Kh-29 (6) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','6Rnd_Ch29','2Rnd_GBU12']]],
[16200,'R-73 (4) | Kh-29 (4) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_Ch29','2Rnd_GBU12']]],
[16400,'R-73 (2) | FAB-250 (8) | Kh-29 (4) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12']]],
[17600,'R-73 (2) | FAB-250 (16) | S-8 (80)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[17600,'Kh-29 (6) | S-8 (80)',[['Ch29Launcher_Su34','80mmLauncher'],['6Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[18000,'FAB-250 (8) | Kh-29 (4) | S-8 (80)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[18200,'R-73 (6) | S-8 (80)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T','40Rnd_S8T']]],
[18400,'R-73 (4) | FAB-250 (8) | S-8 (80)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[18800,'R-73 (2) | Kh-29 (4) | S-8 (80)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[18800,'FAB-250 (24) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[19800,'FAB-250 (24) | GBU-12 (4)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[20600,'R-73 (2) | FAB-250 (16) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[20600,'Kh-29 (6) | S-8 (40) | GBU-12 (2)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['6Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[21000,'FAB-250 (8) | Kh-29 (4) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[21200,'R-73 (6) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T','2Rnd_GBU12']]],
[21200,'FAB-250 (16) | S-8 (120)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[21400,'R-73 (4) | FAB-250 (8) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[21600,'R-73 (2) | FAB-250 (16) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[21600,'Kh-29 (6) | GBU-12 (4)',[['Ch29Launcher_Su34','BombLauncherF35'],['6Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[21800,'R-73 (2) | Kh-29 (4) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[22000,'FAB-250 (8) | Kh-29 (4) | GBU-12 (4)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[22200,'R-73 (6) | GBU-12 (4)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12']]],
[22400,'R-73 (4) | FAB-250 (8) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[22400,'Kh-29 (4) | S-8 (120)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[22800,'R-73 (4) | S-8 (120)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[22800,'R-73 (2) | Kh-29 (4) | GBU-12 (4)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[23000,'R-73 (2) | FAB-250 (8) | S-8 (120)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[24200,'FAB-250 (16) | S-8 (80) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[25400,'Kh-29 (4) | S-8 (80) | GBU-12 (2)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[25800,'R-73 (4) | S-8 (80) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[26000,'R-73 (2) | FAB-250 (8) | S-8 (80) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[26200,'FAB-250 (16) | S-8 (40) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[26600,'FAB-250 (8) | S-8 (160)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[27200,'FAB-250 (16) | GBU-12 (6)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[27400,'R-73 (2) | S-8 (160)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[27400,'Kh-29 (4) | S-8 (40) | GBU-12 (4)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[27800,'R-73 (4) | S-8 (40) | GBU-12 (4)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[28000,'R-73 (2) | FAB-250 (8) | S-8 (40) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[28400,'Kh-29 (4) | GBU-12 (6)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[28800,'R-73 (4) | GBU-12 (6)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[29000,'R-73 (2) | FAB-250 (8) | GBU-12 (6)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[29600,'FAB-250 (8) | S-8 (120) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[30400,'R-73 (2) | S-8 (120) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[31000,'S-8 (200)',[['80mmLauncher'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[31600,'FAB-250 (8) | S-8 (80) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[32400,'R-73 (2) | S-8 (80) | GBU-12 (4)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[33600,'FAB-250 (8) | S-8 (40) | GBU-12 (6)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[34000,'S-8 (160) | GBU-12 (2)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[34400,'R-73 (2) | S-8 (40) | GBU-12 (6)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[34600,'FAB-250 (8) | GBU-12 (8)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[35400,'R-73 (2) | GBU-12 (8)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[36000,'S-8 (120) | GBU-12 (4)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[38000,'S-8 (80) | GBU-12 (6)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[40000,'S-8 (40) | GBU-12 (8)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];



_easaVehi = _easaVehi + ['Su25_Ins'];
_easaDefault = _easaDefault +
[[['Ch29Launcher_Su34','R73Launcher_2'],['4Rnd_Ch29','4Rnd_R73']]];
_easaLoadout = _easaLoadout + [
[
[2800,'FAB-250 (24)',[['AirBombLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[4000,'S-5 (192)',[['80mmLauncher'],['64Rnd_57mm','64Rnd_57mm','64Rnd_57mm']]],
[4200,'FAB-250 (16) | S-5 (64)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','64Rnd_57mm']]],
[4600,'FAB-250 (16) | Igla-V (2)',[['AirBombLauncher','Igla_twice'],['4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_Igla']]],
[4600,'FAB-250 (8) | S-5 (128)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','64Rnd_57mm','64Rnd_57mm']]],
[4600,'Kh-29 (6)',[['Ch29Launcher_Su34'],['6Rnd_Ch29']]],
[5000,'FAB-250 (8) | Kh-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','4Rnd_Ch29']]],
[5400,'Kh-29 (4) | S-5 (64)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','64Rnd_57mm']]],
[5400,'S-5 (128) | Igla-V (2)',[['80mmLauncher','Igla_twice'],['64Rnd_57mm','64Rnd_57mm','2Rnd_Igla']]],
[5800,'Kh-29 (4) | Igla-V (2)',[['Ch29Launcher_Su34','Igla_twice'],['4Rnd_Ch29','2Rnd_Igla']]],
[6000,'FAB-250 (8) | S-5 (64) | Igla-V (2)',[['AirBombLauncher','80mmLauncher','Igla_twice'],['4Rnd_FAB_250','64Rnd_57mm','2Rnd_Igla']]]
]
];



_easaVehi = _easaVehi + ['Su25_TK_EP1'];
_easaDefault = _easaDefault +
[[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','4Rnd_R73']]];
_easaLoadout = _easaLoadout + [
[
[2800,'FAB-250 (24)',[['AirBombLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[4000,'S-5 (192)',[['80mmLauncher'],['64Rnd_57mm','64Rnd_57mm','64Rnd_57mm']]],
[4200,'FAB-250 (16) | S-5 (64)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','64Rnd_57mm']]],
[4600,'FAB-250 (16) | Igla-V (2)',[['AirBombLauncher','Igla_twice'],['4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_Igla']]],
[4600,'FAB-250 (8) | S-5 (128)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','64Rnd_57mm','64Rnd_57mm']]],
[4600,'Kh-29 (6)',[['Ch29Launcher_Su34'],['6Rnd_Ch29']]],
[5000,'FAB-250 (8) | Kh-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','4Rnd_Ch29']]],
[5400,'Kh-29 (4) | S-5 (64)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','64Rnd_57mm']]],
[5400,'S-5 (128) | Igla-V (2)',[['80mmLauncher','Igla_twice'],['64Rnd_57mm','64Rnd_57mm','2Rnd_Igla']]],
[5800,'Kh-29 (4) | Igla-V (2)',[['Ch29Launcher_Su34','Igla_twice'],['4Rnd_Ch29','2Rnd_Igla']]],
[6000,'FAB-250 (8) | S-5 (64) | Igla-V (2)',[['AirBombLauncher','80mmLauncher','Igla_twice'],['4Rnd_FAB_250','64Rnd_57mm','2Rnd_Igla']]]
]
];



_easaVehi = _easaVehi + ['Su39'];
_easaDefault = _easaDefault +
[[['Ch29Launcher_Su34','R73Launcher_2'],['4Rnd_Ch29','4Rnd_R73']]];
_easaLoadout = _easaLoadout + [
[
[3400,'FAB-250 (32)',[['AirBombLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[5200,'R-73 (2) | FAB-250 (24)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250']]],
[5600,'FAB-250 (16) | Kh-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_Ch29']]],[5800,'Kh-29 (8)',[['Ch29Launcher_Su34'],['4Rnd_Ch29','4Rnd_Ch29']]],
[6200,'FAB-250 (8) | Kh-29 (6)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','6Rnd_Ch29']]],
[7000,'R-73 (2) | Kh-29 (6)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','6Rnd_Ch29']]],
[7400,'R-73 (2) | FAB-250 (8) | Kh-29 (4)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_Ch29']]],
[9800,'FAB-250 (24) | S-8 (40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
[11600,'R-73 (2) | FAB-250 (16) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T']]],
[11600,'Kh-29 (6) | S-8 (40)',[['Ch29Launcher_Su34','80mmLauncher'],['6Rnd_Ch29','40Rnd_S8T']]],
[11800,'FAB-250 (24) | GBU-12 (2)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12']]],
[12000,'FAB-250 (8) | Kh-29 (4) | S-8 (40)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T']]],
[12800,'R-73 (2) | Kh-29 (4) | S-8 (40)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','4Rnd_Ch29','40Rnd_S8T']]],
[13600,'R-73 (2) | FAB-250 (16) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12']]],
[13600,'Kh-29 (6) | GBU-12 (2)',[['Ch29Launcher_Su34','BombLauncherF35'],['6Rnd_Ch29','2Rnd_GBU12']]],
[14000,'FAB-250 (8) | Kh-29 (4) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12']]],
[14800,'R-73 (2) | Kh-29 (4) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','4Rnd_Ch29','2Rnd_GBU12']]],
[15200,'FAB-250 (16) | S-8 (80)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[16400,'Kh-29 (4) | S-8 (80)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[17000,'R-73 (2) | FAB-250 (8) | S-8 (80)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[18200,'FAB-250 (16) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[19200,'FAB-250 (16) | GBU-12 (4)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[19400,'Kh-29 (4) | S-8 (40) | GBU-12 (2)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[20000,'R-73 (2) | FAB-250 (8) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[20400,'Kh-29 (4) | GBU-12 (4)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[20600,'FAB-250 (8) | S-8 (120)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[21000,'R-73 (2) | FAB-250 (8) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[21400,'R-73 (2) | S-8 (120)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[23600,'FAB-250 (8) | S-8 (80) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[24400,'R-73 (2) | S-8 (80) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[25000,'S-8 (160)',[['80mmLauncher'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[25600,'FAB-250 (8) | S-8 (40) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[26400,'R-73 (2) | S-8 (40) | GBU-12 (4)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[26600,'FAB-250 (8) | GBU-12 (6)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[27400,'R-73 (2) | GBU-12 (6)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[28000,'S-8 (120) | GBU-12 (2)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[30000,'S-8 (80) | GBU-12 (4)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[32000,'S-8 (40) | GBU-12 (6)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];



_easaVehi = _easaVehi + ['L39_TK_EP1'];
_easaDefault = _easaDefault +
[[['80mmLauncher','R73Launcher_2'],['64Rnd_57mm','2Rnd_R73']]];
_easaLoadout = _easaLoadout + [
[
[2200,'FAB-250 (16)',[['AirBombLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250']]],
[3000,'S-5 (128)',[['80mmLauncher'],['64Rnd_57mm','64Rnd_57mm']]],
[3400,'Ataka-V (8)',[['AT9Launcher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[3600,'FAB-250 (8) | S-5 (64)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','64Rnd_57mm']]],
[3800,'R-73 (4)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73']]],
[3800,'FAB-250 (8) | Ataka-V (4)',[['AirBombLauncher','AT9Launcher'],['4Rnd_FAB_250','4Rnd_AT9_Mi24P']]],
[4000,'R-73 (2) | FAB-250 (8)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250']]],
[4200,'S-5 (64) | Ataka-V (4)',[['80mmLauncher','AT9Launcher'],['64Rnd_57mm','4Rnd_AT9_Mi24P']]],
[4400,'R-73 (2) | S-5 (64)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','64Rnd_57mm']]],
[4600,'R-73 (2) | Ataka-V (4)',[['R73Launcher_2','AT9Launcher'],['2Rnd_R73','4Rnd_AT9_Mi24P']]],
[8600,'FAB-250 (8) | S-8 (40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','40Rnd_S8T']]],
[9000,'S-8 (40) | S-5 (64)',[['80mmLauncher','80mmLauncher'],['40Rnd_S8T','64Rnd_57mm']]],
[9200,'S-8 (40) | Ataka-V (4)',[['80mmLauncher','AT9Launcher'],['40Rnd_S8T','4Rnd_AT9_Mi24P']]],
[9400,'R-73 (2) | S-8 (40)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','40Rnd_S8T']]],
[10600,'FAB-250 (8) | GBU-12 (2)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_GBU12']]],
[11000,'S-5 (64) | GBU-12 (2)',[['80mmLauncher','BombLauncherF35'],['64Rnd_57mm','2Rnd_GBU12']]],
[11200,'Ataka-V (4) | GBU-12 (2)',[['AT9Launcher','BombLauncherF35'],['4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[11400,'R-73 (2) | GBU-12 (2)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_GBU12']]],
[13000,'S-8 (80)',[['80mmLauncher'],['40Rnd_S8T','40Rnd_S8T']]],
[16000,'S-8 (40) | GBU-12 (2)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','2Rnd_GBU12']]]
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
_easaDefault = 	_easaDefault + [[['GAU12','BombLauncherA10'],['300Rnd_25mm_GAU12','4Rnd_GBU12']]];
_easaLoadout = 	_easaLoadout + [
 [
  [2600,'Gau-12 (300) | GBU-12 (4)',[['GAU12','BombLauncherA10'],['300Rnd_25mm_GAU12','4Rnd_GBU12']]],
  [5200,'Gau-12 (300) | GBU-12 (4) | Hydra(+38)',[['GAU12','BombLauncherA10','FFARLauncher'],['300Rnd_25mm_GAU12','4Rnd_GBU12','38Rnd_FFAR']]]


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

_easaVehi = 	_easaVehi + ['L159_ACR'];
_easaDefault = 	_easaDefault + [[['FFARLauncher','MaverickLauncher','SidewinderLaucher_AH1Z'],['38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]];
_easaLoadout = 	_easaLoadout + [
 [
  [3100,'Hydra (38), AGM-65 (2), AIM-9L (2)',[['FFARLauncher','MaverickLauncher','SidewinderLaucher_AH1Z'],['38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [5100,'Hydra (38), AGM-65 (4)',[['FFARLauncher','MaverickLauncher'],['38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [6500,'Hydra (38), AIM-9L (4)',[['FFARLauncher','SidewinderLaucher_AH1Z'],['38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [7500,'Hydra (38), GBU-12 (2)',[['FFARLauncher','BombLauncherF35'],['38Rnd_FFAR','2Rnd_GBU12']]],
  [8000,'Hydra (38), MK-82 (6)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','6Rnd_Mk82']]],
  [4800,'Hydra (76), AGM-65 (2)',[['FFARLauncher','MaverickLauncher'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Maverick_A10']]],
  [5500,'Hydra (76), AIM-9L (2)',[['FFARLauncher','SidewinderLaucher_AH1Z'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z']]],
  [5500,'Hydra (76), MK-82 (3)',[['FFARLauncher','Mk82BombLauncher'],['38Rnd_FFAR','38Rnd_FFAR','3Rnd_Mk82']]],
  [6500,'Hydra (114)',[['FFARLauncher'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
  [7100,'GBU-12 (2), AGM-65 (2)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10']]],
  [8500,'GBU-12 (2), AIM-9L (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z']]],
  [4700,'MK-82 (3), AGM-65 (2), AIM-9L (2)',[['Mk82BombLauncher', 'MaverickLauncher','SidewinderLaucher_AH1Z'],['3Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [4100,'MK-82 (3), AGM-65 (4)',[['Mk82BombLauncher', 'MaverickLauncher'],['3Rnd_Mk82','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [5500,'MK-82 (3), AIM-9L (4)',[['Mk82BombLauncher', 'SidewinderLaucher_AH1Z'],['3Rnd_Mk82','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [5100,'MK-82 (6), AGM-65 (2)',[['Mk82BombLauncher_6', 'MaverickLauncher'],['6Rnd_Mk82','2Rnd_Maverick_A10']]],
  [5800,'MK-82 (6), AIM-9L (2)',[['Mk82BombLauncher_6', 'SidewinderLaucher_AH1Z'],['6Rnd_Mk82','2Rnd_Sidewinder_AH1Z']]],
  [7500,'MK-82 (12)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82']]],
  [6500,'AGM-65 (2), AIM-9L (4)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
  [5800,'AGM-65 (4), AIM-9L (2)',[['MaverickLauncher','SidewinderLaucher_AH1Z'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Sidewinder_AH1Z']]],
  [5500,'AGM-65 (6)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
  [9500,'AGM-114 (8)',[['HellfireLauncher'],['8Rnd_Hellfire']]]

 ]
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