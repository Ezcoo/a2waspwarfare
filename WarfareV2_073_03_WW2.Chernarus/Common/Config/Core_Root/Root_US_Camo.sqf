/* This config file is used with WF_Camo, required CO */
Private ["_side"];

_side = "WEST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'I44_Man_A_Army_DDay_Crew_M1911A1'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'I44_Man_A_AAF_Pilot_M1911A1'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'I44_Man_A_Army_DDay_M1903A3'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], 'flags\FF.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['I44_Car_A_WillysMB_Medic_Army']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['I44_Truck_A_GMC_CCKW_Repair_Army']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['I44_Truck_A_GMC_CCKW_Warfare_Salvage_Army','MtvrSalvage_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['I44_Truck_A_GMC_CCKW_Warfare_Supply_Army','MtvrSupply_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'MQ9PredatorB_US_EP1'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_EN0_EP1','WFHQ_EN1_EP1','WFHQ_EN2_EP1','WFHQ_EN4_EP1','WFHQ_EN5_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_EN'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['I44_Man_A_Army_AB_82_CO_M1A1Carbine','I44_Man_A_Army_AB_82_M1A1Bazooka','I44_Man_A_Army_AB_M3Greasegun','I44_Man_A_Army_AB_82_M1918A2','I44_Man_A_Army_AB_82_M1919A6','I44_Man_A_Army_AB_82_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['I44_Man_A_Army_AB_82_CO_M1A1Carbine','I44_Man_A_Army_AB_82_M1A1Bazooka','I44_Man_A_Army_AB_82_M1A1Bazooka','I44_Man_A_Army_AB_82_M1A1Bazooka','I44_Man_A_Army_AB_82_M1Garand_M7','I44_Man_A_Army_AB_82_M1919A6','I44_Man_A_Army_AB_82_Medic','I44_Man_A_Army_AB_82_Sniper_M1903A4','I44_Man_A_Army_AB_82_Sniper_M1903A4']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['I44_Man_B_Army_AB_CO_StenMk5','I44_Man_B_Army_AB_PIAT','I44_Man_B_Army_AB_PIAT','I44_Man_B_Army_AB_PIAT','I44_Man_B_Army_AB_PIAT','I44_Man_B_Army_AB_SMLENo4Mk1_No82','I44_Man_B_Army_AB_SMLENo4Mk1_No82','I44_Man_B_Army_AB_BrenMk1','I44_Man_B_Army_AB_StenMk2','I44_Man_B_Army_AB_Medic','I44_Man_B_Army_AB_ATCrew_SMLEdNo4Mk1','I44_Man_B_Army_AB_PIAT','I44_Man_B_Army_AB_Sniper_SMLENo4Mk1T']];
	
missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'I44_Plane_A_C47A_AAF'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'I44_Truck_A_GMC_CCKW_Repair_Army'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['I44_Car_A_WillysMB_Medic_Army','I44_Truck_A_GMC_CCKW_Army']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['I44_AmmoBox_A_MP']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'I44_HT_A_M3_Army'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'I44_Plane_A_C47A_AAF'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumWest_EP1'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'MtvrSupply_DES_EP1'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker2","Worker4"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['I44_Man_A_Army_DDay_CO_M1Carbine','I44_Man_A_Army_DDay_M1919A4','I44_Man_A_Army_DDay_Sniper_M1903A4','I44_Man_A_Army_DDay_Medic'], 
		['I44_Man_A_Army_Ranger_CO_M1Carbine','I44_Man_A_Army_Ranger_M1918A2','I44_Man_A_Army_Ranger_M1903A3_M1','I44_Man_A_Army_Ranger_M1A1Bazooka','I44_Man_A_Army_Ranger_RTO_M1Carbine'],
		['I44_HT_A_M3_Army','I44_Tank_B_Army_UC']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['I44_ACar_A_M8_Greyhound_Army','I44_HT_A_M3A1_Army'], 
		['I44_Truck_A_GMC_CCKW_Army','I44_Man_A_Army_AB_82_NCO_M1Garand','I44_Man_A_Army_AB_82_M1A1Bazooka','I44_Man_A_Army_AB_82_M1919A6','I44_Man_A_Army_AB_82_M1A1Bazooka'],
		['I44_Tank_A_M5A1_Stuart_Army','I44_Man_A_Army_AB_82_M1Garand_M7','I44_Man_A_Army_AB_82_M1Garand_M7','I44_Man_A_Army_AB_82_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['I44_Veh_A_Army_M4A3_76_Sherman_Army','I44_Veh_A_Army_M4A3_Sherman_Army'], 
		['I44_Tank_B_ShermanVC_Army','I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army'],
		['I44_Veh_B_Army_MKIV_Churchill','I44_Tank_B_Cromwell_Army','I44_Man_B_Army_Commando_NCO_StenMk2S','I44_Man_B_Army_Commando_BrenMk1','I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T','I44_Man_A_Army_AB_82_Medic','I44_Man_B_Army_Commando_PIAT','I44_Man_B_Army_Commando_PIAT','I44_Man_B_Army_Commando_StenMk5'],
		['I44_ACar_A_M8_Greyhound_Army','I44_Man_B_Army_Commando_NCO_StenMk2S','I44_Man_B_Army_AB_Medic','I44_Man_B_Army_AB_SMLENo4Mk1_No82','I44_Man_B_Army_Commando_StenMk2S','I44_Man_B_Army_Commando_DeLisle']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['I44_Man_A_Army_DDay_CO_M1Carbine','I44_Man_A_Army_DDay_RTO_M1Carbine','I44_Man_A_Army_DDay_M1903A3_M1','I44_Man_A_Army_DDay_M1918A2','I44_Man_A_Army_DDay_M1A1Bazooka','I44_Man_A_Army_DDay_M1919A4']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['I44_Man_A_Army_Ranger_CO_M1Carbine','I44_Man_A_Army_Ranger_RTO_M1Carbine','I44_Man_A_Army_Ranger_M1919A4','I44_Man_A_Army_Ranger_ATCrew_M3','I44_Man_A_Army_Ranger_M1A1Bazooka','I44_Man_A_Army_Ranger_Sniper_M1903A4']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['I44_Man_A_Army_AB_82_NCO_M1A1Thompson','I44_Man_A_Army_AB_82_RTO_M1A1Carbine','I44_Man_A_Army_AB_82_ATCrew_M3','I44_Man_A_Army_AB_82_M1A1Bazooka','I44_Man_A_Army_AB_82_M1Garand_M7','I44_Man_A_Army_AB_82_Sniper_M1903A4']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['I44_Man_B_Army_Commando_NCO_StenMk2S','I44_Man_B_Army_Commando_StenMk5','I44_Man_B_Army_Commando_DeLisle','I44_Man_B_Army_Commando_PIAT','I44_Man_B_Army_Commando_PIAT','I44_Man_B_Army_Commando_SMLENo4Mk1']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['I44_M1903A3','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1903A3','I44_M1A1Bazooka','I44_M1911A1']],
		[['I44_M1903A3','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_HandGrenade_No36M','I44_HandGrenade_No36M','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1903A3','I44_M1A1Bazooka','I44_M1911A1']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['I44_M1903A3_M1','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_RifleGrenade_SignalM17A1_M1903','I44_RifleGrenade_SignalM17A1_M1903','I44_RifleGrenade_M17_M1903','I44_RifleGrenade_M17_M1903','I44_RifleGrenade_M17_M1903','I44_RifleGrenade_M17_M1903','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1903A3_M1','I44_M1A1Bazooka','I44_M1911A1']],
		[['I44_M1903A3_M1','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_RifleGrenade_SignalM17A1_M1903','I44_RifleGrenade_SignalM17A1_M1903','I44_RifleGrenade_M9A1_M1903','I44_RifleGrenade_M9A1_M1903','I44_RifleGrenade_M9A1_M1903','I44_RifleGrenade_M9A1_M1903','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1903A3_M1','I44_M1A1Bazooka','I44_M1911A1']],
		[['I44_M1Garand_M7','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_8rd_762x63_Tracer_M1Garand','I44_8rd_762x63_Tracer_M1Garand','I44_8rd_762x63_Tracer_M1Garand','I44_8rd_762x63_Tracer_M1Garand','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_RifleGrenade_SignalM17A1','I44_RifleGrenade_SignalM17A1','I44_RifleGrenade_M9A1','I44_RifleGrenade_M9A1','I44_RifleGrenade_M9A1','I44_RifleGrenade_M9A1','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1Garand_M7','I44_M1A1Bazooka','I44_M1911A1']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['I44_M1Carbine','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_HandGrenade_Mk2','I44_HandGrenade_Mk2','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1Carbine','I44_M1A1Bazooka','I44_M1911A1']],
		[['I44_M1A1Carbine','I44_M1A1Bazooka','I44_M1911A1','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_15rd_762x33_Tracer_M1Carbine','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_HandGrenade_Mk2','I44_HandGrenade_Mk2','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
		 ['I44_M1A1Carbine','I44_M1A1Bazooka','I44_M1911A1']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
			[['I44_M1918A2','I44_M1A1Bazooka','I44_WebleyMk6','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_20rd_762x63_Tracer_M1918','I44_20rd_762x63_Tracer_M1918','I44_20rd_762x63_Tracer_M1918','I44_20rd_762x63_Tracer_M1918','I44_20rd_762x63_Tracer_M1918','I44_20rd_762x63_Tracer_M1918','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_HandGrenade_Mk2','I44_HandGrenade_Mk2','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6'],
		 ['I44_M1918A2','I44_M1A1Bazooka','I44_WebleyMk6']],
		[['I44_M1903A4','I44_M1A1Bazooka','I44_WebleyMk6','I44_Binocular_M3','ItemRadio','ItemMap'],
		 ['I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_5rd_762x63_Tracer_M1903','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_Rocket_60mm_M6A1_M1A1Bazooka','I44_HandGrenade_Mk2','I44_HandGrenade_Mk2','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6','I44_6rd_12x20R_Ball_WebleyMk6'],
		 ['I44_M1903A4','I44_M1A1Bazooka','I44_WebleyMk6']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_CO_M1Carbine","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_RTO_M1Carbine","I44_Man_A_Army_DDay_Medic","I44_Man_A_Army_DDay_Engr_M2_2"], 0, 2],
		[["I44_Man_A_Army_DDay_CO_M1Carbine","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_Engr_M2_2"], 60, 1],
		[["I44_Man_A_Army_DDay_Sniper_M1903A4","I44_Man_A_Army_DDay_Sniper_M1903A4","I44_Man_A_Army_DDay_Sniper_M1903A4","I44_Man_A_Army_DDay_Sniper_M1903A4","I44_Man_A_Army_DDay_Sniper_M1903A4"], 30, 1],
		[["I44_Man_A_Army_Ranger_CO_M1Carbine","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Engr_M2_2","I44_Man_A_Army_Ranger_M1Garand_M7","I44_Man_A_Army_Ranger_M1919A4","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_RTO_M1Carbine"], 50, 2],
		[["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_Engr_GrenadeNo75"], 50, 1],
		[["I44_HT_A_M3A1_Army","I44_HT_A_M3A1_Army","I44_HT_A_M3_Army"], 10, 1],
		[["I44_ACar_A_M8_Greyhound_Army","I44_ACar_A_M8_Greyhound_Army","I44_ACar_A_M8_Greyhound_Army"], 25, 2],
		[["I44_Man_A_Army_Ranger_CO_M1Carbine","I44_ACar_A_M8_Greyhound_Army","I44_Man_A_Army_Ranger_M1919A4","I44_Man_A_Army_Ranger_ATCrew_M3","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1A1Bazooka"], 40, 2],
		[["I44_Tank_A_M5A1_Stuart_Army","I44_Tank_A_M3A3_Stuart_Army"], 40, 1],
		[["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Tank_A_M5A1_Stuart_Army","I44_Man_A_Army_Ranger_ATCrew_M3","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_Medic","I44_Man_A_Army_Ranger_M1Garand_M7"], 50, 2],
		[["I44_Tank_B_Cromwell_Army","I44_Tank_B_Cromwell_Army"], 40, 1],
		[["I44_Veh_B_Army_MKIV_Churchill","I44_Veh_B_Army_MKIV_Churchill"], 50, 1],
		[["I44_Veh_A_Army_M4A3_76_Sherman_Army","I44_Veh_A_Army_M4A3_76_Sherman_Army"], 80, 2],
		[["I44_Tank_B_ShermanVC_Army","I44_Tank_B_ShermanVC_Army","I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army","I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army"], 100, 3],
		[["I44_Tank_B_ShermanVC_Army","I44_Tank_B_ShermanVC_Army","I44_Tank_B_ShermanVC_Army","Ural_ZU23_CDF"], 100, 2]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["I44_HT_A_M3A1_Army"], "I44_Truck_A_GMC_CCKW_Army", ["I44_HT_A_M3A1_Army"]],
			[
				["I44_Man_A_Army_DDay_CO_M1Carbine","I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_RTO_M1Carbine","I44_Man_A_Army_DDay_Medic","I44_Man_A_Army_DDay_Engr_M2_2"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"]
			]
		], 0, 2],
		[[
			[["I44_ACar_A_M8_Greyhound_Army"], "I44_Truck_A_GMC_CCKW_Army", ["I44_ACar_A_M8_Greyhound_Army"]],
			[
				["I44_Man_A_Army_DDay_CO_M1Carbine","I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_RTO_M1Carbine","I44_Man_A_Army_DDay_Medic","I44_Man_A_Army_DDay_Engr_M2_2"],
				["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_ATCrew_M3","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1919A4"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"]
			]
		], 40, 1],
		[[
			[["I44_Tank_A_M5A1_Stuart_Army"], "I44_HT_A_M3A1_Army", ["I44_Tank_A_M3A3_Stuart_Army"]],
			[
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_AB_82_M1918A2","I44_Man_A_Army_DDay_M1903A3_M1"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1919A4"]
			]
		], 50, 1],
		[[
			[["I44_Veh_A_Army_M4A3_Sherman_Army"], "I44_Truck_A_GMC_CCKW_Army", ["I44_Tank_B_Cromwell_Army"]],
			[
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"],
				["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_Engr_GrenadeNo75"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_AB_82_M1918A2","I44_Man_A_Army_DDay_M1903A3_M1"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1919A4"]
			]
		], 60, 2],
		[[
			[["I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army"], "I44_HT_A_M3A1_Army", ["I44_Veh_B_Army_MKIV_Churchill"]],
			[
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"],
				["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_ATCrew_M3","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1919A4"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1919A4"]
			]
		], 80, 1],
		[[
			[["I44_Tank_B_ShermanVC_Army"], "I44_HT_A_M3A1_Army", ["Ural_ZU23_CDF"]],
			[
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"],
				["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_Engr_GrenadeNo75"],
				["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1919A4"]
			]
		], 100, 1]
	]];
	
	
	
	
	//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
	missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
		[["I44_Boat_A_LCVP_Navy",["I44_Man_A_Army_DDay_CO_M1Carbine","I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_RTO_M1Carbine","I44_Man_A_Army_DDay_Medic","I44_Man_A_Army_DDay_Engr_M2_2"]], 0, 2],
		[["I44_Boat_A_LCM3_Navy",["I44_Man_A_Army_AB_82_NCO_M1A1Thompson","I44_Man_A_Army_AB_82_Sniper_M1903A4","I44_Man_A_Army_AB_82_Sniper_M1903A4","I44_Man_A_Army_AB_82_M1A1Bazooka","I44_Man_A_Army_AB_82_M1A1Bazooka","I44_Man_A_Army_AB_82_Sniper_M1903A4","I44_Man_A_Army_AB_82_M1919A6","I44_Man_A_Army_AB_82_M1Garand_M7"]], 50, 1],
		[["I44_Boat_A_LCVP_Navy",["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_AB_82_M1918A2","I44_Man_A_Army_DDay_M1903A3_M1"]], 40, 1]
	]];
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[["I44_P47",["I44_Man_A_Army_Ranger_CO_M1Carbine","I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1918A2","I44_Man_A_Army_DDay_M1919A4","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_RTO_M1Carbine","I44_Man_A_Army_DDay_Medic","I44_Man_A_Army_DDay_Engr_M2_2"]], 0, 2],
		[["I44_P47A",["I44_Man_B_Army_Commando_NCO_StenMk2S","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_PIAT","I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T","I44_Man_B_Army_Commando_BrenMk1","I44_Man_B_Army_Commando_Engr_GrenadeNo75"]], 50, 1],
		[["I44_P47",["I44_Man_A_Army_Ranger_NCO_M1A1Thompson","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_Sniper_M1903A4","I44_Man_A_Army_Ranger_M1Garand_M7","I44_Man_A_Army_Ranger_ATCrew_M3","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1A1Bazooka","I44_Man_A_Army_Ranger_M1919A4"]], 50, 1],
		[["I44_P47A",["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_G_WH_RPzB54","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1"]], 60, 1],
		[["I44_P47",["I44_Man_A_Army_DDay_NCO_M1A1Thompson","I44_Man_A_Army_DDay_ATCrew_M3","I44_Man_G_WH_RPzB54","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1903A3_M1","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_M1A1Bazooka","I44_Man_A_Army_DDay_Sniper_M1903A4","I44_Man_A_Army_DDay_Sniper_M1903A4"]], 80, 1]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'US'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_US.sqf";
	//(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_USMC.sqf";
	//if ((missionNamespace getVariable "WFBE_C_MODULE_BIS_BAF") > 0) then {(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_BAF.sqf"};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['I44_M1903A3','I44_M1911A1','I44_Binocular_M3','ItemCompass','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],
	['I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_5rd_762x63_Mix_M1903','I44_HandGrenade_No36M','I44_HandGrenade_No36M','I44_SmokeGrenade_ANM8','I44_SmokeGrenade_ANM8','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911','I44_7rd_1143x23_Ball_M1911'],
	['I44_M1903A3','I44_M1911A1']
]];

//--- Artillery.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_US.sqf";
//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_USMC.sqf";

if (WF_A2_CombinedOps) then {
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_US.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_US.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_US.sqf";
} else {
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_USMC.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_USMC.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_USMC.sqf";
};