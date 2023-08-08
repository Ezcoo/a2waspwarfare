switch (typeOf _this) do
{
    case "M6_EP1": {
        _this removeWeapon "StingerLaucher_4x";
        _this addMagazine "8Rnd_9M311";
        _this addWeapon "9M311Laucher";
    };

	case "An2_TK_EP1": {
		_this addMagazine "500Rnd_TwinVickers";
		_this addMagazine "500Rnd_TwinVickers";
		_this addweapon "TwinVickers";
        _this addweapon "CMFlareLauncher";
        _this addMagazine "60Rnd_CMFlareMagazine";
		_this addweapon "AirBombLauncher";
		_this addMagazine "4Rnd_FAB_250";
	};

    case "T34_TK_EP1": {
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "10Rnd_85mmAP";
    };
    case "T34_TK_GUE_EP1": {
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazineTurret ["60Rnd_762x54_DT", [1]];
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "60Rnd_762x54_DT";
        _this addMagazine "10Rnd_85mmAP";
    };

    case "Su25_TK_EP1": {
        _this removeMagazine "80Rnd_S8T";
        _this addMagazine "40Rnd_S8T";
        _this addWeapon "AT9Launcher";
        _this addMagazine "4Rnd_AT9_Mi24P";
        _this addMagazine "4Rnd_AT9_Mi24P";
        _this removeWeapon "AirBombLauncher";
        _this removeMagazine "4Rnd_FAB_250";
    };

    case "Su25_Ins": {
        _this removeWeapon "R73Launcher_2";
        _this removeMagazine "2Rnd_R73";
        _this removeWeapon "S8Launcher";
        _this removeMagazine "80Rnd_S8T";
        _this addMagazine "4Rnd_FAB_250";
        _this addMagazine "4Rnd_FAB_250";
        _this addWeapon "57mmLauncher";
        _this addMagazine "64Rnd_57mm";
    };

    case "Su39": {
        _this removeMagazine "80Rnd_S8T";
        _this addMagazine "40Rnd_S8T";
        _this addMagazine "40Rnd_S8T";
        _this addWeapon "VikhrLauncher";
        _this addMagazine "12Rnd_Vikhr_KA50";
        _this removeWeapon "Ch29Launcher";
        _this removeMagazine "4Rnd_Ch29";
    };

    case "AV8B2": {
        _this removeWeapon "Mk82BombLauncher_6";
        _this removeMagazine "6Rnd_Mk82";
        _this addMagazine "2Rnd_Maverick_A10";
        _this addMagazine "2Rnd_Maverick_A10";
        _this addMagazine "2Rnd_Maverick_A10";
        _this addWeapon "MaverickLauncher";
    };

    case "AV8B": {
        _this removeWeapon "BombLauncher";
        _this removeMagazine "6Rnd_GBU12_AV8B";
        _this addWeapon "BombLauncherF35";
        _this addMagazine "2Rnd_GBU12";
        _this addMagazine "2Rnd_GBU12";
        _this addMagazine "2Rnd_GBU12";
    };

    case "F35B": {
        _this addMagazine "2Rnd_Maverick_A10";
        _this addweapon "MaverickLauncher";
    };

    case "M2A2_EP1": {
        _this removeMagazine "210Rnd_25mm_M242_HEI";
        _this removeMagazine "210Rnd_25mm_M242_APDS";
        _this removeWeapon "M242BC";
        _this addWeapon "M242";
        _this removeMagazine "2Rnd_TOW2";
        _this removeMagazine "2Rnd_TOW2";
        _this removeMagazine "2Rnd_TOW2";
        _this removeMagazine "2Rnd_TOW2";
        _this removeMagazine "2Rnd_TOW2";
        _this removeWeapon "TOWLauncher";
    };

    case "UH1Y": {
        _this addMagazine "60Rnd_CMFlareMagazine";
        _this addMagazine "38Rnd_FFAR";
        _this addweapon "CMFlareLauncher";
        _this addweapon "FFARLauncher";
    };

    case "L39_TK_EP1": {
        _this addweapon "CMFlareLauncher";
        _this addMagazine "60Rnd_CMFlareMagazine";
        _this addweapon "R73Launcher_2";
        _this addMagazine "2Rnd_R73";
    };

    case "Mi24_V": {
        _this removeWeapon "AT6Launcher";
        _this addMagazine "4Rnd_AT9_Mi24P";
        _this addweapon "AT9Launcher";
        _this addWeaponTurret ["YakB", [-1]];
    };

    case "MLRS": {
        _this addMagazine "12Rnd_MLRS";
        _this addMagazine "12Rnd_MLRS";
    };
    case "MLRS_DES_EP1": {
        _this addMagazine "12Rnd_MLRS";
        _this addMagazine "12Rnd_MLRS";
    };

    case "AH6J_EP1": {
        _this addMagazine "14Rnd_FFAR";
    };

    case "Su34": {
        _this removeWeaponTurret ["R73Launcher", [-1]];
        _this removeMagazineTurret ["4Rnd_R73", [-1]];

        _this removeWeaponTurret ["R73Launcher_2", [-1]];
        _this addMagazineTurret ["2Rnd_R73", [-1]];
        _this addMagazineTurret ["2Rnd_R73", [-1]];
    };

    // A-10A
    case "A10": {
        // Remove the vanilla game 14rnd Hydra launcher
        _this removeWeapon "FFARLauncher_14";
        _this removeMagazine "14Rnd_FFAR";

        // Remove vanilla game GBU's
        _this removeWeapon "BombLauncherA10";
        _this removeMagazine "4Rnd_GBU12";

        // Remove sidewinders of the vanilla game loadout
        _this removeWeapon "SidewinderLaucher_AH1Z";
        _this removeMagazine "2Rnd_Sidewinder_AH1Z";

        // Remove mavericks of the vanilla game loadout
        _this removeWeapon "MaverickLauncher";
        _this removeMagazine "2Rnd_Maverick_A10";

        _this addWeapon "FFARLauncher";
        _this addMagazine "38Rnd_FFAR";
        _this addWeapon "Mk82BombLauncher_6";
        _this addMagazine "6Rnd_Mk82";
    };

    // A-10C
    case "A10_US_EP1": {
        // Remove the vanilla game 14rnd Hydra launcher
        _this removeWeapon "FFARLauncher_14";
        _this removeMagazine "14Rnd_FFAR";

        // Remove vanilla game GBU's
        _this removeWeapon "BombLauncherA10";
        _this removeMagazine "4Rnd_GBU12";

        _this addWeapon "FFARLauncher";
        _this addMagazine "38Rnd_FFAR";
        _this addWeapon "Mk82BombLauncher_6";
        _this addMagazine "6Rnd_Mk82";
    };

    case "AH64D": {
        // Remove Hellfire Launcher
        _this removeWeaponTurret ["HellfireLauncher", [0]];
        _this removeMagazineTurret ["8Rnd_Hellfire", [0]];

        // Six TOW2 Missiles
        _this addMagazineTurret ["6Rnd_TOW2", [0]];
        _this addWeaponTurret ["TOWLauncherSingle", [0]];
    };

    case "BMP2_INS": {
        _current_heavy_level = ((side player) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_HEAVY;
        if (_current_heavy_level < 2) then {
            _this removeWeapon "AT5LauncherSingle";
        };
    };
    case "BMP2_TK_EP1": {
        _current_heavy_level = ((side player) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_HEAVY;
        if (_current_heavy_level < 2) then {
            _this removeWeapon "AT5LauncherSingle";
        };
    };

    case "L159_ACR": {
        _this removeWeapon "MaverickLauncher_ACR";
        _this removeMagazine "4Rnd_Maverick_L159";
        _this addWeapon "MaverickLauncher";
        _this addWeapon "FFARLauncher";
        _this addMagazine "2Rnd_Maverick_A10";
        _this addMagazine "38Rnd_FFAR";
    };

    case "AW159_Lynx_BAF": {
        _this removeWeaponTurret ["CRV7_PG", [-1]];
        _this addMagazineTurret ["2Rnd_Spike_ACR", [-1]];
        _this addMagazineTurret ["2Rnd_Spike_ACR", [-1]];
        _this AddWeaponTurret ["SpikeLauncher_ACR", [-1]];
        _this removeWeaponTurret ["BAF_M621", [-1]];
        _this addMagazineTurret ["200Rnd_40mmSABOT_FV510", [-1]];
        _this addMagazineTurret ["200Rnd_40mmHE_FV510", [-1]];
        _this AddWeaponTurret ["CTWS", [-1]];
        _this addMagazineTurret ["6Rnd_CRV7_HEPD", [-1]];
        _this addWeaponTurret ["CRV7_HEPD", [-1]];
    };

    case "M1128_MGS_EP1": {
        _this addMagazineTurret ["6RND_105mm_APDS", [0]];
    };

    case "Mi24_D_TK_EP1": {
        _this removeMagazine "128Rnd_57mm";
        _this addMagazine "64Rnd_57mm";
    };

    case "Mi24_P": {
        _this addMagazineTurret ["750Rnd_30mm_GSh301", [-1]];
        _this addMagazineTurret ["750Rnd_30mm_GSh301", [-1]];
    };

    case "Ka52": {
        _this removeWeaponTurret ["VikhrLauncher", [-1]];
        _this removeMagazineTurret ["12Rnd_Vikhr_KA50", [-1]];
        _this addWeaponTurret ["AT9Launcher", [-1]];
        _this addMagazine "4Rnd_AT9_Mi24P";
        _this addMagazine "4Rnd_AT9_Mi24P";
    };

    case "BRDM2_ATGM_INS": {
        _this RemoveWeaponTurret ["AT5Launcher", [0]];
        _this addWeaponTurret ["Igla_twice", [0]];
        _this addMagazineTurret ["2Rnd_Igla", [0]];
        _this addMagazineTurret ["2Rnd_Igla", [0]];
        _this addMagazineTurret ["2Rnd_Igla", [0]];
        _this addMagazineTurret ["2Rnd_Igla", [0]];
    };
};