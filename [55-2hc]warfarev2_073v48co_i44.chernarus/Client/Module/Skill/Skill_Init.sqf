/*
	Script: Skill System by Benny.
	Description: Skill Initialization.
*/

/* Skills Root */
WFBE_SK_V_Root = 'Client\Module\Skill\Skill_';

/* Functions */
WFBE_SK_FNC_Apply = Compile preprocessFile "Client\Module\Skill\Skill_Apply.sqf";

/* Define which classname belong to which skill group */
WFBE_SK_V_Engineers = ['I44_Man_B_Army_Engr_GrenadeNo75']; // description="Engineer (Fast repair)";
WFBE_SK_V_Soldiers = ['I44_Man_B_Army_StenMk5','I44_Man_G_SS_CO_MP40']; // description="Soldier (Double team size, Camp restore)";
WFBE_SK_V_SpecsOps = ['I44_Man_B_Army_Sapper_M2']; // description="SpecOPS (Lockpick)";
WFBE_SK_V_Spotters = ['I44_Man_B_Army_Sniper_SMLENo4Mk1T'];//description="Sniper (Spot marks on map, Camps restore)";
WFBE_SK_V_Medics = ['I44_Man_B_Army_Medic']; // description="Medic (Fast heal, Camps restore)";

//--- Binoculars.
missionNamespace setVariable ["WFBE_BINOCULARS", ["I44_Binocular_M3"]];

/* Skills Variables */
WFBE_SK_V_LastUse_Repair = -1200;
WFBE_SK_V_LastUse_LR = -1200;
WFBE_SK_V_LastUse_MASH = -1200;
WFBE_SK_V_LastUse_Lockpick = -1200;
WFBE_SK_V_LastUse_Spot = -1200;

/* Skills Timeout */
WFBE_SK_V_Reload_Repair = 5;
WFBE_SK_V_Reload_LR = 300;
WFBE_SK_V_Reload_MASH = 600;
WFBE_SK_V_Reload_Lockpick = 5;
WFBE_SK_V_Reload_Spot = 8;


/* Find the player type */
WFBE_SK_V_Type = "";
if (playerType in WFBE_SK_V_Engineers) then {WFBE_SK_V_Type = "Engineer"};
if (playerType in WFBE_SK_V_Soldiers) then {WFBE_SK_V_Type = "Soldier"};
if (playerType in WFBE_SK_V_SpecsOps) then {WFBE_SK_V_Type = "SpecOps"};
if (playerType in WFBE_SK_V_Spotters) then {WFBE_SK_V_Type = "Spotter"};
if (playerType in WFBE_SK_V_Medics) then {WFBE_SK_V_Type = "Medic"};

/* Special one time init */
/* The soldier can hire more units than the others leader */
if (WFBE_SK_V_Type == 'Soldier') then {missionNamespace setVariable ['WFBE_C_PLAYERS_AI_MAX',ceil (1.5*(missionNamespace getVariable "WFBE_C_PLAYERS_AI_MAX"))]};