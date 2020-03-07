/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "GUER";
_faction = "GUE";

_k = _k + ["Squad"];
_u		= ["I44_Man_R_F_LeeEnfieldNo4Mk1"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_K98k"];
_u = _u + ["I44_Man_R_F_Doctor"];
_u = _u + ["I44_Man_R_F_StenMk2"]; //Medic wenn vorhanden
_l = _l + [_u];

_k = _k + ["Squad"];
_u		= ["I44_Man_R_F_K98k"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT soldat wennn vorhanden
_u = _u + ["I44_Man_R_F_Doctor"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT soldat wennn vorhanden
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_LeeEnfieldNo4Mk1"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT soldat wennn vorhanden
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["I44_Man_R_F_StenMk2"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_Doctor"];
_l = _l + [_u];

_k = _k + ["Team"];
_u		= ["GUE_Villager4"];
_u = _u + ["I44_Man_R_F_P08"];
_u = _u + ["GUE_Villager3"];
_u = _u + ["GUE_Woodlander2"];
_u = _u + ["GUE_Villager3"];
_u = _u + ["GUE_Villager4"];
_l = _l + [_u];

_k = _k + ["Team_AT"];
_u		= ["I44_Man_R_F_K98k"];
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT soldat wennn vorhanden
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT soldat wennn vorhanden
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT soldat wennn vorhanden
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["I44_Man_R_F_Engr_TNT"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_l = _l + [_u];

_k = _k + ["Team_Sniper"];
_u		= ["I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T"];
_u = _u + ["GUE_Villager3"];
_u = _u + ["GUE_Villager4"];
_u = _u + ["I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T"];
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["I44_Man_R_F_CO_P08"];
_u = _u + ["V3S_GUE"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT wenn verfügbar
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_Doctor"];
_u = _u + ["I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T"];
_u = _u + ["I44_Man_R_F_StenMk2"];
_u = _u + ["I44_Man_R_F_M37Ithaca"]; // Medic wenn verfügbar
_l = _l + [_u];

_k = _k + ["Motorized"];
_u		= ["BTR40_TK_GUE_EP1"];
_u = _u + ["I44_Car_A_WillysMB_M1919_Army"];
_u = _u + ["I44_Car_B_WillysAB_VGO_Army"];
_u = _u + ["I44_Car_B_WillysAB_VGO_Army"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["I44_Man_R_F_Engr_TNT"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_StenMk2"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["Ural_ZU23_Gue"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["I44_Man_R_F_Engr_TNT"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_K98k"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["I44_Man_R_F_BrenMk1"];
_u = _u + ["BTR40_TK_GUE_EP1"];
//_u = _u + ["BTR40_TK_GUE_EP1"];
_u = _u + ["I44_Man_R_F_StenMk2"];
_u = _u + ["I44_Man_R_F_LeeEnfieldNo4Mk1"];
_l = _l + [_u];

_k = _k + ["Mechanized"];
_u		= ["BTR40_TK_GUE_EP1"];
_u = _u + ["BTR40_TK_GUE_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_Man_R_F_P38"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_Doctor"];
_u = _u + ["I44_Man_R_F_Sniper_K98kZf42"];
_u = _u + ["I44_Man_R_F_P08"]; //Wiederstand AT wenn verfügbar
_l = _l + [_u];

_k = _k + ["Mechanized_Heavy"];
_u		= ["I44_HT_G_SdKfz251_1D_WH"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_l = _l + [_u];

_k = _k + ["Armored_Light"];
_u		= ["T34"];
_u = _u + ["T34"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T34"];
_u = _u + ["T34"];
_u = _u + ["T34"];
_u = _u + ["T34"];
_l = _l + [_u];

_k = _k + ["Armored_Heavy"];
_u		= ["T34"];
_u = _u + ["T34"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";