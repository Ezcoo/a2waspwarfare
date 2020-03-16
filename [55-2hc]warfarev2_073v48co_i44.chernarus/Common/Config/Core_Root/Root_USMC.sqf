Private ["_side"];

_side = "WEST";

//--- Generic.
missionNamespace setVariable [Format["WFBE_%1CREW", _side], 'USMC_Soldier_Crew'];
missionNamespace setVariable [Format["WFBE_%1PILOT", _side], 'USMC_Soldier_Pilot'];
missionNamespace setVariable [Format["WFBE_%1SOLDIER", _side], 'USMC_Soldier'];

//--- Flag texture.
missionNamespace setVariable [Format["WFBE_%1FLAG", _side], '\Ca\Data\flag_usa_co.paa'];

missionNamespace setVariable [Format["WFBE_%1AMBULANCES", _side], ['HMMWV_Ambulance','HMMWV_Ambulance_DES_EP1','UH60M_MEV_EP1','M1133_MEV_EP1']];
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCKS", _side], ['I44_Truck_A_GMC_CCKW_Repair_Army']];
missionNamespace setVariable [Format["WFBE_%1SALVAGETRUCK", _side], ['I44_Truck_A_GMC_CCKW_Warfare_Salvage_Army']];
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCKS", _side], ['WarfareSupplyTruck_USMC','MtvrSupply_DES_EP1']];
missionNamespace setVariable [Format["WFBE_%1UAV", _side], 'MQ9PredatorB'];

//--- Radio Announcers.
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers", _side], ['WFHQ_EN0','WFHQ_EN1','WFHQ_EN2']];
missionNamespace setVariable [Format ["WFBE_%1_RadioAnnouncers_Config", _side], 'RadioProtocolEN'];

//--- Paratroopers.
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL1", _side],['USMC_Soldier_SL','USMC_Soldier_LAT','USMC_Soldier','USMC_Soldier2','USMC_Soldier_AR','I44_Man_B_Army_Medic']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL2", _side],['USMC_Soldier_SL','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AT','USMC_Soldier_AA','USMC_Soldier_MG','I44_Man_B_Army_Medic','USMC_SoldierS_Spotter','I44_Man_B_Army_Sniper_SMLENo4Mk1T']];
missionNamespace setVariable [Format["WFBE_%1PARACHUTELEVEL3", _side],['FR_Assault_R','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_HAT','USMC_Soldier_AA','USMC_Soldier_AA','FR_AR','FR_AC','I44_Man_B_Army_Medic','FR_Marksman','USMC_Soldier_AT','I44_Man_B_Army_Sniper_SMLENo4Mk1T']];

missionNamespace setVariable [Format["WFBE_%1PARACARGO", _side], 'I44_Plane_A_C47A_AAF'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["WFBE_%1REPAIRTRUCK", _side], 'I44_Truck_A_GMC_CCKW_Repair_Army'];//--- Repair Truck model.
missionNamespace setVariable [Format["WFBE_%1STARTINGVEHICLES", _side], ['HMMWV_Ambulance','MTVR']];//--- Starting Vehicles.
missionNamespace setVariable [Format["WFBE_%1PARAAMMO", _side], ['USBasicAmmunitionBox','USBasicWeaponsBox','USLaunchersBox']];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["WFBE_%1PARAVEHICARGO", _side], 'I44_Truck_A_GMC_CCKW_Repair_Army'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["WFBE_%1PARAVEHI", _side], 'MH60S'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["WFBE_%1PARACHUTE", _side], 'ParachuteMediumWest'];//--- Supply Paradropping, Parachute Model.
missionNamespace setVariable [Format["WFBE_%1SUPPLYTRUCK", _side], 'WarfareSupplyTruck_USMC'];//--- Supply Truck model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["WFBE_%1_PATROL_LIGHT", _side], [
		['I44_Man_B_Army_Engr_GrenadeNo75','USMC_Soldier_MG','I44_Man_B_Army_Sniper_SMLENo4Mk1T','I44_Man_B_Army_Medic'],
		['I44_Man_B_Army_Engr_GrenadeNo75','USMC_Soldier_AR','USMC_Soldier_GL','USMC_Soldier_LAT','USMC_Soldier'],
		['HMMWV_M2','HMMWV_MK19']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_MEDIUM", _side], [
		['LAV25','LAV25'],
		['MTVR','I44_Man_B_Army_Engr_GrenadeNo75','USMC_Soldier_AT','USMC_Soldier_MG','USMC_Soldier_LAT'],
		['AAV','USMC_Soldier_AA','USMC_Soldier_AA','I44_Man_B_Army_Medic']
	]];

	missionNamespace setVariable [Format["WFBE_%1_PATROL_HEAVY", _side], [
		['M1A1','AAV'],
		['M1A1','M1A1'],
		['AAV','AAV','I44_Man_B_Army_Engr_GrenadeNo75','USMC_Soldier_MG','USMC_SoldierM_Marksman','I44_Man_B_Army_Medic','USMC_Soldier_AT','USMC_Soldier_HAT','USMC_Soldier'],
		['LAV25','I44_Man_B_Army_Engr_GrenadeNo75','I44_Man_B_Army_Medic','USMC_Soldier_GL','USMC_Soldier','USMC_Soldier_AR']
	]];

	//--- AI Loadouts [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_0", _side], [
		[['m16a4_acg','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['m16a4_acg','M136','Colt1911']],
		[['G36C','M136','Colt1911','Binocular','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C','M136','Colt1911']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_1", _side], [
		[['M4A1_Aim_camo','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['M4A1_Aim_camo','M136','Colt1911']],
		[['G36K','M136','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','M136','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36K','M136','Colt1911']],
		[['DMR','M9SD','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','20Rnd_762x51_DMR','HandGrenade_West','HandGrenade_West','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
		 ['DMR','M9SD']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_2", _side], [
		[['M4A1_Aim_camo','SMAW','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','SMAW_HEAA','SMAW_HEAA','SMAW_HEDP','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['M4A1_Aim_camo','SMAW','Colt1911']],
		[['G36C','SMAW','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','30Rnd_556x45_G36','SMAW_HEAA','SMAW_HEAA','SMAW_HEDP','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911'],
		 ['G36C','SMAW','Colt1911']]
	]];
	missionNamespace setVariable [Format["WFBE_%1_AI_Loadout_3", _side], [
		[['M4A1_HWS_GL','SMAW','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','SMAW_HEAA','SMAW_HEAA','SMAW_HEDP','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['M4A1_HWS_GL','SMAW']],
		[['M4A1_HWS_GL_camo','Javelin','Colt1911','Binocular','NVGoggles','ItemRadio','ItemMap'],
		 ['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','Javelin','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','7Rnd_45ACP_1911','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203'],
		 ['M4A1_HWS_GL_camo','Javelin','Colt1911']]
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["WFBE_%1DEFAULTFACTION", _side], 'USMC'];

	//--- Import the needed Gear (Available from the gear menu), multiple gear can be used.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_USMC.sqf";
	if (WF_A2_CombinedOps) then {
		(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_US.sqf";
	};
};

//--- Default Loadout [weapons, magazines, eligible muzzles, {backpack}, {backpack content}].
missionNamespace setVariable [Format["WFBE_%1_DefaultGear", _side], [
	['M4A1_Aim','M9','Binocular','NVGoggles','ItemCompass','ItemMap','ItemRadio','ItemWatch'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','HandGrenade_West','HandGrenade_West','HandGrenade_West','SmokeShellBlue','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD','15Rnd_9x19_M9SD'],
	['M4A1_Aim','M9']
]];

if (WF_A2_CombinedOps) then {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_CO_US.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_CO_US.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_USMC.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_CO_US.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_CO_US.sqf";
} else {
	//--- Artillery.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_USMC.sqf";
	//--- Units.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_USMC.sqf";
	//--- Squads.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Squads\Squad_USMC.sqf";
	//--- Structures.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_USMC.sqf";
	//--- Upgrades.
	(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_USMC.sqf";
};

//Engineer
missionNamespace setVariable [Format["WFBE_%1_DefaultGearEngineer", _side], [
	['M16A2GL','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
	['30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','30Rnd_556x45_Stanag','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','1Rnd_HE_M203','PipeBomb'],
	['M16A2GL']
]];

// Sniper
missionNamespace setVariable [Format["WFBE_%1_DefaultGearSpot", _side], [
	['M24','glock17_EP1','ItemCompass','ItemMap','ItemWatch','ItemRadio','Binocular','NVGoggles'],
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