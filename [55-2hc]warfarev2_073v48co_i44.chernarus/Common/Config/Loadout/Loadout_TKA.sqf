Private ["_m","_side","_u"];

_side = _this;

//--- Loadout - Magazines.
_m = ['30Rnd_762x39_AK47'];
_m = _m + ['30Rnd_556x45_Stanag'];
_m = _m + ['30Rnd_545x39_AK'];
_m = _m + ['30Rnd_545x39_AKSD'];
_m = _m + ['100Rnd_762x54_PK'];
_m = _m + ['75Rnd_545x39_RPK'];
_m = _m + ['10Rnd_762x54_SVD'];
_m = _m + ['5Rnd_127x108_KSVK'];
_m = _m + ['10x_303'];
_m = _m + ['30Rnd_762x39_SA58'];
_m = _m + ['20Rnd_762x51_FNFAL'];
_m = _m + ['PG7V'];
_m = _m + ['PG7VL'];
_m = _m + ['OG7'];
_m = _m + ['PG7VR'];
_m = _m + ['RPG18'];
_m = _m + ['Dragon_EP1'];
_m = _m + ['AT13'];
_m = _m + ['Igla'];
_m = _m + ['Strela'];
_m = _m + ['Laserbatteries'];
_m = _m + ['6Rnd_45ACP'];
_m = _m + ['8Rnd_9x18_Makarov'];
_m = _m + ['8Rnd_9x18_MakarovSD'];
_m = _m + ['10Rnd_B_765x17_Ball'];
_m = _m + ['20Rnd_B_765x17_Ball'];
_m = _m + ['30Rnd_9x19_UZI'];
_m = _m + ['30Rnd_9x19_UZI_SD'];
_m = _m + ['HandGrenade_East'];
_m = _m + ['HandGrenade_Stone'];
_m = _m + ['SmokeShell'];
_m = _m + ['SmokeShellRed'];
_m = _m + ['SmokeShellGreen'];
_m = _m + ['SmokeShellBlue'];
_m = _m + ['SmokeShellYellow'];
_m = _m + ['SmokeShellOrange'];
_m = _m + ['SmokeShellPurple'];
_m = _m + ['FlareWhite_GP25'];
_m = _m + ['FlareYellow_GP25'];
_m = _m + ['FlareGreen_GP25'];
_m = _m + ['FlareRed_GP25'];
_m = _m + ['1Rnd_HE_GP25'];
_m = _m + ['1Rnd_SMOKE_GP25'];
_m = _m + ['1Rnd_SMOKERED_GP25'];
_m = _m + ['1Rnd_SMOKEGREEN_GP25'];
_m = _m + ['1Rnd_SMOKEYELLOW_GP25'];
_m = _m + ['FlareWhite_M203'];
_m = _m + ['FlareYellow_M203'];
_m = _m + ['FlareGreen_M203'];
_m = _m + ['FlareRed_M203'];
_m = _m + ['1Rnd_HE_M203'];
_m = _m + ['1Rnd_Smoke_M203'];
_m = _m + ['1Rnd_SmokeRed_M203'];
_m = _m + ['1Rnd_SmokeGreen_M203'];
_m = _m + ['1Rnd_SmokeYellow_M203'];
_m = _m + ['MineE'];
_m = _m + ['PipeBomb'];

_m = [_m, _side] Call Compile preprocessFile "Common\Config\Config_SortMagazines.sqf";

//--- Loadout - Weapons.
_u = ['AK_47_M'];
_u = _u + ['AK_47_S'];
_u = _u + ['M16A2'];
_u = _u + ['M16A2GL'];
_u = _u + ['AK_74'];
_u = _u + ['AK_74_GL'];
_u = _u + ['AK_74_GL_kobra'];
_u = _u + ['AKS_74'];
_u = _u + ['AKS_74_GOSHAWK'];
_u = _u + ['AKS_74_kobra'];
_u = _u + ['AKS_74_NSPU'];
_u = _u + ['AKS_74_pso'];
_u = _u + ['AKS_74_U'];
_u = _u + ['FN_FAL'];
_u = _u + ['FN_FAL_ANPVS4'];
_u = _u + ['LeeEnfield'];
_u = _u + ['PK'];
_u = _u + ['RPK_74'];
_u = _u + ['Sa58P_EP1'];
_u = _u + ['Sa58V_EP1'];
_u = _u + ['Sa58V_RCO_EP1'];
_u = _u + ['Sa58V_CCO_EP1'];
_u = _u + ['SVD'];
_u = _u + ['SVD_des_EP1'];
_u = _u + ['SVD_NSPU_EP1'];
_u = _u + ['ksvk'];
_u = _u + ['RPG7V'];
_u = _u + ['RPG18'];
_u = _u + ['M47Launcher_EP1'];
_u = _u + ['MetisLauncher'];
_u = _u + ['Igla'];
_u = _u + ['Strela'];
_u = _u + ['I44_Binocular_M3'];
_u = _u + ['Makarov'];
_u = _u + ['revolver_EP1'];
_u = _u + ['revolver_gold_EP1'];
_u = _u + ['MakarovSD'];
_u = _u + ['Sa61_EP1'];
_u = _u + ['UZI_EP1'];
_u = _u + ['UZI_SD_EP1'];
_u = _u + ['Laserdesignator'];
_u = _u + ['ItemCompass'];
_u = _u + ['ItemGPS'];
_u = _u + ['ItemMap'];
_u = _u + ['ItemRadio'];
_u = _u + ['ItemWatch'];
_u = _u + ['TK_Assault_Pack_EP1'];
_u = _u + ['TK_Assault_Pack_RPK_EP1'];
_u = _u + ['TK_RPG_Backpack_EP1'];
_u = _u + ['TK_ALICE_Pack_EP1'];
_u = _u + ['TK_ALICE_Pack_AmmoMG_EP1'];
_u = _u + ['TK_ALICE_Pack_Explosives_EP1'];
_u = _u + ['TKA_Assault_Pack_Ammo_EP1'];
_u = _u + ['TKG_ALICE_Pack_AmmoAK74_EP1'];
_u = _u + ['TKG_ALICE_Pack_AmmoAK47_EP1'];
_u = _u + ['TKA_ALICE_Pack_Ammo_EP1'];
_u = _u + ['Tripod_Bag'];
_u = _u + ['KORD_TK_Bag_EP1'];
_u = _u + ['KORD_high_TK_Bag_EP1'];
_u = _u + ['SPG9_TK_INS_Bag_EP1'];
_u = _u + ['AGS_TK_Bag_EP1'];
_u = _u + ['Metis_TK_Bag_EP1'];
_u = _u + ['2b14_82mm_TK_Bag_EP1'];

[_u, _m, _side] Call Compile preprocessFile "Common\Config\Config_SortWeapons.sqf";

//--- Loadout - Templates (note that backpacks content require the weapons to be first), use -1 to use the default BP content.
_u 		= [[['AKS_74_kobra','Makarov','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','HandGrenade_East','SmokeShellRed','8Rnd_9x18_Makarov'],[8,2,2,8]]]];
_u = _u + [[['AK_74_GL_kobra','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','HandGrenade_East','1Rnd_HE_GP25'],[10,2,8]]]];
_u = _u + [[['AKS_74_kobra','RPG18','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','RPG18'],[6,1]]]];
_u = _u + [[['FN_FAL','RPG7V','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20Rnd_762x51_FNFAL','PG7VL','OG7'],[6,2,1]]]];
_u = _u + [[['AKS_74_kobra','MetisLauncher','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','AT13'],[6,1]]]];
_u = _u + [[['FN_FAL','Strela','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20Rnd_762x51_FNFAL','Strela'],[6,1]]]];
_u = _u + [[['AKS_74_pso','TK_ALICE_Pack_Explosives_EP1','Makarov','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','MineE','8Rnd_9x18_Makarov'],[6,3,8]],-1]];
_u = _u + [[['SVD_NSPU_EP1','MakarovSD','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['10Rnd_762x54_SVD','PipeBomb','8Rnd_9x18_MakarovSD'],[6,3,8]]]];
_u = _u + [[['PK','Makarov','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['100Rnd_762x54_PK','SmokeShellRed','8Rnd_9x18_Makarov'],[5,2,8]]]];
_u = _u + [[['RPK_74','Makarov','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['75Rnd_545x39_RPK','SmokeShellRed','8Rnd_9x18_Makarov'],[5,2,8]]]];
_u = _u + [[['SVD','MakarovSD','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['10Rnd_762x54_SVD','HandGrenade_East','8Rnd_9x18_MakarovSD'],[10,2,8]]]];
_u = _u + [[['ksvk','MakarovSD','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['5Rnd_127x108_KSVK','HandGrenade_East','8Rnd_9x18_MakarovSD'],[10,2,8]]]];

[_u, _side] Call Compile preprocessFile "Common\Config\Config_SetTemplates.sqf";