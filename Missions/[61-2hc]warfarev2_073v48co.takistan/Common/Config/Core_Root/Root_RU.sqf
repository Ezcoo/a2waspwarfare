Private ["_side"];

_side = "EAST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'RU_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'RU_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'RU_Soldier'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\Data\flag_rus_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['GAZ_Vodnik_MedEvac','M113Ambul_TK_EP1','Mi17_medevac_RU','M113Ambul_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['KamazRepair','UralRepair_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_RU','UralSalvage_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_RU','UralSupply_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'Pchela1T'];

missionNamespace setVariable [Format["WFBE_%1AMMOTRUCKS", _side], ['MtvrReammo_DES_EP1','WarfareReammoTruck_USMC','WarfareReammoTruck_RU','UralReammo_TK_EP1']];//listed to get gearaccess in updateavailablaactions.sqf (listed both to get capture skill too)
missionNamespace setVariable [Format["WFBE_%1ECMTRUCKS", _side], ['KamazRefuel','UralRefuel_TK_EP1']];//listed to add ecm stuff
missionNamespace setVariable [Format["WFBE_%1LIFTVEHICLE", _side], ["Mi17_Ins","Mi17_medevac_RU","Mi17_TK_EP1"]];
missionNamespace setVariable [Format["WFBE_%1ARTYVEHICLE", _side], ['GRAD_TK_EP1','GRAD_RU']];


//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_RU0','WFHQ_RU1','WFHQ_RU2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolRU'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['RU_Soldier_SL','RU_Soldier_LAT','RU_Soldier','RU_Soldier2','RU_Soldier_AR','RU_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['RU_Soldier_SL','RU_Soldier_AT','RU_Soldier_AT','RU_Soldier_AT','RU_Soldier_AA','RU_Soldier_MG','RU_Soldier_Medic','RU_Soldier_Marksman','RUS_Soldier_Marksman']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['MVD_Soldier_TL','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_HAT','RU_Soldier_AA','RU_Soldier_AA','MVD_Soldier_MG','RUS_Commander','MVD_Soldier_Sniper','RUS_Soldier_Marksman']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'Mi17_Ins'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'KamazRepair'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['GAZ_Vodnik_MedEvac','BTR90']];//--- Starting Vehicles.missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['RUBasicAmmunitionBox','RUBasicWeaponsBox','RULaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'KamazRepair'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'Mi17_Ins'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumEast'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_RU'];//--- Supply Truck model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['RU_Soldier_TL','RU_Soldier_MG','RU_Soldier_Sniper','RU_Soldier_Medic'],
		['RU_Soldier_TL','RU_Soldier_AR','RU_Soldier_GL','RU_Soldier_LAT','RU_Soldier'],
		['GAZ_Vodnik_HMG','GAZ_Vodnik']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['BTR90','BTR90'],
		['Kamaz','RU_Soldier_TL','RU_Soldier_AT','RU_Soldier_MG','RU_Soldier_LAT'],
		['BMP3','RU_Soldier_AA','RU_Soldier_AA','RU_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['T72_RU','BMP3'],
		['T72_RU','T72_RU'],
		['BMP3','BMP3','RU_Soldier_TL','RU_Soldier_MG','RU_Soldier_Marksman','RU_Soldier_Medic','RU_Soldier_AT','RU_Soldier_HAT','RU_Soldier'],
		['BTR90','RU_Soldier_TL','RU_Soldier_Medic','RU_Soldier_GL','RU_Soldier','RU_Soldier_AR']
	]];

	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['AK_107_kobra','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_kobra','RPG18','Makarov']],
		[['AKS_74_U','RPG18','Makarov','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','RPG18','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AKS_74_U','RPG18','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['AK_107_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_kobra','RPG7V','Makarov']],
		[['AK_107_kobra','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7V','PG7V','PG7V','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_kobra','RPG7V','Makarov']],
		[['SVD','MakarovSD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','10Rnd_762x54_SVD','HandGrenade_East','HandGrenade_East','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD','8Rnd_9x18_MakarovSD'],
		 ['SVD','MakarovSD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['AK_107_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_pso','RPG7V','Makarov']],
		[['AK_107_pso','RPG7V','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VL','PG7VL','PG7VL','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
		 ['AK_107_pso','RPG7V','Makarov']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['AK_107_GL_pso','RPG7V','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','PG7VR','PG7VR','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_107_GL_pso','RPG7V']],
		[['AK_107_GL_pso','MetisLauncher','Makarov','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','AT13','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25','1Rnd_HE_GP25'],
		 ['AK_107_GL_pso','MetisLauncher','Makarov']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'Russians'];

	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_RU.sqf";
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_TKA.sqf";
	};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['AK_107_kobra','Makarov','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','30Rnd_545x39_AK','HandGrenade_East','HandGrenade_East','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov','8Rnd_9x18_Makarov'],
	['AK_107_kobra','Makarov']
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