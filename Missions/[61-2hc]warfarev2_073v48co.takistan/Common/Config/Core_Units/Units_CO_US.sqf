Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

_u 			= ['US_Soldier_Light_EP1'];
_u = _u		+ ['US_Soldier_EP1'];
_u = _u		+ ['US_Soldier_B_EP1'];
_u = _u		+ ['US_Soldier_LAT_EP1'];
_u = _u		+ ['US_Soldier_AT_EP1'];
_u = _u		+ ['US_Soldier_HAT_EP1'];
_u = _u		+ ['US_Soldier_AA_EP1'];
_u = _u		+ ['US_Soldier_AR_EP1'];
_u = _u		+ ['US_Soldier_MG_EP1'];
_u = _u		+ ['US_Soldier_GL_EP1'];
_u = _u		+ ['US_Soldier_Sniper_EP1'];
_u = _u		+ ['US_Soldier_SniperH_EP1'];
_u = _u		+ ['US_Soldier_Sniper_NV_EP1'];
_u = _u		+ ['US_Soldier_Marksman_EP1'];
_u = _u		+ ['US_Soldier_Medic_EP1'];
_u = _u		+ ['US_Soldier_Engineer_EP1'];
_u = _u		+ ['US_Soldier_AMG_EP1'];
_u = _u		+ ['US_Soldier_AAR_EP1'];
_u = _u		+ ['US_Soldier_AHAT_EP1'];
_u = _u		+ ['US_Soldier_AAT_EP1'];
_u = _u		+ ['US_Soldier_Spotter_EP1'];
_u = _u		+ ['US_Soldier_TL_EP1'];
_u = _u		+ ['US_Soldier_SL_EP1'];
_u = _u		+ ['US_Soldier_Officer_EP1'];
_u = _u		+ ['US_Soldier_Crew_EP1'];
_u = _u		+ ['US_Soldier_Pilot_EP1'];
_u = _u		+ ['US_Delta_Force_EP1'];
_u = _u		+ ['US_Delta_Force_TL_EP1'];
_u = _u		+ ['US_Delta_Force_Medic_EP1'];
_u = _u		+ ['US_Delta_Force_Assault_EP1'];
_u = _u		+ ['US_Delta_Force_SD_EP1'];
_u = _u		+ ['US_Delta_Force_MG_EP1'];
_u = _u		+ ['US_Delta_Force_AR_EP1'];
_u = _u		+ ['US_Delta_Force_Night_EP1'];
_u = _u		+ ['US_Delta_Force_Marksman_EP1'];
_u = _u		+ ['US_Delta_Force_M14_EP1'];
_u = _u		+ ['US_Delta_Force_Air_Controller_EP1'];
//--- USMC Troops.

if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	//--- BAF Desert Camo.
	_u = _u		+ ['BAF_Soldier_AA_DDPM'];
	_u = _u		+ ['BAF_Soldier_AAA_DDPM'];
	_u = _u		+ ['BAF_Soldier_AAT_DDPM'];
	_u = _u		+ ['BAF_Soldier_AHAT_DDPM'];
	_u = _u		+ ['BAF_Soldier_AAR_DDPM'];
	_u = _u		+ ['BAF_Soldier_AMG_DDPM'];
	_u = _u		+ ['BAF_Soldier_AT_DDPM'];
	_u = _u		+ ['BAF_Soldier_HAT_DDPM'];
	_u = _u		+ ['BAF_Soldier_AR_DDPM'];
	_u = _u		+ ['BAF_crewman_DDPM'];
	_u = _u		+ ['BAF_Soldier_EN_DDPM'];
	_u = _u		+ ['BAF_Soldier_GL_DDPM'];
	_u = _u		+ ['BAF_Soldier_FAC_DDPM'];
	_u = _u		+ ['BAF_Soldier_MG_DDPM'];
	_u = _u		+ ['BAF_Soldier_scout_DDPM'];
	_u = _u		+ ['BAF_Soldier_Marksman_DDPM'];
	_u = _u		+ ['BAF_Soldier_Medic_DDPM'];
	_u = _u		+ ['BAF_Soldier_Officer_DDPM'];
	_u = _u		+ ['BAF_Pilot_DDPM'];
	_u = _u		+ ['BAF_Soldier_DDPM'];
	_u = _u		+ ['BAF_ASoldier_DDPM'];
	_u = _u		+ ['BAF_Soldier_L_DDPM'];
	_u = _u		+ ['BAF_Soldier_N_DDPM'];
	_u = _u		+ ['BAF_Soldier_SL_DDPM'];
	_u = _u		+ ['BAF_Soldier_TL_DDPM'];
};

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['MMT_USMC'];
_u = _u		+ ['M1030'];
_u = _u		+ ["hilux1_civil_1_open"];
_u = _u		+ ["UralCivil"];
_u = _u		+ ['M1030_US_DES_EP1'];
_u = _u		+ ['ATV_US_EP1'];
_u = _u		+ ['HMMWV_DES_EP1'];
_u = _u		+ ['HMMWV_M1035_DES_EP1'];
_u = _u		+ ['HMMWV_M2'];
_u = _u		+ ['HMMWV_MK19_DES_EP1'];
_u = _u		+ ['HMMWV_M998A2_SOV_DES_EP1'];
_u = _u		+ ['HMMWV_M1151_M2_DES_EP1'];
_u = _u		+ ['HMMWV_M998_crows_M2_DES_EP1'];
_u = _u		+ ['HMMWV_M998_crows_MK19_DES_EP1'];
_u = _u		+ ['HMMWV_TOW_DES_EP1'];
_u = _u		+ ['HMMWV_Avenger_DES_EP1'];
_u = _u		+ ['HMMWV_Ambulance_DES_EP1'];
_u = _u		+ ['M1126_ICV_M2_EP1'];
_u = _u		+ ['M1126_ICV_mk19_EP1'];
_u = _u		+ ['M1129_MC_EP1'];
_u = _u		+ ['M1135_ATGMV_EP1'];
_u = _u		+ ['M1128_MGS_EP1'];
_u = _u		+ ['M1133_MEV_EP1'];
_u = _u		+ ['MTVR_DES_EP1'];
_u = _u		+ ['MtvrRepair_DES_EP1'];
_u = _u		+ ['MtvrReammo_DES_EP1'];
_u = _u		+ ['MtvrRefuel_DES_EP1'];
_u = _u		+ ['MtvrSalvage_DES_EP1'];
_u = _u		+ ['Dingo_DST_ACR'];
_u = _u		+ ['Dingo_GL_DST_ACR'];
_u = _u		+ ['LandRover_Special_CZ_EP1'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['MtvrSupply_DES_EP1']};
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_USMC']};
_u = _u		+ ['LAV25'];
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_u = _u		+ ['BAF_Offroad_D'];
	_u = _u		+ ['BAF_Jackal2_GMG_D'];
	_u = _u		+ ['BAF_Jackal2_L2A1_D'];
	_u = _u		+ ['Pandur2_ACR'];
};

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['AAV'];
_u = _u		+ ['M2A2_EP1'];
_u = _u		+ ['M2A3_EP1'];
_u = _u		+ ['M1A1_US_DES_EP1'];
_u = _u		+ ['MLRS_DES_EP1'];
_u = _u		+ ['M1A2_US_TUSK_MG_EP1'];
_u = _u		+ ['M6_EP1'];
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_u = _u		+ ['BAF_FV510_D'];
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
	_u = _u		+ ['A10_US_EP1'];
};
if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {
	_u = _u		+ ['BAF_Merlin_HC3_D'];
	_u = _u		+ ['CH_47F_BAF'];
	if (_restriction_air == 0 || _restriction_air == 1) then {
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
	_u = _u		+ ['A10_US_EP1'];
};

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ["Old_bike_TK_CIV_EP1"];
_u = _u		+ ["MMT_Civ"];
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
	_u = _u		+ ['US_Soldier_Medic_EP1'];
	_u = _u		+ ['BAF_Soldier_EN_W'];
	_u = _u		+ ['US_Soldier_LAT_EP1'];
	_u = _u		+ ['US_Soldier_MG_EP1'];
	_u = _u		+ ['US_Soldier_AA_EP1'];
    _u = _u		+ ["UralCivil"];
    _u = _u		+ ["V3S_Refuel_TK_GUE_EP1"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};