Private ['_restriction_air','_side','_tiMode','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";
_tiMode = missionNamespace getVariable "WFBE_C_GAMEPLAY_THERMAL_IMAGING";
_tiMode = if (_tiMode == 1 || _tiMode == 3) then {true} else {false};

	_u 			= ['I44_Man_G_WH_Medic'];
	_u = _u		+ ['I44_Man_G_WH_RTO'];
	_u = _u		+ ['I44_Man_G_WH_K98k'];
	_u = _u		+ ['I44_Man_G_WH_K98k_GGrGer'];
	_u = _u		+ ['I44_Man_G_WH_K98kZf41'];
	_u = _u		+ ['I44_Man_G_WH_Sniper_K98kZf42'];	
	_u = _u		+ ['I44_Man_G_WH_G43'];
	_u = _u		+ ['I44_Man_G_WH_Sniper_G43Zf4'];
	_u = _u		+ ['I44_Man_G_WH_MG34'];
	_u = _u		+ ['I44_Man_G_WH_MG42'];
	_u = _u		+ ['I44_Man_G_WH_K98k_PzF30'];
	_u = _u		+ ['I44_Man_G_WH_K98k_PzF60'];
	_u = _u		+ ['I44_Man_G_WH_K98k_PzF100'];
	_u = _u		+ ['I44_Man_G_WH_ATCrew_G43'];
	_u = _u		+ ['I44_Man_G_WH_RPzB54'];
	_u = _u		+ ['I44_Man_G_WH_MP40'];
	_u = _u		+ ['I44_Man_G_WH_MP43'];
	_u = _u		+ ['I44_Man_G_WH_NCO_MP40'];
	_u = _u		+ ['I44_Man_G_WH_NCO_MP43'];
	_u = _u		+ ['I44_Man_G_WH_CO_P08'];
	_u = _u		+ ['I44_Man_G_WH_CO_MP40'];
	_u = _u		+ ['I44_Man_G_WH_Engr_FmW35'];
	_u = _u		+ ['I44_Man_G_WH_Engr_GbLadung10kg'];
	_u = _u		+ ['I44_Man_G_WH_Engr_GbLadung3kg'];
	_u = _u		+ ['I44_Man_G_WH_Engr_Rohrladung'];
	_u = _u		+ ['I44_Man_G_WH_Engr_SprB24'];
	_u = _u		+ ['I44_Man_G_WH_Engr_TMi42'];
	_u = _u		+ ['I44_Man_G_WH_GunCrew_K98k'];
	_u = _u		+ ['I44_Man_G_WH_GunCrew_NCO_P38'];
	_u = _u		+ ['I44_Man_G_WH_MCrew_G'];
	_u = _u		+ ['I44_Man_G_WH_MCrew_C'];
	_u = _u		+ ['I44_Man_G_WH_Crew_P38'];
	_u = _u		+ ['I44_Man_G_WH_Crew_NCO_P38'];
	_u = _u		+ ['I44_Man_G_WH_Crew_MP40'];
	_u = _u		+ ['I44_Man_G_WL_Pilot_P38'];
	_u = _u		+ ['I44_Man_G_WH_Camo_RTO'];
	_u = _u		+ ['I44_Man_G_WH_Camo_K98k'];
	_u = _u		+ ['I44_Man_G_WH_Camo_K98k_GGrGer'];
	_u = _u		+ ['I44_Man_G_WH_Camo_K98kZf41'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Sniper_K98kZf42'];
	_u = _u		+ ['I44_Man_G_WH_Camo_G43'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Sniper_G43Zf4'];
	_u = _u		+ ['I44_Man_G_WH_Camo_MG34'];
	_u = _u		+ ['I44_Man_G_WH_Camo_MG42'];
	_u = _u		+ ['I44_Man_G_WH_Camo_K98k_PzF30'];
	_u = _u		+ ['I44_Man_G_WH_Camo_K98k_PzF60'];
	_u = _u		+ ['I44_Man_G_WH_Camo_K98k_PzF100'];
	_u = _u		+ ['I44_Man_G_WH_Camo_ATCrew_G43'];
	_u = _u		+ ['I44_Man_G_WH_Camo_RPzB54'];
	_u = _u		+ ['I44_Man_G_WH_Camo_MP40'];
	_u = _u		+ ['I44_Man_G_WH_Camo_MP43'];
	_u = _u		+ ['I44_Man_G_WH_Camo_NCO_K98k'];
	_u = _u		+ ['I44_Man_G_WH_Camo_NCO_MP40'];
	_u = _u		+ ['I44_Man_G_WH_Camo_NCO_MP43'];
	_u = _u		+ ['I44_Man_G_WH_Camo_CO_P08'];
	_u = _u		+ ['I44_Man_G_WH_Camo_CO_MP40'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Engr_FmW35'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Engr_GbLadung10kg'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Engr_GbLadung3kg'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Engr_Rohrladung'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Engr_SprB24'];
	_u = _u		+ ['I44_Man_G_WH_Camo_Engr_TMi42'];
	_u = _u		+ ['I44_Man_G_WH_Camo_MCrew_G'];
	_u = _u		+ ['I44_Man_G_WH_Camo_MCrew_C'];
	_u = _u		+ ['I44_Man_G_SS_Medic'];
	_u = _u		+ ['I44_Man_G_SS_RTO'];
	_u = _u		+ ['I44_Man_G_SS_K98k'];
	_u = _u		+ ['I44_Man_G_SS_K98k_GGrGer'];
	_u = _u		+ ['I44_Man_G_SS_K98kZf41'];
	_u = _u		+ ['I44_Man_G_SS_Sniper_K98kZf42'];
	_u = _u		+ ['I44_Man_G_SS_G43'];
	_u = _u		+ ['I44_Man_G_SS_Sniper_G43Zf4'];
	_u = _u		+ ['I44_Man_G_SS_MG34'];
	_u = _u		+ ['I44_Man_G_SS_MG42'];
	_u = _u		+ ['I44_Man_G_SS_K98k_PzF30'];
	_u = _u		+ ['I44_Man_G_SS_K98k_PzF60'];
	_u = _u		+ ['I44_Man_G_SS_K98k_PzF100'];
	_u = _u		+ ['I44_Man_G_SS_ATCrew_G43'];
	_u = _u		+ ['I44_Man_G_SS_RPzB54'];
	_u = _u		+ ['I44_Man_G_SS_MP40'];
	_u = _u		+ ['I44_Man_G_SS_MP43'];
	_u = _u		+ ['I44_Man_G_SS_NCO_K98k'];
	_u = _u		+ ['I44_Man_G_SS_NCO_MP40'];
	_u = _u		+ ['I44_Man_G_SS_NCO_MP43'];
	_u = _u		+ ['I44_Man_G_SS_CO_P08'];
	_u = _u		+ ['I44_Man_G_SS_CO_MP40'];
	_u = _u		+ ['I44_Man_G_SS_Engr_FmW35'];
	_u = _u		+ ['I44_Man_G_SS_Engr_GbLadung10kg'];
	_u = _u		+ ['I44_Man_G_SS_Engr_GbLadung3kg'];
	_u = _u		+ ['I44_Man_G_SS_Engr_Rohrladung'];
	_u = _u		+ ['I44_Man_G_SS_Engr_SprB24'];
	_u = _u		+ ['I44_Man_G_SS_Engr_TMi42'];
	_u = _u		+ ['I44_Man_G_SS_MCrew_G'];
	_u = _u		+ ['I44_Man_G_SS_MCrew_C'];
	_u = _u		+ ['I44_Man_G_SS_GunCrew_K98k'];
	_u = _u		+ ['I44_Man_G_SS_GunCrew_NCO_P38'];
	_u = _u		+ ['I44_Man_G_WL_FJ_Medic'];
	_u = _u		+ ['I44_Man_G_WL_FJ_NCO_K98k'];
	_u = _u		+ ['I44_Man_G_WL_FJ_RTO'];
	_u = _u		+ ['I44_Man_G_WL_FJ_K98k_GGrGer'];
	_u = _u		+ ['I44_Man_G_WL_FJ_K98kZf41'];
	_u = _u		+ ['I44_Man_G_WL_FJ_Sniper_K98kZf42'];
	_u = _u		+ ['I44_Man_G_WL_FJ_G43'];
	_u = _u		+ ['I44_Man_G_WL_FJ_Sniper_G43Zf4'];
	_u = _u		+ ['I44_Man_G_WL_FJ_FG42'];
	_u = _u		+ ['I44_Man_G_WL_FJ_FG42_Zf4'];
	_u = _u		+ ['I44_Man_G_WL_FJ_MP40'];
	_u = _u		+ ['I44_Man_G_WL_FJ_MP43'];
	_u = _u		+ ['I44_Man_G_WL_FJ_MG34'];
	_u = _u		+ ['I44_Man_G_WL_FJ_MG42'];
	_u = _u		+ ['I44_Man_G_WL_FJ_K98k_PzF30'];
	_u = _u		+ ['I44_Man_G_WL_FJ_K98k_PzF60'];
	_u = _u		+ ['I44_Man_G_WL_FJ_K98k_PzF100'];
	_u = _u		+ ['I44_Man_G_WL_FJ_ATCrew_G43'];
	_u = _u		+ ['I44_Man_G_WL_FJ_RPzB54'];
	_u = _u		+ ['I44_Man_G_WL_FJ_MCrew_G'];
	_u = _u		+ ['I44_Man_G_WL_FJ_MCrew_C'];
	_u = _u		+ ['I44_Man_G_WL_FJ_CO_P08'];
	_u = _u		+ ['I44_Man_G_WL_FJ_CO_MP40'];
	_u = _u		+ ['I44_Man_G_WL_FJ_NCO_MP43'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u 			= ['I44_Car_G_Kfz1_Camo_WH'];
	_u = _u		+ ['I44_HT_G_SdKfz2_Camo_WH'];
	_u = _u		+ ['I44_motorcycle_G_BMWR75'];
	_u = _u		+ ['I44_motorcycle_G_BMWR75_S'];
	_u = _u		+ ['I44_HT_G_SdKfz251_1D_WH'];
	_u = _u		+ ['I44_HT_G_SdKfz251_2D_WH'];
	_u = _u		+ ['I44_HT_G_SdKfz251_1_IID_WH'];
	_u = _u		+ ['I44_HT_G_SdKfz251_22_WH'];
	_u = _u		+ ['I44_ACar_G_SdKfz222_WH'];
	_u = _u		+ ['I44_ACar_G_SdKfz234_1_WH'];
	_u = _u		+ ['I44_ACar_G_SdKfz234_2_WH'];
	_u = _u		+ ['I44_ACar_G_SdKfz234_3_WH'];
	_u = _u		+ ['I44_ACar_G_SdKfz234_4_WH'];
	_u = _u		+ ['I44_Car_G_Kfz1_CamoOpen_WH'];
	_u = _u		+ ['I44_Car_G_Kfz1_Gray_WH'];
	_u = _u		+ ['I44_Car_G_Kfz1_GrayOpen_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Camo_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Gray_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Open_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Repair_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Ammo_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Fuel_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Warfare_Salvage_WH'];
	_u = _u		+ ['I44_Truck_G_Kfz305_Warfare_Supply_WH'];
	_u = _u		+ ['I44_Car_G_Kfz1_GrayOpen_Medic_WH'];
	_u = _u		+ ['Ural_ZU23_INS'];
	_u = _u		+ ['PBX'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u 			= ['I44_Tank_G_PzKpfwII_F_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwIV_D_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwIV_G_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwIV_G_Skirt_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwV_G_camo_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwVI_E_Late_Camo_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH'];
	_u = _u		+ ['I44_Tank_G_PzKpfwVI_B_WH'];
	_u = _u		+ ['I44_Tank_G_JaPz38_T_WH'];
	_u = _u		+ ['I44_Tank_G_StuGIII_G_Late_WH'];
	_u = _u		+ ['I44_Tank_G_StuGIII_G_Late_Skirt_WH'];
	_u = _u		+ ['I44_Tank_G_StuH42_G_WH'];
	_u = _u		+ ['I44_Tank_G_StuH42_G_Skirt_WH'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

		_u 			= ['I44_Plane_G_Ju52_3mg5e_WL'];
		_u = _u 		+ ['I44_Plane_G_Bf109E4_WL'];
		_u = _u 		+ ['I44_Plane_G_Bf109F2_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109F2_SC50_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109F2_SC250_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109G6_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109G6_SC250_WL'];
		_u = _u		+ ['I44_Plane_G_Me262A_WL'];
		_u = _u		+ ['I44_Plane_G_Me262_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_B_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_SC50_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_SC250_WL'];

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

		_u 			= ['I44_Plane_G_Ju52_3mg5e_WL'];
		_u = _u 		+ ['I44_Plane_G_Bf109E4_WL'];
		_u = _u 		+ ['I44_Plane_G_Bf109F2_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109F2_SC50_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109F2_SC250_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109G6_WL'];
		_u = _u		+ ['I44_Plane_G_Bf109G6_SC250_WL'];
		_u = _u		+ ['I44_Plane_G_Me262A_WL'];
		_u = _u		+ ['I44_Plane_G_Me262_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_B_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_SC50_WL'];
		_u = _u		+ ['I44_Plane_G_Ju87_SC250_WL'];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u			= ["Old_bike_TK_CIV_EP1"];
	_u = _u		+ ["Old_moto_TK_Civ_EP1"];
	_u = _u		+ ["Tractor"];
	_u = _u		+ ["LandRover_TK_CIV_EP1"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_EASTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};