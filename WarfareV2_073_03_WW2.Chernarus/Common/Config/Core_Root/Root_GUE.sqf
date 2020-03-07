Private ["_side"];

_side = "GUER";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'I44_Man_R_F_CO_P08'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'I44_Man_R_F_WebleyMk6'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'I44_Man_R_F_K98k'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], 'flags\FF.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['BTR40_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['I44_Truck_G_Kfz305_Repair_WH','V3S_Repair_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['I44_Truck_G_Kfz305_Warfare_Salvage_WH','V3S_Salvage_TK_GUE_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['I44_Truck_G_Kfz305_Warfare_Supply_WH','V3S_Supply_TK_GUE_EP1']];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_CZ0','WFHQ_CZ1','WFHQ_CZ2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolCZ'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['I44_Man_R_F_CO_P08','Ins_Bardak','I44_Man_R_F_Doctor','I44_Man_R_F_Engr_GrenadeNo75','I44_Man_R_F_StenMk2','I44_Man_R_F_Engr_GrenadeNo75']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['I44_Man_R_F_CO_P08','Ins_Bardak','Ins_Bardak','Ins_Bardak','I44_Man_R_F_P38','I44_Man_R_F_BrenMk1','I44_Man_R_F_Engr_GrenadeNo75','I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T','I44_Man_R_F_Sniper_K98kZf42']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['I44_Man_R_F_CO_P08','Ins_Bardak','Ins_Bardak','Ins_Bardak','Ins_Bardak','I44_Man_R_F_P38','I44_Man_R_F_P38','I44_Man_R_F_Doctor','I44_Man_R_F_M37Ithaca','I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T','Ins_Bardak','GUE_Villager3']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'I44_Plane_G_Ju52_3mg5e_WL'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'V3S_Repair_TK_GUE_EP1'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['BTR40_TK_GUE_EP1','V3S_Gue']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['I44_AmmoBox_G_MP']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'BTR40_TK_GUE_EP1'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'I44_Plane_G_Ju52_3mg5e_WL'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteC'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'V3S_Supply_TK_GUE_EP1'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker3","Worker1"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['I44_Man_R_F_K98k','I44_Man_R_F_BrenMk1','I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T','I44_Man_R_F_M37Ithaca'], 
		['I44_Man_R_F_P38','I44_Man_R_F_StenMk5','I44_Man_R_F_Engr_GrenadeNo75','Ins_Bardak','I44_Man_R_F_LeeEnfieldNo4Mk1'],
		['I44_Car_A_WillysMB_M1919_Army','I44_Car_B_WillysAB_VGO_Army']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BTR40_MG_TK_GUE_EP1','BTR40_MG_TK_GUE_EP1'], 
		['V3S_GUE','I44_Man_R_F_CO_P08','Ins_Bardak','I44_Man_R_F_BrenMk1','Ins_Bardak'],
		['I44_HT_G_SdKfz251_1D_WH','I44_Man_R_F_P38','I44_Man_R_F_Engr_TNT','I44_Man_R_F_M37Ithaca']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['I44_HT_G_SdKfz251_1D_WH','I44_HT_G_SdKfz251_1D_WH'], 
		['T34','T34'],
		['I44_Man_R_F_Sniper_K98kZf42','I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T','GUE_Villager3']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['I44_Man_R_F_CO_P08','I44_Man_R_F_K98k','I44_Man_R_F_LeeEnfieldNo4Mk1','I44_Man_R_F_StenMk2','I44_Man_R_F_Engr_GrenadeNo75','I44_Man_R_F_BrenMk1']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['I44_Man_R_F_CO_P08','I44_Man_R_F_K98k','I44_Man_R_F_LeeEnfieldNo4Mk1','I44_Man_R_F_BrenMk1','Ins_Bardak','I44_Man_R_F_M37Ithaca']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['I44_Man_R_F_CO_P08','I44_Man_R_F_K98k','I44_Man_R_F_LeeEnfieldNo4Mk1','Ins_Bardak','I44_Man_R_F_P38','I44_Man_R_F_Sniper_K98kZf42']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['I44_Man_R_F_CO_P08','I44_Man_R_F_K98k','I44_Man_R_F_StenMk5','Ins_Bardak','Ins_Bardak','I44_Man_R_F_Engr_GrenadeNo75']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['I44_K98k','I44_RPzB54','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_RPzB54','I44_P08']],
		[['I44_K98k','I44_RPzB54','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_RPzB54','I44_P08']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['I44_K98k','I44_RPzB54','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_RPzB54','I44_P08']],
		[['I44_K98k','I44_RPzB54','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_RPzB54','I44_P08']],
		[['I44_K98k','I44_RPzB54','I44_P08','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_5rd_792x57_Tracer_K98','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
		 ['I44_K98k','I44_RPzB54','I44_P08']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['I44_LeeEnfieldNo4Mk1','I44_RPzB54','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_LeeEnfieldNo4Mk1','I44_RPzB54','I44_P38']],
		[['I44_LeeEnfieldNo4Mk1','I44_RPzB54','I44_P38','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38','I44_8rd_9x19_Ball_P38'],
		 ['I44_LeeEnfieldNo4Mk1','I44_RPzB54','I44_P38']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['I44_LeeEnfieldNo4Mk1','I44_RPzB54','I44_WebleyMk6','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6'],
		 ['I44_LeeEnfieldNo4Mk1','I44_RPzB54','I44_WebleyMk6']],
		[['I44_LeeEnfieldNo4Mk1_T','I44_RPzB54','I44_WebleyMk6','I44_Binocular_TypeEE','ItemRadio','ItemMap'],
		 ['I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_10rd_77x56R_Ball_LeeEnfield','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_Rocket_88mm_RPzBGr4322_RPzB54','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6'],
		 ['I44_LeeEnfieldNo4Mk1_T','I44_RPzB54','I44_WebleyMk6']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["I44_Man_R_F_P38","I44_Man_R_F_StenMk5","I44_Man_R_F_StenMk5","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_K98k","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_M37Ithaca"], 0, 2],
		[["GUE_Villager3","GUE_Woodlander2","GUE_Villager4","I44_Man_R_F_Engr_TNT","Ins_Bardak","I44_Man_R_F_Doctor"], 0, 1],
		[["I44_Man_R_F_P38","I44_Man_R_F_StenMk2","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"], 10, 1],
		[["I44_Man_R_F_P38","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_Engr_GrenadeNo75"], 10, 1],
		[["I44_Man_R_F_P38","I44_Man_R_F_Engr_TNT","I44_Man_R_F_CO_P08","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","Ins_Bardak","I44_Man_R_F_Doctor","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_M37Ithaca"], 20, 1],
		[["BTR40_TK_GUE_EP1","I44_Car_A_WillysMB_M1919_Army","I44_Car_A_WillysMB_M1919_Army"], 10, 2],
		[["BTR40_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1"], 10, 2],
		[["Ural_ZU23_Gue","Ural_ZU23_Gue"], 20, 1],
		[["I44_Man_R_F_P38","BTR40_MG_TK_GUE_EP1","BTR40_MG_TK_GUE_EP1","I44_Man_R_F_BrenMk1","I44_Man_R_F_StenMk5","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"], 10, 2],
		[["I44_Man_R_F_P38","I44_HT_G_SdKfz251_1D_WH","I44_HT_G_SdKfz251_1D_WH","I44_Man_R_F_BrenMk1","I44_Man_R_F_StenMk5","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"], 10, 2],
		[["I44_HT_G_SdKfz251_1D_WH","I44_HT_G_SdKfz251_1D_WH"], 10, 1],
		[["T34","T34"], 20, 2],
		[["T34","T34","T34","T34"], 30, 5]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["I44_Car_A_WillysMB_M1919_Army"], "V3S_Gue", ["I44_Car_B_WillysAB_VGO_Army"]],
			[
				["I44_Man_R_F_P38","I44_Man_R_F_StenMk2","I44_Man_R_F_Doctor","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_K98k","I44_Man_R_F_M37Ithaca","I44_Man_R_F_Engr_GrenadeNo75"],
				["I44_Man_R_F_P38","Ins_Bardak","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_Engr_TNT"]
			]
		], 0, 2],
		[[
			[["BTR40_MG_TK_GUE_EP1"], "V3S_Gue", ["BTR40_MG_TK_GUE_EP1"]],
			[
				["I44_Man_R_F_P38","I44_Man_R_F_Engr_GrenadeNo75","I44_Man_R_F_CO_P08","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_LeeEnfieldNo4Mk1","Ins_Bardak","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_M37Ithaca"],
				["I44_Man_R_F_P38","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"],
				["I44_Man_R_F_P38","I44_Man_R_F_BrenMk1","I44_Man_R_F_StenMk5","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_M37Ithaca","I44_Man_R_F_Engr_GrenadeNo75"]
			]
		], 10, 1],
		[[
			[["I44_HT_G_SdKfz251_1D_WH"], "V3S_Gue", ["I44_HT_G_SdKfz251_1D_WH"]],
			[
				["I44_Man_R_F_P38","I44_Man_R_F_StenMk5","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"],
				["I44_Man_R_F_P38","I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_BrenMk1","I44_Man_R_F_StenMk2","I44_Man_R_F_StenMk5","I44_Man_R_F_Doctor","I44_Man_R_F_Engr_TNT","I44_Man_R_F_Engr_TNT"],
				["I44_Man_R_F_P38","Ins_Bardak","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_Engr_TNT"]
			]
		], 10, 2],
		[[
			//[["T34"], "I44_HT_G_SdKfz251_1D_WH", ["Ural_ZU23_Gue"]],
			[["T34"], "I44_HT_G_SdKfz251_1D_WH", ["T34"]],
			[
				["I44_Man_R_F_P38","I44_Man_R_F_Engr_GrenadeNo75","I44_Man_R_F_CO_P08","GUE_Woodlander2","I44_Man_R_F_CO_P08","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_WebleyMk6","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_M37Ithaca"],
				["I44_Man_R_F_P38","I44_Man_R_F_StenMk2","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"]
			]
		], 20, 1]
	]];
	
	if (WF_A2_CombinedOps) then {
		//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
		missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
			[[["Fishing_Boat","Smallboat_1"],["I44_Man_R_F_P38","I44_Man_R_F_StenMk5","I44_Man_R_F_StenMk2","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_K98k","I44_Man_R_F_M37Ithaca","I44_Man_R_F_Engr_GrenadeNo75"]], 0, 2],
			[["Fishing_Boat",["I44_Man_R_F_P38","I44_Man_R_F_Engr_GrenadeNo75","I44_Man_R_F_CO_P08","I44_Man_R_F_Doctor","I44_Man_R_F_P08","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_WebleyMk6","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_M37Ithaca"]], 0, 1],
			[[["Fishing_Boat","Smallboat_2"],["I44_Man_R_F_P38","I44_Man_R_F_StenMk5","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"]], 0, 1]
		]];
	};
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[["I44_Plane_B_HHmkIIa_M57_RAF",["I44_Man_R_F_P38","I44_Man_R_F_StenMk2","I44_Man_R_F_StenMk5","I44_Man_R_F_BrenMk1","I44_Man_R_F_CO_P08","I44_Man_R_F_K98k","I44_Man_R_F_M37Ithaca","I44_Man_R_F_Engr_GrenadeNo75"]], 0, 2],
		[["I44_Plane_B_HHmkIIa_HVAR_RAF",["I44_Man_R_F_P38","Ins_Bardak","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T","I44_Man_R_F_Engr_TNT"]], 10, 1],
		[["I44_Plane_B_HHmkIIa_M57_RAF",["I44_Man_R_F_P38","I44_Man_R_F_Engr_GrenadeNo75","I44_Man_R_F_CO_P08","I44_Man_R_F_Doctor","GUE_Villager3","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_WebleyMk6","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_M37Ithaca"]], 10, 1],
		[["I44_Plane_B_HHmkIIa_HVAR_RAF",["I44_Man_R_F_P38","I44_Man_R_F_Engr_GrenadeNo75","I44_Man_R_F_CO_P08","I44_Man_R_F_Doctor","GUE_Villager3","I44_Man_R_F_LeeEnfieldNo4Mk1","I44_Man_R_F_WebleyMk6","I44_Man_R_F_Sniper_K98kZf42","I44_Man_R_F_M37Ithaca","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08","I44_Man_R_F_CO_P08"]], 10, 1]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Guerilla'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_GUE.sqf";
	
	/*if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKGUE.sqf";
	};*/
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['I44_K98k','I44_P08','I44_Binocular_TypeEE','ItemCompass','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],
	['I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_5rd_792x57_Mix_K98','I44_HandGrenade_StiHgr24','I44_HandGrenade_StiHgr24','I44_SmokeGrenade_NbHgr39','I44_SmokeGrenade_NbHgr39','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08','I44_8rd_9x19_Ball_P08'],
	['I44_K98k','I44_P08']
]];

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_GUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_GUE.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_GUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_GUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_GUE.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_GUE.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_GUE.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_GUE.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_GUE.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_GUE.sqf";
};