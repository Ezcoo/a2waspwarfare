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
_u = _u		+ ['I44_Man_B_Army_Sniper_SMLENo4Mk1T'];
_u = _u		+ ['I44_Man_B_Army_Sniper_SMLENo4Mk1TH'];
_u = _u		+ ['USMC_SoldierM_Marksman'];
_u = _u		+ ['I44_Man_B_Army_Medic'];
_u = _u		+ ['USMC_SoldierS_Engineer'];
_u = _u		+ ['USMC_SoldierS'];
_u = _u		+ ['USMC_SoldierS_Spotter'];
_u = _u		+ ['I44_Man_B_Army_Engr_GrenadeNo75'];
_u = _u		+ ['USMC_Soldier_SL'];
_u = _u		+ ['USMC_Soldier_Crew'];
_u = _u		+ ['USMC_Soldier_Pilot'];
_u = _u		+ ['FR_GL'];
_u = _u		+ ['FR_Corpsman'];
_u = _u		+ ['I44_Man_B_Army_Sapper_M2'];
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

if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['MtvrSupply_DES_EP1']};
_u = _u		+ ['MTVR'];
_u = _u		+ ['MtvrRepair'];
_u = _u		+ ['WarfareReammoTruck_USMC'];
_u = _u		+ ['MtvrRefuel'];
_u = _u		+ ['WarfareSalvageTruck_USMC'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_USMC']};
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

_u  		= ['I44_HT_A_M3_Army'];
_u = _u		+ ['I44_HT_A_M3A1_Army'];
_u = _u		+ ['I44_Tank_A_M3A3_Stuart_Army"'];
_u = _u		+ ['I44_Tank_A_M5A1_Stuart_Army"'];
_u = _u		+ ['I44_Tank_B_ShermanIV_Army'];
_u = _u		+ ['I44_Veh_A_Army_M4A3_Sherman_Army"'];
_u = _u		+ ['I44_Veh_B_Army_MKIV_Churchill'];
_u = _u		+ ['I44_Tank_B_Cromwell_Army'];
_u = _u		+ ['I44_Veh_A_Army_M4A3_76_Sherman_Army'];
_u = _u		+ ['I44_Veh_A_Army_M4A3_Wading_Sherman_Army"'];
_u = _u		+ ['I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army"'];
_u = _u		+ ['I44_Tank_B_ShermanVC_Army'];
_u = _u		+ ['I44_Tank_B_Army_UC'];
_u = _u		+ ['I44_ACar_A_M8_Greyhound_Army'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u  		= ['I44_Plane_A_C47A_AAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
_u = _u		+ ['I44_Plane_A_P51D_HVAR_AAF'];
_u = _u		+ ['I44_Plane_A_P38_M64_AAF'];
_u = _u		+ ['I44_P47A'];
_u = _u		+ ['I44_Plane_A_B17_AAF'];
_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
_u = _u		+ ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];


missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u  		= ['I44_Plane_A_C47A_AAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
_u = _u		+ ['I44_Plane_A_P51D_HVAR_AAF'];
_u = _u		+ ['I44_Plane_A_P38_M64_AAF'];
_u = _u		+ ['I44_P47A'];
_u = _u		+ ['I44_Plane_A_B17_AAF'];
_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
_u = _u		+ ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];

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
	_u = _u		+ ['I44_Man_B_Army_Medic'];
	_u = _u		+ ['BAF_Soldier_EN_W'];
	_u = _u		+ ['USMC_Soldier_LAT'];
    _u = _u		+ ['USMC_Soldier_MG'];
    _u = _u		+ ['USMC_Soldier_AA'];
_u = _u		+ ["UralCivil"];
_u = _u		+ ["V3S_Refuel_TK_GUE_EP1"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};