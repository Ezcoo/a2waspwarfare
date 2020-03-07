/*
	Script: Skill System by Benny.
	Description: Skill Initialization.
*/

/* Skills Root */
WFBE_SK_V_Root = 'Client\Module\Skill\Skill_';

/* Functions */
WFBE_SK_FNC_Apply = Compile preprocessFile "Client\Module\Skill\Skill_Apply.sqf";

/* Define which classname belong to which skill group */
WFBE_SK_V_Engineers = ['I44_Man_G_WH_Camo_Engr_Rohrladung','I44_Man_A_Army_DDay_Engr_M1A1Bangalore','I44_Man_G_SS_Engr_Rohrladung_Winter','I44_Man_A_Army_AB_Engr_M1A1Bangalore_Winter','I44_Man_R_F_Engr_GrenadeNo75'];
WFBE_SK_V_Officers = ['I44_Man_G_WH_Camo_CO_MP40','I44_Man_A_Army_AB_CO_M1A1Carbine','I44_Man_G_SS_CO_MP40_Winter','I44_Man_A_Army_AB_CO_M1A1Carbine_Winter','I44_Man_R_F_CO_P08'];
WFBE_SK_V_Soldiers = ['I44_Man_G_WH_Camo_K98k_GGrGer','I44_Man_A_Army_AB_M1Garand_M7','I44_Man_A_Army_AB_M1Garand_M7_Winter','I44_Man_G_SS_K98k_GGrGer_Winter','I44_Man_R_F_K98k'];
WFBE_SK_V_SpecsOps = ['I44_Man_G_WH_Camo_NCO_K98k','I44_Man_A_Army_Ranger_NCO_M1Carbine','I44_Man_G_SS_NCO_K98k_Winter','I44_Man_A_Army_AB_NCO_M1A1Carbine_Winter','I44_Man_R_F_StenMk5'];
WFBE_SK_V_Spotters = ['I44_Man_G_WH_Camo_Sniper_K98kZf42','I44_Man_A_Army_AB_Sniper_M1903A4','I44_Man_G_SS_Sniper_G43Zf4_Winter','I44_Man_A_Army_AB_Sniper_M1903A4_Winter','I44_Man_R_F_Sniper_LeeEnfieldNo4Mk1_T'];
WFBE_SK_V_Saboteur = ['I44_Man_G_WL_FJ_SprB24','I44_Man_B_Army_AB_Sapper_M37','I44_Man_G_WL_FJ_SprB24_Winter','I44_Man_B_Army_Commando_Sapper_M37_winter','I44_Man_R_F_Engr_TNT'];

//--- Binoculars.
missionNamespace setVariable ["WFBE_BINOCULARS", ["I44_Binocular_TypeEE", "I44_Binocular_M3"]];

/* Skills Variables */
WFBE_SK_V_LastUse_Repair = -1200;
WFBE_SK_V_LastUse_MASH = -1200;
WFBE_SK_V_LastUse_Lockpick = -1200;
WFBE_SK_V_LastUse_Spot = -1200;
WFBE_SK_V_LastUse_SuperSatchel = -1200;

/* Skills Timeout */
WFBE_SK_V_Reload_Repair = 65;
WFBE_SK_V_Reload_MASH = 600;
WFBE_SK_V_Reload_Lockpick = 25;
WFBE_SK_V_Reload_Spot = 8;
WFBE_SK_V_Reload_SuperSatchel = 180;

/* Find the player type */
WFBE_SK_V_Type = [];
if (playerType in WFBE_SK_V_Engineers) then {WFBE_SK_V_Type = WFBE_SK_V_Type + ["Engineer"]};
if (playerType in WFBE_SK_V_Officers) then {WFBE_SK_V_Type = WFBE_SK_V_Type + ["Officer"]};
if (playerType in WFBE_SK_V_Soldiers) then {WFBE_SK_V_Type = WFBE_SK_V_Type + ["Soldier"]};
if (playerType in WFBE_SK_V_SpecsOps) then {WFBE_SK_V_Type = WFBE_SK_V_Type + ["SpecOps"]};
if (playerType in WFBE_SK_V_Spotters) then {WFBE_SK_V_Type = WFBE_SK_V_Type + ["Spotter"]};
if (playerType in WFBE_SK_V_Saboteur) then {WFBE_SK_V_Type = WFBE_SK_V_Type + ["Saboteur"]};

/* Special one time init */
/* The soldier can hire more units than the others leader */
if ('Soldier' in WFBE_SK_V_Type) then {missionNamespace setVariable ['WFBE_C_PLAYERS_AI_MAX',(missionNamespace getVariable "WFBE_C_PLAYERS_AI_MAX") + (missionNamespace getVariable "WFBE_C_PLAYERS_SKILL_SOLDIER_UNITS_MAX")]};