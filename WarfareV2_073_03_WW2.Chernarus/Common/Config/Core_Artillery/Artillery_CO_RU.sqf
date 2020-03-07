Private ["_side"];
_side = _this;

missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPLAY_NAME', _side], ['10,5 cm leFH 18','SdKfz251_1_IID 280mm','SdKfz251_2D 81mm Mortar','Mortar_GrW34 81mm','Nebelwerfer 150mm']]; //--- Display Name to use in the GUI.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_WEAPONS', _side], ['I44_105L28_leFH18','I44_RocketLauncher_Wurfrahmen40','I44_GrW34_81L14','I44_GrW34_81L14','I44_RocketLauncher_150mm_NbW41']]; //--- Weapon classname.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MIN', _side], [900,700,500,500,700]]; //--- Unit cannot fire if the target is within it's min range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_RANGES_MAX', _side], [9000,7000,5500,5500,7000]]; //--- Unit max firing range.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_TIME_RELOAD', _side], [7,2,4,4,2]]; //--- Approximate time needed for unit to fire again.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_BURST', _side], [10,6,10,10,6]]; //--- Burst sent per fire mission.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_VELOCITIES', _side], [500,550,475,475,550]]; //--- Projectile fall velocity.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DISPERSIONS', _side], [50,40,60,60,40]]; //--- Accuracy of the shell upon landing.
//missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_LASER', _side], ['Sh_122_LASER']]; //--- LASER rounds
//missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_SADARM', _side], ['Sh_122_SADARM']]; //--- SADARM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMO_ILLUMN', _side], ['I44_S_81L14_WFlgr']]; //--- ILLUM rounds
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_DEPLOY_SMOKE', _side], ['I44_S_81L14_WGr34Nb']]; //--- Projectiles which deploys smoke

//--- Usable projectiles per artillery class.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_AMMOS', _side], [
	['I44_S_105L28_Gr38'],
  	['I44_R_280mm_Wkf'],
	//['I44_S_81L14_WGr34','I44_S_81L14_WGr40','I44_S_81L14_WGr34Nb','I44_S_81L14_WFlgr'],
	//['I44_S_81L14_WGr34','I44_S_81L14_WGr40','I44_S_81L14_WGr34Nb','I44_S_81L14_WFlgr'],
	['I44_S_81L14_WGr34'],
	['I44_S_81L14_WGr34','I44_S_81L14_WGr34Nb','I44_S_81L14_WFlgr'],
	['I44_R_150mm_WGr41']
]];

//--- Special projectiles used by artillery classes.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS', _side], [
	[],
	[],
	//['I44_12rd_81L14_WGr40','I44_12rd_81L14_WGr34Nb','I44_12rd_81L14_WFlgr'],
	//['I44_12rd_81L14_WGr40','I44_12rd_81L14_WGr34Nb','I44_12rd_81L14_WFlgr'],
	[],
	['I44_12rd_81L14_WGr34Nb','I44_12rd_81L14_WFlgr'],
	[]
]];

//--- Upgrade level required to use the special projectile.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [
	[],
	[],
	//[3,1,1],
	//[3,1,1],
	[],
	[1,1],
	[]
]];

//--- Artillery classnames, more than one of the same family may be used.
missionNamespace setVariable [Format['WFBE_%1_ARTILLERY_CLASSNAMES', _side], [
	['I44_Gun_G_leFH18_WH'],
  	['I44_HT_G_SdKfz251_1_IID_WH'],
	['I44_HT_G_SdKfz251_2D_WH'],
	['I44_GunMortar_G_GrW34_WH'],
	['I44_Gun_G_NbW41_WH']
]];