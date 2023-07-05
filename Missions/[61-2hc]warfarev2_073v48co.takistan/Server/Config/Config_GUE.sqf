Private ['_resTeamCost','_resTeamTemplates','_resTeamTemplateRequires','_resTeamTypes','_d','_f','_get','_p','_u'];
/* RES TEAM TEMPLATES */
/* GUE*/
_resTeamTemplates = [];
_resTeamTemplateRequires = [];
_resTeamTypes = []; //--- 0 Inf, 2 Light, 3 Armor, 4 Air
_resTeamCost = [];

_d		= ["Infantry - Infantry Squad"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_u = _u + ["TK_GUE_Soldier_EP1"];
_u = _u + ["TK_GUE_Soldier_Sniper_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_AAT_EP1"];
_f 		= [true,false,false,false];
_p 		= 0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u;

_resTeamTemplates = _resTeamTemplates + [_u];
_resTeamTemplateRequires = _resTeamTemplateRequires + [_f];
_resTeamTypes = _resTeamTypes + [0];
_resTeamCost = _resTeamCost + [_p];

_d		= ["Infantry - Rifle Squad"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_2_EP1"];
_u = _u + ["TK_GUE_Soldier_2_EP1"];
_u = _u + ["TK_GUE_Soldier_Sniper_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_AAT_EP1"];
_f 		= [true,false,false,false];
_p 		= 0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u;

_resTeamTemplates = _resTeamTemplates + [_u];
_resTeamTemplateRequires = _resTeamTemplateRequires + [_f];
_resTeamTypes = _resTeamTypes + [0];
_resTeamCost = _resTeamCost + [_p];

_d		= ["Infantry - Rifle Squad"];
_u		= ["TK_GUE_Warlord_EP1"];
_u = _u + ["TK_GUE_Soldier_AR_EP1"];
_u = _u + ["TK_GUE_Soldier_3_EP1"];
_u = _u + ["TK_GUE_Soldier_3_EP1"];
_u = _u + ["TK_GUE_Soldier_Sniper_EP1"];
_u = _u + ["TK_GUE_Soldier_HAT_EP1"];
_u = _u + ["TK_GUE_Soldier_AT_EP1"];
_u = _u + ["TK_GUE_Soldier_AAT_EP1"];
_f 		= [true,false,false,false];
_p 		= 0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u;

_resTeamTemplates = _resTeamTemplates + [_u];
_resTeamTemplateRequires = _resTeamTemplateRequires + [_f];
_resTeamTypes = _resTeamTypes + [0];
_resTeamCost = _resTeamCost + [_p];

_d		= ["Infantry - Weapon Squad"];
_u		= ["Soldier_TL_PMC"];
_u = _u + ["Soldier_AT_PMC"];
_u = _u + ["Soldier_Bodyguard_M4_PMC"];
_u = _u + ["Soldier_AT_PMC"];
_u = _u + ["Soldier_Bodyguard_M4_PMC"];
_u = _u + ["Soldier_AT_PMC"];
_u = _u + ["Soldier_MG_PMC"];
_u = _u + ["Soldier_AA_PMC"];
_f 		= [true,false,false,false];
_p 		= 0;
{_get = missionNamespace getVariable _x;if (!isNil '_get') then {_p = _p + (_get select QUERYUNITPRICE)}} forEach _u;

_resTeamTemplates = _resTeamTemplates + [_u];
_resTeamTemplateRequires = _resTeamTemplateRequires + [_f];
_resTeamTypes = _resTeamTypes + [0];
_resTeamCost = _resTeamCost + [_p];

missionNamespace setVariable ['WFBE_GUERRESTEAMTEMPLATES',_resTeamTemplates];
missionNamespace setVariable ['WFBE_GUERRESTEAMTEMPLATEREQUIRES',_resTeamTemplateRequires];
missionNamespace setVariable ['WFBE_GUERRESTEAMTYPES',_resTeamTypes];
missionNamespace setVariable ['WFBE_GUERRESTEAMCOST',_resTeamCost];

missionNamespace setVariable ['WFBE_GUERRESCREW','GUE_Soldier_Crew'];
missionNamespace setVariable ['WFBE_GUERRESSOLDIER','GUE_Soldier_1'];
missionNamespace setVariable ['WFBE_GUERRESPILOT','GUE_Soldier_Pilot'];