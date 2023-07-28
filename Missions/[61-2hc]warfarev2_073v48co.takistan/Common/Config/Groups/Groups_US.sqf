/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "US";

_k = _k + ["Squad_0"];
_u		= ["US_Soldier_GL_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_GL_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_1"];
_u		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_2"];
_u		= ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_SL_EP1"];
_u = _u + ["BAF_Soldier_AAT_DDPM"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_3"];
_u		= ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["US_Delta_Force_TL_EP1"];
_u = _u + ["US_Delta_Force_Assault_EP1"];
_u = _u + ["US_Delta_Force_MG_EP1"];
_u = _u + ["US_Delta_Force_Assault_EP1"];
_u = _u + ["US_Delta_Force_M14_EP1"];
_l = _l + [_u];

_k = _k + ["Team_0"];
_u 		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_GL_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_1"];
_u 		= ["US_Soldier_TL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_GL_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_2"];
_u 		= ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_GL_EP1"];
_u = _u + ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_u = _u + ["US_Soldier_Marksman_EP1"];
_l = _l + [_u];

_k = _k + ["Team_3"];
_u 		= ["US_Soldier_SL_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_HAT_EP1"];
_u = _u + ["US_Soldier_GL_EP1"];
_u = _u + ["US_Soldier_SniperH_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_0"];
_u		= ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_1"];
_u		= ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_MG_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_2"];
_u		= ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_AR_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_3"];
_u		= ["GER_Soldier_MG_EP1"];
_u = _u + ["GER_Soldier_MG_EP1"];
_u = _u + ["GER_Soldier_MG_EP1"];
_u = _u + ["GER_Soldier_MG_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_0"];
_u		= ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_1"];
_u		= ["US_Soldier_LAT_EP1"];
_u = _u + ["US_Soldier_LAT_EP1"];
_u = _u + ["BAF_Soldier_AT_DDPM"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_2"];
_u		= ["BAF_Soldier_AT_DDPM"];
_u = _u + ["BAF_Soldier_AT_DDPM"];
_u = _u + ["BAF_Soldier_AAT_DDPM"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_3"];
_u		= ["US_Soldier_AT_EP1"];
_u = _u + ["US_Soldier_HAT_EP1"];
_u = _u + ["US_Soldier_HAT_EP1"];
_u = _u + ["US_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u =      ["US_Soldier_AA_EP1"];
_u = _u + ["US_Soldier_AA_EP1"];
_u = _u + ["US_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_0"];
_u		= ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_1"];
_u		= ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_2"];
_u		= ["US_Soldier_EP1"];
_u = _u + ["US_Soldier_Marksman_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_3"];
_u		= ["US_Soldier_Spotter_EP1"];
_u = _u + ["US_Soldier_SniperH_EP1"];
_u = _u + ["BAF_Soldier_SniperH_MTP"];
_l = _l + [_u];

_k = _k + ["Motorized_0"];
_u =      ["HMMWV_M1151_M2_DES_EP1"];
_u = _u + ["HMMWV_MK19_DES_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_1"];
_u =      ["HMMWV_M1151_M2_DES_EP1"];
_u = _u + ["HMMWV_MK19_DES_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_2"];
_u =      ["HMMWV_M998_crows_M2_DES_EP1"];
_u = _u + ["HMMWV_M998_crows_MK19_DES_EP1"];
_u = _u + ["BAF_Jackal2_GMG_D"];
_l = _l + [_u];

_k = _k + ["Motorized_3"];
_u =      ["M1126_ICV_M2_EP1"];
_u = _u + ["M1126_ICV_mk19_EP1"];
_u = _u + ["HMMWV_TOW_DES_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_4"];
_u =      ["LAV25"];
_u = _u + ["M1135_ATGMV_EP1"];
_u = _u + ["M1128_MGS_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["HMMWV_Avenger_DES_EP1"];
_u = _u + ["HMMWV_Avenger_DES_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["HMMWV_Avenger_DES_EP1"];
_u = _u + ["M6_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_0"];
_u		= ["AAV"];
_u = _u + ["AAV"];
_l = _l + [_u];

_k = _k + ["Mechanized_1"];
_u		= ["M2A2_EP1"];
_u = _u + ["M2A2_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_2"];
_u		= ["M2A2_EP1"];
_u = _u + ["M2A2_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_3"];
_u		= ["BAF_FV510_D"];
_u = _u + ["BAF_FV510_D"];
_u = _u + ["M2A3_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_4"];
_u		= ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["BAF_FV510_D"];
_u = _u + ["M2A3_EP1"];
_l = _l + [_u];


_k = _k + ["Armored_0"];
_u		= ["M2A2_EP1"];
_u = _u + ["M2A2_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_1"];
_u		= ["M2A3_EP1"];
_u = _u + ["M2A3_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_2"];
_u		= ["M1A1_US_DES_EP1"];
_u = _u + ["M1A1_US_DES_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_3"];
_u		= ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_4"];
_u		= ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_u = _u + ["M1A2_US_TUSK_MG_EP1"];
_l = _l + [_u];


[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";