/*
	Script: Skill Application System by Benny.
	Description: Skill Application.
*/

Private ["_unit"];

_unit = _this;

if ('Engineer' in WFBE_SK_V_Type) then {
	/* Repair Ability */
	_unit addAction [
		("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),
		(WFBE_SK_V_Root + 'Engineer' + '.sqf'), 
		[], 
		80, 
		false, 
		true, 
		"", 
		"time - WFBE_SK_V_LastUse_Repair > WFBE_SK_V_Reload_Repair"
	];
};

if ('Officer' in WFBE_SK_V_Type) then {
	/* MASH Ability require that the MASH parameter is enabled */
	if ((missionNamespace getVariable "WFBE_C_RESPAWN_MASH") > 0) then {
		/* MASH Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_DeployMASH'+ "</t>"),
			(WFBE_SK_V_Root + 'Officer' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"time - WFBE_SK_V_LastUse_MASH > WFBE_SK_V_Reload_MASH"
		];
	};
};

if ('SpecOps' in WFBE_SK_V_Type) then {
	/* Lockpicking Ability */
	_unit addAction [
		("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),
		(WFBE_SK_V_Root + 'SpecOps' + '.sqf'), 
		[], 
		80, 
		false, 
		true, 
		"", 
		"time - WFBE_SK_V_LastUse_Lockpick > WFBE_SK_V_Reload_Lockpick"
	];
};

if ('Spotter' in WFBE_SK_V_Type) then {
	/* Spotting Ability */
	_unit addAction [
		("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),
		(WFBE_SK_V_Root + 'Sniper' + '.sqf'), 
		[], 
		80, 
		false, 
		true, 
		"", 
		"time - WFBE_SK_V_LastUse_Spot > WFBE_SK_V_Reload_Spot"
	];
	/* Lockpicking Ability */
	_unit addAction [
		("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),
		(WFBE_SK_V_Root + 'SpecOps' + '.sqf'), 
		[], 
		79, 
		false, 
		true, 
		"", 
		"time - WFBE_SK_V_LastUse_Lockpick > WFBE_SK_V_Reload_Lockpick"
	];
};

if ('Saboteur' in WFBE_SK_V_Type) then {
	/* Lockpicking Ability */
	_unit addAction [
		("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Satchel'+ "</t>"),
		(WFBE_SK_V_Root + 'Saboteur' + '.sqf'), 
		[], 
		78, 
		false, 
		true, 
		"", 
		"time - WFBE_SK_V_LastUse_SuperSatchel > WFBE_SK_V_Reload_SuperSatchel && {_x == 'PipeBomb'} count magazines player > 1"
	];
	
	_unit = player addAction [
		("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Satchel_Detonate'+ "</t>"),
		(WFBE_SK_V_Root + 'Saboteur_TouchOff' + '.sqf'), 
		[], 
		78, 
		false, 
		true, 
		"", 
		"!isNil 'WFBE_SK_V_SaboteurSatchel' && player distance WFBE_SK_V_SaboteurSatchel < 700"
	];
};