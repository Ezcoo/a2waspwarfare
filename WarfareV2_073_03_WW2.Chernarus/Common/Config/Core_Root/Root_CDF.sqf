Private ["_side"];

_side = "WEST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'CDF_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'CDF_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'CDF_Soldier'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\ca\ca_e\data\flag_cdf_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['BMP2_Ambul_CDF']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['UralRepair_CDF']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_CDF']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_CDF']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'MQ9PredatorB'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_RU0','WFHQ_RU1','WFHQ_RU2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolRU'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['CDF_Soldier_TL','CDF_Soldier_RPG','CDF_Soldier','CDF_Soldier','CDF_Soldier_AR','CDF_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['CDF_Soldier_TL','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier_Strela','CDF_Soldier_MG','CDF_Soldier_Medic','CDF_Soldier_Spotter','CDF_Soldier_Sniper']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['CDF_Soldier_TL','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier_Strela','CDF_Soldier_Strela','CDF_Soldier','CDF_Soldier_GL','CDF_Soldier_Medic','CDF_Soldier_Sniper','CDF_Soldier','CDF_Soldier_Marksman']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Mi17_CDF'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'UralRepair_CDF'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['BMP2_Ambul_CDF','Ural_CDF']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['RUBasicAmmunitionBox','RUBasicWeaponsBox','RULaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'BRDM2_CDF'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Mi17_CDF'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumWest'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_CDF'];//--- Supply Truck model.
missionNamespace setVariable [Format["WFBE_%1_WORKER", _side], ["Worker2","Worker4"]];//--- Workers model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['CDF_Soldier_TL','CDF_Soldier_MG','CDF_Soldier_Sniper','CDF_Soldier_Medic'], 
		['CDF_Soldier_TL','CDF_Soldier_AR','CDF_Soldier_GL','CDF_Soldier_RPG','CDF_Soldier'],
		['UAZ_MG_CDF','UAZ_AGS30_CDF']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BRDM2_CDF','BRDM2_ATGM_CDF'], 
		['Ural_CDF','CDF_Soldier_TL','CDF_Soldier_RPG','CDF_Soldier_MG','CDF_Soldier_RPG'],
		['BMP2_CDF','CDF_Soldier_Strela','CDF_Soldier_Strela','CDF_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T72_CDF','BMP2_CDF'], 
		['T72_CDF','T72_CDF'],
		['BMP2_CDF','BMP2_CDF','CDF_Soldier_TL','CDF_Soldier_MG','CDF_Soldier_Marksman','CDF_Soldier_Medic','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier'],
		['BMP2_CDF','CDF_Soldier_TL','CDF_Soldier_Medic','CDF_Soldier_GL','CDF_Soldier','CDF_Soldier_AR']
	]];
	
	//--- Base Patrols.
	if ((missionNamespace getVariable "WFBE_C_BASE_PATROLS_INFANTRY") > 0) then {
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_0", _side],['CDF_Soldier_TL','CDF_Soldier','CDF_Soldier','CDF_Soldier_AR','CDF_Soldier_GL','CDF_Soldier_MG']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_1", _side],['CDF_Soldier_TL','CDF_Soldier','CDF_Soldier','CDF_Soldier_MG','CDF_Soldier_RPG','CDF_Soldier_Medic']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_2", _side],['CDF_Soldier_TL','CDF_Soldier','CDF_Soldier','CDF_Soldier_Marksman','CDF_Soldier_Strela','CDF_Soldier_Sniper']];
		missionNamespace setVariable [Format["WFBE_%1BASEPATROLS_3", _side],['CDF_Soldier_TL','CDF_Soldier','CDF_Soldier_AR','CDF_Soldier_RPG','CDF_Soldier_RPG','CDF_Soldier_GL']];
	};
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AKS_74_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG18','Makarov']],
		[['AKS_74_U','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_U','RPG18','Makarov']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['AKS_74_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_kobra','RPG7V','Makarov']],
		[['SVD','MakarovSD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','HandGrenade_East','HandGrenade_East','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD'],
		 ['SVD','MakarovSD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']],
		[['AKS_74_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_pso','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['AK_74_GL','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL','RPG7V']],
		[['AK_74_GL','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL','RPG7V','Makarov']]
	]];
	
	//--- Reinforcer Module [units, needed sv, spawn chance (higher is better)], ground units.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS", _side], [
		[["CDF_Soldier_Officer","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_Militia","CDF_Soldier_Medic","CDF_Soldier_GL"], 0, 2],
		[["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"], 60, 1],
		[["CDF_Soldier_Marksman","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Spotter"], 30, 1],
		[["CDF_Soldier_TL","CDF_Soldier_Strela","CDF_Soldier_RPG","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier","CDF_Soldier","CDF_Soldier"], 40, 1],
		[["UAZ_MG_CDF","UAZ_AGS30_CDF","UAZ_MG_CDF"], 10, 2],
		[["Ural_ZU23_CDF","Ural_ZU23_CDF"], 50, 1],
		[["CDF_Soldier_TL","BRDM2_CDF","CDF_Soldier_MG","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG"], 40, 2],
		[["BRDM2_CDF","BRDM2_CDF"], 40, 1],
		[["CDF_Soldier_TL","BMP2_CDF","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_Medic","CDF_Soldier"], 50, 2],
		[["BMP2_CDF","BMP2_CDF"], 30, 2],
		[["T72_CDF","T72_CDF"], 50, 2],
		[["ZSU_CDF","ZSU_CDF"], 50, 1],
		[["T72_CDF","T72_CDF","T72_CDF","T72_CDF"], 100, 3],
		[["T72_CDF","T72_CDF","BMP2_CDF","ZSU_CDF"], 100, 1]
	]];
	
	//--- Reinforcer Module [[[[head vehicles], transport, [tail vehicles]], [[units group 1],[units group 2],[units group 3]...]], needed sv, spawn chance (higher is better)], ground units convoys.
	missionNamespace setVariable [Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side], [
		[[
			[["UAZ_MG_CDF"], "Ural_CDF", ["UAZ_AGS30_CDF"]],
			[
				["CDF_Soldier_Officer","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_Militia","CDF_Soldier_Medic","CDF_Soldier_GL"],
				["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"]
			]
		], 0, 2],
		[[
			[["BRDM2_CDF"], "Ural_CDF", ["BRDM2_ATGM_CDF"]],
			[
				["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"],
				["CDF_Soldier_Officer","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_Militia","CDF_Soldier_Medic","CDF_Soldier_GL"],
				["CDF_Soldier_Marksman","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Spotter"]
			]
		], 40, 1],
		[[
			[["BMP2_CDF"], "Ural_CDF", ["BRDM2_ATGM_CDF"]],
			[
				["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"],
				["CDF_Soldier_TL","CDF_Soldier_Sniper","CDF_Soldier_MG","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier_Strela","CDF_Soldier_Strela","CDF_Soldier_Strela"],
				["CDF_Soldier_TL","CDF_Soldier_Strela","CDF_Soldier_RPG","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier","CDF_Soldier","CDF_Soldier"]
			]
		], 60, 2],
		[[
			[["T72_CDF"], "BMP2_CDF", ["ZSU_CDF"]],
			[
				["CDF_Soldier_TL","CDF_Soldier_Strela","CDF_Soldier_RPG","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier","CDF_Soldier","CDF_Soldier"],
				["CDF_Soldier_Marksman","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Spotter"],
				["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"]
			]
		], 80, 2]
	]];
	
	//--- Reinforcer Module [[boat, units], needed sv, spawn chance (higher is better)], naval units.
	missionNamespace setVariable [Format["REINFORCER_%1_NAVAL_UNITS", _side], [
		[[["Fishing_Boat","Smallboat_1","Smallboat_2"],["CDF_Soldier_Officer","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_Militia","CDF_Soldier_Medic","CDF_Soldier_GL"]], 0, 2],
		[[["Fishing_Boat","Smallboat_1"],["CDF_Soldier_TL","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"]], 50, 1],
		[[["Fishing_Boat","Smallboat_2"],["CDF_Soldier_Marksman","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Spotter"]], 40, 1]
	]];
	
	//--- Reinforcer Module [[chopper(s), units], needed sv, spawn chance (higher is better)], aerial units.
	missionNamespace setVariable [Format["REINFORCER_%1_AIR_UNITS", _side], [
		[["Mi17_CDF",["CDF_Soldier_Officer","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier_MG","CDF_Soldier_RPG","CDF_Soldier_Militia","CDF_Soldier_Medic","CDF_Soldier_GL"]], 0, 2],
		[["Mi17_CDF",["CDF_Soldier_Marksman","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Sniper","CDF_Soldier_Spotter"]], 50, 1],
		[["Mi17_CDF",["CDF_Soldier_TL","CDF_Soldier_Strela","CDF_Soldier_RPG","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier","CDF_Soldier","CDF_Soldier"]], 60, 1],
		[["Mi17_CDF",["CDF_Soldier_TL","CDF_Soldier_Strela","CDF_Soldier_RPG","CDF_Soldier_AR","CDF_Soldier_AR","CDF_Soldier","CDF_Soldier","CDF_Soldier","CDF_Soldier_RPG","CDF_Soldier_RPG","CDF_Soldier_GL"]], 80, 1]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'CDF'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_CDF.sqf";
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];

//--- Artillery.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CDF.sqf";
//--- Squads.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_CDF.sqf";
//--- Units.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CDF.sqf";
//--- Upgrades.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CDF.sqf";

if (WF_A2_CombinedOps) then {
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_CDF.sqf";
} else {
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CDF.sqf";
};