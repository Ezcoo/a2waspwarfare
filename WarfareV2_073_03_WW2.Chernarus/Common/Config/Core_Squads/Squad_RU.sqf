Private ['_aiTeamTemplateRequires','_aiTeamTemplateName','_aiTeamTemplates','_aiTeamTypes','_aiTeamUpgrades','_side','_u'];

_side = _this;

//--- Overall Dump.
//_return = ["East", "RU", ["RU_Pchela1TSquadron","RU_Ka52Squadron"]] Call Compile preprocessFile "Common\Config\Core_Squads\Squads_GetFactionGroups.sqf";
_aiTeamTemplates = [];
_aiTeamTemplateName = [];
_aiTeamTemplateRequires = [];
_aiTeamTypes = [];
_aiTeamUpgrades = [];

//--- Custom Groups.

/*_u	  = [];

_aiTeamTemplateName = _aiTeamTemplateName + ["*** Lone Wolf *** (AI don't buy anything)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [4];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];
*/
_u		= ["I44_Man_G_WH_CO_MP40"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_K98kZf41"];
_u = _u + ["I44_Man_G_WH_G43"];
_u = _u + ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_Engr_FmW35"];
_u = _u + ["I44_Man_G_WH_Medic"];
_u = _u + ["I44_Man_G_WH_RTO"];
_u = _u + ["I44_Man_G_WH_MG42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Wehrmacht"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_G_WH_CO_MP40"];
_u = _u + ["I44_Man_G_WH_Camo_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_Camo_MG34"];
_u = _u + ["I44_Man_G_WH_Camo_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_Camo_Sniper_K98kZf42"];
_u = _u + ["I44_Man_G_WH_Camo_RTO"];
_u = _u + ["I44_Man_G_WH_Camo_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_Camo_Engr_FmW35"];
_u = _u + ["I44_Man_G_WH_Camo_G43"];
_u = _u + ["I44_Man_G_WH_Camo_MG42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Wehrmacht Camo"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,0,0,0]];


_u		= ["I44_Man_G_SS_CO_MP40"];
_u = _u + ["I44_Man_G_SS_K98k_GGrGer"];
_u = _u + ["I44_Man_G_SS_MG42"];
_u = _u + ["I44_Man_G_SS_K98k_PzF100"];
_u = _u + ["I44_Man_G_SS_Sniper_G43Zf4"];
_u = _u + ["I44_Man_G_SS_Medic"];
_u = _u + ["I44_Man_G_SS_NCO_MP43"];
_u = _u + ["I44_Man_G_SS_Engr_FmW35"];
_u = _u + ["I44_Man_G_SS_RTO"];
_u = _u + ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_MG34"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Waffen-SS"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[2,0,0,0]];


_u		= ["I44_Man_G_WL_FJ_CO_MP40"];
_u = _u + ["I44_Man_G_WL_FJ_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WL_FJ_MG42"];
_u = _u + ["I44_Man_G_WL_FJ_RPzB54"];
_u = _u + ["I44_Man_G_WL_FJ_ATCrew_G43"];
_u = _u + ["I44_Man_G_WL_FJ_FG42_Zf4"];
_u = _u + ["I44_Man_G_WL_FJ_Medic"];
_u = _u + ["I44_Man_G_WL_FJ_RPzB54"];
_u = _u + ["I44_Man_G_WL_FJ_RTO"];
_u = _u + ["I44_Man_G_WL_FJ_FG42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Fallschirmjaeger"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_G_WH_Camo_ATCrew_G43"];
_u = _u + ["I44_Man_G_WH_Camo_RPzB54"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_Camo_RPzB54"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Infantry Section (AT)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_G_WH_Camo_NCO_K98k"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_Camo_MG42"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_Camo_MG42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Infantry Section (MG)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,0,0,0]];


_u		= ["I44_Man_G_WH_K98kZf41"];
_u = _u + ["I44_Man_G_WH_Camo_Sniper_K98kZf42"];
_u = _u + ["I44_Man_G_SS_Sniper_G43Zf4"];
_u = _u + ["I44_Man_G_WL_FJ_FG42_Zf4"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Snipers Team"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_G_WH_CO_MP40"];
_u = _u + ["I44_Truck_G_Kfz305_Open_WH"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_K98k_PzF100"];
_u = _u + ["I44_Man_G_WH_Engr_TMi42"];
_u = _u + ["I44_Man_G_WH_K98kZf41"];
_u = _u + ["I44_Man_G_WH_G43"];
_u = _u + ["I44_Man_G_WH_NCO_MP43"];
_u = _u + ["I44_Man_G_WH_Medic"];
_u = _u + ["I44_Man_G_WH_RTO"];
_u = _u + ["I44_Man_G_WH_MG42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized Wehrmacht - (Truck)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_G_WH_CO_MP40"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_u = _u + ["I44_motorcycle_G_BMWR75_S"];
_u = _u + ["I44_Man_G_WH_MG34"];
_u = _u + ["I44_Man_G_WH_RPzB54"];
_u = _u + ["I44_Man_G_WH_ATCrew_G43"];
_u = _u + ["I44_Man_G_WH_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WH_Sniper_K98kZf42"];
_u = _u + ["I44_Man_G_WH_MG42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized Wehrmacht - SdKfz251_1D + BMWR75_S"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,1,0,0]];


_u		= ["I44_Man_G_WH_Camo_MP43"];
_u = _u + ["I44_Tank_G_PzKpfwII_F_WH"];
_u = _u + ["I44_ACar_G_SdKfz222_WH"];
_u = _u + ["I44_Man_G_WH_Camo_MG42"];
_u = _u + ["I44_Man_G_WH_Camo_RPzB54"];
_u = _u + ["I44_Man_G_WH_Camo_Sniper_G43Zf4"];
_u = _u + ["I44_Man_G_WH_Camo_K98k_GGrGer"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Mechanized Wehrmacht camo - Panzer II F + SdKfz222"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,true,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,1,0,0]];


_u		= ["I44_Man_G_SS_MP43"];
_u = _u + ["I44_ACar_G_SdKfz234_1_WH"];
_u = _u + ["I44_Tank_G_PzKpfwIV_D_WH"];
_u = _u + ["I44_Man_G_SS_RPzB54"];
_u = _u + ["I44_Man_G_SS_MG42"];
_u = _u + ["I44_Man_G_SS_K98k_GGrGer"];
_u = _u + ["I44_Man_G_SS_Sniper_G43Zf4"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Mechanized Waffen-SS - SdKfz234_1 + Panzer IV D"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,true,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[2,2,0,0]];

_u		= ["I44_ACar_G_SdKfz234_3_WH"];
_u = _u + ["I44_HT_G_SdKfz251_22_WH"];
_u = _u + ["I44_ACar_G_SdKfz234_4_WH"];
_u = _u + ["I44_ACar_G_SdKfz234_2_WH"];
_u = _u + ["I44_ACar_G_SdKfz234_4_WH"];
_u = _u + ["I44_ACar_G_SdKfz234_1_WH"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Light Vehicle Support (SdKfz251+SdKfz234)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,3,0,0]];

_u		= ["Ural_ZU23_INS"];
_u = _u + ["Ural_ZU23_INS"];
_u = _u + ["Ural_ZU23_INS"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Anti Air Platoon"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,3,0,0]];

_u		= ["I44_Tank_G_JaPz38_T_WH"];
_u = _u + ["I44_Tank_G_StuGIII_G_Late_WH"];
_u = _u + ["I44_Tank_G_StuH42_G_WH"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank-Hunter Platoon"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,1,0]];

_u		= ["I44_Tank_G_PzKpfwIV_D_WH"];
_u = _u + ["I44_Tank_G_PzKpfwIV_G_WH"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank Platoon (Light)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,1,0]];


_u		= ["I44_Tank_G_PzKpfwVI_E_Late_AAMG_Camo_WH"];
_u = _u + ["I44_Tank_G_PzKpfwV_G_camo_WH"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank Platoon (Heavy)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,2,0]];


_u		= ["I44_Plane_G_Ju52_3mg5e_WL"];
_u = _u + ["I44_Man_G_WL_FJ_NCO_MP43"];
_u = _u + ["I44_Man_G_WL_FJ_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WL_FJ_MG42"];
_u = _u + ["I44_Man_G_WL_FJ_RPzB54"];
_u = _u + ["I44_Man_G_WL_FJ_FG42_Zf4"];
_u = _u + ["I44_Man_G_WL_FJ_FG42"];
_u = _u + ["I44_Man_G_WL_FJ_K98k_GGrGer"];
_u = _u + ["I44_Man_G_WL_FJ_FG42"];
_u = _u + ["I44_Man_G_WL_FJ_RPzB54"];
_u = _u + ["I44_Man_G_WL_FJ_RTO"];
_u = _u + ["I44_Man_G_WL_FJ_FG42_Zf4"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air Fallschirmjaeger - Ju52 Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Plane_G_Bf109G6_SC250_WL"];
_u = _u + ["I44_Plane_G_Bf109G6_SC250_WL"];
_u = _u + ["I44_Plane_G_Bf109F2_SC50_WL"];
_u = _u + ["I44_Plane_G_Bf109F2_SC50_WL"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Fighter Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,2]];


_u		= ["I44_Plane_G_Me262A_WL"];
_u = _u + ["I44_Plane_G_Me262A_WL"];
_u = _u + ["I44_Plane_G_Ju87_SC50_WL"];
_u = _u + ["I44_Plane_G_Ju87_SC50_WL"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Bomber Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,3]];

/*if !(paramRestrictionKamov) then {
	_u		= ["Ka52Black"];
	_u = _u + ["Ka52"];

	_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Ka-52 Squadron"];
	_aiTeamTemplates = _aiTeamTemplates + [_u];
	_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
	_aiTeamTypes = _aiTeamTypes + [3];
	_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,3]];
};
*/
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATES", _side], _aiTeamTemplates];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEREQUIRES", _side], _aiTeamTemplateRequires];
missionNamespace setVariable [Format["WFBE_%1AITEAMTYPES", _side], _aiTeamTypes];
missionNamespace setVariable [Format["WFBE_%1AITEAMUPGRADES", _side], _aiTeamUpgrades];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEDESCRIPTIONS", _side], _aiTeamTemplateName];