/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "RU";

_k = _k + ["Squad_0"];
_u		= ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_1"];
_u		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_2"];
_u		= ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_3"];
_u		= ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["MVD_Soldier_TL"];
_u = _u + ["MVD_Soldier_Marksman"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_Marksman"];
_u = _u + ["MVD_Soldier_MG"];
_l = _l + [_u];

_k = _k + ["Team_0"];
_u 		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_1"];
_u 		= ["RU_Soldier_TL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_2"];
_u 		= ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier_Medic"];
_u = _u + ["RU_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_3"];
_u 		= ["RU_Soldier_SL"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_HAT"];
_u = _u + ["RU_Soldier_GL"];
_u = _u + ["RU_Soldier_SniperH"];
_l = _l + [_u];

_k = _k + ["Team_MG_0"];
_u		= ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_1"];
_u		= ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_MG"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_2"];
_u		= ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_AR"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_3"];
_u		= ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["MVD_Soldier_MG"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_0"];
_u		= ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_1"];
_u		= ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_LAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_2"];
_u		= ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_3"];
_u		= ["RU_Soldier_AT"];
_u = _u + ["RU_Soldier_HAT"];
_u = _u + ["RU_Soldier_HAT"];
_u = _u + ["RU_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u =      ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_u = _u + ["RU_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_0"];
_u		= ["RU_Soldier_Sniper"];
_u = _u + ["RU_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_1"];
_u		= ["RU_Soldier_Sniper"];
_u = _u + ["RU_Soldier_Sniper"];
_u = _u + ["RU_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_2"];
_u		= ["RU_Soldier_Sniper"];
_u = _u + ["RU_Soldier_Sniper"];
_u = _u + ["RU_Soldier_Sniper"];
_u = _u + ["RU_Soldier_Sniper"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_3"];
_u		= ["RU_Soldier_SniperH"];
_u = _u + ["RU_Soldier_SniperH"];
_u = _u + ["RU_Soldier_SniperH"];
_l = _l + [_u];

_k = _k + ["Motorized_0"];
_u =      ["UAZ_MG_INS"];
_u = _u + ["UAZ_AGS30_RU"];
_l = _l + [_u];

_k = _k + ["Motorized_1"];
_u =      ["UAZ_MG_INS"];
_u = _u + ["UAZ_AGS30_RU"];
_u = _u + ["UAZ_AGS30_RU"];
_l = _l + [_u];

_k = _k + ["Motorized_2"];
_u =      ["GAZ_Vodnik"];
_u = _u + ["BRDM2_INS"];
_u = _u + ["BRDM2_INS"];
_l = _l + [_u];

_k = _k + ["Motorized_3"];
_u =      ["GAZ_Vodnik_HMG"];
_u = _u + ["GAZ_Vodnik_HMG"];
_u = _u + ["UAZ_SPG9_INS"];
_l = _l + [_u];

_k = _k + ["Motorized_4"];
_u =      ["BRDM2_ATGM_INS"];
_u = _u + ["BTR90"];
_u = _u + ["BTR90"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["ZSU_INS"];
_u = _u + ["ZSU_INS"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["ZSU_INS"];
_u = _u + ["2S6M_Tunguska"];
_l = _l + [_u];

_k = _k + ["Mechanized_0"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_l = _l + [_u];

_k = _k + ["Mechanized_1"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_l = _l + [_u];

_k = _k + ["Mechanized_2"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_l = _l + [_u];

_k = _k + ["Mechanized_3"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP2_INS"];
_u = _u + ["BMP3"];
_l = _l + [_u];

_k = _k + ["Mechanized_4"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP3"];
_u = _u + ["BMP3"];
_l = _l + [_u];

_k = _k + ["Armored_0"];
_u		= ["BMP2_INS"];
_u = _u + ["BMP3"];
_l = _l + [_u];

_k = _k + ["Armored_1"];
_u		= ["BMP3"];
_u = _u + ["BMP3"];
_l = _l + [_u];

_k = _k + ["Armored_2"];
_u		= ["T72_RU"];
_u = _u + ["T72_RU"];
_l = _l + [_u];

_k = _k + ["Armored_3"];
_u		= ["T72_RU"];
_u = _u + ["T90"];
_u = _u + ["T90"];
_l = _l + [_u];

_k = _k + ["Armored_4"];
_u		= ["T90"];
_u = _u + ["T90"];
_u = _u + ["T90"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";