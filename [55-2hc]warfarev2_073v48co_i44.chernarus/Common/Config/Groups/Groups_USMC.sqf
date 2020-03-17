/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "USMC";

_k = _k + ["Squad_0"];
_u		= ["I44_Man_A_Army_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_1"];
_u		= ["I44_Man_B_Army_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_B_Army_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_B_Army_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_2"];
_u		= ["I44_Man_A_Army_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_NCO_M1A1Thompson"];
_u = _u + ["BAF_Soldier_AAT_W"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_3"];
_u		= ["I44_Man_A_Army_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_B_Army_PIAT"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Squad_Advanced"];
_u		= ["I44_Man_B_Army_Sapper_M2"];
_u = _u + ["FR_Assault_R"];
_u = _u + ["FR_AR"];
_u = _u + ["FR_R"];
_u = _u + ["FR_Marksman"];
_l = _l + [_u];

_k = _k + ["Team_0"];
_u 		= ["I44_Man_B_Army_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_1"];
_u 		= ["I44_Man_B_Army_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_2"];
_u 		= ["I44_Man_A_Army_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_3"];
_u 		= ["I44_Man_A_Army_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_B_Army_PIAT"];
_u = _u + ["I44_Man_A_Army_M1Garand_M7"];
_u = _u + ["I44_Man_B_Army_Sniper_SMLENo4Mk1TH"];
_l = _l + [_u];

_k = _k + ["Team_MG_0"];
_u		= ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_1"];
_u		= ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_M1919A4"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_2"];
_u		= ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_MG_3"];
_u		= ["BAF_Soldier_MG_W"];
_u = _u + ["BAF_Soldier_MG_W"];
_u = _u + ["BAF_Soldier_MG_W"];
_u = _u + ["BAF_Soldier_MG_W"];
_l = _l + [_u];

_k = _k + ["Team_AT_0"];
_u		= ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_1"];
_u		= ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["BAF_Soldier_AT_W"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_2"];
_u		= ["BAF_Soldier_AT_W"];
_u = _u + ["BAF_Soldier_AT_W"];
_u = _u + ["BAF_Soldier_AAT_W"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_AT_3"];
_u		= ["I44_Man_B_Army_PIAT"];
_u = _u + ["I44_Man_B_Army_PIAT"];
_u = _u + ["I44_Man_A_Army_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Medic"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_0"];
_u		= ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_1"];
_u		= ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_M1918A2"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_2"];
_u		= ["I44_Man_A_Army_M1918A2"];
_u = _u + ["I44_Man_A_Army_Sniper_M1903A4"];
_l = _l + [_u];

_k = _k + ["Team_Sniper_3"];
_u		= ["US_Soldier_Spotter_EP1"];
_u = _u + ["I44_Man_B_Army_Sniper_SMLENo4Mk1TH"];
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


[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";