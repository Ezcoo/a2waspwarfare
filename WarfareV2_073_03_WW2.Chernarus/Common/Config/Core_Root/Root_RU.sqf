Private ["_side"];

_side = "EAST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'I44_Man_G_WH_Crew_P38'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'I44_Man_G_WL_Pilot_P38'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'I44_Man_G_WH_K98k'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], 'flags\gfk.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['I44_Car_G_Kfz1_GrayOpen_Medic_WH']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['I44_Truck_G_Kfz305_Repair_WH']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['I44_Truck_G_Kfz305_Warfare_Salvage_WH','UralSalvage_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['I44_Truck_G_Kfz305_Warfare_Supply_WH','UralSupply_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'Pchela1T'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_RU0','WFHQ_RU1','WFHQ_RU2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolRU'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['I44_Man_G_WL_FJ_NCO_MP43','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_FG42','I44_Man_G_WL_FJ_FG42','I44_Man_G_WL_FJ_MG34','I44_Man_G_WL_FJ_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['I44_Man_G_WL_FJ_NCO_MP43','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_K98k_GGrGer','I44_Man_G_WL_FJ_MG42','I44_Man_G_WL_FJ_Medic','I44_Man_G_WL_FJ_FG42_Zf4','I44_Man_G_WL_FJ_FG42_Zf4']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['I44_Man_G_WL_FJ_NCO_MP43','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_K98k_GGrGer','I44_Man_G_WL_FJ_K98k_GGrGer','I44_Man_G_WL_FJ_MG42','I44_Man_G_WL_FJ_CO_MP40','I44_Man_G_WL_FJ_FG42_Zf4','I44_Man_G_WL_FJ_FG42_Zf4']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'I44_Plane_G_Ju52_3mg5e_WL'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'I44_Truck_G_Kfz305_Repair_WH'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['I44_Car_G_Kfz1_GrayOpen_Medic_WH','I44_Truck_G_Kfz305_Open_WH']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['I44_AmmoBox_G_MP']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'I44_Car_G_Kfz1_CamoOpen_WH'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'I44_Plane_G_Ju52_3mg5e_WL'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'I44_Truck_G_Kfz305_Warfare_Supply_WH'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker3","Worker1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['I44_Man_G_WH_CO_MP40','I44_Man_G_WH_MG34','I44_Man_G_WH_K98kZf41','I44_Man_G_WH_Medic'], 
		['I44_Man_G_WH_Camo_CO_MP40','I44_Man_G_WH_Camo_MP43','I44_Man_G_WH_Camo_K98k_GGrGer','I44_Man_G_WH_Camo_K98k_PzF100','I44_Man_G_WH_Camo_RTO'],
		['I44_Tank_G_PzKpfwII_F_WH','I44_ACar_G_SdKfz222_WH']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['I44_ACar_G_SdKfz234_2_WH','I44_HT_G_SdKfz251_22_WH'], 
		['I44_Truck_G_Kfz305_Camo_WH','I44_Man_G_SS_NCO_MP43','I44_Man_G_SS_RPzB54','I44_Man_G_SS_MG42','I44_Man_G_SS_K98k_PzF100'],
		['I44_Tank_G_PzKpfwIV_D_WH','I44_Man_G_SS_K98k_GGrGer','I44_Man_G_SS_K98k_GGrGer','I44_Man_G_SS_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['I44_Tank_G_PzKpfwIV_G_WH','I44_Tank_G_PzKpfwIV_D_WH'], 
		['I44_Tank_G_PzKpfwVI_B_WH','I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH'],
		['I44_Tank_G_PzKpfwV_G_camo_WH','I44_Tank_G_PzKpfwIV_G_Skirt_WH','I44_Man_G_WL_FJ_NCO_MP43','I44_Man_G_WL_FJ_MG42','I44_Man_G_WL_FJ_FG42_Zf4','I44_Man_G_WL_FJ_Medic','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_FG42'],
		['I44_ACar_G_SdKfz234_2_WH','I44_Man_G_WL_FJ_NCO_MP43','I44_Man_G_WL_FJ_Medic','I44_Man_G_WL_FJ_K98k_GGrGer','I44_Man_G_WL_FJ_FG42','I44_Man_G_WL_FJ_FG42']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['I44_Man_G_WH_CO_MP40','I44_Man_G_WH_RTO','I44_Man_G_WH_K98k_GGrGer','I44_Man_G_WH_ATCrew_G43','I44_Man_G_WH_RPzB54','I44_Man_G_WH_MG34']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['I44_Man_G_WH_Camo_CO_MP40','I44_Man_G_WH_Camo_RTO','I44_Man_G_WH_Camo_MG34','I44_Man_G_WH_Camo_ATCrew_G43','I44_Man_G_WH_Camo_RPzB54','I44_Man_G_WH_Camo_Sniper_K98kZf42']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['I44_Man_G_SS_NCO_MP43','I44_Man_G_SS_RTO','I44_Man_G_SS_ATCrew_G43','I44_Man_G_SS_RPzB54','I44_Man_G_SS_K98k_GGrGer','I44_Man_G_SS_Sniper_G43Zf4']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['I44_Man_G_WL_FJ_NCO_MP43','I44_Man_G_WL_FJ_FG42','I44_Man_G_WL_FJ_ATCrew_G43','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_RPzB54','I44_Man_G_WL_FJ_K98k_GGrGer']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['I44_K98k','I44_PzFaust60','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_149mm_PzF_60','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_PzFaust60','I44_P08']],
		[['I44_K98k','I44_PzFaust100','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_Rocket_149mm_PzF_100','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_PzFaust100','I44_P08']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['I44_K98k_GGrGer','I44_PzFaust60','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_149mm_PzF_60','I44_RifleGrenade_GFlgr','I44_RifleGrenade_GFlgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k_GGrGer','I44_PzFaust60','I44_P08']],
		[['I44_K98k_GGrGer','I44_PzFaust100','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_149mm_PzF_100','I44_RifleGrenade_GFlgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k_GGrGer','I44_PzFaust100','I44_P08']],
		[['I44_K98k_GGrGer','I44_PzFaust100','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_149mm_PzF_100','I44_RifleGrenade_GFlgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GSprgr','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_K98k_GGrGer','I44_PzFaust100','I44_P38']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['I44_G43','I44_RPzB54','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_10rd_792x57_Tracer_G43','I44_10rd_792x57_Tracer_G43','I44_10rd_792x57_Tracer_G43','I44_10rd_792x57_Tracer_G43','I44_10rd_792x57_Tracer_G43','I44_10rd_792x57_Tracer_G43','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_G43','I44_RPzB54','I44_P38']],
		[['I44_FG42II','I44_RPzB54','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_FG42II','I44_RPzB54','I44_P38']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
	[['I44_FG42I_bipod','I44_RPzB54','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_FG42I_bipod','I44_RPzB54','I44_P38']],
		[['I44_FG42I_Zf4_bipod','I44_RPzB54','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_20rd_792x57_Tracer_FG42','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_FG42I_Zf4_bipod','I44_RPzB54','I44_P38']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_CO_MP40","I44_Man_G_WH_G43","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_MG34","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_RTO","I44_Man_G_WH_Medic","I44_Man_G_WH_Engr_FmW35"], 0, 2],
		[["I44_Man_G_WH_CO_MP40","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_Engr_FmW35"], 60, 1],
		[["I44_Man_G_WH_K98kZf41","I44_Man_G_WH_K98kZf41","I44_Man_G_WH_K98kZf41","I44_Man_G_WH_Sniper_K98kZf42","I44_Man_G_WH_Sniper_K98kZf42"], 30, 1],
		[["I44_Man_G_WH_Camo_CO_MP40","I44_Man_G_WH_Camo_Sniper_K98kZf42","I44_Man_G_WH_Camo_Sniper_G43Zf4","I44_Man_G_WH_Camo_Engr_FmW35","I44_Man_G_WH_Camo_K98k_GGrGer","I44_Man_G_WH_Camo_MG42","I44_Man_G_WH_Camo_K98k_PzF100","I44_Man_G_WH_Camo_RTO"], 50, 2],
		[["I44_Man_G_WL_FJ_NCO_MP43","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_Sniper_G43Zf4","I44_Man_G_WL_FJ_MG42","I44_Man_G_WL_FJ_K98k_GGrGer"], 50, 1],
		[["I44_ACar_G_SdKfz222_WH","I44_ACar_G_SdKfz222_WH","I44_HT_G_SdKfz251_1D_WH"], 10, 1],
		[["I44_HT_G_SdKfz251_22_WH","I44_ACar_G_SdKfz234_2_WH","I44_ACar_G_SdKfz234_3_WH"], 25, 2],
		[["I44_Man_G_WH_Camo_CO_MP40","I44_ACar_G_SdKfz234_4_WH","I44_Man_G_WH_Camo_MG42","I44_Man_G_WH_Camo_ATCrew_G43","I44_Man_G_WH_Camo_RPzB54","I44_Man_G_WH_Camo_K98k_PzF100"], 40, 2],
		[["I44_ACar_G_SdKfz234_4_WH","I44_ACar_G_SdKfz234_2_WH"], 40, 1],
		[["I44_Tank_G_JaPz38_T_WH","I44_Tank_G_PzKpfwIV_D_WH","I44_Man_G_WH_Camo_G43","I44_Man_G_WH_Camo_K98k_PzF100","I44_Man_G_WH_Medic","I44_Man_G_WH_Camo_K98k_GGrGer"], 50, 2],
		[["I44_Tank_G_PzKpfwIV_D_WH","I44_Tank_G_JaPz38_T_WH"], 40, 1],
		[["I44_Tank_G_PzKpfwIV_G_WH","I44_Tank_G_StuGIII_G_Late_WH"], 50, 1],
		[["I44_Tank_G_PzKpfwIV_G_WH","I44_Tank_G_StuH42_G_WH"], 80, 2],
		[["I44_Tank_G_PzKpfwV_G_camo_WH","I44_Tank_G_PzKpfwV_G_camo_WH","I44_Tank_G_PzKpfwIV_G_Skirt_WH","I44_Tank_G_PzKpfwIV_G_Skirt_WH"], 100, 3],
		[["I44_Tank_G_PzKpfwVI_B_WH","I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH","I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH","Ural_ZU23_INS"], 100, 2]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["I44_HT_G_SdKfz251_1D_WH"], "I44_Truck_G_Kfz305_Camo_WH", ["I44_ACar_G_SdKfz234_1_WH"]],
			[
				["I44_Man_G_WH_CO_MP40","I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_G43","I44_Man_G_WH_MG34","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_RTO","I44_Man_G_WH_Medic","I44_Man_G_WH_Engr_FmW35"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"]
			]
		], 0, 2],
		[[
			[["I44_ACar_G_SdKfz234_2_WH"], "I44_Truck_G_Kfz305_Camo_WH", ["I44_ACar_G_SdKfz234_2_WH"]],
			[
				["I44_Man_G_WH_CO_MP40","I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_G43","I44_Man_G_WH_MG34","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_RTO","I44_Man_G_WH_Medic","I44_Man_G_WH_Engr_FmW35"],
				["I44_Man_G_WH_Camo_NCO_MP43","I44_Man_G_WH_Camo_K98kZf41","I44_Man_G_WH_Camo_Sniper_K98kZf42","I44_Man_G_WH_Camo_K98k_GGrGer","I44_Man_G_WH_Camo_ATCrew_G43","I44_Man_G_WH_Camo_RPzB54","I44_Man_G_WH_Camo_K98k_PzF100","I44_Man_G_WH_Camo_MG42"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"]
			]
		], 40, 1],
		[[
			[["I44_HT_G_SdKfz251_22_WH"], "I44_HT_G_SdKfz251_1D_WH", ["I44_ACar_G_SdKfz234_3_WH"]],
			[
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_GGrGer"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_MG34","I44_Man_G_WH_MG42","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_MG42"]
			]
		], 50, 1],
		[[
			[["I44_Tank_G_PzKpfwIV_G_WH"], "I44_Truck_G_Kfz305_Camo_WH", ["I44_Tank_G_PzKpfwIV_D_WH"]],
			[
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"],
				["I44_Man_G_WL_FJ_NCO_MP43","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_Sniper_G43Zf4","I44_Man_G_WL_FJ_MG42","I44_Man_G_WL_FJ_K98k_GGrGer"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_GGrGer"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_MG34","I44_Man_G_WH_MG42","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_MG42"]
			]
		], 60, 2],
		[[
			[["I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH"], "I44_HT_G_SdKfz251_1D_WH", ["I44_Tank_G_PzKpfwV_G_camo_WH"]],
			[
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"],
				["I44_Man_G_WH_Camo_NCO_MP43","I44_Man_G_WH_Camo_K98kZf41","I44_Man_G_WH_Camo_Sniper_K98kZf42","I44_Man_G_WH_Camo_K98k_GGrGer","I44_Man_G_WH_Camo_ATCrew_G43","I44_Man_G_WH_Camo_RPzB54","I44_Man_G_WH_Camo_K98k_PzF100","I44_Man_G_WH_Camo_MG42"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_MG34","I44_Man_G_WH_MG42","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_MG42"]
			]
		], 80, 1],
		[[
			[["I44_Tank_G_PzKpfwVI_B_WH"], "I44_HT_G_SdKfz251_1D_WH", ["Ural_ZU23_INS"]],
			[
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"],
				["I44_Man_G_WL_FJ_NCO_MP43","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_Sniper_G43Zf4","I44_Man_G_WL_FJ_MG42","I44_Man_G_WL_FJ_K98k_GGrGer"],
				["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_MG34","I44_Man_G_WH_MG42","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_MG42"]
			]
		], 100, 1]
	]];
	
	
	//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
	missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
		[["PBX",["I44_Man_G_WH_CO_MP40","I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_G43","I44_Man_G_WH_MG34","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_RTO","I44_Man_G_WH_Medic","I44_Man_G_WH_Engr_FmW35"]], 0, 2],
		[["PBX",["I44_Man_G_WL_FJ_NCO_MP43","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_Sniper_G43Zf4","I44_Man_G_WL_FJ_MG42","I44_Man_G_WL_FJ_K98k_GGrGer"]], 50, 1],
		[["PBX",["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"]], 40, 1]
	]];
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[["I44_Plane_G_Bf109F2_SC50_WL",["I44_Man_G_WH_CO_MP40","I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_G43","I44_Man_G_WH_MG34","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_RTO","I44_Man_G_WH_Medic","I44_Man_G_WH_Engr_FmW35"]], 0, 2],
		[["I44_Plane_G_Bf109F2_SC50_WL",["I44_Man_G_WL_FJ_NCO_MP43","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_FG42_Zf4","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_RPzB54","I44_Man_G_WL_FJ_Sniper_G43Zf4","I44_Man_G_WL_FJ_MG42","I44_Man_G_WL_FJ_K98k_GGrGer"]], 50, 1],
		[["I44_Plane_G_Bf109F2_SC50_WL",["I44_Man_G_WH_Camo_NCO_MP43","I44_Man_G_WH_Camo_K98kZf41","I44_Man_G_WH_Camo_Sniper_K98kZf42","I44_Man_G_WH_Camo_K98k_GGrGer","I44_Man_G_WH_Camo_ATCrew_G43","I44_Man_G_WH_Camo_RPzB54","I44_Man_G_WH_Camo_K98k_PzF100","I44_Man_G_WH_Camo_MG42"]], 50, 1],
		[["I44_Plane_G_Bf109F2_SC50_WL",["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer"]], 60, 1],
		[["I44_Plane_G_Bf109F2_SC50_WL",["I44_Man_G_WH_NCO_MP43","I44_Man_G_WH_ATCrew_G43","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_K98k_PzF100","I44_Man_G_WH_K98k_GGrGer","I44_Man_G_WH_RPzB54","I44_Man_G_WH_RPzB54","I44_Man_G_WH_Sniper_K98kZf42","I44_Man_G_WH_Sniper_G43Zf4"]], 80, 1]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Russians'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_RU.sqf";
	/*if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKA.sqf";
	};*/
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['I44_K98k','I44_P08','I44_Binocular_TypeEE','ItemCompass','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],
	['I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_SmokeGrenade_NbHgr39','I44_SmokeGrenade_NbHgr39','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
	['I44_K98k','I44_P08']
]];

//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_RU.sqf";

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_RU.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_RU.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_RU.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_RU.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_RU.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_RU.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_RU.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_RU.sqf";
};