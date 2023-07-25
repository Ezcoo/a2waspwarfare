/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "USMC";

_k = _k + ["Squad_0"];
_u		= ["USMC_Soldier_GL"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_GL"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_1"];
_u		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_2"];
_u		= ["USMC_Soldier_SL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_SL"];
_u = _u + ["BAF_Soldier_AAT_W"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_3"];
_u		= ["USMC_Soldier_SL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_SL"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["FR_TL"];
_u = _u + ["FR_Assault_R"];
_u = _u + ["FR_AR"];
_u = _u + ["FR_R"];
_u = _u + ["FR_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_0"];
_u 		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier_GL"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_1"];
_u 		= ["USMC_Soldier_TL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier_GL"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_2"];
_u 		= ["USMC_Soldier_SL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_GL"];
_u = _u + ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier_Medic"];
_u = _u + ["USMC_SoldierM_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_3"];
_u 		= ["USMC_Soldier_SL"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_HAT"];
_u = _u + ["USMC_Soldier_GL"];
_u = _u + ["USMC_SoldierS_SniperH"];
_l = _l + [_u];

_k = _k + ["Team_MG_0"];
_u		= ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_1"];
_u		= ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_MG"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_2"];
_u		= ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_AR"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_3"];
_u		= ["BAF_Soldier_MG_W"];
_u = _u + ["BAF_Soldier_MG_W"];
_u = _u + ["BAF_Soldier_MG_W"];
_u = _u + ["BAF_Soldier_MG_W"];
_l = _l + [_u];

_k = _k + ["Team_AT_0"];
_u		= ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_1"];
_u		= ["USMC_Soldier_LAT"];
_u = _u + ["USMC_Soldier_LAT"];
_u = _u + ["BAF_Soldier_AT_W"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_2"];
_u		= ["BAF_Soldier_AT_W"];
_u = _u + ["BAF_Soldier_AT_W"];
_u = _u + ["BAF_Soldier_AAT_W"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_3"];
_u		= ["USMC_Soldier_AT"];
_u = _u + ["USMC_Soldier_HAT"];
_u = _u + ["USMC_Soldier_HAT"];
_u = _u + ["USMC_Soldier_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AA"];
_u =      ["USMC_Soldier_AA"];
_u = _u + ["USMC_Soldier_AA"];
_u = _u + ["USMC_Soldier_AA"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_0"];
_u		= ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier2"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_1"];
_u		= ["USMC_Soldier2"];
_u = _u + ["USMC_Soldier2"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_2"];
_u		= ["USMC_Soldier2"];
_u = _u + ["USMC_SoldierM_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_3"];
_u		= ["US_Soldier_Spotter_EP1"];
_u = _u + ["USMC_SoldierS_SniperH"];
_u = _u + ["BAF_Soldier_SniperH_W"];
_l = _l + [_u];

_k = _k + ["Motorized_0"];
_u =      ["HMMWV_M1151_M2_DES_EP1"];
_u = _u + ["HMMWV_MK19"];
_l = _l + [_u];

_k = _k + ["Motorized_1"];
_u =      ["HMMWV_M1151_M2_DES_EP1"];
_u = _u + ["HMMWV_MK19"];
_l = _l + [_u];

_k = _k + ["Motorized_2"];
_u =      ["HMMWV_M998_crows_M2_DES_EP1"];
_u = _u + ["HMMWV_M998_crows_MK19_DES_EP1"];
_u = _u + ["BAF_Jackal2_GMG_D"];
_l = _l + [_u];

_k = _k + ["Motorized_3"];
_u =      ["M1126_ICV_M2_EP1"];
_u = _u + ["M1126_ICV_mk19_EP1"];
_u = _u + ["HMMWV_TOW"];
_l = _l + [_u];

_k = _k + ["Motorized_4"];
_u =      ["LAV25"];
_u = _u + ["M1135_ATGMV_EP1"];
_u = _u + ["M1128_MGS_EP1"];
_l = _l + [_u];

_k = _k + ["AA_Light"];
_u		= ["HMMWV_Avenger"];
_u = _u + ["HMMWV_Avenger"];
_l = _l + [_u];

_k = _k + ["AA_Heavy"];
_u		= ["HMMWV_Avenger"];
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
_u		= ["BAF_FV510_W"];
_u = _u + ["BAF_FV510_W"];
_u = _u + ["M2A3_EP1"];
_l = _l + [_u];

_k = _k + ["Mechanized_4"];
_u		= ["BAF_FV510_W"];
_u = _u + ["BAF_FV510_W"];
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
_u		= ["M1A1"];
_u = _u + ["M1A1"];
_l = _l + [_u];

_k = _k + ["Armored_3"];
_u		= ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_l = _l + [_u];

_k = _k + ["Armored_4"];
_u		= ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_u = _u + ["M1A2_TUSK_MG"];
_l = _l + [_u];

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";