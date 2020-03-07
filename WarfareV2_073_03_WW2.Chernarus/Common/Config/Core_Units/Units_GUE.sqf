Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

_u 			= ['I44_Man_R_F_K98k'];
_u = _u		+ ['I44_Man_R_F_LeeEnfieldNo4Mk1'];
_u = _u		+ ['I44_Man_R_F_M37Ithaca'];
_u = _u		+ ['I44_Man_R_F_Doctor'];
_u = _u		+ ['I44_Man_R_F_Engr_GrenadeNo75'];
_u = _u		+ ['Ins_Bardak'];
_u = _u		+ ['I44_Man_R_F_StenMk2'];
_u = _u		+ ['I44_Man_R_F_StenMk5'];
_u = _u		+ ['I44_Man_R_F_P08'];
_u = _u		+ ['I44_Man_R_F_BrenMk1'];
_u = _u		+ ['I44_Man_R_F_CO_P08'];
_u = _u		+ ['I44_Man_R_F_P38'];
_u = _u		+ ['I44_Man_R_F_WebleyMk6'];
_u = _u		+ ['I44_Man_R_F_Sniper_K98kZf42'];
_u = _u		+ ['I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T'];
_u = _u		+ ['I44_Man_R_F_Engr_TNT'];
_u = _u		+ ['GUE_Villager3'];
_u = _u		+ ['GUE_Woodlander2'];
_u = _u		+ ['GUE_Villager4'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['V3S_Gue'];
_u = _u		+ ['I44_Car_A_WillysMB_M1919_Army'];
_u = _u		+ ['I44_Car_B_WillysAB_VGO_Army'];
_u = _u		+ ['BTR40_TK_GUE_EP1'];
_u = _u		+ ['BTR40_MG_TK_GUE_EP1'];
_u = _u		+ ['I44_HT_G_SdKfz251_1D_WH'];
_u = _u		+ ['Ural_ZU23_Gue'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['T34'];
//_u = _u		+ ['T72_Gue'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['I44_Plane_G_Ju52_3mg5e_WL'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_RAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_M57_RAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['I44_Plane_G_Ju52_3mg5e_WL'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_RAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_M57_RAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u			= ["Old_bike_TK_CIV_EP1"];
	_u = _u		+ ["Old_moto_TK_Civ_EP1"];
	_u = _u		+ ["Tractor"];
	_u = _u		+ ["LandRover_TK_CIV_EP1"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_GUERSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};