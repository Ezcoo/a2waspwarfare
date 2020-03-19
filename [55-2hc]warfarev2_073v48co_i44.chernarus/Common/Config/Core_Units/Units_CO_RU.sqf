Private ['_restriction_air','_side','_tiMode','_u'];

_side = _this;
_restriction_air = missionNamespace getVariable "WFBE_C_UNITS_RESTRICT_AIR";
_tiMode = missionNamespace getVariable "WFBE_C_GAMEPLAY_THERMAL_IMAGING";
_tiMode = if (_tiMode == 1 || _tiMode == 3) then {true} else {false};

//--- Russian Troops.
_u 			= ['RU_Soldier'];
_u = _u		+ ['RU_Soldier2'];
_u = _u		+ ['RU_Soldier_LAT'];
_u = _u		+ ['RU_Soldier_AT'];
_u = _u		+ ['RU_Soldier_HAT'];
_u = _u		+ ['RU_Soldier_AA'];
_u = _u		+ ['RU_Soldier_AR'];
_u = _u		+ ['RU_Soldier_MG'];
_u = _u		+ ['RU_Soldier_GL'];
_u = _u		+ ['RU_Soldier_Marksman'];
_u = _u		+ ['RU_Soldier_Spotter'];
_u = _u		+ ['RU_Soldier_Sniper'];
_u = _u		+ ['RU_Soldier_SniperH'];
_u = _u		+ ['RU_Soldier_Medic'];
_u = _u		+ ['RU_Soldier_TL'];
_u = _u		+ ['RU_Soldier_SL'];
_u = _u		+ ['RU_Soldier_Crew'];
_u = _u		+ ['RU_Soldier_Pilot'];
_u = _u		+ ['RUS_Soldier1'];
_u = _u		+ ['RUS_Soldier2'];
_u = _u		+ ['RUS_Soldier_GL'];
_u = _u		+ ['RUS_Soldier_Marksman'];
_u = _u		+ ['RUS_Soldier3'];
_u = _u		+ ['RUS_Soldier_TL'];
_u = _u		+ ['MVD_Soldier_GL'];
_u = _u		+ ['MVD_Soldier_MG'];
_u = _u		+ ['MVD_Soldier_Marksman'];
_u = _u		+ ['MVD_Soldier_AT'];
_u = _u		+ ['MVD_Soldier_Sniper'];
_u = _u		+ ['MVD_Soldier_TL'];
//--- Takistan Troops.
_u = _u		+ ['TK_Soldier_Engineer_EP1'];


missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['MMT_Civ'];
_u = _u		+ ['TT650_Ins'];
_u = _u		+ ['UAZ_Unarmed_TK_EP1'];
_u = _u		+ ['UAZ_RU'];
_u = _u		+ ['PBX'];
_u = _u		+ ['UAZ_MG_INS'];
_u = _u		+ ['UAZ_AGS30_RU'];
_u = _u		+ ['UAZ_SPG9_INS'];
_u = _u		+ ['LandRover_MG_TK_EP1'];
_u = _u		+ ['LandRover_SPG9_TK_EP1'];
_u = _u		+ ['SUV_TK_EP1'];
_u = _u		+ ["hilux1_civil_1_open"];
_u = _u		+ ["UralCivil"];
_u = _u		+ ['Kamaz'];
_u = _u		+ ['V3S_TK_EP1'];
_u = _u		+ ['V3S_Open_TK_EP1'];
_u = _u		+ ['BTR40_TK_INS_EP1'];
_u = _u		+ ['BTR40_MG_TK_INS_EP1'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['UralSupply_TK_EP1']};
_u = _u		+ ['KamazRepair'];
_u = _u		+ ['WarfareReammoTruck_RU'];
_u = _u		+ ['KamazRefuel'];
_u = _u		+ ['WarfareSalvageTruck_RU'];
if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_RU']};
_u = _u		+ ['M113Ambul_TK_EP1'];
_u = _u		+ ['GAZ_Vodnik_MedEvac'];
_u = _u		+ ['BRDM2_INS'];
_u = _u		+ ['BRDM2_ATGM_INS'];
_u = _u		+ ['GAZ_Vodnik'];
_u = _u		+ ['GAZ_Vodnik_HMG'];
_u = _u		+ ['BTR60_TK_EP1'];
_u = _u		+ ['Ural_ZU23_INS'];
_u = _u		+ ['BTR90'];
_u = _u		+ ['GRAD_RU'];

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['M113_TK_EP1'];
_u = _u		+ ['BMP2_INS'];
_u = _u		+ ['BMP3'];
_u = _u		+ ['ZSU_INS'];
_u = _u		+ ['T34_TK_EP1'];
_u = _u		+ ['T55_TK_EP1'];
_u = _u		+ ['T72_RU'];
_u = _u		+ ['T90'];
_u = _u		+ ['2S6M_Tunguska'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['I44_Plane_G_Bf109E4_WL'];
_u = _u		+ ['I44_Plane_G_Bf109F2_SC250_WL'];
_u = _u		+ ['I44_Plane_G_Bf109G6_SC250_WL'];
_u = _u		+ ['I44_Plane_G_Ju52_3mg5e_WL'];
_u = _u		+ ['I44_Plane_G_Ju87_SC250_WL'];
_u = _u		+ ['I44_Plane_G_Me262_WL'];
_u = _u		+ ['TI44_Plane_G_Me262A_WL'];

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['I44_Plane_G_Bf109E4_WL'];
_u = _u		+ ['I44_Plane_G_Bf109F2_SC250_WL'];
_u = _u		+ ['I44_Plane_G_Bf109G6_SC250_WL'];
_u = _u		+ ['I44_Plane_G_Ju52_3mg5e_WL'];
_u = _u		+ ['I44_Plane_G_Ju87_SC250_WL'];
_u = _u		+ ['I44_Plane_G_Me262_WL'];
_u = _u		+ ['TI44_Plane_G_Me262A_WL'];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ["MMT_Civ"];
_u = _u		+ ["Old_bike_TK_CIV_EP1"];
_u = _u		+ ["TT650_Civ"];
_u = _u		+ ["Tractor"];
_u = _u		+ ["Lada2_TK_CIV_EP1"];
_u = _u		+ ["SkodaRed"];
_u = _u		+ ["VolhaLimo_TK_CIV_EP1"];
_u = _u		+ ["Volha_2_TK_CIV_EP1"];
_u = _u		+ ["VWGolf"];
_u = _u		+ ["LandRover_TK_CIV_EP1"];
_u = _u		+ ["datsun1_civil_2_covered"];
_u = _u		+ ["hilux1_civil_2_covered"];
_u = _u		+ ["S1203_TK_CIV_EP1"];
_u = _u		+ ["Ikarus_TK_CIV_EP1"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_EASTSOLDIER"];
	_u = _u		+ ['RU_Soldier_Medic'];
	_u = _u		+ ['TK_Soldier_Engineer_EP1'];
	_u = _u		+ ['RU_Soldier_LAT'];
    _u = _u		+ ['Ins_Soldier_MG'];
	_u = _u		+ ['RU_Soldier_AA'];
_u = _u		+ ["UralCivil"];
_u = _u		+ ["V3S_Refuel_TK_GUE_EP1"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};