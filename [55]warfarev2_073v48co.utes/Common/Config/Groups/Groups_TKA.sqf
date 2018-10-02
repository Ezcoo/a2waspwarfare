/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "TKA";

_k = _k + ["Squad"];
_u		= ["TK_Soldier_SL_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];
_u = _u + ["TK_Soldier_GL_EP1"];

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

_k = _k + ["Team"];
_u		= ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AR_EP1"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["TK_Special_Forces_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_u = _u + ["TK_Soldier_MG_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u 		= ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_HAT"];
_u		= ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_HAT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_u = _u + ["TK_Soldier_AT_EP1"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["TK_Soldier_Sniper_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_u = _u + ["TK_Soldier_Sniper_EP1"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["BRDM2_TK_EP1"];
_u = _u + ["BRDM2_TK_EP1"];
_u = _u + ["BRDM2_ATGM_TK_EP1"];

_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["Ural_ZU23_TK_EP1"];
_u = _u + ["Ural_ZU23_TK_EP1"];
_u = _u + ["TK_Soldier_AA_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["ZSU_TK_EP1"];
_u = _u + ["ZSU_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BTR60_TK_EP1"];
_u = _u + ["BTR60_TK_EP1"];
_u = _u + ["BRDM2_ATGM_TK_EP1"];
_l = _l + [_u];


_k = _k + ["Mechanized_Heavy"];
_u		= ["TK_Soldier_SL_EP1"];
_u = _u + ["BMP2_TK_EP1"];
_u = _u + ["BRDM2_ATGM_TK_EP1"];

_l = _l + [_u];



_k = _k + ["Armored_Light"];
_u		= ["T72_TK_EP1"];
_u = _u + ["T72_TK_EP1"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T72_TK_EP1"];
_u = _u + ["T72_TK_EP1"];
_u = _u + ["T72_TK_EP1"];

_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";