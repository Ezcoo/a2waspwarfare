Private ["_m","_side","_u"];

_side = _this;

//--- Loadout - Magazines.
_m = ['5Rnd_127x99_AS50'];
_m = _m + ['5Rnd_86x70_L115A1'];
_m = _m + ['30Rnd_556x45_Stanag'];
_m = _m + ['30Rnd_556x45_StanagSD'];
_m = _m + ['100Rnd_762x51_M240'];
_m = _m + ['200Rnd_556x45_L110A1'];
_m = _m + ['NLAW'];
_m = _m + ['Laserbatteries'];
_m = _m + ['BAF_L109A1_HE'];
_m = _m + ['15Rnd_9x19_M9'];
_m = _m + ['15Rnd_9x19_M9SD'];
_m = _m + ['7Rnd_45ACP_1911'];
_m = _m + ['17Rnd_9x19_glock17'];
_m = _m + ['HandGrenade_West'];
_m = _m + ['HandGrenade_Stone'];
_m = _m + ['IR_Strobe_Target'];
_m = _m + ['IR_Strobe_Marker'];
_m = _m + ['SmokeShell'];
_m = _m + ['SmokeShellRed'];
_m = _m + ['SmokeShellGreen'];
_m = _m + ['SmokeShellBlue'];
_m = _m + ['SmokeShellYellow'];
_m = _m + ['SmokeShellOrange'];
_m = _m + ['SmokeShellPurple'];
_m = _m + ['FlareWhite_M203'];
_m = _m + ['FlareYellow_M203'];
_m = _m + ['FlareGreen_M203'];
_m = _m + ['FlareRed_M203'];
_m = _m + ['1Rnd_HE_M203'];
_m = _m + ['1Rnd_Smoke_M203'];
_m = _m + ['1Rnd_SmokeRed_M203'];
_m = _m + ['1Rnd_SmokeGreen_M203'];
_m = _m + ['1Rnd_SmokeYellow_M203'];
_m = _m + ['Mine'];
_m = _m + ['PipeBomb'];

_m = [_m, _side] Call Compile preprocessFile "Common\Config\Config_SortMagazines.sqf";

//--- Loadout - Weapons.
_u = ['BAF_AS50_scoped'];
_u = _u + ['BAF_AS50_TWS'];
_u = _u + ['BAF_LRR_scoped'];
_u = _u + ['BAF_LRR_scoped_W'];
_u = _u + ['BAF_L85A2_RIS_Holo'];
_u = _u + ['BAF_L85A2_UGL_Holo'];
_u = _u + ['BAF_L85A2_RIS_SUSAT'];
_u = _u + ['BAF_L85A2_UGL_SUSAT'];
_u = _u + ['BAF_L85A2_RIS_ACOG'];
_u = _u + ['BAF_L85A2_UGL_ACOG'];
_u = _u + ['BAF_L85A2_RIS_CWS'];
_u = _u + ['BAF_L86A2_ACOG'];
_u = _u + ['BAF_L110A1_Aim'];
_u = _u + ['BAF_L7A2_GPMG'];
_u = _u + ['BAF_NLAW_Launcher'];
_u = _u + ['Laserdesignator'];
_u = _u + ['Colt1911'];
_u = _u + ['M9'];
_u = _u + ['M9SD'];
_u = _u + ['glock17_EP1'];
_u = _u + ['Binocular'];
_u = _u + ['NVGoggles'];
_u = _u + ['Binocular_Vector'];
_u = _u + ['BAF_AssaultPack_ARAmmo'];
_u = _u + ['BAF_AssaultPack_ATAmmo'];
_u = _u + ['BAF_AssaultPack_FAC'];
_u = _u + ['BAF_AssaultPack_HAAAmmo'];
_u = _u + ['BAF_AssaultPack_HATAmmo'];
_u = _u + ['BAF_AssaultPack_LRRAmmo'];
_u = _u + ['BAF_AssaultPack_MGAmmo'];
_u = _u + ['BAF_AssaultPack_RifleAmmo'];
_u = _u + ['BAF_AssaultPack_special'];
_u = _u + ['Tripod_Bag'];
_u = _u + ['BAF_L2A1_ACOG_minitripod_bag'];
_u = _u + ['BAF_L2A1_ACOG_tripod_bag'];
_u = _u + ['BAF_GPMG_Minitripod_D_bag'];
_u = _u + ['BAF_GMG_ACOG_minitripod_bag'];

[_u, _m, _side] Call Compile preprocessFile "Common\Config\Config_SortWeapons.sqf";

//--- Loadout - Templates (note that backpacks content require the weapons to be first), use -1 to use the default BP content.
_u 		= [[[],[[],[]]]];

[_u, _side] Call Compile preprocessFile "Common\Config\Config_SetTemplates.sqf";