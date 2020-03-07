Private ['_aiTeamTemplateRequires','_aiTeamTemplateName','_aiTeamTemplates','_aiTeamTypes','_aiTeamUpgrades','_side','_u'];

_side = _this;

//--- Overall Dump.
//_return = ["West", "USMC", ["USMC_MQ9Squadron","USMC_FRTeam_Razor"]] Call Compile preprocessFile "Common\Config\Core_Squads\Squads_GetFactionGroups.sqf";
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

_u		= ["I44_Man_A_Army_DDay_CO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_DDay_M1903A3_M1"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_DDay_M1918A2"];
_u = _u + ["I44_Man_A_Army_DDay_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1Garand"];
_u = _u + ["I44_Man_A_Army_DDay_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_DDay_Engr_M2_2"];
_u = _u + ["I44_Man_A_Army_DDay_Medic"];
_u = _u + ["I44_Man_A_Army_DDay_RTO_M1Carbine"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - US Army"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_A_Army_Ranger_CO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_Ranger_M1919A4"];
_u = _u + ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Ranger_M1918A2"];
_u = _u + ["I44_Man_A_Army_Ranger_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_Ranger_RTO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_M3Greasegun"];
_u = _u + ["I44_Man_A_Army_Ranger_Engr_M2_2"];
_u = _u + ["I44_Man_A_Army_Ranger_RTO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_Medic"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - US Army Ranger"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,0,0,0]];


_u		= ["I44_Man_B_Army_AB_CO_StenMk5"];
_u = _u + ["I44_Man_B_Army_AB_SMLENo4Mk1_No82"];
_u = _u + ["I44_Man_B_Army_AB_BrenMk1"];
_u = _u + ["I44_Man_B_Army_AB_PIAT"];
_u = _u + ["I44_Man_B_Army_AB_StenMk2"];
_u = _u + ["I44_Man_B_Army_AB_Sniper_SMLENo4Mk1T"];
_u = _u + ["I44_Man_B_Army_AB_Medic"];
_u = _u + ["I44_Man_B_Army_AB_NCO_SMLENo4Mk1"];
_u = _u + ["I44_Man_B_Army_AB_RTO"];
_u = _u + ["I44_Man_B_Army_AB_SMLENo4Mk1_No82"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - British Airborne"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[2,0,0,0]];


_u		= ["I44_Man_A_Army_AB_82_CO_M1A1Carbine"];
_u = _u + ["I44_Man_A_Army_AB_82_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_AB_82_M1919A6"];
_u = _u + ["I44_Man_A_Army_AB_82_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_AB_82_M1918A2"];
_u = _u + ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_AB_82_Medic"];
_u = _u + ["I44_Man_A_Army_AB_82_M1918A2"];
_u = _u + ["I44_Man_A_Army_AB_82_RTO_M1A1Carbine"];
_u = _u + ["I44_Man_A_Army_AB_82_M1918A2"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - US Airborne"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_B_Army_Commando_NCO_StenMk2S"];
_u = _u + ["I44_Man_B_Army_Commando_StenMk5"];
_u = _u + ["I44_Man_B_Army_Commando_BrenMk1"];
_u = _u + ["I44_Man_B_Army_Commando_PIAT"];
_u = _u + ["I44_Man_B_Army_Commando_DeLisle"];
_u = _u + ["I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T"];
_u = _u + ["I44_Man_B_Army_Commando_StenMk5"];
_u = _u + ["I44_Man_B_Army_Commando_StenMk2S"];
_u = _u + ["I44_Man_B_Army_Commando_RTO"];
_u = _u + ["I44_Man_B_Army_Commando_PIAT"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - British Commando"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_A_Army_DDay_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_B_Army_AB_BrenMk1"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Fire Team (MG)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_A_Army_AB_82_ATCrew_M3"];
_u = _u + ["I44_Man_A_Army_AB_82_M1A1Bazooka"];
_u = _u + ["I44_Man_B_Army_Commando_PIAT"];
_u = _u + ["I44_Man_A_Army_AB_82_M1A1Bazooka"];
_u = _u + ["I44_Man_B_Army_Commando_PIAT"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Infantry Section (AT)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T"];
_u = _u + ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_B_Army_Commando_Sniper_SMLENo4Mk1T"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Infantry - Snipers Team"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,false]];
_aiTeamTypes = _aiTeamTypes + [0];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_Man_A_Army_DDay_CO_M1Carbine"];
_u = _u + ["I44_Truck_A_GMC_CCKW_Army"];
_u = _u + ["I44_Man_A_Army_DDay_M1903A3_M1"];
_u = _u + ["I44_Man_A_Army_DDay_M1919A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_DDay_M1918A2"];
_u = _u + ["I44_Man_A_Army_DDay_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_DDay_M1Garand"];
_u = _u + ["I44_Man_A_Army_DDay_NCO_M1A1Thompson"];
_u = _u + ["I44_Man_A_Army_DDay_Engr_M2_2"];
_u = _u + ["I44_Man_A_Army_DDay_Medic"];
_u = _u + ["I44_Man_A_Army_DDay_RTO_M1Carbine"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized US Army - (Truck)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,0]];


_u		= ["I44_Man_A_Army_Ranger_CO_M1Carbine"];
_u = _u + ["I44_HT_A_M3A1_Army"];
_u = _u + ["I44_Man_A_Army_Ranger_M1919A4"];
_u = _u + ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Ranger_M1918A2"];
_u = _u + ["I44_Man_A_Army_Ranger_M1903A3_M1"];
_u = _u + ["I44_Man_A_Army_Ranger_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_Ranger_M3Greasegun"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand_M7"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Mechanized Infantry - M3A1 Halftruck"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[1,2,0,0]];


_u		= ["I44_Man_B_Army_AB_NCO_StenMk5"];
_u = _u + ["I44_Tank_B_Army_UC"];
_u = _u + ["I44_Man_B_Army_AB_BrenMk1"];
_u = _u + ["I44_Man_B_Army_AB_PIAT"];
_u = _u + ["I44_Man_B_Army_AB_Sniper_SMLENo4Mk1T"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized Infantry British Airborne - Bren Carrier"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[2,1,0,0]];


_u		= ["I44_Man_A_Army_AB_82_CO_M1A1Carbine"];
_u = _u + ["I44_ACar_A_M8_Greyhound_Army"];
_u = _u + ["I44_Man_A_Army_DDay_RTO_M1Carbine"];
_u = _u + ["I44_Man_A_Army_Ranger_M1918A2"];
_u = _u + ["I44_Man_A_Army_Ranger_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_Ranger_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_Ranger_M1919A4"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Mechanized Infantry - M8 Greyhound"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,3,0,0]];


_u		= ["I44_ACar_A_M8_Greyhound_Army"];
_u = _u + ["I44_Tank_A_M3A3_Stuart_Army"];
_u = _u + ["I44_ACar_A_M8_Greyhound_Army"];
_u = _u + ["I44_HT_A_M3A1_Army"];
_u = _u + ["I44_Tank_A_M3A3_Stuart_Army"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Light Vehicle (M8 Greyhound + M3A3 Stuart + M3A1 Halftruck)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,true,true,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,3,0,0]];


_u		= ["Ural_ZU23_CDF"];
_u = _u + ["Ural_ZU23_CDF"];
_u = _u + ["Ural_ZU23_CDF"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Motorized - Anti Air Section"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,true,false,false]];
_aiTeamTypes = _aiTeamTypes + [1];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,3,0,0]];


_u		= ["I44_Tank_A_M5A1_Stuart_Army"];
_u = _u + ["I44_Tank_B_Cromwell_Army"];
_u = _u + ["I44_Veh_A_Army_M4A3_Sherman_Army"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank Light (M5A1 Stuart + Cromwell + M4A3 Sherman)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,2,0]];


_u		= ["I44_Tank_A_M4A3E8_76_HVSS_Sherman_Army"];
_u = _u + ["I44_Tank_B_ShermanVC_Army"];
_u = _u + ["I44_Veh_B_Army_MKIV_Churchill"];
_u = _u + ["I44_Veh_A_Army_M4A3_76_Sherman_Army"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Armor - Tank Heavy (M4A3E8 Sherman + Sherman VC + Churchill + M4A3 76 Sherman)"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,true,false]];
_aiTeamTypes = _aiTeamTypes + [2];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,3,0]];


_u		= ["I44_Plane_A_C47A_AAF"];
_u = _u + ["I44_Man_A_Army_AB_82_CO_M1A1Carbine"];
_u = _u + ["I44_Man_A_Army_AB_82_M1Garand_M7"];
_u = _u + ["I44_Man_A_Army_AB_82_M1919A6"];
_u = _u + ["I44_Man_A_Army_AB_82_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];
_u = _u + ["I44_Man_A_Army_AB_82_M1918A2"];
_u = _u + ["I44_Man_A_Army_AB_82_M1903A3_M1"];
_u = _u + ["I44_Man_A_Army_AB_82_M1918A2"];
_u = _u + ["I44_Man_A_Army_AB_82_M1A1Bazooka"];
_u = _u + ["I44_Man_A_Army_AB_82_RTO_M1A1Carbine"];
_u = _u + ["I44_Man_A_Army_AB_82_Sniper_M1903A4"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - C47A Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[true,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[3,0,0,0]];


_u		= ["I44_P47"];
_u = _u + ["I44_P47"];
_u = _u + ["I44_Plane_B_TyphoonMk1A_RP3_RAF"];
_u = _u + ["I44_Plane_B_TyphoonMk1A_RP3_RAF"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Fighter Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,2]];


_u		= ["I44_Plane_A_P38_M64_AAF"];
_u = _u + ["I44_Plane_A_P38_M64_AAF"];
_u = _u + ["I44_Plane_B_SpitfireMk1a_M57_RAF"];
_u = _u + ["I44_Plane_B_SpitfireMk1a_M57_RAF"];

_aiTeamTemplateName = _aiTeamTemplateName + ["Air - Bomber Squadron"];
_aiTeamTemplates = _aiTeamTemplates + [_u];
_aiTeamTemplateRequires = _aiTeamTemplateRequires + [[false,false,false,true]];
_aiTeamTypes = _aiTeamTypes + [3];
_aiTeamUpgrades = _aiTeamUpgrades + [[0,0,0,3]];

missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATES", _side], _aiTeamTemplates];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEREQUIRES", _side], _aiTeamTemplateRequires];
missionNamespace setVariable [Format["WFBE_%1AITEAMTYPES", _side], _aiTeamTypes];
missionNamespace setVariable [Format["WFBE_%1AITEAMUPGRADES", _side], _aiTeamUpgrades];
missionNamespace setVariable [Format["WFBE_%1AITEAMTEMPLATEDESCRIPTIONS", _side], _aiTeamTemplateName];