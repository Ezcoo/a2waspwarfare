Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

//--- USMC Troops.
_u = ['USMC_Soldier'];
_u = _u		+ ['USMC_Soldier2'];
_u = _u		+ ['USMC_Soldier_LAT'];
_u = _u		+ ['USMC_Soldier_AT'];
_u = _u		+ ['USMC_Soldier_HAT'];
_u = _u		+ ['USMC_Soldier_AA'];
_u = _u		+ ['USMC_Soldier_AR'];
_u = _u		+ ['USMC_Soldier_MG'];
_u = _u		+ ['USMC_Soldier_GL'];
_u = _u		+ ['USMC_SoldierS_Sniper'];
_u = _u		+ ['USMC_SoldierS_SniperH'];
_u = _u		+ ['USMC_SoldierM_Marksman'];
_u = _u		+ ['USMC_Soldier_Medic'];
_u = _u		+ ['USMC_SoldierS_Engineer'];
_u = _u		+ ['USMC_SoldierS'];
_u = _u		+ ['USMC_SoldierS_Spotter'];
_u = _u		+ ['USMC_Soldier_TL'];
_u = _u		+ ['USMC_Soldier_SL'];
_u = _u		+ ['USMC_Soldier_Crew'];
_u = _u		+ ['USMC_Soldier_Pilot'];
_u = _u		+ ['FR_GL'];
_u = _u		+ ['FR_Corpsman'];
_u = _u		+ ['FR_TL'];
_u = _u		+ ['FR_Assault_R'];
_u = _u		+ ['FR_Assault_GL'];
_u = _u		+ ['FR_AR'];
_u = _u		+ ['FR_R'];
_u = _u		+ ['FR_Sapper'];
_u = _u		+ ['FR_AC'];
_u = _u		+ ['FR_Marksman'];
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	//--- BAF MTP Camo.
	_u = _u		+ ['BAF_Soldier_AA_W'];
	_u = _u		+ ['BAF_Soldier_AAA_W'];
	_u = _u		+ ['BAF_Soldier_AAT_W'];
	_u = _u		+ ['BAF_Soldier_AHAT_W'];
	_u = _u		+ ['BAF_Soldier_AAR_W'];
	_u = _u		+ ['BAF_Soldier_AMG_W'];
	_u = _u		+ ['BAF_Soldier_AT_W'];
	_u = _u		+ ['BAF_Soldier_HAT_W'];
	_u = _u		+ ['BAF_Soldier_AR_W'];
	_u = _u		+ ['BAF_crewman_W'];
	_u = _u		+ ['BAF_Soldier_EN_W'];
	_u = _u		+ ['BAF_Soldier_GL_W'];
	_u = _u		+ ['BAF_Soldier_FAC_W'];
	_u = _u		+ ['BAF_Soldier_MG_W'];
	_u = _u		+ ['BAF_Soldier_scout_W'];
	_u = _u		+ ['BAF_Soldier_Marksman_W'];
	_u = _u		+ ['BAF_Soldier_Medic_W'];
	_u = _u		+ ['BAF_Soldier_Officer_W'];
	_u = _u		+ ['BAF_Pilot_W'];
	_u = _u		+ ['BAF_Soldier_W'];
	_u = _u		+ ['BAF_ASoldier_W'];
	_u = _u		+ ['BAF_Soldier_L_W'];
	_u = _u		+ ['BAF_Soldier_N_W'];
	_u = _u		+ ['BAF_Soldier_SL_W'];
	_u = _u		+ ['BAF_Soldier_SniperN_W'];
	_u = _u		+ ['BAF_Soldier_SniperH_W'];
	_u = _u		+ ['BAF_Soldier_Sniper_W'];
	_u = _u		+ ['BAF_Soldier_spotter_W'];
	_u = _u		+ ['BAF_Soldier_spotterN_W'];
	_u = _u		+ ['BAF_Soldier_TL_W'];
};

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['MMT_USMC'];
_u = _u		+ ['M1030'];
_u = _u		+ ['M1030_US_DES_EP1'];
_u = _u		+ ['ATV_US_EP1'];
_u = _u		+ ['Zodiac'];

_u = _u		+ ['HMMWV_M998A2_SOV_DES_EP1'];
_u = _u		+ ['HMMWV_M1151_M2_DES_EP1'];
_u = _u		+ ['HMMWV'];
_u = _u		+ ["hilux1_civil_1_open"];
_u = _u		+ ["UralCivil"];
_u = _u		+ ['HMMWV_M2'];
_u = _u		+ ['HMMWV_Armored'];
_u = _u		+ ['HMMWV_MK19'];
_u = _u		+ ['HMMWV_TOW'];
_u = _u		+ ['HMMWV_Avenger'];
_u = _u		+ ['HMMWV_Ambulance'];
_u = _u		+ ['HMMWV_M998_crows_MK19_DES_EP1'];
_u = _u		+ ['HMMWV_M998_crows_M2_DES_EP1'];
_u = _u		+ ['M1126_ICV_M2_EP1'];
_u = _u		+ ['M1126_ICV_mk19_EP1'];
_u = _u		+ ['M1129_MC_EP1'];
_u = _u		+ ['M1135_ATGMV_EP1'];
_u = _u		+ ['M1128_MGS_EP1'];
_u = _u		+ ['M1133_MEV_EP1'];
_u = _u		+ ['LandRover_Special_CZ_EP1'];
_u = _u		+ ['HMMWV_M1035_DES_EP1'];
_u = _u		+ ['Dingo_WDL_ACR'];
_u = _u		+ ['Dingo_GL_Wdl_ACR'];
_u = _u		+ ['Pandur2_ACR'];

// // if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['MtvrSupply_DES_EP1']};
_u = _u		+ ['MTVR'];
_u = _u		+ ['MtvrRepair'];
_u = _u		+ ['WarfareReammoTruck_USMC'];
_u = _u		+ ['MtvrRefuel'];
_u = _u		+ ['WarfareSalvageTruck_USMC'];
// // if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {
_u = _u		+ ['WarfareSupplyTruck_USMC'];
_u = _u		+ ['RHIB'];
_u = _u		+ ['RHIB2Turret'];
_u = _u		+ ['LAV25'];
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_u = _u		+ ['BAF_ATV_W'];
	_u = _u		+ ['BAF_Offroad_W'];
	_u = _u		+ ['BAF_Jackal2_GMG_W'];
	_u = _u		+ ['BAF_Jackal2_L2A1_W'];
};
missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['AAV'];
_u = _u		+ ['M2A2_EP1'];
_u = _u		+ ['M2A3_EP1'];
_u = _u		+ ['M1A1'];
_u = _u		+ ['MLRS'];
_u = _u		+ ['M1A2_TUSK_MG'];
_u = _u		+ ['M6_EP1'];
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_u = _u		+ ['BAF_FV510_W'];
};

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['MH6J_EP1'];
_u = _u		+ ['MH60S'];
_u = _u		+ ['UH60M_EP1'];
_u = _u		+ ['UH60M_MEV_EP1'];
_u = _u		+ ['CH_47F_EP1'];
if (_restriction_air == 0 || _restriction_air == 1) then {
	_u = _u		+ ['UH1Y'];
	_u = _u		+ ['AH6J_EP1'];
	_u = _u		+ ['AH1Z'];
	_u = _u		+ ['AH64D_EP1'];
};
if (_restriction_air == 0) then {
	_u = _u		+ ['MV22'];
	_u = _u		+ ['C130J_US_EP1'];
	_u = _u		+ ['F35B'];
	_u = _u		+ ['L159_ACR'];
	_u = _u		+ ['AV8B'];
	_u = _u		+ ['AV8B2'];
	_u = _u		+ ['A10'];
};
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_u = _u		+ ['BAF_Merlin_HC3_D'];
	_u = _u		+ ['CH_47F_BAF'];
	if (_restriction_air == 0 || _restriction_air == 1) then {
		_u = _u		+ ['AW159_Lynx_BAF'];
		_u = _u		+ ['BAF_Apache_AH1_D'];
	};
};

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];
if (_restriction_air == 0) then {
	_u = _u 	+ ['MV22'];
	_u = _u		+ ['C130J_US_EP1'];
	_u = _u		+ ['F35B'];
	_u = _u		+ ['L159_ACR'];
	_u = _u		+ ['AV8B'];
	_u = _u		+ ['AV8B2'];
	_u = _u		+ ['A10'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ["MMT_USMC"];
_u = _u		+ ["Old_moto_TK_Civ_EP1"];
_u = _u		+ ["Lada1_TK_CIV_EP1"];
_u = _u		+ ["SkodaBlue"];
_u = _u		+ ["car_sedan"];
_u = _u		+ ["car_hatchback"];
_u = _u		+ ["Volha_1_TK_CIV_EP1"];
_u = _u		+ ["datsun1_civil_1_open"];
_u = _u		+ ["datsun1_civil_3_open"];
_u = _u		+ ["hilux1_civil_1_open"];
_u = _u		+ ["LandRover_TK_CIV_EP1"];
_u = _u		+ ["Ikarus"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_WESTSOLDIER"];
	_u = _u		+ ['USMC_Soldier_Medic'];
	_u = _u		+ ['BAF_Soldier_EN_W'];
	_u = _u		+ ['USMC_Soldier_LAT'];
    _u = _u		+ ['USMC_Soldier_MG'];
    _u = _u		+ ['USMC_Soldier_AA'];
_u = _u		+ ["UralCivil"];
_u = _u		+ ["V3S_Refuel_TK_GUE_EP1"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};