/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "TKA";

_k = _k + ["Squad_0"];
_u		= ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_1"];
_u		= ["TK_Soldier_Officer_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Officer_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Officer_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_2"];
_u		= ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_3"];
_u		= ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["TK_Special_Forces_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Special_Forces_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Special_Forces_EP1"];
_l = _l + [_u];

_k = _k + ["Team_0"];
_u 		= ["TK_Soldier_Officer_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_1"];
_u 		= ["TK_Soldier_Officer_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_l = _l + [_u];

_k = _k + ["Team_2"];
_u 		= ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_l = _l + [_u];

_k = _k + ["Team_3"];
_u 		= ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Special_Forces_EP1"];
_u = _u + ["TK_Soldier_SniperH_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_0"];
_u		= ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_1"];
_u		= ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_2"];
_u		= ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG_3"];
_u		= ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_0"];
_u		= ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_1"];
_u		= ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_LAT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_2"];
_u 		= ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT_3"];
_u		= ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_Medic_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_0"];
_u		= ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_u = _u + ["TK_Soldier_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_1"];
_u		= ["TK_Soldier_Sniper_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_2"];
_u		= ["TK_Soldier_Spotter_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_3"];
_u		= ["TK_Soldier_Spotter_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_u = _u + ["TK_Soldier_SniperH_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_0"];
_u =      ["UAZ_MG_TK_EP1"];
_u = _u + ["UAZ_MG_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_1"];
_u =      ["UAZ_MG_TK_EP1"];
_u = _u + ["UAZ_MG_TK_EP1"];
_u = _u + ["UAZ_AGS30_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_2"];
_u =      ["GAZ_Vodnik"];
_u = _u + ["UAZ_AGS30_TK_EP1"];
_u = _u + ["LandRover_SPG9_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_3"];
_u =      ["GAZ_Vodnik_HMG"];
_u = _u + ["BTR60_TK_EP1"];
_u = _u + ["BTR60_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized_4"];
_u =      ["BTR90"];
_u = _u + ["BRDM2_ATGM_TK_EP1"];
_u = _u + ["BTR90"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["ZSU_TK_EP1"];
_u = _u + ["ZSU_TK_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["2S6M_Tunguska"];
_u = _u + ["ZSU_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_0"];
_u		= ["M113_TK_EP1"];
_u = _u + ["M113_TK_EP1"];
_u = _u + ["BMP2_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_1"];
_u		= ["BMP2_TK_EP1"];
_u = _u + ["BMP2_TK_EP1"];
_u = _u + ["BMP2_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_2"];
_u		= ["BMP2_TK_EP1"];
_u = _u + ["BMP2_TK_EP1"];
_u = _u + ["BMP3"];
_l = _l + [_u];

_k = _k + ["Mechanized_3"];
_u		= ["BMP3"];
_u = _u + ["BMP3"];
_u = _u + ["BMP3"];
_l = _l + [_u];

k = _k + ["Armored_0"];
_u		= ["T34_TK_EP1"];
_u = _u + ["T34_TK_EP1"];
_l = _l + [_u];

k = _k + ["Armored_1"];
_u		= ["T55_TK_EP1"];
_u = _u + ["T55_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_2"];
_u		= ["T72_TK_EP1"];
_u = _u + ["T72_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_3"];
_u		= ["T90"];
_u = _u + ["T90"];
_u = _u + ["T72_RU"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";