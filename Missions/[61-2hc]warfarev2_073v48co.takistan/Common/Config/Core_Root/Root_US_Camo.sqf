/* This config file is used with IS_chernarus_map_dependent, required CO */
Private ["_side"];

_side = "WEST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'USMC_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'USMC_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'USMC_Soldier'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\ca_e\Data\flag_us_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['HMMWV_Ambulance','HMMWV_Ambulance_DES_EP1','UH60M_MEV_EP1','M1133_MEV_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['MtvrRepair','MtvrRepair_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['WarfareSalvageTruck_USMC','MtvrSalvage_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_USMC','MtvrSupply_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'MQ9PredatorB_US_EP1'];

missionNamespace setVariable [Format["WFBE_%1AMMOTRUCKS", _side], ['MtvrReammo_DES_EP1','WarfareReammoTruck_USMC','WarfareReammoTruck_RU','UralReammo_TK_EP1']];//listed to get gearaccess in updateavailablaactions.sqf (listed both to get capture skill too)
missionNamespace setVariable [Format["WFBE_%1ECMTRUCKS", _side], ['MtvrRefuel_DES_EP1','MtvrRefuel']];//listed to add ecm stuff
missionNamespace setVariable [Format["WFBE_%1LIFTVEHICLE", _side], ["MH60S","MV22","C130J","UH60M_EP1","UH60M_MEV_EP1","CH_47F_EP1","C130J_US_EP1","BAF_Merlin_HC3_D","CH_47F_BAF","Mi17_Civilian"]];
missionNamespace setVariable [Format["WFBE_%1ARTYVEHICLE", _side], ['MLRS_DES_EP1','MLRS','M1129_MC_EP1']];


//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_EN0_EP1','WFHQ_EN1_EP1','WFHQ_EN2_EP1','WFHQ_EN4_EP1','WFHQ_EN5_EP1']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_EN'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['USMC_Soldier_SL','USMC_Soldier_LAT','USMC_Soldier','USMC_Soldier2','USMC_Soldier_AR','USMC_Soldier_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['USMC_Soldier_SL','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AA','USMC_Soldier_MG','USMC_Soldier_Medic','USMC_SoldierS_Spotter','USMC_SoldierS_Sniper']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['FR_Assault_R','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_AA','USMC_Soldier_AA','FR_AR','FR_AC','USMC_Soldier_Medic','FR_Marksman','USMC_Soldier_AT','USMC_SoldierS_Sniper']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'C130J'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'MtvrRepair'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['HMMWV_Ambulance','Pandur2_ACR']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['USBasicAmmunitionBox','USBasicWeaponsBox','USLaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'MtvrRepair'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'MH60S'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumWest'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_USMC'];//--- Supply Truck model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['USMC_Soldier_TL','USMC_Soldier_MG','USMC_SoldierS_Sniper','USMC_Soldier_Medic'], 
		['USMC_Soldier_TL','USMC_Soldier_AR','USMC_Soldier_GL','USMC_Soldier_LAT','USMC_Soldier'],
		['HMMWV_M2','HMMWV_MK19']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['LAV25','LAV25'], 
		['MTVR','USMC_Soldier_TL','USMC_Soldier_AT','USMC_Soldier_MG','USMC_Soldier_LAT'],
		['AAV','USMC_Soldier_AA','USMC_Soldier_AA','USMC_Soldier_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['M1A1','AAV'], 
		['M1A1','M1A1'],
		['AAV','AAV','USMC_Soldier_TL','USMC_Soldier_MG','USMC_SoldierM_Marksman','USMC_Soldier_Medic','USMC_Soldier_AT','USMC_Soldier_HAT','USMC_Soldier'],
		['LAV25','USMC_Soldier_TL','USMC_Soldier_Medic','USMC_Soldier_GL','USMC_Soldier','USMC_Soldier_AR']
	]];
	
	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['SCAR_L_CQC','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['SCAR_L_CQC','M136','Colt1911']],
		[['G36C_camo','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C_camo','M136','Colt1911']]
	]];	
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['M4A3_CCO_EP1','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['M4A3_CCO_EP1','M136','Colt1911']],
		[['G36K_camo','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36K_camo','M136','Colt1911']],
		[['M14_EP1','M9SD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','HandGrenade_West','HandGrenade_West','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
		 ['M14_EP1','M9SD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['SCAR_L_STD_HOLO','MAAWS','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','MAAWS_HEAT','MAAWS_HEAT','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['SCAR_L_STD_HOLO','MAAWS','Colt1911']],
		[['G36C_camo','MAAWS','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','MAAWS_HEAT','MAAWS_HEAT','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C_camo','MAAWS','Colt1911']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['SCAR_L_CQC_EGLM_Holo','MAAWS','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','MAAWS_HEAT','MAAWS_HEAT','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['SCAR_L_CQC_EGLM_Holo','MAAWS']],
		[['SCAR_H_STD_EGLM_Spect','Javelin','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','20Rnd_762x51_SB_SCAR','Javelin','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['SCAR_H_STD_EGLM_Spect','Javelin','Colt1911']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'US'];
	
	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_US.sqf";
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_USMC.sqf";
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_BAF.sqf";
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['SCAR_L_CQC','M9','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','HandGrenade_West','HandGrenade_West','HandGrenade_West','SmokeShellBlue','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
	['SCAR_L_CQC','M9']
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
//Engineer
missionNamespace setVariable [Format["WFBE_%1_DefaultGearEngineer", _side], [
	['M16A2GL','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','HandGrenade_West','HandGrenade_West','HandGrenade_West','HandGrenade_West'],
	['M16A2GL']
]];

// Sniper
missionNamespace setVariable [Format["WFBE_%1_DefaultGearSpot", _side], [
	['M24','glock17_EP1','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular_Vector','NVGoggles'],
	['5Rnd_762x51_M24','5Rnd_762x51_M24','5Rnd_762x51_M24','5Rnd_762x51_M24','17Rnd_9x19_glock17','17Rnd_9x19_glock17','17Rnd_9x19_glock17','17Rnd_9x19_glock17','SmokeShellRed'],
	['M24']
]];

// MASH MAN
missionNamespace setVariable [Format["WFBE_%1_DefaultGearOfficer", _side], [
	['m16a4_acg','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','HandGrenade_West','HandGrenade_West','HandGrenade_West','HandGrenade_West'],
	['m16a4_acg']
]];

// Soldier
missionNamespace setVariable [Format["WFBE_%1_DefaultGearSoldier", _side], [
	['M4A1_Aim','M136','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','HandGrenade_West','HandGrenade_West','HandGrenade_West','HandGrenade_West'],
	['M4A1_Aim']
]];

// Lock MAN
missionNamespace setVariable [Format["WFBE_%1_DefaultGearLock", _side], [
	['M249','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['100Rnd_556x45_BetaCMag','100Rnd_556x45_BetaCMag','100Rnd_556x45_BetaCMag','100Rnd_556x45_BetaCMag','HandGrenade_West','HandGrenade_West','HandGrenade_West','HandGrenade_West'],
	['M249']
]];

// Medic 
missionNamespace setVariable [Format["WFBE_%1_DefaultGearMedic", _side], [
	['M4A1','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','SmokeShell','SmokeShell','SmokeShell','SmokeShell'],
	['M4A1']
]];