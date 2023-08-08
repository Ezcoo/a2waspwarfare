Private ["_ammo","_easaDefault","_easaLoadout","_easaVehi","_is_AAMissile","_loadout","_loadout_line","_vehicle"];

EASA_Equip = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_Equip.sqf';
EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_RemoveLoadout.sqf';

_easaDefault = [];
_easaLoadout = [];
_easaVehi = [];

/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */
// Su-34 [AF5] - 10 pylons
_easaVehi = _easaVehi + ['Su34'];
_easaDefault = _easaDefault +
[[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','6Rnd_Ch29']]];
_easaLoadout = _easaLoadout + [
[
[4000,'FAB-250 (30)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[5800,'R-73 (2) | FAB-250 (24)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[6200,'FAB-250 (18) | Kh-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29']]],
[6600,'R-73 (4) | FAB-250 (18)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[6800,'FAB-250 (12) | Kh-29 (6)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','6Rnd_Ch29']]],
[7000,'Kh-29 (10)',[['Ch29Launcher_Su34'],['6Rnd_Ch29','4Rnd_Ch29']]],
[7400,'R-73 (6) | FAB-250 (12)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[7400,'FAB-250 (6) | Kh-29 (8)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','4Rnd_Ch29']]],
[8000,'R-73 (10)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
[8000,'R-73 (2) | FAB-250 (12) | Kh-29 (4)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29']]],
[8200,'R-73 (8) | FAB-250 (6)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250']]],
[8200,'R-73 (2) | Kh-29 (8)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_Ch29','4Rnd_Ch29']]],
[8400,'DEFAULT | R-73 (4) | Kh-29 (6)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','6Rnd_Ch29']]],
[8600,'R-73 (6) | Kh-29 (4)',[['R73Launcher_2','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_Ch29']]],
[8600,'R-73 (2) | FAB-250 (6) | Kh-29 (6)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','6Rnd_Ch29']]],
[8800,'R-73 (4) | FAB-250 (6) | Kh-29 (4)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29']]],
[10400,'FAB-250 (24) | S-8 (40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
[12200,'R-73 (2) | FAB-250 (18) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
[12400,'FAB-250 (24) | GBU-12 (2)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12']]],
[12600,'FAB-250 (12) | Kh-29 (4) | S-8 (40)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T']]],
[12800,'Kh-29 (8) | S-8 (40)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','4Rnd_Ch29','40Rnd_S8T']]],
[13000,'R-73 (4) | FAB-250 (12) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
[13200,'FAB-250 (6) | Kh-29 (6) | S-8 (40)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','6Rnd_Ch29','40Rnd_S8T']]],
[13600,'R-73 (8) | S-8 (40)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T']]],
[13800,'R-73 (6) | FAB-250 (6) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
[14000,'R-73 (2) | Kh-29 (6) | S-8 (40)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','6Rnd_Ch29','40Rnd_S8T']]],
[14200,'R-73 (4) | Kh-29 (4) | S-8 (40)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_Ch29','40Rnd_S8T']]],
[14200,'R-73 (2) | FAB-250 (18) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12']]],
[14400,'R-73 (2) | FAB-250 (6) | Kh-29 (4) | S-8 (40)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T']]],
[14600,'FAB-250 (12) | Kh-29 (4) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12']]],
[14800,'Kh-29 (8) | GBU-12 (2)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','4Rnd_Ch29','2Rnd_GBU12']]],
[15000,'R-73 (4) | FAB-250 (12) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12']]],
[15200,'FAB-250 (6) | Kh-29 (6) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','6Rnd_Ch29','2Rnd_GBU12']]],
[15600,'R-73 (8) | GBU-12 (2)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_GBU12']]],
[15800,'R-73 (6) | FAB-250 (6) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12']]],
[15800,'FAB-250 (18) | S-8 (80)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[16000,'R-73 (2) | Kh-29 (6) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','6Rnd_Ch29','2Rnd_GBU12']]],
[16200,'R-73 (4) | Kh-29 (4) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_Ch29','2Rnd_GBU12']]],
[16400,'R-73 (2) | FAB-250 (6) | Kh-29 (4) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12']]],
[17600,'R-73 (2) | FAB-250 (12) | S-8 (80)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[17600,'Kh-29 (6) | S-8 (80)',[['Ch29Launcher_Su34','80mmLauncher'],['6Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[18000,'FAB-250 (6) | Kh-29 (4) | S-8 (80)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[18200,'R-73 (6) | S-8 (80)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T','40Rnd_S8T']]],
[18400,'R-73 (4) | FAB-250 (6) | S-8 (80)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[18800,'R-73 (2) | Kh-29 (4) | S-8 (80)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher'],['2Rnd_R73','4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T']]],
[18800,'FAB-250 (18) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[19800,'FAB-250 (18) | GBU-12 (4)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[20600,'R-73 (2) | FAB-250 (12) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[20600,'Kh-29 (6) | S-8 (40) | GBU-12 (2)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['6Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[21000,'FAB-250 (6) | Kh-29 (4) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[21200,'R-73 (6) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','40Rnd_S8T','2Rnd_GBU12']]],
[21200,'FAB-250 (12) | S-8 (120)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[21400,'R-73 (4) | FAB-250 (6) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[21600,'R-73 (2) | FAB-250 (12) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[21600,'Kh-29 (6) | GBU-12 (4)',[['Ch29Launcher_Su34','BombLauncherF35'],['6Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[21800,'R-73 (2) | Kh-29 (4) | S-8 (40) | GBU-12 (2)',[['R73Launcher_2','Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12']]],
[22000,'FAB-250 (6) | Kh-29 (4) | GBU-12 (4)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[22200,'R-73 (6) | GBU-12 (4)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12']]],
[22400,'R-73 (4) | FAB-250 (6) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[22400,'Kh-29 (4) | S-8 (120)',[['Ch29Launcher_Su34','80mmLauncher'],['4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[22800,'R-73 (4) | S-8 (120)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[22800,'R-73 (2) | Kh-29 (4) | GBU-12 (4)',[['R73Launcher_2','Ch29Launcher_Su34','BombLauncherF35'],['2Rnd_R73','4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[23000,'R-73 (2) | FAB-250 (6) | S-8 (120)',[['R73Launcher_2','AirBombLauncher','80mmLauncher'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[24200,'FAB-250 (12) | S-8 (80) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[25400,'Kh-29 (4) | S-8 (80) | GBU-12 (2)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_Ch29','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[25800,'R-73 (4) | S-8 (80) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[26000,'R-73 (2) | FAB-250 (6) | S-8 (80) | GBU-12 (2)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[26200,'FAB-250 (12) | S-8 (40) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[27200,'FAB-250 (12) | GBU-12 (6)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[27400,'Kh-29 (4) | S-8 (40) | GBU-12 (4)',[['Ch29Launcher_Su34','80mmLauncher','BombLauncherF35'],['4Rnd_Ch29','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[27800,'R-73 (4) | S-8 (40) | GBU-12 (4)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[28000,'R-73 (2) | FAB-250 (6) | S-8 (40) | GBU-12 (4)',[['R73Launcher_2','AirBombLauncher','80mmLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[28400,'Kh-29 (4) | GBU-12 (6)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[28800,'R-73 (4) | GBU-12 (6)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[29000,'R-73 (2) | FAB-250 (6) | GBU-12 (6)',[['R73Launcher_2','AirBombLauncher','BombLauncherF35'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[29600,'FAB-250 (6) | S-8 (120) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[30400,'R-73 (2) | S-8 (120) | GBU-12 (2)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[31600,'FAB-250 (6) | S-8 (80) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[32400,'R-73 (2) | S-8 (80) | GBU-12 (4)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[33600,'FAB-250 (6) | S-8 (40) | GBU-12 (6)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[34400,'R-73 (2) | S-8 (40) | GBU-12 (6)',[['R73Launcher_2','80mmLauncher','BombLauncherF35'],['2Rnd_R73','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[34600,'FAB-250 (6) | GBU-12 (8)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[35400,'R-73 (2) | GBU-12 (8)',[['R73Launcher_2','BombLauncherF35'],['2Rnd_R73','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[36000,'S-8 (120) | GBU-12 (4)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[38000,'S-8 (80) | GBU-12 (6)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[40000,'S-8 (40) | GBU-12 (8)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// Su-25A [AF3] - 6 pylons
_easaVehi = _easaVehi + ['Su25_Ins'];
_easaDefault = _easaDefault +
[[['AirBombLauncher','57mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','64Rnd_57mm']]];
_easaLoadout = _easaLoadout + [
[
[2800,'FAB-250 (18)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[3600,'FAB-250 (12) | Igla-V (2)',[['AirBombLauncher','Igla_twice'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_Igla']]],
[4000,'S-5 (192)',[['57mmLauncher'],['64Rnd_57mm','64Rnd_57mm','64Rnd_57mm']]],
[4200,'DEFAULT | FAB-250 (12) | S-5 (64)',[['AirBombLauncher','57mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','64Rnd_57mm']]],
[4400,'FAB-250 (12) | Gun rounds (360rnd) (2)',[['AirBombLauncher','GSh301'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','180Rnd_30mm_GSh301']]],
[4400,'Igla-V (2) | S-5 (128)',[['Igla_twice','57mmLauncher'],['2Rnd_Igla','64Rnd_57mm','64Rnd_57mm']]],
[4600,'FAB-250 (6) | S-5 (128)',[['AirBombLauncher','57mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','64Rnd_57mm','64Rnd_57mm']]],
[5000,'FAB-250 (6) | Igla-V (2) | S-5 (64)',[['AirBombLauncher','Igla_twice','57mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_Igla','64Rnd_57mm']]],
[5200,'FAB-250 (6) | Igla-V (2) | Gun rounds (360rnd) (2)',[['AirBombLauncher','Igla_twice','GSh301'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_Igla','180Rnd_30mm_GSh301']]],
[5200,'S-5 (128) | Gun rounds (360rnd) (2)',[['57mmLauncher','GSh301'],['64Rnd_57mm','64Rnd_57mm','180Rnd_30mm_GSh301']]],
[5600,'Igla-V (2) | S-5 (64) | Gun rounds (360rnd) (2)',[['Igla_twice','57mmLauncher','GSh301'],['2Rnd_Igla','64Rnd_57mm','180Rnd_30mm_GSh301']]],
[5800,'FAB-250 (6) | S-5 (64) | Gun rounds (360rnd) (2)',[['AirBombLauncher','57mmLauncher','GSh301'],['4Rnd_FAB_250','2Rnd_FAB_250','64Rnd_57mm','180Rnd_30mm_GSh301']]]
]
];


// Su-25T [AF4] - 8 pylons
_easaVehi = _easaVehi + ['Su25_TK_EP1'];
_easaDefault = _easaDefault +
[[['AT9Launcher','R73Launcher_2','80mmLauncher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_R73','40Rnd_S8T']]];
_easaLoadout = _easaLoadout + [
[
[3400,'FAB-250 (24)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[5000,'FAB-250 (18) | Ataka-V (4)',[['AirBombLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P']]],
[5600,'FAB-250 (12) | Ataka-V (8)',[['AirBombLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[5800,'Ataka-V (16)',[['AT9Launcher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[6200,'FAB-250 (6) | Ataka-V (12)',[['AirBombLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[9800,'FAB-250 (18) | S-8 (40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
[11400,'FAB-250 (12) | S-8 (40) | Ataka-V (4)',[['AirBombLauncher','80mmLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','4Rnd_AT9_Mi24P']]],
[11600,'S-8 (40) | Ataka-V (12)',[['80mmLauncher','AT9Launcher'],['40Rnd_S8T','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[11800,'FAB-250 (18) | GBU-12 (2)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12']]],
[12000,'FAB-250 (6) | S-8 (40) | Ataka-V (8)',[['AirBombLauncher','80mmLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[13400,'FAB-250 (12) | Ataka-V (4) | GBU-12 (2)',[['AirBombLauncher','AT9Launcher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[13600,'Ataka-V (12) | GBU-12 (2)',[['AT9Launcher','BombLauncherF35'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[14000,'FAB-250 (6) | Ataka-V (8) | GBU-12 (2)',[['AirBombLauncher','AT9Launcher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[15200,'FAB-250 (12) | S-8 (80)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[16400,'S-8 (80) | Ataka-V (8)',[['80mmLauncher','AT9Launcher'],['40Rnd_S8T','40Rnd_S8T','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[16800,'FAB-250 (6) | S-8 (80) | Ataka-V (4)',[['AirBombLauncher','80mmLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','4Rnd_AT9_Mi24P']]],
[18200,'FAB-250 (12) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[19200,'FAB-250 (12) | GBU-12 (4)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[19400,'S-8 (40) | Ataka-V (8) | GBU-12 (2)',[['80mmLauncher','AT9Launcher','BombLauncherF35'],['40Rnd_S8T','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[19800,'FAB-250 (6) | S-8 (40) | Ataka-V (4) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','AT9Launcher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[20400,'Ataka-V (8) | GBU-12 (4)',[['AT9Launcher','BombLauncherF35'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','2Rnd_GBU12','2Rnd_GBU12']]],
[20600,'FAB-250 (6) | S-8 (120)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[20800,'FAB-250 (6) | Ataka-V (4) | GBU-12 (4)',[['AirBombLauncher','AT9Launcher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P','2Rnd_GBU12','2Rnd_GBU12']]],
[21200,'S-8 (120) | Ataka-V (4)',[['80mmLauncher','AT9Launcher'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','4Rnd_AT9_Mi24P']]],
[23600,'FAB-250 (6) | S-8 (80) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[24200,'S-8 (80) | Ataka-V (4) | GBU-12 (2)',[['80mmLauncher','AT9Launcher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','4Rnd_AT9_Mi24P','2Rnd_GBU12']]],
[25000,'S-8 (160)',[['80mmLauncher'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[25600,'FAB-250 (6) | S-8 (40) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[26200,'S-8 (40) | Ataka-V (4) | GBU-12 (4)',[['80mmLauncher','AT9Launcher','BombLauncherF35'],['40Rnd_S8T','4Rnd_AT9_Mi24P','2Rnd_GBU12','2Rnd_GBU12']]],
[26600,'FAB-250 (6) | GBU-12 (6)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[27200,'Ataka-V (4) | GBU-12 (6)',[['AT9Launcher','BombLauncherF35'],['4Rnd_AT9_Mi24P','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[28000,'S-8 (120) | GBU-12 (2)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[30000,'S-8 (80) | GBU-12 (4)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[32000,'S-8 (40) | GBU-12 (6)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// Su-39 [AF5] - 10 pylons
_easaVehi = _easaVehi + ['Su39'];
_easaDefault = _easaDefault +
[[['VikhrLauncher','R73Launcher_2','80mmLauncher'],['12Rnd_Vikhr_KA50','2Rnd_R73','40Rnd_S8T','40Rnd_S8T']]];
_easaLoadout = _easaLoadout + [
[
[3400,'FAB-250 (6) | Vikhr (24)',[['AirBombLauncher','VikhrLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','12Rnd_Vikhr_KA50','12Rnd_Vikhr_KA50']]],
[4000,'FAB-250 (30)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[4200,'FAB-250 (18) | Vikhr (12)',[['AirBombLauncher','VikhrLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','12Rnd_Vikhr_KA50']]],
[6000,'Vikhr (12) | Kh-29 (6)',[['VikhrLauncher','Ch29Launcher_Su34'],['12Rnd_Vikhr_KA50','6Rnd_Ch29']]],
[6200,'FAB-250 (18) | Kh-29 (4)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29']]],
[6400,'FAB-250 (6) | Vikhr (12) | Kh-29 (4)',[['AirBombLauncher','VikhrLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','12Rnd_Vikhr_KA50','4Rnd_Ch29']]],
[6800,'FAB-250 (12) | Kh-29 (6)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','6Rnd_Ch29']]],
[7000,'Kh-29 (10)',[['Ch29Launcher_Su34'],['6Rnd_Ch29','4Rnd_Ch29']]],
[7400,'FAB-250 (6) | Kh-29 (8)',[['AirBombLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','4Rnd_Ch29']]],
[8800,'S-8 (40) | Vikhr (24)',[['80mmLauncher','VikhrLauncher'],['40Rnd_S8T','12Rnd_Vikhr_KA50','12Rnd_Vikhr_KA50']]],
[10400,'FAB-250 (24) | S-8 (40)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T']]],
[10600,'FAB-250 (12) | S-8 (40) | Vikhr (12)',[['AirBombLauncher','80mmLauncher','VikhrLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','12Rnd_Vikhr_KA50']]],
[10800,'Vikhr (24) | GBU-12 (2)',[['VikhrLauncher','BombLauncherF35'],['12Rnd_Vikhr_KA50','12Rnd_Vikhr_KA50','2Rnd_GBU12']]],
[11800,'S-8 (40) | Vikhr (12) | Kh-29 (4)',[['80mmLauncher','VikhrLauncher','Ch29Launcher_Su34'],['40Rnd_S8T','12Rnd_Vikhr_KA50','4Rnd_Ch29']]],
[12400,'FAB-250 (24) | GBU-12 (2)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12']]],
[12600,'FAB-250 (12) | S-8 (40) | Kh-29 (4)',[['AirBombLauncher','80mmLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','4Rnd_Ch29']]],
[12600,'FAB-250 (12) | Vikhr (12) | GBU-12 (2)',[['AirBombLauncher','VikhrLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','12Rnd_Vikhr_KA50','2Rnd_GBU12']]],
[12800,'S-8 (40) | Kh-29 (8)',[['80mmLauncher','Ch29Launcher_Su34'],['40Rnd_S8T','4Rnd_Ch29','4Rnd_Ch29']]],
[13200,'FAB-250 (6) | S-8 (40) | Kh-29 (6)',[['AirBombLauncher','80mmLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','6Rnd_Ch29']]],
[13800,'Vikhr (12) | Kh-29 (4) | GBU-12 (2)',[['VikhrLauncher','Ch29Launcher_Su34','BombLauncherF35'],['12Rnd_Vikhr_KA50','4Rnd_Ch29','2Rnd_GBU12']]],
[14600,'FAB-250 (12) | Kh-29 (4) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12']]],
[14800,'Kh-29 (8) | GBU-12 (2)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','4Rnd_Ch29','2Rnd_GBU12']]],
[15200,'FAB-250 (6) | Kh-29 (6) | GBU-12 (2)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','6Rnd_Ch29','2Rnd_GBU12']]],
[15800,'FAB-250 (18) | S-8 (80)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T']]],
[16000,'FAB-250 (6) | S-8 (80) | Vikhr (12)',[['AirBombLauncher','80mmLauncher','VikhrLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','12Rnd_Vikhr_KA50']]],
[17600,'S-8 (80) | Kh-29 (6)',[['80mmLauncher','Ch29Launcher_Su34'],['40Rnd_S8T','40Rnd_S8T','6Rnd_Ch29']]],
[18000,'FAB-250 (6) | S-8 (80) | Kh-29 (4)',[['AirBombLauncher','80mmLauncher','Ch29Launcher_Su34'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','4Rnd_Ch29']]],
[18800,'FAB-250 (18) | S-8 (40) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12']]],
[19000,'FAB-250 (6) | S-8 (40) | Vikhr (12) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','VikhrLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','12Rnd_Vikhr_KA50','2Rnd_GBU12']]],
[19800,'FAB-250 (18) | GBU-12 (4)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12']]],
[20000,'FAB-250 (6) | Vikhr (12) | GBU-12 (4)',[['AirBombLauncher','VikhrLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','12Rnd_Vikhr_KA50','2Rnd_GBU12','2Rnd_GBU12']]],
[20400,'S-8 (120) | Vikhr (12)',[['80mmLauncher','VikhrLauncher'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','12Rnd_Vikhr_KA50']]],
[20600,'S-8 (40) | Kh-29 (6) | GBU-12 (2)',[['80mmLauncher','Ch29Launcher_Su34','BombLauncherF35'],['40Rnd_S8T','6Rnd_Ch29','2Rnd_GBU12']]],
[21000,'FAB-250 (6) | S-8 (40) | Kh-29 (4) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','4Rnd_Ch29','2Rnd_GBU12']]],
[21200,'FAB-250 (12) | S-8 (120)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[21600,'Kh-29 (6) | GBU-12 (4)',[['Ch29Launcher_Su34','BombLauncherF35'],['6Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[22000,'FAB-250 (6) | Kh-29 (4) | GBU-12 (4)',[['AirBombLauncher','Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[22400,'S-8 (120) | Kh-29 (4)',[['80mmLauncher','Ch29Launcher_Su34'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','4Rnd_Ch29']]],
[23400,'S-8 (80) | Vikhr (12) | GBU-12 (2)',[['80mmLauncher','VikhrLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','12Rnd_Vikhr_KA50','2Rnd_GBU12']]],
[24200,'FAB-250 (12) | S-8 (80) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[25400,'S-8 (80) | Kh-29 (4) | GBU-12 (2)',[['80mmLauncher','Ch29Launcher_Su34','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','4Rnd_Ch29','2Rnd_GBU12']]],
[25400,'S-8 (40) | Vikhr (12) | GBU-12 (4)',[['80mmLauncher','VikhrLauncher','BombLauncherF35'],['40Rnd_S8T','12Rnd_Vikhr_KA50','2Rnd_GBU12','2Rnd_GBU12']]],
[26200,'FAB-250 (12) | S-8 (40) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[26400,'Vikhr (12) | GBU-12 (6)',[['VikhrLauncher','BombLauncherF35'],['12Rnd_Vikhr_KA50','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[26600,'FAB-250 (6) | S-8 (160)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[27200,'FAB-250 (12) | GBU-12 (6)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[27400,'S-8 (40) | Kh-29 (4) | GBU-12 (4)',[['80mmLauncher','Ch29Launcher_Su34','BombLauncherF35'],['40Rnd_S8T','4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12']]],
[28400,'Kh-29 (4) | GBU-12 (6)',[['Ch29Launcher_Su34','BombLauncherF35'],['4Rnd_Ch29','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[29600,'FAB-250 (6) | S-8 (120) | GBU-12 (2)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[31000,'S-8 (200)',[['80mmLauncher'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T']]],
[31600,'FAB-250 (6) | S-8 (80) | GBU-12 (4)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[33600,'FAB-250 (6) | S-8 (40) | GBU-12 (6)',[['AirBombLauncher','80mmLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[34000,'S-8 (160) | GBU-12 (2)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12']]],
[34600,'FAB-250 (6) | GBU-12 (8)',[['AirBombLauncher','BombLauncherF35'],['4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[36000,'S-8 (120) | GBU-12 (4)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12']]],
[38000,'S-8 (80) | GBU-12 (6)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]],
[40000,'S-8 (40) | GBU-12 (8)',[['80mmLauncher','BombLauncherF35'],['40Rnd_S8T','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// L-39 [AF3] - 4 pylons
_easaVehi = _easaVehi + ['L39_TK_EP1'];
_easaDefault = _easaDefault +
[[['R73Launcher_2','57mmLauncher'],['2Rnd_R73','64Rnd_57mm']]];
_easaLoadout = _easaLoadout + [
[
[2200,'FAB-250 (12)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]],
[3000,'S-5 (128)',[['57mmLauncher'],['64Rnd_57mm','64Rnd_57mm']]],
[3400,'Ataka-V (8)',[['AT9Launcher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]],
[3600,'FAB-250 (6) | S-5 (64)',[['AirBombLauncher','57mmLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250','64Rnd_57mm']]],
[3800,'R-73 (4)',[['R73Launcher_2'],['2Rnd_R73','2Rnd_R73']]],
[3800,'FAB-250 (6) | Ataka-V (4)',[['AirBombLauncher','AT9Launcher'],['4Rnd_FAB_250','2Rnd_FAB_250','4Rnd_AT9_Mi24P']]],
[4000,'R-73 (2) | FAB-250 (6)',[['R73Launcher_2','AirBombLauncher'],['2Rnd_R73','4Rnd_FAB_250','2Rnd_FAB_250']]],
[4200,'S-5 (64) | Ataka-V (4)',[['57mmLauncher','AT9Launcher'],['64Rnd_57mm','4Rnd_AT9_Mi24P']]],
[4400,'DEFAULT | R-73 (2) | S-5 (64)',[['R73Launcher_2','57mmLauncher'],['2Rnd_R73','64Rnd_57mm']]],
[4600,'R-73 (2) | Ataka-V (4)',[['R73Launcher_2','AT9Launcher'],['2Rnd_R73','4Rnd_AT9_Mi24P']]]
]
];


// F-35B [AF5] - 6 pylons
_easaVehi = _easaVehi + ['F35B'];
_easaDefault = _easaDefault +
[[['BombLauncherF35','SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10']]];
_easaLoadout = _easaLoadout + [
[
[4600,'AGM-65 (6)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[5200,'AIM-9L (6)',[['SidewinderLaucher_F35'],['2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35']]],
[5800,'AIM-9L (2) | AGM-65 (4)',[['SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_Sidewinder_F35','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[6000,'AIM-9L (4) | AGM-65 (2)',[['SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10']]],
[12400,'GBU-12 (2) | AGM-65 (4)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[12800,'GBU-12 (2) | AIM-9L (4)',[['BombLauncherF35','SidewinderLaucher_F35'],['2Rnd_GBU12','2Rnd_Sidewinder_F35','2Rnd_Sidewinder_F35']]],
[13600,'DEFAULT | GBU-12 (2) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher_F35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_F35','2Rnd_Maverick_A10']]],
[19200,'GBU-12 (4) | AGM-65 (2)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10']]],
[19400,'GBU-12 (4) | AIM-9L (2)',[['BombLauncherF35','SidewinderLaucher_F35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_F35']]],
[25000,'GBU-12 (6)',[['BombLauncherF35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// L-159 [AF3] - 6 pylons
_easaVehi = _easaVehi + ['L159_ACR'];
_easaDefault = _easaDefault +
[[['SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]];
_easaLoadout = _easaLoadout + [
[
[2800,'MK-82 (18)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[4000,'Hydra (114)',[['FFARLauncher'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[4200,'Hydra (38) | MK-82 (12)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[4400,'AGM-65 (2) | MK-82 (12)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[4600,'AIM-9L (2) | MK-82 (12)',[['SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82']]],
[4600,'AGM-65 (6)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[4600,'Hydra (76) | MK-82 (6)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[5000,'AGM-65 (4) | MK-82 (6)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[5200,'AGM-65 (2) | Hydra (76)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','38Rnd_FFAR','38Rnd_FFAR']]],
[5400,'AIM-9L (4) | MK-82 (6)',[['SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[5400,'AIM-9L (2) | Hydra (76)',[['SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','38Rnd_FFAR']]],
[5400,'AGM-65 (4) | Hydra (38)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],
[5800,'AIM-9L (4) | Hydra (38)',[['SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
[5800,'AIM-9L (2) | AGM-65 (4)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[5800,'AGM-65 (2) | Hydra (38) | MK-82 (6)',[['MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','38Rnd_FFAR','6Rnd_Mk82']]],
[6000,'AIM-9L (4) | AGM-65 (2)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[6000,'AIM-9L (2) | Hydra (38) | MK-82 (6)',[['SidewinderLaucher_AH1Z','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','6Rnd_Mk82']]],
[6200,'AIM-9L (2) | AGM-65 (2) | MK-82 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[6600,'DEFAULT | AIM-9L (2) | AGM-65 (2) | Hydra (38)',[['SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]]
]
];


// A-10A [AF3] - 4 pylons
_easaVehi = _easaVehi + ['A10'];
_easaDefault = _easaDefault +
[[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','6Rnd_Mk82']]];
_easaLoadout = _easaLoadout + [
[
[2200,'MK-82 (12)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82']]],
[3000,'Hydra (76)',[['FFARLauncher'],['38Rnd_FFAR','38Rnd_FFAR']]],
[3000,'MK-82 (6) | Stinger (2)',[['Mk82BombLauncher_6','StingerLauncher_twice'],['6Rnd_Mk82','2Rnd_Stinger']]],
[3400,'Hydra (38) | Stinger (2)',[['FFARLauncher','StingerLauncher_twice'],['38Rnd_FFAR','2Rnd_Stinger']]],
[3600,'DEFAULT | Hydra (38) | MK-82 (6)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','6Rnd_Mk82']]]
]
];


// A-10C [AF4] - 8 pylons
_easaVehi = _easaVehi + ['A10_US_EP1'];
_easaDefault = _easaDefault +
[[['SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR','6Rnd_Mk82']]];
_easaLoadout = _easaLoadout + [
[
[3400,'MK-82 (24)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[4800,'Hydra (38) | MK-82 (18)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[5000,'AGM-65 (2) | MK-82 (18)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[5000,'Hydra (152)',[['FFARLauncher'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[5200,'AIM-9L (2) | MK-82 (18)',[['SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[5200,'Hydra (76) | MK-82 (12)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[5600,'AGM-65 (4) | MK-82 (12)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[5600,'Hydra (114) | MK-82 (6)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[5800,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[6200,'AGM-65 (6) | MK-82 (6)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[6200,'AGM-65 (2) | Hydra (114)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[6400,'AIM-9L (2) | Hydra (114)',[['SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[6400,'AGM-65 (4) | Hydra (76)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR','38Rnd_FFAR']]],
[6400,'AGM-65 (2) | Hydra (38) | MK-82 (12)',[['MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[6600,'AIM-9L (2) | Hydra (38) | MK-82 (12)',[['SidewinderLaucher_AH1Z','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[6600,'AGM-65 (6) | Hydra (38)',[['MaverickLauncher','FFARLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],
[6800,'AIM-9L (2) | AGM-65 (2) | MK-82 (12)',[['SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[6800,'AGM-65 (2) | Hydra (76) | MK-82 (6)',[['MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[7000,'AIM-9L (2) | AGM-65 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[7000,'AIM-9L (2) | Hydra (76) | MK-82 (6)',[['SidewinderLaucher_AH1Z','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[7000,'AGM-65 (4) | Hydra (38) | MK-82 (6)',[['MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR','6Rnd_Mk82']]],
[7400,'AIM-9L (2) | AGM-65 (4) | MK-82 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[7600,'AIM-9L (2) | AGM-65 (2) | Hydra (76)',[['SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR','38Rnd_FFAR']]],
[7800,'AIM-9L (2) | AGM-65 (4) | Hydra (38)',[['SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],
[8200,'DEFAULT | AIM-9L (2) | AGM-65 (2) | Hydra (38) | MK-82 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR','6Rnd_Mk82']]],
[11800,'GBU-12 (2) | MK-82 (18)',[['BombLauncherF35','Mk82BombLauncher_6'],['2Rnd_GBU12','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[13000,'GBU-12 (2) | Hydra (114)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[13200,'GBU-12 (2) | Hydra (38) | MK-82 (12)',[['BombLauncherF35','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[13400,'GBU-12 (2) | AGM-65 (2) | MK-82 (12)',[['BombLauncherF35','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[13600,'GBU-12 (2) | AIM-9L (2) | MK-82 (12)',[['BombLauncherF35','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82']]],
[13600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[13600,'GBU-12 (2) | Hydra (76) | MK-82 (6)',[['BombLauncherF35','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[14000,'GBU-12 (2) | AGM-65 (4) | MK-82 (6)',[['BombLauncherF35','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[14200,'GBU-12 (2) | AGM-65 (2) | Hydra (76)',[['BombLauncherF35','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','38Rnd_FFAR','38Rnd_FFAR']]],
[14400,'GBU-12 (2) | AIM-9L (2) | Hydra (76)',[['BombLauncherF35','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','38Rnd_FFAR']]],
[14400,'GBU-12 (2) | AGM-65 (4) | Hydra (38)',[['BombLauncherF35','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','38Rnd_FFAR']]],
[14800,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[14800,'GBU-12 (2) | AGM-65 (2) | Hydra (38) | MK-82 (6)',[['BombLauncherF35','MaverickLauncher','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Maverick_A10','38Rnd_FFAR','6Rnd_Mk82']]],
[15000,'GBU-12 (2) | AIM-9L (2) | Hydra (38) | MK-82 (6)',[['BombLauncherF35','SidewinderLaucher_AH1Z','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR','6Rnd_Mk82']]],
[15200,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | MK-82 (6)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[15600,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | Hydra (38)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','38Rnd_FFAR']]],
[19200,'GBU-12 (4) | MK-82 (12)',[['BombLauncherF35','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','6Rnd_Mk82','6Rnd_Mk82']]],
[20000,'GBU-12 (4) | Hydra (76)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR']]],
[20400,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[20600,'GBU-12 (4) | Hydra (38) | MK-82 (6)',[['BombLauncherF35','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR','6Rnd_Mk82']]],
[20800,'GBU-12 (4) | AGM-65 (2) | MK-82 (6)',[['BombLauncherF35','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[21000,'GBU-12 (4) | AIM-9L (2) | MK-82 (6)',[['BombLauncherF35','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[21200,'GBU-12 (4) | AGM-65 (2) | Hydra (38)',[['BombLauncherF35','MaverickLauncher','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10','38Rnd_FFAR']]],
[21400,'GBU-12 (4) | AIM-9L (2) | Hydra (38)',[['BombLauncherF35','SidewinderLaucher_AH1Z','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','38Rnd_FFAR']]],
[21600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[26600,'GBU-12 (6) | MK-82 (6)',[['BombLauncherF35','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','6Rnd_Mk82']]],
[27000,'GBU-12 (6) | Hydra (38)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR']]],
[27200,'GBU-12 (6) | AGM-65 (2)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10']]],
[27400,'GBU-12 (6) | AIM-9L (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z']]],
[33000,'GBU-12 (8)',[['BombLauncherF35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// AV8B (LGB) [AF4] - 8 pylons
_easaVehi = _easaVehi + ['AV8B'];
_easaDefault = _easaDefault +
[[['GAU12','BombLauncherF35'],['300Rnd_25mm_GAU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]];
_easaLoadout = _easaLoadout + [
[
[3000,'GBU-12 (6) | Hydra (38)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR']]],
[9000,'GBU-12 (8)',[['BombLauncherF35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// AV8B [AF5] - 8 pylons
_easaVehi = _easaVehi + ['AV8B2'];
_easaDefault = _easaDefault +
[[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]];
_easaLoadout = _easaLoadout + [
[
[3400,'MK-82 (24)',[['Mk82BombLauncher_6'],['6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[4800,'Hydra (38) | MK-82 (18)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[5000,'Hydra (152)',[['FFARLauncher'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[5000,'AGM-65 (2) | MK-82 (18)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[5200,'Hydra (76) | MK-82 (12)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[5200,'AIM-9L (2) | MK-82 (18)',[['SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[5600,'Hydra (114) | MK-82 (6)',[['FFARLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[5600,'AGM-65 (4) | MK-82 (12)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[5800,'AGM-65 (8)',[['MaverickLauncher'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[6000,'AIM-9L (4) | MK-82 (12)',[['SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82']]],
[6200,'Hydra (114) | AGM-65 (2)',[['FFARLauncher','MaverickLauncher'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR','2Rnd_Maverick_A10']]],
[6200,'AGM-65 (6) | MK-82 (6)',[['MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[6400,'Hydra (114) | AIM-9L (2)',[['FFARLauncher','SidewinderLaucher_AH1Z'],['38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z']]],
[6400,'Hydra (76) | AGM-65 (4)',[['FFARLauncher','MaverickLauncher'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[6400,'Hydra (38) | AGM-65 (2) | MK-82 (12)',[['FFARLauncher','MaverickLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[6600,'Hydra (38) | AIM-9L (2) | MK-82 (12)',[['FFARLauncher','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82']]],
[6600,'Hydra (38) | AGM-65 (6)',[['FFARLauncher','MaverickLauncher'],['38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[6800,'Hydra (76) | AIM-9L (4)',[['FFARLauncher','SidewinderLaucher_AH1Z'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
[6800,'Hydra (76) | AGM-65 (2) | MK-82 (6)',[['FFARLauncher','MaverickLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[6800,'AIM-9L (2) | AGM-65 (2) | MK-82 (12)',[['SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[7000,'Hydra (76) | AIM-9L (2) | MK-82 (6)',[['FFARLauncher','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[7000,'Hydra (38) | AGM-65 (4) | MK-82 (6)',[['FFARLauncher','MaverickLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[7000,'DEFAULT | AIM-9L (2) | AGM-65 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[7200,'AIM-9L (4) | AGM-65 (4)',[['SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[7400,'Hydra (38) | AIM-9L (4) | MK-82 (6)',[['FFARLauncher','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[7400,'AIM-9L (2) | AGM-65 (4) | MK-82 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[7600,'Hydra (76) | AIM-9L (2) | AGM-65 (2)',[['FFARLauncher','SidewinderLaucher_AH1Z','MaverickLauncher'],['38Rnd_FFAR','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[7600,'AIM-9L (4) | AGM-65 (2) | MK-82 (6)',[['SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[7800,'Hydra (38) | AIM-9L (2) | AGM-65 (4)',[['FFARLauncher','SidewinderLaucher_AH1Z','MaverickLauncher'],['38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[8000,'Hydra (38) | AIM-9L (4) | AGM-65 (2)',[['FFARLauncher','SidewinderLaucher_AH1Z','MaverickLauncher'],['38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[8200,'Hydra (38) | AIM-9L (2) | AGM-65 (2) | MK-82 (6)',[['FFARLauncher','SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[11800,'GBU-12 (2) | MK-82 (18)',[['BombLauncherF35','Mk82BombLauncher_6'],['2Rnd_GBU12','6Rnd_Mk82','6Rnd_Mk82','6Rnd_Mk82']]],
[13000,'GBU-12 (2) | Hydra (114)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR','38Rnd_FFAR']]],
[13200,'GBU-12 (2) | Hydra (38) | MK-82 (12)',[['BombLauncherF35','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','38Rnd_FFAR','6Rnd_Mk82','6Rnd_Mk82']]],
[13400,'GBU-12 (2) | AGM-65 (2) | MK-82 (12)',[['BombLauncherF35','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Maverick_A10','6Rnd_Mk82','6Rnd_Mk82']]],
[13600,'GBU-12 (2) | Hydra (76) | MK-82 (6)',[['BombLauncherF35','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR','6Rnd_Mk82']]],
[13600,'GBU-12 (2) | AIM-9L (2) | MK-82 (12)',[['BombLauncherF35','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82','6Rnd_Mk82']]],
[13600,'GBU-12 (2) | AGM-65 (6)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[14000,'GBU-12 (2) | AGM-65 (4) | MK-82 (6)',[['BombLauncherF35','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[14200,'GBU-12 (2) | Hydra (76) | AGM-65 (2)',[['BombLauncherF35','FFARLauncher','MaverickLauncher'],['2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR','2Rnd_Maverick_A10']]],
[14400,'GBU-12 (2) | Hydra (76) | AIM-9L (2)',[['BombLauncherF35','FFARLauncher','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z']]],
[14400,'GBU-12 (2) | Hydra (38) | AGM-65 (4)',[['BombLauncherF35','FFARLauncher','MaverickLauncher'],['2Rnd_GBU12','38Rnd_FFAR','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[14400,'GBU-12 (2) | AIM-9L (4) | MK-82 (6)',[['BombLauncherF35','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[14800,'GBU-12 (2) | Hydra (38) | AIM-9L (4)',[['BombLauncherF35','FFARLauncher','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
[14800,'GBU-12 (2) | Hydra (38) | AGM-65 (2) | MK-82 (6)',[['BombLauncherF35','FFARLauncher','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','38Rnd_FFAR','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[14800,'GBU-12 (2) | AIM-9L (2) | AGM-65 (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[15000,'GBU-12 (2) | Hydra (38) | AIM-9L (2) | MK-82 (6)',[['BombLauncherF35','FFARLauncher','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_GBU12','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[15000,'GBU-12 (2) | AIM-9L (4) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[15200,'GBU-12 (2) | AIM-9L (2) | AGM-65 (2) | MK-82 (6)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[15600,'GBU-12 (2) | Hydra (38) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherF35','FFARLauncher','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[19200,'GBU-12 (4) | MK-82 (12)',[['BombLauncherF35','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','6Rnd_Mk82','6Rnd_Mk82']]],
[20000,'GBU-12 (4) | Hydra (76)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR','38Rnd_FFAR']]],
[20400,'GBU-12 (4) | AGM-65 (4)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10','2Rnd_Maverick_A10']]],
[20600,'GBU-12 (4) | Hydra (38) | MK-82 (6)',[['BombLauncherF35','FFARLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR','6Rnd_Mk82']]],
[20800,'GBU-12 (4) | AIM-9L (4)',[['BombLauncherF35','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Sidewinder_AH1Z']]],
[20800,'GBU-12 (4) | AGM-65 (2) | MK-82 (6)',[['BombLauncherF35','MaverickLauncher','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10','6Rnd_Mk82']]],
[21000,'GBU-12 (4) | AIM-9L (2) | MK-82 (6)',[['BombLauncherF35','SidewinderLaucher_AH1Z','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','6Rnd_Mk82']]],
[21200,'GBU-12 (4) | Hydra (38) | AGM-65 (2)',[['BombLauncherF35','FFARLauncher','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR','2Rnd_Maverick_A10']]],
[21400,'GBU-12 (4) | Hydra (38) | AIM-9L (2)',[['BombLauncherF35','FFARLauncher','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR','2Rnd_Sidewinder_AH1Z']]],
[21600,'GBU-12 (4) | AIM-9L (2) | AGM-65 (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z','2Rnd_Maverick_A10']]],
[26600,'GBU-12 (6) | MK-82 (6)',[['BombLauncherF35','Mk82BombLauncher_6'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','6Rnd_Mk82']]],
[27000,'GBU-12 (6) | Hydra (38)',[['BombLauncherF35','FFARLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','38Rnd_FFAR']]],
[27200,'GBU-12 (6) | AGM-65 (2)',[['BombLauncherF35','MaverickLauncher'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_Maverick_A10']]],
[27400,'GBU-12 (6) | AIM-9L (2)',[['BombLauncherF35','SidewinderLaucher_AH1Z'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_Sidewinder_AH1Z']]],
[33000,'GBU-12 (8)',[['BombLauncherF35'],['2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12','2Rnd_GBU12']]]
]
];


// Mi-24V (CZ) [AF3] - 2 pylons
_easaVehi = _easaVehi + ['Mi24_D_CZ_ACR'];
_easaDefault = _easaDefault +
[[['AT9Launcher','80mmLauncher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','40Rnd_S8T']]];
_easaLoadout = _easaLoadout + [
[
[5800,'Stinger (2)',[['StingerLauncher_twice'],['2Rnd_Stinger']]]
]
];


// AH-64A [AF3] - 2 pylons
_easaVehi = _easaVehi + ['AH64D'];
_easaDefault = _easaDefault +
[[['TOWLauncherSingle'],['6Rnd_TOW2']]];
_easaLoadout = _easaLoadout + [
[
[5800,'Stinger (2)',[['StingerLauncher_twice'],['2Rnd_Stinger']]]
]
];


// AH-64D (Longbow) [AF4] - 4 pylons
_easaVehi = _easaVehi + ['AH64D_EP1'];
_easaDefault = _easaDefault +
[[['HellfireLauncher'],['8Rnd_Hellfire']]];
_easaLoadout = _easaLoadout + [
[
[6800,'AGM-114 (8) | Stinger (2)',[['HellfireLauncher','StingerLauncher_twice'],['8Rnd_Hellfire','2Rnd_Stinger']]]
]
];


// Apache AH1 [AF4] - 4 pylons
_easaVehi = _easaVehi + ['BAF_Apache_AH1_D'];
_easaDefault = _easaDefault +
[[['HellfireLauncher'],['8Rnd_Hellfire']]];
_easaLoadout = _easaLoadout + [
[
[6800,'AGM-114 (8) | Stinger (2)',[['HellfireLauncher','StingerLauncher_twice'],['8Rnd_Hellfire','2Rnd_Stinger']]]
]
];


// AH-1Z [AF5] - 4 pylons
_easaVehi = _easaVehi + ['AH1Z'];
_easaDefault = _easaDefault +
[[['HellfireLauncher'],['8Rnd_Hellfire','8Rnd_Hellfire']]];
_easaLoadout = _easaLoadout + [
[
[1000,'DEFAULT | AGM-114 (16)',[['HellfireLauncher'],['8Rnd_Hellfire','8Rnd_Hellfire']]],
[9000,'AIM-9L (2) | AGM-114 (8)',[['SidewinderLaucher_F35','HellfireLauncher'],['2Rnd_Sidewinder_F35','8Rnd_Hellfire']]]
]
];


// Wildcat AH11 [AF3] - 4 pylons
_easaVehi = _easaVehi + ['AW159_Lynx_BAF'];
_easaDefault = _easaDefault +
[[['SpikeLauncher_ACR','CTWS','CRV7_HEPD'],['2Rnd_Spike_ACR','2Rnd_Spike_ACR','200Rnd_40mmHE_FV510','200Rnd_40mmHE_FV510','200Rnd_40mmSABOT_FV510','200Rnd_40mmSABOT_FV510','6Rnd_CRV7_HEPD','6Rnd_CRV7_HEPD']]];
_easaLoadout = _easaLoadout + [
[
[1000,'Spike (4)',[['SpikeLauncher_ACR'],['2Rnd_Spike_ACR','2Rnd_Spike_ACR']]],
[4800,'Spike (2) | Stinger (2)',[['SpikeLauncher_ACR','StingerLauncher_twice'],['2Rnd_Spike_ACR','2Rnd_Stinger']]],
[10600,'Stinger (4)',[['StingerLauncher_twice'],['2Rnd_Stinger','2Rnd_Stinger']]]
]
];


// Mi-24V [AF3] - 2 pylons
_easaVehi = _easaVehi + ['Mi24_V'];
_easaDefault = _easaDefault +
[[['AT9Launcher','80mmLauncher'],['4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','40Rnd_S8T','40Rnd_S8T']]];
_easaLoadout = _easaLoadout + [
[
[5800,'Igla-V (2)',[['Igla_twice'],['2Rnd_Igla']]]
]
];


// Mi-24P [AF3] - 2 pylons
_easaVehi = _easaVehi + ['Mi24_P'];
_easaDefault = _easaDefault +
[[['AT9Launcher','80mmLauncher','AirBombLauncher'],['4Rnd_AT9_Mi24P','40Rnd_S8T','2Rnd_FAB_250']]];
_easaLoadout = _easaLoadout + [
[
[1600,'FAB-250 (6)',[['AirBombLauncher'],['4Rnd_FAB_250','2Rnd_FAB_250']]],
[5800,'Igla-V (2)',[['Igla_twice'],['2Rnd_Igla']]]
]
];


// Ka-52 [AF4] - 2 pylons
_easaVehi = _easaVehi + ['Ka52'];
_easaDefault = _easaDefault +
[[['80mmLauncher','AT9Launcher'],['40Rnd_S8T','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P','4Rnd_AT9_Mi24P']]];
_easaLoadout = _easaLoadout + [
[
[5800,'Igla-V (2)',[['Igla_twice'],['2Rnd_Igla']]]
]
];


// Ka-52 (Black) [AF5] - 2 pylons
_easaVehi = _easaVehi + ['Ka52'];
_easaDefault = _easaDefault +
[[['80mmLauncher','VikhrLauncher'],['40Rnd_S8T','12Rnd_Vikhr_KA50']]];
_easaLoadout = _easaLoadout + [
[
[8000,'R-73 (2)',[['R73Launcher_2'],['2Rnd_R73']]]
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