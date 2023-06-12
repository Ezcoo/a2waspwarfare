switch (typeOf _this) do
{
	case "M6_EP1": {
		_this removeWeapon "StingerLaucher_4x";
		_this addMagazine "8Rnd_9M311";
		_this addWeapon "9M311Laucher";
	};

    case "Ka52Black":
                   {
        _this addMagazine "2Rnd_R73";
        _this addweapon "R73Launcher_2";
	};

	case "Ka52":
	{
		_this removeWeapon "VikhrLauncher";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addMagazine "4Rnd_AT9_Mi24P";
		_this addweapon "AT9Launcher";
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

				_this addMagazineTurret ["60Rnd_762x54_DT",[1]];
				_this addMagazineTurret ["60Rnd_762x54_DT",[1]];
				_this addMagazineTurret ["60Rnd_762x54_DT",[1]];
				_this addMagazineTurret ["60Rnd_762x54_DT",[1]];
				_this addMagazineTurret ["60Rnd_762x54_DT",[1]];
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

                _this addMagazine "4Rnd_FAB_250";
				_this addMagazine "4Rnd_FAB_250";

	};
        case "Su25_Ins": {

                _this addMagazine "4Rnd_FAB_250";
				_this addMagazine "4Rnd_FAB_250";

	};
        case "AV8B2": {

			    _this removeWeapon "Mk82BombLauncher_6";
				_this removeMagazine "6Rnd_Mk82";
				_this addMagazine "2Rnd_Maverick_A10";
				_this addMagazine "2Rnd_Maverick_A10";
				_this addMagazine "2Rnd_Maverick_A10";
				_this addweapon "MaverickLauncher";
	};
     case "AV8B": {

			    _this removeWeapon "GAU12";
				_this removeMagazine "300Rnd_25mm_GAU12";
	};

        case "F35B": {

				_this addMagazine "2Rnd_Maverick_A10";
				_this addweapon "MaverickLauncher";

	};

        case "M2A2_EP1": {

				_this removeMagazine "2Rnd_TOW2";
				_this removeMagazine "2Rnd_TOW2";
				_this removeMagazine "2Rnd_TOW2";
				_this removeMagazine "2Rnd_TOW2";
			    _this removeMagazine "2Rnd_TOW2";
                _this removeWeapon "TOWLauncher";
                _this addMagazine "6Rnd_TOW_HMMWV";
                _this addweapon "TOWLauncherSingle";
				_this removeMagazine "210Rnd_25mm_M242_HEI";
				_this removeMagazine "210Rnd_25mm_M242_APDS";
			    _this removeWeapon "M242BC";
			    _this addWeapon "M242";

	};

        case "UH1Y":
{
                     _this addMagazine "60Rnd_CMFlareMagazine";
                     _this addMagazine "38Rnd_FFAR";
                     _this addweapon "CMFlareLauncher";
                     _this addweapon "FFARLauncher";};

        case "L39_TK_EP1": {

                _this addweapon "CMFlareLauncher";
                _this addMagazine "60Rnd_CMFlareMagazine";
                _this addweapon "R73Launcher_2";
                _this addMagazine "2Rnd_R73";


	};
         case "Mi24_V": {
		_this removeWeapon "AT6Launcher";

                _this addMagazine "4Rnd_AT9_Mi24P";
                _this addMagazine "4Rnd_AT9_Mi24P";
		_this addweapon "AT9Launcher";


	};

         case "Mi24_P": {
	    _this addMagazineTurret ["750Rnd_30mm_GSh301",[-1]];
	    _this addMagazineTurret ["750Rnd_30mm_GSh301",[-1]];
	};
	case "Mi24_D_TK_EP1": {
    	    _this removeWeaponTurret ["YakB", [0]];
    	    _this addMagazineTurret ["500Rnd_145x115_KPVT", [0]];
    	    _this addWeaponTurret ["KPVT", [0]];
    	    _this removeMagazineTurret ["128Rnd_57mm", [-1]];
    	    _this addMagazineTurret ["64Rnd_57mm", [-1]];
    	    _this addMagazineTurret ["6Rnd_Grenade_Camel", [-1]];
    	    _this addWeaponTurret ["CamelGrenades", [-1]];
    	};

          case "MLRS": {


                 _this addMagazine "12Rnd_MLRS";
                 _this addMagazine "12Rnd_MLRS";

  };
         case "MLRS_DES_EP1": {


                 _this addMagazine "12Rnd_MLRS";
                 _this addMagazine "12Rnd_MLRS";

  };

case "AH6J_EP1":{
    _this addMagazine "14Rnd_FFAR";
};


case "BMP2_INS":{
	_current_heavy_level = ((side player) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_HEAVY;
    if(_current_heavy_level < 2)then{

    	_this removeWeapon "AT5LauncherSingle";
	};
};


case "L159_ACR":{
    _this removeWeapon "MaverickLauncher_ACR";
    _this removeMagazine "4Rnd_Maverick_L159";
    _this addweapon "MaverickLauncher";
    _this addWeapon "BombLauncherF35";
    _this addMagazine "2Rnd_Maverick_A10";
    _this addMagazine "38Rnd_FFAR";
};


case "Pandur2_ACR":{
_this addMagazineTurret ["60Rnd_30mm_ATKMK44_AP_ACR",[0]];
	_current_light_level = ((side player) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_LIGHT;
    if(_current_light_level < 4)then{

    	_this removeWeaponTurret ["SpikeLauncher_ACR", [0]];
	};
};

case "AW159_Lynx_BAF":{
    _this removeWeaponTurret ["CRV7_PG", [-1]];
    _this removeWeaponTurret ["BAF_M621", [-1]];
    _this addMagazineTurret ["2Rnd_Spike_ACR", [-1]];
    _this addMagazineTurret ["1200Rnd_30x113mm_M789_HEDP", [-1]];
    _this addMagazineTurret ["6Rnd_CRV7_HEPD", [-1]];
    _this addWeaponTurret ["M230", [-1]];
    _this addWeaponTurret ["CRV7_HEPD",[-1]];
    _this addWeaponTurret ["SpikeLauncher_ACR", [-1]];




};

case "BVP1_TK_ACR":{
    _this RemoveWeaponTurret ["2A28", [0]];
    _this addMagazineTurret ["10Rnd_85mmAP", [0]];
    _this addWeaponTurret ["ZiS_S_53", [0]];
    _this addMagazineTurret ["33Rnd_85mmHE", [0]];
    _this addMagazineTurret ["4rnd_AT3", [0]];




};

case "M1128_MGS_EP1":{

    _this addMagazineTurret ["6RND_105mm_APDS", [0]];

};
case "BRDM2_ATGM_INS":{

    _this RemoveWeaponTurret ["AT5Launcher", [0]];
    _this addWeaponTurret ["Igla_twice", [0]];
    _this addMagazineTurret ["2Rnd_Igla", [0]];
    _this addMagazineTurret ["2Rnd_Igla", [0]];
    _this addMagazineTurret ["2Rnd_Igla", [0]];
    _this addMagazineTurret ["2Rnd_Igla", [0]];
};
};