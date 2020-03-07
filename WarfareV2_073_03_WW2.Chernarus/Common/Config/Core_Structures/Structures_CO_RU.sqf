Private ['_c','_count','_d','_dir','_dis','_n','_s','_side','_t','_v'];

_side = _this;

/* Root Definition */
_MHQ = "I44_HT_G_SdKfz251_1D_WH";
_HQ = "BTR90_HQ_unfolded";
_BAR = "RU_WarfareBBarracks";
_LVF = "RU_WarfareBLightFactory";
_CC = "RU_WarfareBUAVterminal";
_HEAVY = "RU_WarfareBHeavyFactory";
_AIR = "RU_WarfareBAircraftFactory";
_SP = "RU_WarfareBVehicleServicePoint";
_AAR = "RU_WarfareBAntiAirRadar";

/* Mash used after being deployed */
missionNamespace setVariable [Format["WFBE_%1FARP", _side], 'CampEast'];

/* Construction Crates */
missionNamespace setVariable [Format["WFBE_%1CONSTRUCTIONSITE", _side], 'RU_WarfareBContructionSite'];

/* Structures */
_v			= ["Headquarters"];
_n			= [_HQ];
_d			= [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c			= [missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_COST_DEPLOY"];
_t			= [if (WF_Debug) then {1} else {30}];
_s			= ["HQSite"];
_dis		= [15];
_dir		= [0];

_v = _v		+ ["Barracks"];
_n = _n		+ [_BAR];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [200];
_t = _t		+ [if (WF_Debug) then {1} else {70}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [18];
_dir = _dir	+ [90];

_v = _v		+ ["Light"];
_n = _n		+ [_LVF];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [600];
_t = _t		+ [if (WF_Debug) then {1} else {90}];
_s = _s		+ ["MediumSite"];
_dis = _dis	+ [25];
_dir = _dir	+ [90];

_v = _v		+ ["CommandCenter"];
_n = _n		+ [_CC];
_d = _d		+ [localize "STR_WF_CommandCenter"];
_c = _c		+ [1200];
_t = _t		+ [if (WF_Debug) then {1} else {110}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [20];
_dir = _dir	+ [90];

_v = _v		+ ["Heavy"];
_n = _n		+ [_HEAVY];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [2800];
_t = _t		+ [if (WF_Debug) then {1} else {130}];
_s = _s		+ ["MediumSite"];
_dis = _dis	+ [25];
_dir = _dir	+ [90];

_v = _v		+ ["Aircraft"];
_n = _n		+ [_AIR];
_d = _d		+ [localize "STR_WF_AircraftFactory"];
_c = _c		+ [4400];
_t = _t		+ [if (WF_Debug) then {1} else {150}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [31];
_dir = _dir	+ [90];

_v = _v		+ ["ServicePoint"];
_n = _n		+ [_SP];
_d = _d		+ [localize "STR_WF_MAIN_ServicePoint"];
_c = _c		+ [700];
_t = _t		+ [if (WF_Debug) then {1} else {70}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [21];
_dir = _dir	+ [90];

if ((missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR") > 0) then {
	_v = _v		+ ["AARadar"];
	_n = _n		+ [_AAR];
	_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
	_c = _c		+ [3200];
	_t = _t		+ [if (WF_Debug) then {1} else {280}];
	_s = _s		+ ["MediumSite"];
	_dis = _dis	+ [21];
	_dir = _dir	+ [90];
};

for [{_count = count _v - 1},{_count >= 0},{_count = _count - 1}] do {
	missionNamespace setVariable [Format["WFBE_%1%2TYPE",_side,_v select _count],_count];
};

{
	missionNamespace setVariable [Format ["%1%2",_side, _x select 0], _x select 1];
} forEach [["HQ",_HQ],["BAR",_BAR],["LVF",_LVF],["CC",_CC],["HEAVY",_HEAVY],["SP",_SP],["AAR",_AAR]];

missionNamespace setVariable [Format["WFBE_%1MHQNAME", _side], _MHQ];
missionNamespace setVariable [Format["WFBE_%1STRUCTURES", _side], _v];
missionNamespace setVariable [Format["WFBE_%1STRUCTURENAMES", _side], _n];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDESCRIPTIONS", _side], _d];
missionNamespace setVariable [Format["WFBE_%1STRUCTURECOSTS", _side], _c];
missionNamespace setVariable [Format["WFBE_%1STRUCTURETIMES", _side], _t];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDISTANCES", _side], _dis];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDIRECTIONS", _side], _dir];
missionNamespace setVariable [Format["WFBE_%1STRUCTURESCRIPTS", _side], _s];

/* Defenses */
	_n 			= ["I44_GunMG_G_MG42_Bipod_WH"];
	_n = _n		+ ["I44_GunMG_G_MG42_Tripod_WH"];
	_n = _n		+ ["I44_GunMG_G_MG42_Tripod_Zf40_WH"];
	_n = _n		+ ["I44_GunMG_G_MG42_Nest_WH"];
	_n = _n		+ ["ZU23_Ins"];
	_n = _n		+ ["I44_GunAA_G_FlaK38_WL"];
	_n = _n		+ ["I44_GunBunker_G_FlaK36_R272_WH"];
	_n = _n		+ ["I44_GunBunker_G_PaK40_R67R_WH"];
	_n = _n		+ ["I44_GunBunker_G_PaK40_R67L_WH"];
	_n = _n		+ ["I44_GunAA_G_FlaK36_Pintle_AT_WL"];
	_n = _n		+ ["I44_GunAA_G_FlaK36_Pintle_WL"];
	_n = _n		+ ["I44_GunAT_G_PaK40_Pintle_WH"];
	_n = _n		+ ["I44_GunAT_G_PaK40_WH"];
	_n = _n		+ ["I44_Gun_G_leFH18_WH"];
	_n = _n		+ ["I44_GunMortar_G_GrW34_WH"];
	_n = _n		+ ["I44_Gun_G_NbW41_WH"];
	_n = _n		+ ["SearchLight_RUS"];
	//_n = _n		+ ["I44_GunAA_G_FlaKvierling38_WL"];
	_n = _n		+ ["I44_trench_line"];
	_n = _n		+ ["I44_trench_line_wire"];
	_n = _n		+ ["MASH"];
	_n = _n		+ ["Land_Ind_SawMillPen"];
	_n = _n		+ ["Land_fort_bagfence_long"];
	_n = _n		+ ["Land_fort_bagfence_corner"];
	_n = _n		+ ["Land_fort_bagfence_round"];
	_n = _n		+ ["Land_fortified_nest_small"];
	_n = _n		+ ["Land_fortified_nest_big"];
	_n = _n		+ ["Land_Fort_Watchtower"];
	_n = _n		+ ["Land_fort_rampart"];
	_n = _n		+ ["Land_fort_artillery_nest"];
	_n = _n		+ ["Hhedgehog_concreteBig"];
	_n = _n		+ ["Hedgehog"];
	_n = _n		+ ["Land_CamoNet_EAST"];
	_n = _n		+ ["Land_CamoNetVar_EAST"];
	_n = _n		+ ["Land_CamoNetB_EAST"];
	_n = _n		+ ["Sign_Danger"];
	_n = _n		+ ["Fort_RazorWire"];
	_n = _n		+ ["Land_Ind_IlluminantTower"];
	// _n = _n		+ ["Concrete_Wall_EP1"];
	_n = _n		+ ["Land_Wall_L3_5m_EP1"];
	_n = _n		+ ["Land_Campfire"];
	_n = _n		+ ["I44_AmmoBox_G_MP"];

/* Class used for AI, AI will attempt to build those */
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MG", _side], ['I44_GunMG_G_MG42_Nest_WH']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_GL", _side], ['I44_GunMG_G_MG42_Tripod_Zf40_WH']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_AAPOD", _side], ['ZU23_Ins']];
//missionNamespace setVariable [Format["WFBE_%1DEFENSES_AAPOD", _side], ['I44_GunAA_G_FlaKvierling38_WL']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_ATPOD", _side], ['I44_GunAT_G_PaK40_WH']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_CANNON", _side], ['I44_GunAA_G_FlaK36_Pintle_AT_WL']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MASH", _side], ['MASH_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MORTAR", _side], ['I44_GunMortar_G_GrW34_WH']];

missionNamespace setVariable [Format["WFBE_%1DEFENSENAMES", _side], _n];