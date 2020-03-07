Private ["_m","_side","_u"];

_side = _this;

//--- Loadout - Magazines.
_m = ['I44_5rd_792x57_Ball_K98'];
_m = _m + ['I44_5rd_792x57_Tracer_K98'];
_m = _m + ['I44_10rd_77x56R_Ball_LeeEnfield'];
_m = _m + ['5x_22_LR_17_HMR'];
_m = _m + ['I44_30rd_77x56R_Mix_Bren'];
_m = _m + ['I44_32rd_9x19_Ball_MP40'];
_m = _m + ['5x_22_LR_17_HMR'];
_m = _m + ['I44_32rd_9x19_Ball_Sten'];
_m = _m + ['I44_4xM19_12ga_00Buckshot_M37'];
_m = _m + ['I44_8rd_9x19_Ball_P08'];
_m = _m + ['I44_8rd_9x19_Ball_P38'];
_m = _m + ['I44_6rd_12x20R_Ball_WebleyMk6'];
_m = _m + ['I44_Mine_AT_GrenadeNo75'];

_m = [_m, _side] Call Compile preprocessFile "Common\Config\Config_SortMagazines.sqf";

//--- Loadout - Weapons.
_u = ['I44_K98k'];
_u = _u + ['I44_LeeEnfieldNo4Mk1'];
_u = _u + ['I44_K98kZf42'];
_u = _u + ['I44_LeeEnfieldNo4Mk1_T'];
_u = _u + ['HuntingRifle'];
_u = _u + ['I44_BrenMk1'];
_u = _u + ['I44_MP40'];
_u = _u + ['I44_StenMk2'];
_u = _u + ['I44_StenMk5'];
_u = _u + ['I44_M37Ithaca_20'];
_u = _u + ['I44_PzFaust100'];
_u = _u + ['I44_RPzB54'];
_u = _u + ['I44_P08'];
_u = _u + ['I44_P38'];
_u = _u + ['I44_WebleyMk6'];
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

[_u, _m, _side] Call Compile preprocessFile "Common\Config\Config_SortWeapons.sqf";

//--- Loadout - Templates (note that backpacks content require the weapons to be first), use -1 to use the default BP content.
_u 		= [[['HuntingRifle','I44_P08'],[['5x_22_LR_17_HMR','I44_Mine_AT_GrenadeNo75','I44_8rd_9x19_Ball_P08'],[8,1,8]]]];
/*_u = _u + [[['AK_74_GL','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','HandGrenade_East','1Rnd_HE_GP25'],[10,2,8]]]];
_u = _u + [[['AKS_74_kobra','RPG18','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','RPG18'],[6,1]]]];
_u = _u + [[['AKS_74_U','RPG7V','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','PG7VL','OG7'],[6,2,1]]]];
_u = _u + [[['AKS_74_U','Strela','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','Strela'],[6,1]]]];
_u = _u + [[['AKS_74_pso','Makarov','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_545x39_AK','MineE','8Rnd_9x18_Makarov'],[6,3,8]]]];
_u = _u + [[['PK','Makarov','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['100Rnd_762x54_PK','SmokeShellRed','8Rnd_9x18_Makarov'],[5,2,8]]]];
_u = _u + [[['Pecheneg','Makarov','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['100Rnd_762x54_PK','SmokeShellRed','8Rnd_9x18_Makarov'],[5,2,8]]]];
_u = _u + [[['SVD','MakarovSD','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['10Rnd_762x54_SVD','HandGrenade_East','8Rnd_9x18_MakarovSD'],[10,2,8]]]];
*/
[_u, _side] Call Compile preprocessFile "Common\Config\Config_SetTemplates.sqf";