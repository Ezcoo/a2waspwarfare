Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

	_u 			= ['I44_Man_A_Army_DDay_Medic'];
	_u = _u		+ ['I44_Man_A_Army_DDay_RTO_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1903A3'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1903A3_M1'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Sniper_M1903A4'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1Garand'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1Garand_M7'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1918A2'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1919A4'];
	_u = _u		+ ['I44_Man_A_Army_DDay_ATCrew_M3'];	
	_u = _u		+ ['I44_Man_A_Army_DDay_M1A1Bazooka'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M1A1Thompson'];
	_u = _u		+ ['I44_Man_A_Army_DDay_M3Greasegun'];
	_u = _u		+ ['I44_Man_A_Army_DDay_NCO_M1Garand'];
	_u = _u		+ ['I44_Man_A_Army_DDay_NCO_M1Carbine'];	
	_u = _u		+ ['I44_Man_A_Army_DDay_NCO_M1A1Thompson'];
	_u = _u		+ ['I44_Man_A_Army_DDay_CO_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_DDay_CO_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Engr_M2_2'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Engr_M1Mine'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Engr_M1A1Bangalore'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Engr_M2DemoCharges'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Engr_M37DemoKit'];
	_u = _u		+ ['I44_Man_A_Army_DDay_MCrew_C'];
	_u = _u		+ ['I44_Man_A_Army_DDay_MCrew_G'];
	_u = _u		+ ['I44_Man_A_Army_DDay_GunCrew_NCO_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_DDay_GunCrew_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Crew_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Crew_M3Greasegun'];
	_u = _u		+ ['I44_Man_A_Army_DDay_Crew_NCO_M1911A1'];
	_u = _u		+ ['I44_Man_A_AAF_Pilot_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Medic'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_RTO_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1903A3'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1903A3_M1'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Sniper_M1903A4'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1Garand'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1Garand_M7'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1918A2'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1919A4'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_ATCrew_M3'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1A1Bazooka'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M1A1Thompson'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_M3Greasegun'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_NCO_M1Garand'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_NCO_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_NCO_M1A1Thompson'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_CO_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_CO_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Engr_M2_2'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Engr_M1Mine'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Engr_M1A1Bangalore'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Engr_M2DemoCharges'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_Engr_M37DemoKit'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_MCrew_C'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_MCrew_G'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_GunCrew_NCO_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_Ranger_GunCrew_M1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_Medic'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_RTO_M1A1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1903A3'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1903A3_M1'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_Sniper_M1903A4'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1Garand'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1Garand_M7'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1A1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1918A2'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1919A4'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1919A6'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_ATCrew_M3'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_M1A1Bazooka'];
	_u = _u		+ ['I44_Man_A_Army_AB_M1A1Thompson'];
	_u = _u		+ ['I44_Man_A_Army_AB_M3Greasegun'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_NCO_M1Garand'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_NCO_M1A1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_NCO_M1A1Thompson'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_CO_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_CO_M1A1Carbine'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_Engr_M2_2'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_MCrew_C'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_MCrew_G'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_GunCrew_NCO_M1911A1'];
	_u = _u		+ ['I44_Man_A_Army_AB_82_GunCrew_M1A1Carbine'];
	_u = _u		+ ['I44_Man_B_Army_AB_Medic'];
	_u = _u		+ ['I44_Man_B_Army_AB_RTO'];
	_u = _u		+ ['I44_Man_B_Army_AB_SMLENo4Mk1'];
	_u = _u		+ ['I44_Man_B_Army_AB_SMLENo4Mk1_No82'];
	_u = _u		+ ['I44_Man_B_Army_AB_Sniper_SMLENo4Mk1T'];
	_u = _u		+ ['I44_Man_B_Army_AB_BrenMk1'];	
	_u = _u		+ ['I44_Man_B_Army_AB_ATCrew_SMLEdNo4Mk1'];
	_u = _u		+ ['I44_Man_B_Army_AB_PIAT'];
	_u = _u		+ ['I44_Man_B_Army_AB_StenMk2'];
	_u = _u		+ ['I44_Man_B_Army_AB_StenMk5'];
	_u = _u		+ ['I44_Man_B_Army_AB_NCO_SMLENo4Mk1'];
	_u = _u		+ ['I44_Man_B_Army_AB_NCO_StenMk5'];
	_u = _u		+ ['I44_Man_B_Army_AB_CO_WebleyMk6'];
	_u = _u		+ ['I44_Man_B_Army_AB_CO_StenMk5'];
	_u = _u		+ ['I44_Man_B_Army_AB_Engr_GrenadeNo75'];
	_u = _u		+ ['I44_Man_B_Army_AB_Sapper_M1A1'];
	_u = _u		+ ['I44_Man_B_Army_AB_Sapper_M2'];
	_u = _u		+ ['I44_Man_B_Army_AB_Sapper_M37'];	
	_u = _u		+ ['I44_Man_B_Army_AB_GunCrew_SMLEdNo4Mk1'];
	_u = _u		+ ['I44_Man_B_Army_AB_Crew_WebleyMk6'];
	_u = _u		+ ['I44_Man_B_Army_AB_Crew_StenMk2'];
	_u = _u		+ ['I44_Man_B_Army_Commando_RTO'];
	_u = _u		+ ['I44_Man_B_Army_Commando_SMLENo4Mk1'];
	_u = _u		+ ['I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T'];
	_u = _u		+ ['I44_Man_B_Army_Commando_BrenMk1'];
	_u = _u		+ ['I44_Man_B_Army_Commando_PIAT'];
	_u = _u		+ ['I44_Man_B_Army_Commando_M1A1Thompson'];	
	_u = _u		+ ['I44_Man_B_Army_Commando_DeLisle'];
	_u = _u		+ ['I44_Man_B_Army_Commando_StenMk2'];
	_u = _u		+ ['I44_Man_B_Army_Commando_StenMk2S'];
	_u = _u		+ ['I44_Man_B_Army_Commando_StenMk5'];
	_u = _u		+ ['I44_Man_B_Army_Commando_NCO_StenMk2S'];
	_u = _u		+ ['I44_Man_B_Army_Commando_Engr_GrenadeNo75'];
	_u = _u		+ ['I44_Man_B_Army_Commando_Sapper_M2'];
	_u = _u		+ ['I44_Man_B_Army_Commando_Sapper_M37'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u 			= ['I44_Car_A_WillysMB_Army'];
	_u = _u		+ ['I44_Car_B_WillysAB_Army'];
	_u = _u		+ ['I44_Car_A_WillysMB_M1919_Army'];
	_u = _u		+ ['I44_Car_B_WillysAB_VGO_Army'];
	_u = _u		+ ['I44_Tank_B_Army_UC'];
	_u = _u		+ ['I44_HT_A_M3_Army'];
	_u = _u		+ ['I44_HT_A_M3A1_Army'];
	_u = _u		+ ['I44_ACar_A_M8_Greyhound_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Ammo_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Fuel_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Repair_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Open_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Open2_Army'];
	_u = _u		+ ['I44_Boat_A_LCVP_Navy'];
	_u = _u		+ ['I44_Boat_A_LCM3_Navy'];
	_u = _u		+ ['I44_Boat_A_M1_AssaultBoat_Army'];
	_u = _u		+ ['I44_Boat_A_InflatableBoat_Army'];
	_u = _u		+ ['Zodiac'];
	_u = _u		+ ['Ural_ZU23_CDF'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Warfare_Salvage_Army'];
	_u = _u		+ ['I44_Truck_A_GMC_CCKW_Warfare_Supply_Army'];
	_u = _u		+ ['I44_Car_A_WillysMB_Medic_Army'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u 			= ['I44_Tank_A_M3A3_Stuart_Army'];
	_u = _u		+ ['I44_Tank_A_M5A1_Stuart_Army'];
	_u = _u		+ ['I44_Veh_A_Army_M4A3_Sherman_Army'];
	_u = _u		+ ['I44_Veh_A_Army_M4A3_DD_Sherman_Army'];
	_u = _u		+ ['I44_Veh_A_Army_M4A3_76_Sherman_Army'];
	_u = _u		+ ['I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army'];
	_u = _u		+ ['I44_Tank_B_ShermanIV_Army'];
	_u = _u		+ ['I44_Tank_B_ShermanVC_Army'];
	_u = _u		+ ['I44_Tank_B_Cromwell_Army'];
	_u = _u		+ ['I44_Veh_B_Army_MKIV_Churchill'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u = 		['I44_Plane_A_C47A_AAF'];
	_u = _u		+ ['I44_P47'];
	_u = _u		+ ['I44_P47A'];
	_u = _u		+ ['I44_Plane_A_P51D_AAF'];
	_u = _u		+ ['I44_Plane_A_P51D_250lb_AAF'];
	_u = _u		+ ['I44_Plane_A_P51D_HVAR_AAF'];
	_u = _u		+ ['I44_Plane_A_P38_AAF'];
	_u = _u		+ ['I44_Plane_A_P38_M64_AAF'];
	_u = _u		+ ['I44_Plane_A_P38_HVAR_AAF'];
	_u = _u		+ ['I44_Plane_B_HHmkIIa_RAF'];
	_u = _u		+ ['I44_Plane_B_HHmkIIa_M57_RAF'];
	_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
	_u = _u		+ ['I44_Plane_B_SpitfireMk1a_RAF'];
	_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M57_RAF'];
	_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
	_u = _u		+ ['I44_Plane_B_TyphoonMk1A_RAF'];
	_u = _u		+ ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];
	_u = _u		+ ['I44_Plane_A_B17_AAF'];

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u = 		 	  ['I44_Plane_A_C47A_AAF'];
	_u = _u		+ ['I44_P47'];
	_u = _u		+ ['I44_P47A'];
	_u = _u		+ ['I44_Plane_A_P51D_AAF'];
	_u = _u		+ ['I44_Plane_A_P51D_250lb_AAF'];
	_u = _u		+ ['I44_Plane_A_P51D_HVAR_AAF'];
	_u = _u		+ ['I44_Plane_A_P38_AAF'];
	_u = _u		+ ['I44_Plane_A_P38_M64_AAF'];
	_u = _u		+ ['I44_Plane_A_P38_HVAR_AAF'];
	_u = _u		+ ['I44_Plane_B_HHmkIIa_RAF'];
	_u = _u		+ ['I44_Plane_B_HHmkIIa_M57_RAF'];
	_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
	_u = _u		+ ['I44_Plane_B_SpitfireMk1a_RAF'];
	_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M57_RAF'];
	_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
	_u = _u		+ ['I44_Plane_A_B17_AAF'];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

	_u			= ["Old_bike_TK_CIV_EP1"];
	_u = _u		+ ["Old_moto_TK_Civ_EP1"];
	_u = _u		+ ["Tractor"];
	_u = _u		+ ["LandRover_TK_CIV_EP1"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_WESTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};