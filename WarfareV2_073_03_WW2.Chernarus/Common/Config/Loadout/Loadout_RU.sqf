Private ["_m","_side","_u"];

_side = _this;

//--- Loadout - Magazines.
_m = ['I44_HandGrenade_StiHgr24'];
_m = _m + ['I44_HandGrenade_StiHgr24x7'];
_m = _m + ['I44_Item_SprB24'];
_m = _m + ['I44_Item_Rohrladung'];
_m = _m + ['I44_Item_GbLadung3kg'];
_m = _m + ['I44_Item_GbLadung10kg'];
_m = _m + ['I44_throwable_GbLadung3kg'];
_m = _m + ['I44_throwable_GbLadung10kg'];
//_m = _m + ['I44_Mine_AT_TMi42'];
_m = _m + ['I44_RifleGrenade_GSprgr'];
_m = _m + ['I44_RifleGrenade_GPzgr30'];
_m = _m + ['I44_RifleGrenade_GGPzgr40'];
_m = _m + ['I44_RifleGrenade_GFlgr'];
_m = _m + ['I44_SmokeGrenade_NbHgr39'];
_m = _m + ['I44_SmokeGrenade_M18Red'];
_m = _m + ['I44_SmokeGrenade_M18Green'];
_m = _m + ['I44_SmokeGrenade_M18Violet'];
_m = _m + ['I44_SmokeGrenade_M18Yellow'];
_m = _m + ['HandGrenade_Stone'];
_m = _m + ['I44_5rd_792x57_Mix_K98'];
_m = _m + ['I44_5rd_792x57_Tracer_K98'];
_m = _m + ['I44_5rd_792x57_Ball_K98'];
_m = _m + ['I44_5rd_792x57_AP_K98'];
_m = _m + ['I44_10rd_792x57_Mix_G43'];
_m = _m + ['I44_10rd_792x57_Tracer_G43'];
_m = _m + ['I44_10rd_792x57_Ball_G43'];
_m = _m + ['I44_10rd_792x57_AP_G43'];
_m = _m + ['I44_20rd_792x57_Mix_FG42'];
_m = _m + ['I44_20rd_792x57_Tracer_FG42'];
_m = _m + ['I44_20rd_792x57_Ball_FG42'];
_m = _m + ['I44_20rd_792x57_AP_FG42'];
_m = _m + ['I44_30rd_792x33_Ball_MP43'];
_m = _m + ['I44_32rd_9x19_Ball_MP40'];
_m = _m + ['I44_32rd_9x19_Ball_Sten'];
_m = _m + ['I44_50rd_792x57_Mix_MG34'];
_m = _m + ['I44_50rd_792x57_Tracer_MG34'];
_m = _m + ['I44_50rd_792x57_Ball_MG34'];
_m = _m + ['I44_50rd_792x57_AP_MG34'];
_m = _m + ['I44_50rd_792x57_Mix_MG42'];
_m = _m + ['I44_50rd_792x57_Tracer_MG42'];
_m = _m + ['I44_50rd_792x57_Ball_MG42'];
_m = _m + ['I44_50rd_792x57_AP_MG42'];
_m = _m + ['I44_250rd_792x57_Mix_MG42_mounted'];
_m = _m + ['I44_8rd_9x19_Ball_P08'];
_m = _m + ['I44_8rd_9x19_Ball_P38'];
_m = _m + ['I44_Rocket_149mm_PzF_100'];
_m = _m + ['I44_Rocket_149mm_PzF_60'];
_m = _m + ['I44_Rocket_149mm_PzF_30'];
_m = _m + ['I44_Rocket_88mm_RPzBGr4322_RPzB54'];
_m = _m + ['I44_m2_flamethrower_mag'];

_m = [_m, _side] Call Compile preprocessFile "Common\Config\Config_SortMagazines.sqf";

//--- Loadout - Weapons.
_u = ['I44_K98k'];
_u = _u + ['I44_K98k_GGrGer'];
_u = _u + ['I44_K98kZf41'];
_u = _u + ['I44_K98kZf42'];
_u = _u + ['I44_G43'];
_u = _u + ['I44_G43Zf4'];
//_u = _u + ['I44_K43'];
_u = _u + ['I44_FG42I'];
_u = _u + ['I44_FG42I_Zf4'];
_u = _u + ['I44_FG42I_bipod'];
_u = _u + ['I44_FG42I_Zf4_bipod'];
_u = _u + ['I44_FG42II'];
_u = _u + ['I44_MP40'];
//_u = _u + ['I44_MP43'];
_u = _u + ['I44_StG44'];
_u = _u + ['I44_MG34'];
_u = _u + ['I44_MG42'];
_u = _u + ['I44_M2_flameThrower'];
_u = _u + ['I44_PzFaust'];
_u = _u + ['I44_PzFaust30'];
_u = _u + ['I44_PzFaust60'];
_u = _u + ['I44_PzFaust100'];
_u = _u + ['I44_RPzB54'];
_u = _u + ['I44_P08'];
_u = _u + ['I44_P38'];
_u = _u + ['I44_Binocular_TypeEE'];
_u = _u + ['I44_itemBayonet'];
_u = _u + ['I44_itemShovel'];
_u = _u + ['I44_MedpackSmall'];
_u = _u + ['I44_MedpackLarge'];
_u = _u + ['ItemCompass'];
_u = _u + ['ItemGPS'];
_u = _u + ['ItemMap'];
_u = _u + ['ItemRadio'];
_u = _u + ['ItemWatch'];
_u = _u + ['I44_Bag_Tripod_Lafette'];
_u = _u + ['I44_Bag_MG42'];
_u = _u + ['Tripod_Bag'];
_u = _u + ['I44_Bag_GrW34'];
_u = _u + ['I44_Backpack_M2flamethrower'];
_u = _u + ['I44_Bag_G_NCO'];

[_u, _m, _side] Call Compile preprocessFile "Common\Config\Config_SortWeapons.sqf";

//--- Loadout - Templates (note that backpacks content require the weapons to be first), use -1 to use the default BP content.
_u 		= [[['I44_K98k','I44_P08','I44_Binocular_TypeEE','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],[['I44_5rd_792x57_Mix_K98','I44_HandGrenade_StiHgr24','I44_8rd_9x19_Ball_P08'],[8,2,8]]]];
_u = _u + [[['I44_K98k_GGrGer','I44_Binocular_TypeEE','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],[['I44_5rd_792x57_Mix_K98','I44_RifleGrenade_GSprgr','I44_RifleGrenade_GPzgr30'],[6,3,3]]]];
_u = _u + [[['I44_M2_flameThrower','I44_Backpack_M2flamethrower','I44_P38','I44_Binocular_TypeEE','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],[['I44_m2_flamethrower_mag','I44_8rd_9x19_Ball_P38'],[1,8]]]];
/*_u = _u + [[['AKS_74_U','RPG7V','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','PG7VL','OG7'],[6,2,1]]]];
_u = _u + [[['AK_107_kobra','MetisLauncher','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','AT13'],[6,1]]]];
_u = _u + [[['AKS_74_U','Strela','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','Strela'],[6,1]]]];
_u = _u + [[['AK_107_pso','Makarov','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','MineE','8Rnd_9x18_Makarov'],[6,3,8]]]];
_u = _u + [[['VSS_vintorez','MakarovSD','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20Rnd_9x39_SP5_VSS','PipeBomb','8Rnd_9x18_MakarovSD'],[6,3,8]]]];
_u = _u + [[['PK','Makarov','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['100Rnd_762x54_PK','SmokeShellRed','8Rnd_9x18_Makarov'],[5,2,8]]]];
_u = _u + [[['Pecheneg','Makarov','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['100Rnd_762x54_PK','SmokeShellRed','8Rnd_9x18_Makarov'],[5,2,8]]]];
_u = _u + [[['SVD','MakarovSD','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['10Rnd_762x54_SVD','HandGrenade_East','8Rnd_9x18_MakarovSD'],[10,2,8]]]];
_u = _u + [[['ksvk','MakarovSD','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['5Rnd_127x108_KSVK','HandGrenade_East','8Rnd_9x18_MakarovSD'],[10,2,8]]]];
*/
[_u, _side] Call Compile preprocessFile "Common\Config\Config_SetTemplates.sqf";