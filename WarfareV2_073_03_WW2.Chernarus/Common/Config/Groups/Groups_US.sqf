/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "US";

_k = _k + ["Squad"];
_u		= ["I44_Man_A_Army_DDay_CO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_DDay_RTO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_DDay_M1903A3_M1"];
_u = _u + ["I44_Man_A_Army_DDay_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1Garand"];
_u = _u + ["I44_Man_A_Army_DDay_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_DDay_M1918A2"];
_u = _u + ["I44_Man_A_Army_DDay_Engr_M2_2"];
_u = _u + ["I44_Man_A_Army_DDay_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["I44_Man_A_Army_Ranger_CO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_RTO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_M1919A4"];
_u = _u + ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Ranger_M1903A3_M1"];
_u = _u + ["I44_Man_A_Army_Ranger_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand"];
_u = _u + ["I44_Man_A_Army_Ranger_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_Ranger_M1918A2"];
_u = _u + ["I44_Man_A_Army_Ranger_Engr_M2_2"];
_u = _u + ["I44_Man_A_Army_Ranger_Medic"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["I44_Man_A_Army_AB_82_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_AB_82_M1918A2"];
_u = _u + ["I44_Man_A_Army_AB_82_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_AB_M3Greasegun"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["I44_Man_B_Army_AB_NCO_StenMk5"];
_u = _u + ["I44_Man_B_Army_AB_BrenMk1"];
_u = _u + ["I44_Man_B_Army_AB_ATCrew_SMLEdNo4Mk1"];
_u = _u + ["I44_Man_B_Army_AB_PIAT"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["I44_Man_B_Army_Commando_NCO_StenMk2S"];
_u = _u + ["I44_Man_B_Army_Commando_BrenMk1"];
_u = _u + ["I44_Man_B_Army_Commando_PIAT"];
_u = _u + ["I44_Man_B_Army_Commando_StenMk5"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["I44_Man_A_Army_DDay_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1918A2"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["I44_Man_A_Army_DDay_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_DDay_ATCrew_M3"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_l = _l + [_u];

_k = _k + ["Team_HAT"];
_u		= ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_B_Army_AB_PIAT"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["I44_Man_A_Army_Ranger_NCO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand_M7"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_B_Army_AB_Sniper_SMLENo4Mk1T"];
_u = _u + ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_Man_A_Army_DDay_NCO_M1Garand"];
_u = _u + ["I44_Car_A_WillysMB_M1919_Army"];
_u = _u + ["I44_HT_A_M3_Army"];
_u = _u + ["I44_Man_A_Army_DDay_M1918A2"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_A_Army_DDay_Sniper_M1903A4"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_Man_B_Army_AB_NCO_StenMk5"];
_u = _u + ["I44_Tank_B_Army_UC"];
_u = _u + ["I44_ACar_A_M8_Greyhound_Army"];
_u = _u + ["I44_Man_B_Army_AB_BrenMk1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_ACar_A_M8_Greyhound_Army"];
_u = _u + ["I44_HT_A_M3A1_Army"];
_u = _u + ["I44_ACar_A_M8_Greyhound_Army"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["Ural_ZU23_CDF"];
_u = _u + ["I44_Man_A_Army_DDay_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_DDay_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_DDay_M1Garand_M7"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["Ural_ZU23_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["I44_ACar_A_M8_Greyhound_Army"];
_u = _u + ["I44_Man_B_Army_AB_BrenMk1"];
_u = _u + ["I44_Man_B_Army_AB_PIAT"];
_u = _u + ["I44_Man_B_Army_AB_Medic"];
_u = _u + ["I44_Man_B_Army_AB_StenMk5"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["I44_Tank_A_M3A3_Stuart_Army"];
_u = _u + ["I44_HT_A_M3A1_Army"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["I44_Tank_A_M3A3_Stuart_Army"];
_u = _u + ["I44_ACar_A_M8_Greyhound_Army"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_Tank_A_M5A1_Stuart_Army"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_DDay_Medic"];
_u = _u + ["I44_Man_A_Army_DDay_RTO_M1Carbine"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_Veh_A_Army_M4A3_Sherman_Army"];
_u = _u + ["I44_Veh_A_Army_M4A3_DD_Sherman_Army"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["I44_Veh_A_Army_M4A3_76_Sherman_Army"];
_u = _u + ["I44_Tank_B_Cromwell_Army"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army"];
_u = _u + ["I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army"];
_u = _u + ["I44_Tank_B_ShermanVC_Army"];
_u = _u + ["I44_Tank_B_ShermanVC_Army"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["I44_Tank_B_ShermanVC_Army"];
_u = _u + ["I44_Veh_B_Army_MKIV_Churchill"];
_u = _u + ["I44_Veh_B_Army_MKIV_Churchill"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";