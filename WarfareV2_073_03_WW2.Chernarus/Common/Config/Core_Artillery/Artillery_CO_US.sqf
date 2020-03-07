Private ["_side"];
_side = _this;

missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPLAY_NAME', _side], ['ML-3 Mortar 81mm','M1 Mortar 81mm','M2 Mortar 60mm']]; //--- Display Name to use in the GUI.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_WEAPONS', _side], ['I44_81L17_ML','I44_M1_81L15','I44_M2_60L12']]; //--- Weapon classname.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MIN', _side], [500,500,500]]; //--- Unit cannot fire if the target is within it's min range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MAX', _side], [5500,5500,5500]]; //--- Unit max firing range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_TIME_RELOAD', _side], [4,4,4]]; //--- Approximate time needed for unit to fire again.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_BURST', _side], [10,10,10]]; //--- Burst sent per fire mission.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_VELOCITIES', _side], [475,475,475]]; //--- Projectile fall velocity.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPERSIONS', _side], [60,60,60]]; //--- Accuracy of the shell upon landing.
//missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_LASER', _side], ['Sh_105_LASER']]; //--- LASER rounds
//missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_SADARM', _side], ['Sh_105_SADARM']]; //--- SADARM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_ILLUMN', _side], ['I44_S_81L17_IllumMk1','I44_S_81L15_M301','I44_S_60L12_M83A1']]; //--- ILLUM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DEPLOY_SMOKE', _side], ['I44_S_81L17_SmokeMk1','I44_S_81L15_M57FS']]; //--- Projectiles which deploys smoke

//--- Usable projectiles per artillery class.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMOS', _side], [
	['I44_S_81L17_HEMk6','I44_S_81L17_SmokeMk1','I44_S_81L17_IllumMk1'],
	['I44_S_81L15_M43A1','I44_S_81L15_M57FS','I44_S_81L15_M301'],
	['I44_S_60L12_M49A2','I44_S_60L12_M302','I44_S_60L12_M83A1']
]];

//--- Special projectiles used by artillery classes.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS', _side], [
	['I44_12rd_81L17_SmokeMk1','I44_12rd_81L17_IllumMk1'],
	['I44_12rd_81L15_M56','I44_12rd_81L15_M57','I44_12rd_81L15_M57FS','I44_12rd_81L15_M301'],
	['I44_12rd_60L12_M302','I44_LOAD_60L12_M302_M2','I44_LOAD_60L12_M83A1_M2']
]];

//--- Upgrade level required to use the special projectile.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [
	[1,1],
	[3,2,1,1],
	[2,1,1]
]];

//--- Artillery classnames, more than one of the same family may be used.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_CLASSNAMES', _side], [
	['I44_GunMortar_B_ML3in_Army'],
	['I44_GunMortar_A_M1_Army'],
	['I44_GunMortar_A_M2_Army']
]];