/*
	Defenses Definition, define the available defenses.
*/

Private ["_c","_f","_faction","_k","_n","_o","_side","_t"];

_side = "WEST";
_faction = "USMC";

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
_k = _k + ["AA"];

_c = _c + ['SearchLight'];
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

_c = _c + ['MK19_TriPod'];
_n = _n + [''];
_o = _o + [600];
_t = _t + ["Defense"];
_k = _k + ["GL"];

_c = _c + ['TOW_TriPod'];
_n = _n + [''];
_o = _o + [850];
_t = _t + ["Defense"];
_k = _k + ["AT"];

_c = _c + ['Stinger_Pod'];
_n = _n + [''];
_o = _o + [700];
_t = _t + ["Defense"];
_k = _k + ["AA"];

_c = _c + ['I44_GunMortar_A_M1_Army'];
_n = _n + [''];
_o = _o + [1250];
_t = _t + ["Defense"];
_k = _k + [""];

_c = _c + ['M119'];
_n = _n + [''];
_o = _o + [1800];
_t = _t + ["Defense"];
_k = _k + ["Artillery"];

//--- Defenses management for towns.
if (isServer) then {[_side, _c, _k] Call Compile preprocessFile "Common\Config\Config_Defenses_Towns.sqf"};

//--- Fortitications and rest.

// [_faction, _c, _n, _o, _t] Call Compile preprocessFile "Common\Config\Config_Defenses.sqf";