/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "CDF";

_k = _k + ["Squad_0"];
_u		= ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_1"];
_u		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_2"];
_u		= ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_3"];
_u		= ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_0"];
_u 		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_Light"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_Light"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_1"];
_u 		= ["CDF_Soldier_TL"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_2"];
_u 		= ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_u = _u + ["CDF_Soldier_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_3"];
_u 		= ["CDF_Soldier_Officer"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_GL"];
_u = _u + ["CDF_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_MG_0"];
_u		= ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_1"];
_u		= ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_2"];
_u		= ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_MG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_3"];
_u		= ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_AR"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_0"];
_u		= ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_1"];
_u		= ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_2"];
_u		= ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_3"];
_u		= ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_RPG"];
_u = _u + ["CDF_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u		= ["CDF_Soldier_AA"];
_u = _u + ["CDF_Soldier_AA"];
_u = _u + ["CDF_Soldier_AA"];
_u = _u + ["CDF_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_0"];
_u		= ["CDF_Soldier"];
_u = _u + ["CDF_Soldier"];
_u = _u + ["CDF_Soldier"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_1"];
_u		= ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_Marksman"];
_u = _u + ["CDF_Soldier_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_2"];
_u		= ["CDF_Soldier_Spotter"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_3"];
_u		= ["CDF_Soldier_Spotter"];
_u = _u + ["CDF_Soldier_Sniper"];
_u = _u + ["CDF_Soldier_SniperH"];
_l = _l + [_u];

_k = _k + ["Motorized_0"];
_u =      ["UAZ_MG_INS"];
_u = _u + ["UAZ_MG_INS"];
_l = _l + [_u];

_k = _k + ["Motorized_1"];
_u =      ["UAZ_MG_CDF"];
_u = _u + ["UAZ_MG_CDF"];
_u = _u + ["UAZ_AGS30_CDF"];
_l = _l + [_u];

_k = _k + ["Motorized_2"];
_u =      ["BRDM2_CDF"];
_u = _u + ["UAZ_AGS30_CDF"];
_u = _u + ["UAZ_SPG9_INS"];
_l = _l + [_u];

_k = _k + ["Motorized_3"];
_u =      ["BRDM2_CDF"];
_u = _u + ["BRDM2_CDF"];
_u = _u + ["BRDM2_ATGM_CDF"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["ZSU_CDF"];
_u = _u + ["ZSU_CDF"];
_u = _u + ["CDF_Soldier_AA"];
_u = _u + ["CDF_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["ZSU_CDF"];
_u = _u + ["ZSU_CDF"];
_u = _u + ["ZSU_CDF"];
_u = _u + ["ZSU_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized_0"];
_u		= ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized_1"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized_2"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Mechanized_3"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_0"];
_u		= ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_1"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_2"];
_u		= ["BMP2_CDF"];
_u = _u + ["BMP2_CDF"];
_l = _l + [_u];

_k = _k + ["Armored_3"];
_u		= ["T72_CDF"];
_u = _u + ["T72_CDF"];
_u = _u + ["T72_CDF"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";