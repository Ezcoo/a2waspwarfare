Private ["_side"];

_side = "EAST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'TK_Soldier_Crew_EP1'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'TK_Soldier_Pilot_EP1'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'TK_Soldier_EP1'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\ca_e\Data\flag_tka_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['GAZ_Vodnik_MedEvac','M113Ambul_TK_EP1','Mi17_medevac_RU','M113Ambul_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['KamazRepair','UralRepair_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_RU','UralSalvage_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_RU','UralSupply_TK_EP1']];

missionNamespace setVariable [Format["WFBE_%1AMMOTRUCKS", _side], ['MtvrReammo_DES_EP1','WarfareReammoTruck_USMC','WarfareReammoTruck_RU','UralReammo_TK_EP1']];//listed to get gearaccess in updateavailablaactions.sqf (listed both to get capture skill too)
missionNamespace setVariable [Format["WFBE_%1ECMTRUCKS", _side], ['KamazRefuel','UralRefuel_TK_EP1']];//listed to add ecm stuff
missionNamespace setVariable [Format["WFBE_%1LIFTVEHICLE", _side], ["Mi17_Ins","Mi17_medevac_RU","Mi17_TK_EP1"]];
missionNamespace setVariable [Format["WFBE_%1ARTYVEHICLE", _side], ['GRAD_TK_EP1','GRAD_RU']];



//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_TK0_EP1','WFHQ_TK1_EP1','WFHQ_TK2_EP1','WFHQ_TK3_EP1','WFHQ_TK4_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_TK'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['TK_Soldier_SL_EP1','TK_Soldier_LAT_EP1','TK_Soldier_EP1','TK_Soldier_LAT_EP1','TK_Soldier_AR_EP1','TK_Soldier_Medic_EP1']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['TK_Soldier_SL_EP1','TK_Soldier_AT_EP1','TK_Soldier_AT_EP1','TK_Soldier_AT_EP1','TK_Soldier_AA_EP1','TK_Soldier_MG_EP1','TK_Soldier_Medic_EP1','TK_Soldier_Sniper_EP1','TK_Soldier_Spotter_EP1']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['TK_Special_Forces_TL_EP1','TK_Soldier_HAT_EP1','TK_Soldier_HAT_EP1','TK_Soldier_HAT_EP1','TK_Soldier_HAT_EP1','TK_Soldier_HAT_EP1','TK_Soldier_AA_EP1','TK_Soldier_AA_EP1','TK_Special_Forces_MG_EP1','TK_Special_Forces_EP1','TK_Special_Forces_EP1','TK_Special_Forces_EP1']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Mi17_Ins'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'UralRepair_TK_EP1'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['GAZ_Vodnik_MedEvac','BTR90']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['TKBasicAmmunitionBox_EP1','TKBasicWeapons_EP1','TKLaunchers_EP1']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'UralRepair_TK_EP1'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Mi17_TK_EP1'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast_EP1'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'UralSupply_TK_EP1'];//--- Supply Truck model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['TK_Soldier_SL_EP1','TK_Soldier_MG_EP1','TK_Soldier_Sniper_EP1','TK_Soldier_Medic_EP1'],
		['TK_Soldier_SL_EP1','TK_Soldier_AR_EP1','TK_Soldier_GL_EP1','TK_Soldier_LAT_EP1','TK_Soldier_EP1'],
		['LandRover_MG_TK_EP1','LandRover_SPG9_TK_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BRDM2_TK_EP1','BRDM2_ATGM_TK_EP1'],
		['V3S_TK_EP1','TK_Soldier_SL_EP1','TK_Soldier_AT_EP1','TK_Soldier_MG_EP1','TK_Soldier_LAT_EP1'],
		['BMP2_TK_EP1','TK_Soldier_AA_EP1','TK_Soldier_AA_EP1','TK_Soldier_Medic_EP1']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T72_TK_EP1','BMP2_TK_EP1'],
		['T55_TK_EP1','T72_TK_EP1'],
		['BMP2_TK_EP1','BMP2_TK_EP1','TK_Soldier_SL_EP1','TK_Soldier_MG_EP1','TK_Soldier_Sniper_EP1','TK_Soldier_Medic_EP1','TK_Soldier_AT_EP1','TK_Soldier_HAT_EP1','TK_Soldier_EP1'],
		['M113_TK_EP1','TK_Soldier_SL_EP1','TK_Soldier_Medic_EP1','TK_Soldier_GL_EP1','TK_Soldier_EP1','TK_Soldier_AR_EP1']
	]];

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
		[['AK_74_GL_kobra','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VR','PG7VR','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL_kobra','RPG7V']],
		[['AK_74_GL_kobra','MetisLauncher','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','AT13','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_74_GL_kobra','MetisLauncher','Makarov']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Takistani Army'];

	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKA.sqf";
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_RU.sqf";
	};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AKS_74_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AKS_74_kobra','Makarov']
]];

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_RU.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_RU.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_RU.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_RU.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_RU.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_OA_TKA.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_OA_TKA.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_OA_TKA.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_OA_TKA.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_OA_TKA.sqf";
};
//Engineer
missionNamespace setVariable [Format["WFBE_%1_DefaultGearEngineer", _side], [
	['AK_74_GL','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','HandGrenade_East','HandGrenade_East','HandGrenade_East','HandGrenade_East'],
	['AK_74_GL']
]];

// Sniper
missionNamespace setVariable [Format["WFBE_%1_DefaultGearSpot", _side], [
	['huntingrifle','Sa61_EP1','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular_Vector','NVGoggles'],
	['5x_22_LR_17_HMR','5x_22_LR_17_HMR','5x_22_LR_17_HMR','5x_22_LR_17_HMR','20Rnd_B_765x17_Ball','20Rnd_B_765x17_Ball','20Rnd_B_765x17_Ball','20Rnd_B_765x17_Ball','SmokeShellRed'],
	['huntingrifle']
]];

// MASH MAN
missionNamespace setVariable [Format["WFBE_%1_DefaultGearOfficer", _side], [
	['AKS_74_pso', 'RPG18', 'ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','HandGrenade_East'],
	['AKS_74_pso']
]];

// Soldier
missionNamespace setVariable [Format["WFBE_%1_DefaultGearSoldier", _side], [
	['AKS_74_kobra', 'RPG18', 'ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','HandGrenade_East'],
	['AKS_74_kobra']
]];

// Lock MAN
missionNamespace setVariable [Format["WFBE_%1_DefaultGearLock", _side], [
	['RPK_74','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['75Rnd_545x39_RPK','75Rnd_545x39_RPK','75Rnd_545x39_RPK','75Rnd_545x39_RPK','75Rnd_545x39_RPK','75Rnd_545x39_RPK','75Rnd_545x39_RPK','75Rnd_545x39_RPK','HandGrenade_East','HandGrenade_East','HandGrenade_East','HandGrenade_East'],
	['RPK_74']
]];

// Medic
missionNamespace setVariable [Format["WFBE_%1_DefaultGearMedic", _side], [
	['AK_47_S','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_762x39_AK47','30Rnd_762x39_AK47','30Rnd_762x39_AK47','30Rnd_762x39_AK47','SmokeShell','SmokeShell','SmokeShell','SmokeShell'],
	['AK_47_S']
]];