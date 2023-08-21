switch (typeOf _this) do
{
// Su-34 [AF5] - 10 pylons
case "Su34": {
    _this removeMagazine "4Rnd_R73";
    _this removeWeapon "R73Launcher";
    _this addMagazine "2Rnd_R73";
    _this addMagazine "2Rnd_R73";
    _this addWeapon "R73Launcher_2";
};

// Su-25A [AF3] - 6 pylons
case "Su25_Ins": {
    _this removeMagazine "4Rnd_FAB_250";
    _this removeMagazine "2Rnd_R73";
    _this removeMagazine "80Rnd_S8T";
    _this removeWeapon "R73Launcher_2";
    _this removeWeapon "S8Launcher";
    _this addMagazine "4Rnd_FAB_250";
    _this addMagazine "4Rnd_FAB_250";
    _this addMagazine "2Rnd_FAB_250";
    _this addMagazine "2Rnd_FAB_250";
    _this addMagazine "64Rnd_57mm";
    _this addWeapon "57mmLauncher";
};

// Su-25T [AF4] - 8 pylons
case "Su25_TK_EP1": {
    _this removeMagazine "4Rnd_FAB_250";
    _this removeMagazine "80Rnd_S8T";
    _this removeWeapon "AirBombLauncher";
    _this removeWeapon "80mmLauncher";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addMagazine "40Rnd_S8T";
    _this addWeapon "AT9Launcher";
    _this addWeapon "S8Launcher";
};

// Su-39 [AF5] - 10 pylons
case "Su39": {
    _this removeMagazine "4Rnd_FAB_250";
    _this removeMagazine "80Rnd_S8T";
    _this removeMagazine "4Rnd_Ch29";
    _this removeWeapon "AirBombLauncher";
    _this removeWeapon "80mmLauncher";
    _this removeWeapon "Ch29Launcher";
    _this addMagazine "12Rnd_Vikhr_KA50";
    _this addMagazine "40Rnd_S8T";
    _this addMagazine "40Rnd_S8T";
    _this addWeapon "VikhrLauncher";
    _this addWeapon "S8Launcher";
};

// L-39 [AF3] - 4 pylons
case "L39_TK_EP1": {
    _this addMagazine "2Rnd_R73";
    _this addMagazine "60Rnd_CMFlareMagazine";
    _this addWeapon "R73Launcher_2";
    _this addWeapon "CMFlareLauncher";
};

// F-35B [AF5] - 6 pylons
case "F35B": {
    _this addMagazine "2Rnd_Maverick_A10";
    _this addWeapon "MaverickLauncher";
};

// L-159 [AF3] - 6 pylons
case "L159_ACR": {
    _this removeMagazine "4Rnd_Maverick_L159";
    _this removeWeapon "MaverickLauncher_ACR";
    _this addMagazine "2Rnd_Maverick_A10";
    _this addMagazine "38Rnd_FFAR";
    _this addWeapon "MaverickLauncher";
    _this addWeapon "FFARLauncher";
};

// A-10A [AF3] - 4 pylons
case "A10": {
    _this removeMagazine "14Rnd_FFAR";
    _this removeMagazine "4Rnd_GBU12";
    _this removeMagazine "2Rnd_Sidewinder_AH1Z";
    _this removeMagazine "2Rnd_Maverick_A10";
    _this removeWeapon "FFARLauncher_14";
    _this removeWeapon "BombLauncherA10";
    _this removeWeapon "SidewinderLaucher_AH1Z";
    _this removeWeapon "MaverickLauncher";
    _this addMagazine "38Rnd_FFAR";
    _this addMagazine "6Rnd_Mk82";
    _this addWeapon "FFARLauncher";
    _this addWeapon "Mk82BombLauncher_6";
};

// A-10C [AF4] - 8 pylons
case "A10_US_EP1": {
    _this removeMagazine "14Rnd_FFAR";
    _this removeMagazine "4Rnd_GBU12";
    _this removeWeapon "FFARLauncher_14";
    _this removeWeapon "BombLauncherA10";
    _this addMagazine "38Rnd_FFAR";
    _this addMagazine "6Rnd_Mk82";
    _this addWeapon "FFARLauncher";
    _this addWeapon "Mk82BombLauncher_6";
};

// AV8B (LGB) [AF4] - 8 pylons
case "AV8B": {
    _this removeMagazine "6Rnd_GBU12_AV8B";
    _this removeWeapon "BombLauncher";
    _this addMagazine "2Rnd_GBU12";
    _this addMagazine "2Rnd_GBU12";
    _this addMagazine "2Rnd_GBU12";
    _this addWeapon "BombLauncherF35";
};

// AV8B [AF5] - 8 pylons
case "AV8B2": {
    _this removeMagazine "14Rnd_FFAR";
    _this removeMagazine "6Rnd_Mk82";
    _this removeWeapon "FFARLauncher_14";
    _this removeWeapon "Mk82BombLauncher_6";
    _this addMagazine "2Rnd_Maverick_A10";
    _this addMagazine "2Rnd_Maverick_A10";
    _this addMagazine "2Rnd_Maverick_A10";
    _this addWeapon "MaverickLauncher";
};

// Mi-24V (CZ) [AF3] - 4 pylons
case "Mi24_D_CZ_ACR": {
};

// AH-64D (TOW) [AF3] - 4 pylons
case "AH64D": {
    _this removeMagazine "8Rnd_Hellfire";
    _this removeWeapon "HellfireLauncher";
    _this addMagazine "6Rnd_TOW2";
    _this addWeapon "TOWLauncherSingle";
};

// AH-64D (Hellfire) [AF4] - 4 pylons
case "AH64D_EP1": {
};

// Apache AH1 [AF4] - 4 pylons
case "BAF_Apache_AH1_D": {
};

// AH-1Z [AF5] - 4 pylons
case "AH1Z": {
    _this removeMagazine "8Rnd_Hellfire";
    _this removeMagazine "2Rnd_Sidewinder_AH1Z";
    _this removeWeapon "SidewinderLaucher_AH1Z";
    _this addMagazine "8Rnd_Hellfire";
    _this addMagazine "8Rnd_Hellfire";
};

// Wildcat AH11 [AF3] - 4 pylons
case "AW159_Lynx_BAF": {
    _this addMagazine "2Rnd_Spike_ACR";
    _this addMagazine "2Rnd_Spike_ACR";
    _this addWeapon "SpikeLauncher_ACR";
    _this removeMagazineTurret ["12Rnd_CRV7", [-1]];
    _this removeMagazineTurret ["1200Rnd_20mm_M621", [-1]];
    _this removeWeaponTurret ["CRV7_PG", [-1]];
    _this removeWeaponTurret ["BAF_M621", [-1]];
    _this addMagazineTurret ["200Rnd_40mmHE_FV510", [-1]];
    _this addMagazineTurret ["200Rnd_40mmSABOT_FV510", [-1]];
    _this addMagazineTurret ["6Rnd_CRV7_HEPD", [-1]];
    _this addWeaponTurret ["CTWS", [-1]];
    _this addWeaponTurret ["CRV7_HEPD", [-1]];
};

// Mi-24V [AF3] - 6 pylons
case "Mi24_V": {
    _this removeMagazine "4Rnd_AT6_Mi24V";
    _this removeWeapon "AT6Launcher";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addWeapon "AT9Launcher";
};

// Mi-24P [AF3] - 4 pylons
case "Mi24_P": {
    _this removeMagazine "4Rnd_AT9_Mi24P";
    _this removeMagazine "4Rnd_AT9_Mi24P";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this removeMagazineTurret ["2Rnd_FAB_250", [-1]];
    _this removeMagazineTurret ["80Rnd_S8T", [-1]];
    _this removeWeaponTurret ["HeliBombLauncher", [-1]];
    _this removeWeaponTurret ["80mmLauncher", [-1]];
    _this addMagazineTurret ["750Rnd_30mm_GSh301", [-1]];
    _this addMagazineTurret ["750Rnd_30mm_GSh301", [-1]];
    _this addMagazineTurret ["64Rnd_57mm", [-1]];
    _this addWeaponTurret ["57mmLauncher", [-1]];
};

// Mi-24D [AF3] - 2 pylons
case "Mi24_D_TK_EP1": {
    _this removeMagazineTurret ["128Rnd_57mm", [-1]];
    _this addMagazineTurret ["64Rnd_57mm", [-1]];
};

// Ka-52 [AF4] - 8 pylons
case "Ka52": {
    _this removeMagazine "12Rnd_Vikhr_KA50";
    _this removeWeapon "VikhrLauncher";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addMagazine "4Rnd_AT9_Mi24P";
    _this addWeapon "AT9Launcher";
};

// Ka-52 (Black) [AF5] - 4 pylons
case "Ka52Black": {
};

// M6 Linebacker [HF4]
case "M6_EP1": {
    _this removeMagazine "4Rnd_Stinger";
    _this removeMagazine "4Rnd_Stinger";
    _this removeMagazine "4Rnd_Stinger";
    _this removeWeapon "StingerLaucher_4x";
    _this addMagazine "8Rnd_9M311";
    _this addWeapon "9M311Laucher";
};

// An-2 [AF1] - 10 pylons
case "An2_TK_EP1": {
    _this addMagazine "60Rnd_CMFlareMagazine";
    _this addMagazine "500Rnd_TwinVickers";
    _this addMagazine "500Rnd_TwinVickers";
    _this addMagazine "4Rnd_FAB_250";
    _this addWeapon "CMFlareLauncher";
    _this addWeapon "TwinVickers";
    _this addWeapon "AirBombLauncher";
};

// T-34 [HF1]
case "T34_TK_EP1": {
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "10Rnd_85mmAP";
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
};

// T-34 (Guerilla) [HF1]
case "T34_TK_GUE_EP1": {
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "60Rnd_762x54_DT";
    _this addMagazine "10Rnd_85mmAP";
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
    _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
};

// M2A2 Bradley [HF1]
case "M2A2_EP1": {
    _this removeMagazine "2Rnd_TOW2";
    _this removeMagazine "2Rnd_TOW2";
    _this removeMagazine "2Rnd_TOW2";
    _this removeMagazine "2Rnd_TOW2";
    _this removeMagazine "2Rnd_TOW2";
    _this removeMagazine "210Rnd_25mm_M242_HEI";
    _this removeMagazine "210Rnd_25mm_M242_APDS";
    _this removeWeapon "TOWLauncher";
    _this removeWeapon "M242BC";
    _this addWeapon "M242";
};

// UH1Y [AF2] - 0 pylons
case "UH1Y": {
    _this addMagazine "60Rnd_CMFlareMagazine";
    _this addMagazine "38Rnd_FFAR";
    _this addWeapon "CMFlareLauncher";
    _this addWeapon "FFARLauncher";
};

// MLRS [HF3]
case "MLRS": {
    _this addMagazine "12Rnd_MLRS";
    _this addMagazine "12Rnd_MLRS";
};

// MLRS (Desert) [HF3]
case "MLRS_DES_EP1": {
    _this addMagazine "12Rnd_MLRS";
    _this addMagazine "12Rnd_MLRS";
};

// AH-6J [AF2] - 0 pylons
case "AH6J_EP1": {
    _this addMagazine "14Rnd_FFAR";
};

// BMP-2 [HF1]
case "BMP2_INS": {
_current_heavy_level = ((side group player) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_HEAVY;
if (_current_heavy_level < 2) then {
    _this removeWeapon "AT5LauncherSingle";
};
};

// BMP-2 [HF1]
case "BMP2_TK_EP1": {
_current_heavy_level = ((side group player) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_HEAVY;
if (_current_heavy_level < 2) then {
    _this removeWeapon "AT5LauncherSingle";
};
};

// Stryker MGS [LF4]
case "M1128_MGS_EP1": {
    _this addMagazineTurret ["6RND_105mm_APDS", [0]];
};

// BRDM (Igla) [LF4]
case "BRDM2_ATGM_INS": {
    _this removeMagazineTurret ["5Rnd_AT5_BRDM2", [0]];
    _this removeWeaponTurret ["AT5Launcher", [0]];
    _this addMagazineTurret ["2Rnd_Igla", [0]];
    _this addMagazineTurret ["2Rnd_Igla", [0]];
    _this addWeaponTurret ["Igla_twice", [0]];
};

};