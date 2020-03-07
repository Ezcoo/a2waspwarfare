Private ["_ammo","_easaDefault","_easaLoadout","_easaVehi","_is_AAMissile","_loadout","_loadout_line","_vehicle"];

EASA_Equip = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_Equip.sqf';
EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\Module\EASA\EASA_RemoveLoadout.sqf';

_easaDefault = [];
_easaLoadout = [];
_easaVehi = [];

/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */
_easaVehi = 	_easaVehi + ['I44_Plane_G_Bf109F2_SC50_WL'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']]];
_easaLoadout = 	_easaLoadout + [
 [
 [[1200],['SC-250 (1)'],['I44_BombLauncherSC250','I44_Bomb_SC250']],
 [[1000],['SC-50 (4)'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_G_Bf109F2_SC250_WL'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherSC250','I44_Bomb_SC250']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[1000],['SC_50 (4)'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']],
  [[1200],['SC_250 (1)'],['I44_BombLauncherSC250','I44_Bomb_SC250']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_G_Me262A_WL'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncher_Me262','2Rnd_GP_250']]];
_easaLoadout = 	_easaLoadout + [
 [
 [[3700],['Rockets R4M (24)'],['I44_R4M_Launcher','I44_R4M_mag']],
 [[2700],['SC-250 (2)'],['I44_BombLauncher_Me262','2Rnd_GP_250']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_G_Me262_WL'];
_easaDefault = 	_easaDefault + [[['I44_R4M_Launcher','I44_R4M_mag']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2700],['SC-250 (2)'],['I44_BombLauncher_Me262','2Rnd_GP_250']],
  [[3700],['Rockets R4M (24)'],['I44_R4M_Launcher','I44_R4M_mag']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_G_Ju87_B_WL'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherSC250','I44_Bomb_SC250'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2700],['SC_250 (4)'],['I44_BombLauncherSC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250']],
  [[2200],['SC_50 (10)'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']],
  [[1800],['SC_250 (1) | SC_50 (5)'],['I44_BombLauncherSC250','I44_Bomb_SC250'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_G_Ju87_SC50_WL'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[1700],['SC_250 (4)'],['I44_BombLauncherSC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250']],
  [[1300],['SC_250 (1) | SC_50 (5)'],['I44_BombLauncherSC250','I44_Bomb_SC250'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']],
  [[1100],['SC_50 (10)'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_G_Ju87_SC250_WL'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherSC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[1100],['SC_250 (1) | SC_50 (5)'],['I44_BombLauncherSC250','I44_Bomb_SC250'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']],
  [[1300],['SC_50 (10)'],['I44_BombLauncherSC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50','I44_Bomb_SC50']],
  [[1700],['SC_250 (4)'],['I44_BombLauncherSC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250','I44_Bomb_SC250']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_P47'];
_easaDefault = 	_easaDefault + [[['I44_Rocket_LauncherHVAR','I44_HVAR_mag']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2800],['Bomb 500 (2)'],['I44_BombLauncher500','2Rnd_GP_500']],
  [[3200],['Rockets HVAR (10)'],['I44_Rocket_LauncherHVAR','I44_HVAR_mag']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_P47A'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncher500','2Rnd_GP_500']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3200],['Rockets HVAR (10)'],['I44_Rocket_LauncherHVAR','I44_HVAR_mag']],
  [[2800],['Bomb 500 (2)'],['I44_BombLauncher500','2Rnd_GP_500']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_A_P51D_250lb_AAF'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3200],['Rockets HVAR (10)'],['I44_RocketLauncher_127mm_HVAR','I44_10xRocket_127mm_HVAR']],
  [[2800],['Bomb57 (2)'],['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_A_P51D_HVAR_AAF'];
_easaDefault = 	_easaDefault + [[['I44_RocketLauncher_127mm_HVAR','I44_RocketLauncher_127mm_HVAR']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2800],['Bomb57 (2)'],['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']],
  [[3200],['Rockets HVAR (10)'],['I44_RocketLauncher_127mm_HVAR','I44_RocketLauncher_127mm_HVAR']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_A_P38_M64_AAF'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherM64','I44_Bomb_AN_M64','I44_Bomb_AN_M64','I44_Bomb_AN_M64','I44_Bomb_AN_M64']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3200],['Rockets HVAR (10)'],['I44_RocketLauncher_127mm_HVAR','I44_10xRocket_127mm_HVAR']],
  [[2800],['Bomb M64 (4)'],['I44_BombLauncherM64','I44_Bomb_AN_M64','I44_Bomb_AN_M64','I44_Bomb_AN_M64','I44_Bomb_AN_M64']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_A_P38_HVAR_AAF'];
_easaDefault = 	_easaDefault + [[['I44_RocketLauncher_127mm_HVAR','I44_RocketLauncher_127mm_HVAR']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2800],['Bomb M64 (4)'],['I44_BombLauncherM64','I44_Bomb_AN_M64','I44_Bomb_AN_M64','I44_Bomb_AN_M64','I44_Bomb_AN_M64']],
  [[3200],['Rockets HVAR (10)'],['I44_RocketLauncher_127mm_HVAR','I44_RocketLauncher_127mm_HVAR']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_B_HHmkIIa_M57_RAF'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2700],['Rockets HVAR (10)'],['I44_RocketLauncher_127mm_HVAR','I44_10xRocket_127mm_HVAR']],
  [[2200],['Bomb M57 (2)'],['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
_easaDefault = 	_easaDefault + [[['I44_RocketLauncher_127mm_HVAR','I44_RocketLauncher_127mm_HVAR']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2200],['Bomb M57 (2)'],['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']],
  [[2700],['Rockets HVAR (10)'],['I44_RocketLauncher_127mm_HVAR','I44_10xRocket_127mm_HVAR']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_B_SpitfireMk1a_M57_RAF'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3700],['Bomb M64 (1)'],['I44_BombLauncherM64','I44_Bomb_AN_M64']],
  [[3300],['Bomb M57 (2)'],['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherM64','I44_Bomb_AN_M64']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3300],['Bomb M57 (2)'],['I44_BombLauncherM57','I44_Bomb_AN_M57','I44_Bomb_AN_M57']],
  [[3700],['Bomb M64 (1)'],['I44_BombLauncherM64','I44_Bomb_AN_M64']]
 ]
];
 
_easaVehi = 	_easaVehi + ['I44_Plane_B_TyphoonMk1A_RAF'];
_easaDefault = 	_easaDefault + [[['I44_BombLauncherGP250','2Rnd_GP_250']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[3200],['Rockets 90lb (8)'],['I44_Rocket_Launcher','I44_90lb_mag']],
  [[2700],['Bomb 250 (2)'],['I44_BombLauncherGP250','2Rnd_GP_250']]
 ]
];

_easaVehi = 	_easaVehi + ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];
_easaDefault = 	_easaDefault + [[['I44_Rocket_Launcher','I44_90lb_mag']]];
_easaLoadout = 	_easaLoadout + [
 [
  [[2700],['Bomb 250 (2)'],['I44_BombLauncherGP250','2Rnd_GP_250']],
  [[3200],['Rockets 90lb (8)'],['I44_Rocket_Launcher','I44_90lb_mag']]
 ]
];
 
missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];
missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];
missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];