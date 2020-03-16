/*
	Defenses Definition, define the available defenses.
*/

Private ["_c","_f","_faction","_k","_n","_o","_side","_t"];

_side = "WEST";
_faction = "US";

_c = []; //--- Classname
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Category
_k = []; //--- Kind (Used for town defenses)

//--- Defenses (Statics)
_c = _c + ['I44_GunMG_A_M2HB_TripodAA_Army'];
_n = _n + [''];
_o = _o + [300];
_t = _t + ["Defense"];
_k = _k + ["MGNest"];

_c = _c + ['SearchLight_US_EP1'];
_n = _n + [''];
_o = _o + [50];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['I44_GunMG_A_M2HB_TripodM3_Army'];
_n = _n + [''];
_o = _o + [275];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['I44_GunMG_A_M1919A4_TripodM2_c_Army'];
_n = _n + [''];
_o = _o + [225];
_t = _t + ["Defense"];
_k = _k + ["MG"];

_c = _c + ['I44_GunMG_B_Vickers_Army'];
_n = _n + [''];
_o = _o + [230];
_t = _t + ["Defense"];
_k = _k + ["MG"];

_c = _c + ['ZU23_CDF'];
_n = _n + [''];
_o = _o + [700];
_t = _t + ["Defense"];
_k = _k + ["AA"];

_c = _c + ['I44_GunAT_A_M1_Army'];
_n = _n + [''];
_o = _o + [650];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['I44_GunMortar_A_M1_Army'];
_n = _n + [''];
_o = _o + [1250];
_t = _t + ["Defense"];
_k = _k + ["Artillery"];

//--- Defenses management for towns.
if (isServer) then {[_side, _c, _k] Call Compile preprocessFile "Common\Config\Config_Defenses_Towns.sqf"};

//--- Fortitications and rest.

// [_faction, _c, _n, _o, _t] Call Compile preprocessFile "Common\Config\Config_Defenses.sqf";