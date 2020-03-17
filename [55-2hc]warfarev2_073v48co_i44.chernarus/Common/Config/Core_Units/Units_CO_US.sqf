Private ['_restriction_air','_side','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";

//--- USMC Troops.
_u = ['I44_Man_A_Army_GunCrew_M1Carbine'];
_u = _u		+ ['I44_Man_A_Army_M1918A2'];
_u = _u		+ ['I44_Man_A_Army_M1A1Bazooka'];
_u = _u		+ ['I44_Man_B_Army_PIAT'];
_u = _u		+ ['I44_Man_A_Army_M1A1Thompson'];
_u = _u		+ ['I44_Man_A_Army_M1919A4'];
_u = _u		+ ['I44_Man_A_Army_M1Garand_M7'];
_u = _u		+ ['I44_Man_A_Army_Medic'];
_u = _u		+ ['I44_Man_B_Army_Engr_GrenadeNo75'];
_u = _u		+ ['I44_Man_A_Army_Sniper_M1903A4'];
_u = _u		+ ['USMC_Soldier_SL'];
_u = _u		+ ['I44_Man_A_Army_Crew_M3Greasegun'];
_u = _u		+ ['I44_Man_A_AAF_Pilot_M1911A1'];
_u = _u		+ ['FR_GL'];
_u = _u		+ ['FR_Corpsman'];
_u = _u		+ ['I44_Man_B_Army_Sapper_M2'];
_u = _u		+ ['FR_Assault_R'];
_u = _u		+ ['FR_Assault_GL'];
_u = _u		+ ['FR_AR'];
_u = _u		+ ['FR_R'];
_u = _u		+ ['FR_Sapper'];
_u = _u		+ ['FR_AC'];
_u = _u		+ ['FR_Marksman'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u  		= ['I44_Car_A_WillysMB_Medic_Army'];
_u = _u		+ ['I44_Car_B_WillysAB_Medic_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Repair_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Ammo_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Fuel_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Warfare_Salvage_Army'];
_u = _u		+ ['I44_HT_A_M3_Army'];
_u = _u		+ ['I44_HT_A_M3A1_Army'];
_u = _u		+ ['I44_ACar_A_M8_Greyhound_Army'];
_u = _u		+ ['I44_HT_A_M3_Army'];
_u = _u		+ ['I44_HT_A_M3A1_Army'];
_u = _u		+ ['I44_Car_A_WillysMB_Army'];
_u = _u		+ ['I44_Car_B_WillysAB_Army'];
_u = _u		+ ['I44_Car_A_WillysMB_Closed_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Open2_Army'];
_u = _u		+ ['I44_Truck_A_GMC_CCKW_Open_Army'];
_u = _u		+ ['I44_Car_B_WillysAB_VGO_Army'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u  		= ['I44_Tank_A_M3A3_Stuart_Army'];
_u = _u		+ ['I44_Tank_A_M5A1_Stuart_Army'];
_u = _u		+ ['I44_Tank_B_ShermanIV_Army'];
_u = _u		+ ['I44_Veh_A_Army_M4A3_Sherman_Army'];
_u = _u		+ ['I44_Veh_B_Army_MKIV_Churchill'];
_u = _u		+ ['I44_Tank_B_Cromwell_Army'];
_u = _u		+ ['I44_Veh_A_Army_M4A3_76_Sherman_Army'];
_u = _u		+ ['I44_Veh_A_Army_M4A3_Wading_Sherman_Army'];
_u = _u		+ ['I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army'];
_u = _u		+ ['I44_Tank_B_ShermanVC_Army'];
_u = _u		+ ['I44_Tank_B_Army_UC'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u  		= ['I44_Plane_A_C47A_AAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
_u = _u		+ ['I44_Plane_A_P51D_HVAR_AAF'];
_u = _u		+ ['I44_Plane_A_P38_M64_AAF'];
_u = _u		+ ['I44_P47A'];
_u = _u		+ ['I44_Plane_A_B17_AAF'];
_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
_u = _u		+ ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];


missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u  		= ['I44_Plane_A_C47A_AAF'];
_u = _u		+ ['I44_Plane_B_HHmkIIa_HVAR_RAF'];
_u = _u		+ ['I44_Plane_A_P51D_HVAR_AAF'];
_u = _u		+ ['I44_Plane_A_P38_M64_AAF'];
_u = _u		+ ['I44_P47A'];
_u = _u		+ ['I44_Plane_A_B17_AAF'];
_u = _u		+ ['I44_Plane_B_SpitfireMk1a_M64_RAF'];
_u = _u		+ ['I44_Plane_B_TyphoonMk1A_RP3_RAF'];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ["MMT_USMC"];
_u = _u		+ ["Old_moto_TK_Civ_EP1"];
_u = _u		+ ["Lada1_TK_CIV_EP1"];
_u = _u		+ ["SkodaBlue"];
_u = _u		+ ["car_sedan"];
_u = _u		+ ["car_hatchback"];
_u = _u		+ ["Volha_1_TK_CIV_EP1"];
_u = _u		+ ["datsun1_civil_1_open"];
_u = _u		+ ["datsun1_civil_3_open"];
_u = _u		+ ["hilux1_civil_1_open"];
_u = _u		+ ["LandRover_TK_CIV_EP1"];
_u = _u		+ ["Ikarus"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_WESTSOLDIER"];
	_u = _u		+ ['I44_Man_A_Army_Medic'];
	_u = _u		+ ['BAF_Soldier_EN_W'];
	_u = _u		+ ['I44_Man_A_Army_M1A1Bazooka'];
    _u = _u		+ ['I44_Man_A_Army_M1919A4'];
_u = _u		+ ["UralCivil"];
_u = _u		+ ["V3S_Refuel_TK_GUE_EP1"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};