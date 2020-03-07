/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "RU";

_k = _k + ["Squad"];
_u		= ["I44_Man_G_WH_CO_MP40"];
_u = _u + ["I44_Man_G_WH_RTO"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_K98kZf41"];
_u = _u + ["I44_Man_G_WH_G43"];
_u = _u + ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_MG42"];
_u = _u + ["I44_Man_G_WH_Engr_FmW35"];
_u = _u + ["I44_Man_G_WH_Medic"];
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["I44_Man_G_WH_Camo_CO_MP40"];
_u = _u + ["I44_Man_G_WH_Camo_RTO"];
_u = _u + ["I44_Man_G_WH_Camo_MG34"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_Camo_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_Camo_Sniper_K98kZf42"];
_u = _u + ["I44_Man_G_WH_Camo_G43"];
_u = _u + ["I44_Man_G_WH_Camo_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_Camo_MG42"];
_u = _u + ["I44_Man_G_WH_Camo_Engr_FmW35"];
_u = _u + ["I44_Man_G_WH_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["I44_Man_G_SS_CO_MP40"];
_u = _u + ["I44_Man_G_SS_RTO"];
_u = _u + ["I44_Man_G_SS_MG42"];
_u = _u + ["I44_Man_G_SS_K98k_GGrGer"];
_u = _u + ["I44_Man_G_SS_Sniper_G43Zf4"];
_u = _u + ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_NCO_MP43"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["I44_Man_G_WL_FJ_CO_MP40"];
_u = _u + ["I44_Man_G_WL_FJ_MG42"];
_u = _u + ["I44_Man_G_WL_FJ_RPzB54"];
_u = _u + ["I44_Man_G_WL_FJ_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WL_FJ_FG42_Zf4"];
_u = _u + ["I44_Man_G_WL_FJ_FG42"];
_u = _u + ["I44_Man_G_WL_FJ_NCO_MP43"];
_l = _l + [_u];

_k = _k + ["Team"];
_u 		= ["I44_Man_G_SS_NCO_MP43"];
_u = _u + ["I44_Man_G_SS_ATCrew_G43"];
_u = _u + ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_G43"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["I44_Man_G_WL_FJ_NCO_MP43"];
_u = _u + ["I44_Man_G_WL_FJ_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WL_FJ_FG42"];
_u = _u + ["I44_Man_G_WL_FJ_FG42"];
_u = _u + ["I44_Man_G_WL_FJ_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG"];
_u		= ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_MG42"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_l = _l + [_u];

_k = _k + ["Team_HAT"];
_u		= ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_RPzB54"]; 
_u = _u + ["I44_Man_G_SS_K98k_PzF100"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["I44_Man_G_WH_Camo_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_Camo_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_Camo_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_G43"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["I44_Man_G_WL_FJ_FG42_Zf4"];
_u = _u + ["I44_Man_G_WL_FJ_Sniper_K98kZf42"];
_u = _u + ["I44_Man_G_WL_FJ_Sniper_G43Zf4"];
_u = _u + ["I44_Man_G_WL_FJ_FG42_Zf4"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_Man_G_WH_CO_MP40"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_u = _u + ["I44_ACar_G_SdKfz234_1_WH"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_K98kZf41"];
_u = _u + ["I44_Man_G_WH_G43"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_RTO"];
_u = _u + ["I44_Man_G_WH_Medic"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_motorcycle_G_BMWR75_S"];
_u = _u + ["I44_ACar_G_SdKfz222_WH"];
_u = _u + ["I44_ACar_G_SdKfz222_WH"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_ACar_G_SdKfz234_2_WH"];
_u = _u + ["I44_ACar_G_SdKfz234_3_WH"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["Ural_ZU23_INS"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["Ural_ZU23_INS"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["I44_Man_G_SS_CO_MP40"];
_u = _u + ["I44_ACar_G_SdKfz234_2_WH"];
_u = _u + ["I44_Man_G_SS_MG42"];
_u = _u + ["I44_Man_G_SS_ATCrew_G43"];
_u = _u + ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_K98k_PzF100"];
_u = _u + ["I44_Man_G_SS_Engr_FmW35"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["I44_ACar_G_SdKfz234_4_WH"];
_u = _u + ["I44_HT_G_SdKfz251_22_WH"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_HT_G_SdKfz251_22_WH"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_MG42"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_Tank_G_PzKpfwII_F_WH"];
_u = _u + ["I44_Man_G_WH_MG42"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_Tank_G_PzKpfwIV_D_WH"];
_u = _u + ["I44_Tank_G_PzKpfwII_F_WH"];
_u = _u + ["I44_Tank_G_JaPz38_T_WH"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["I44_Tank_G_PzKpfwIV_G_WH"];
_u = _u + ["I44_Tank_G_PzKpfwIV_G_WH"];
_u = _u + ["I44_Tank_G_StuGIII_G_Late_WH"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH"];
_u = _u + ["I44_Tank_G_PzKpfwV_G_camo_WH"];
_u = _u + ["I44_Tank_G_PzKpfwV_G_camo_WH"];
_u = _u + ["I44_Tank_G_StuH42_G_WH"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["I44_Tank_G_PzKpfwVI_B_WH"];
_u = _u + ["I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH"];
_u = _u + ["I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";