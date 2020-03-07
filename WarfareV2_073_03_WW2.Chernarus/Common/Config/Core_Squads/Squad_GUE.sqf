Private ['_aiTeamTemplateRequires','_aiTeamTemplateName','_aiTeamTemplates','_aiTeamTypes','_aiTeamUpgrades','_side','_u'];

_side = _this;

//--- Overall Dump.
//_return = ["Guerrila", "GUE"] Call Compile preprocessFile "Common\Config\Core_Squads\Squads_GetFactionGroups.sqf";
_aiTeamTemplates = [];
_aiTeamTemplateName = [];
_aiTeamTemplateRequires = [];
_aiTeamTypes = [];
_aiTeamUpgrades = [];

//--- Custom Groups.

_u		= ["I44_Man_R_F_LeeEnfieldNo4Mk1"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["Ins_Bardak"];
_u = _u + ["I44_Man_R_F_StenMk2"];
_u = _u + ["I44_Man_R_F_Sniper_K98kZf42"];
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_P38"];
_u = _u + ["I44_Man_R_F_Doctor"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - GUE"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["GUE_Woodlander2"];
_u = _u + ["I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T"];
_u = _u + ["GUE_Villager3"];
_u = _u + ["I44_Man_R_F_Sniper_K98kZf42"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Sniper Team"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,0,0,0]];


_u		= ["Ins_Bardak"];
_u = _u + ["I44_Man_R_F_Doctor"];
_u = _u + ["Ins_Bardak"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Infantry Section (AT)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_R_F_WebleyMk6"];
_u = _u + ["V3S_GUE"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];
_u = _u + ["Ins_Bardak"];
_u = _u + ["I44_Man_R_F_K98k"];
_u = _u + ["I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T"];
_u = _u + ["I44_Man_R_F_Doctor"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["Ins_Bardak"];
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_P38"];
_u = _u + ["I44_Man_R_F_StenMk2"];
_u = _u + ["I44_Man_R_F_Engr_TNT"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized - (Truck)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_R_F_CO_P08"];
_u = _u + ["I44_Car_A_WillysMB_M1919_Army"];
_u = _u + ["I44_Car_B_WillysAB_VGO_Army"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["Ins_Bardak"];
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_Engr_GrenadeNo75"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized - Jeep MG"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_R_F_Doctor"];
_u = _u + ["I44_HT_G_SdKfz251_1D_WH"];
_u = _u + ["BTR40_MG_TK_GUE_EP1"];
_u = _u + ["I44_Man_R_F_BrenMk1"];
_u = _u + ["Ins_Bardak"];
_u = _u + ["I44_Man_R_F_P38"];
_u = _u + ["I44_Man_R_F_M37Ithaca"];
_u = _u + ["I44_Man_R_F_Sniper_K98kZf42"];
_u = _u + ["I44_Man_R_F_BrenMk1"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized - SdKfz251_1D + BTR40_MG"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,1,0,0]];


_u		= ["Ural_ZU23_Gue"];
_u = _u + ["Ural_ZU23_Gue"];
_u = _u + ["Ural_ZU23_Gue"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Anti Air Platoon"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,3,0,0]];


_u		= ["T34"];
_u = _u + ["T34"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank Platoon (T34)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,2,0]];


_u		= ["I44_Plane_B_HHmkIIa_HVAR_RAF"];
_u = _u + ["I44_Plane_B_HHmkIIa_M57_RAF"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Fighter Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,3]];

missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATES", _side], _aiTeamTemplates];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEREQUIRES", _side], _aiTeamTemplateRequires];
missionNamespace setVariable [Format["WFBE_%1AITEAMTYPES", _side], _aiTeamTypes];
missionNamespace setVariable [Format["WFBE_%1AITEAMUPGRADES", _side], _aiTeamUpgrades];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEDESCRIPTIONS", _side], _aiTeamTemplateName];