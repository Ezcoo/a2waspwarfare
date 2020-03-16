Private ["_m","_side","_u"];

_side = _this;

//--- Loadout - Magazines.
_m = ['I44_HandGrenade_No36M'];
_m = _m + ['I44_HandGrenade_Mk2'];
_m = _m + ['I44_HandGrenade_No82'];
_m = _m + ['I44_Item_M2DemoCharge'];
_m = _m + ['I44_Item_M1A1Bangalore'];
_m = _m + ['I44_Item_M37DemoKitHalf'];
_m = _m + ['I44_Item_M37DemoKit'];
_m = _m + ['I44_throwable_M2'];
_m = _m + ['I44_throwable_M37'];
_m = _m + ['I44_Mine_AT_GrenadeNo75'];
_m = _m + ['I44_Mine_AT_M1'];
_m = _m + ['I44_RifleGrenade_SignalM17A1_M1903'];
_m = _m + ['I44_RifleGrenade_M17_M1903'];
_m = _m + ['I44_RifleGrenade_M9A1_M1903'];
_m = _m + ['I44_RifleGrenade_SignalM17A1'];
_m = _m + ['I44_RifleGrenade_M1Mk2'];
_m = _m + ['I44_RifleGrenade_M17'];
_m = _m + ['I44_RifleGrenade_M9A1'];
_m = _m + ['I44_SmokeGrenade_ANM8'];
_m = _m + ['I44_SmokeGrenade_M18Red'];
_m = _m + ['I44_SmokeGrenade_M18Green'];
_m = _m + ['I44_SmokeGrenade_M18Violet'];
_m = _m + ['I44_SmokeGrenade_M18Yellow'];
_m = _m + ['HandGrenade_Stone'];
_m = _m + ['I44_10rd_77x56R_Ball_LeeEnfield'];
_m = _m + ['I44_7rd_1143x23_Ball_DeLisle'];
_m = _m + ['I44_15rd_762x33_Mix_M1Carbine'];
_m = _m + ['I44_15rd_762x33_Tracer_M1Carbine'];
_m = _m + ['I44_15rd_762x33_Ball_M1Carbine'];
_m = _m + ['I44_8rd_762x63_Mix_M1Garand'];
_m = _m + ['I44_8rd_762x63_Tracer_M1Garand'];
_m = _m + ['I44_8rd_762x63_Ball_M1Garand'];
_m = _m + ['I44_8rd_762x63_AP_M1Garand'];
_m = _m + ['I44_5rd_762x63_Mix_M1903'];
_m = _m + ['I44_5rd_762x63_Tracer_M1903'];
_m = _m + ['I44_5rd_762x63_Ball_M1903'];
_m = _m + ['I44_5rd_762x63_AP_M1903'];
_m = _m + ['I44_4xM19_12ga_00Buckshot_M37'];
_m = _m + ['I44_20rd_762x63_Mix_M1918'];
_m = _m + ['I44_20rd_762x63_Tracer_M1918'];
_m = _m + ['I44_20rd_762x63_Ball_M1918'];
_m = _m + ['I44_20rd_762x63_AP_M1918'];
_m = _m + ['I44_Rocket_60mm_M6A1_M1A1Bazooka'];
_m = _m + ['I44_30rd_77x56R_Mix_Bren'];
_m = _m + ['I44_30rd_77x56R_Tracer_Bren'];
_m = _m + ['I44_30rd_77x56R_Ball_Bren'];
_m = _m + ['I44_50rd_762x63_Mix_M1919'];
_m = _m + ['I44_50rd_762x63_Tracer_M1919'];
_m = _m + ['I44_50rd_762x63_Ball_M1919'];
_m = _m + ['I44_50rd_762x63_AP_M1919'];
_m = _m + ['I44_7rd_1143x23_Ball_M1911'];
_m = _m + ['I44_6rd_12x20R_Ball_WebleyMk6'];
_m = _m + ['I44_30rd_1143x23_Mix_M1A1Thompson'];
_m = _m + ['I44_30rd_1143x23_Tracer_M1A1Thompson'];
_m = _m + ['I44_30rd_1143x23_Ball_M1A1Thompson'];
_m = _m + ['I44_30rd_1143x23_Mix_M3Greasegun'];
_m = _m + ['I44_30rd_1143x23_Tracer_M3Greasegun'];
_m = _m + ['I44_30rd_1143x23_Ball_M3Greasegun'];
_m = _m + ['I44_32rd_9x19_Ball_Sten'];
_m = _m + ['I44_32rd_9x19_BallSS_Sten'];
_m = _m + ['I44_m2_flamethrower_mag'];
_m = _m + ['I44_Grenade_PIATMk3'];

_m = [_m, _side] Call Compile preprocessFile "Common\Config\Config_SortMagazines.sqf";

//--- Loadout - Weapons.
_u = ['I44_PIAT'];
//_u = _u + ['I44_M1903'];
_u = _u + ['I44_M1903A3'];
_u = _u + ['I44_M1903A3_M1'];
_u = _u + ['I44_M1903A4'];
//_u = _u + ['I44_LeeEnfield'];
_u = _u + ['I44_LeeEnfieldNo4Mk1'];
_u = _u + ['I44_LeeEnfieldNo4Mk1_T'];
_u = _u + ['I44_M1Garand'];
_u = _u + ['I44_M1Garand_M7'];
_u = _u + ['I44_M1Carbine'];
_u = _u + ['I44_M1A1Carbine'];
_u = _u + ['I44_M1918A2'];
_u = _u + ['I44_M1A1Thompson'];
_u = _u + ['I44_M3Greasegun'];
_u = _u + ['I44_StenMk2'];
_u = _u + ['I44_StenMk2S'];
_u = _u + ['I44_StenMk5'];
_u = _u + ['I44_BrenMk1'];
_u = _u + ['I44_M1919A4'];
_u = _u + ['I44_M1919A6'];
_u = _u + ['I44_DeLisleCarbine'];
_u = _u + ['I44_M37Ithaca'];
_u = _u + ['I44_M2_flameThrower'];
_u = _u + ['I44_M1A1Bazooka'];
_u = _u + ['I44_M1911A1'];
_u = _u + ['I44_WebleyMk6'];
_u = _u + ['I44_Binocular_M3'];
_u = _u + ['I44_itemBayonet'];
_u = _u + ['I44_itemShovel'];
_u = _u + ['I44_MedpackSmall'];
_u = _u + ['I44_MedpackLarge'];
_u = _u + ['ItemCompass'];
_u = _u + ['ItemGPS'];
_u = _u + ['ItemMap'];
_u = _u + ['ItemRadio'];
_u = _u + ['ItemWatch'];
_u = _u + ['I44_Bag_M1919A4'];
_u = _u + ['I44_Bag_Tripod_M2_C'];
_u = _u + ['I44_Bag_M2MortarBP'];
_u = _u + ['I44_Bag_M2Mortar'];
_u = _u + ['I44_Backpack_M2flamethrower'];
_u = _u + ['I44_Bag_ANCO'];
_u = _u + ['I44_Bag_ABNCO'];
//_u = _u + ['I44_Bag_ABBergen'];

[_u, _m, _side] Call Compile preprocessFile "Common\Config\Config_SortWeapons.sqf";

//--- Loadout - Templates (note that backpacks content require the weapons to be first), use -1 to use the default BP content.
_u 		= [[['I44_M1Garand','I44_M1911A1','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],[['I44_8rd_762x63_Mix_M1Garand','I44_HandGrenade_Mk2','I44_7rd_1143x23_Ball_M1911'],[6,2,8]]]];
_u = _u + [[['I44_M1Garand_M7','I44_M1911A1','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],[['I44_8rd_762x63_Mix_M1Garand','I44_RifleGrenade_M1Mk2','I44_RifleGrenade_M17','I44_7rd_1143x23_Ball_M1911'],[6,2,4,8]]]];
_u = _u + [[['I44_M2_flameThrower','I44_Backpack_M2flamethrower','I44_M1911A1','I44_Binocular_M3','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch','I44_itemBayonet','I44_itemShovel'],[['I44_m2_flamethrower_mag','I44_7rd_1143x23_Ball_M1911'],[1,8]]]];
/*_u = _u + [[['SCAR_H_CQC_CCO','MAAWS','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20rnd_762x51_B_SCAR','MAAWS_HEAT'],[6,2]]]];
_u = _u + [[['M4A3_CCO_EP1','Javelin','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_556x45_Stanag','Javelin'],[6,1]]]];
_u = _u + [[['SCAR_L_STD_Mk4CQT','Stinger','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_556x45_Stanag','Stinger'],[6,1]]]];
_u = _u + [[['SCAR_L_CQC','M9','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['30Rnd_556x45_Stanag','Mine','15Rnd_9x19_M9'],[6,3,8]]]];
_u = _u + [[['SCAR_H_CQC_CCO_SD','M9SD','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20Rnd_762x51_SB_SCAR','PipeBomb','15Rnd_9x19_M9SD'],[6,3,8]]]];
_u = _u + [[['m240_scoped_EP1','Colt1911','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['100Rnd_762x51_M240','SmokeShellBlue','7Rnd_45ACP_1911'],[5,2,8]]]];
_u = _u + [[['M249_m145_EP1','Colt1911','NVGoggles','Binocular','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['200Rnd_556x45_M249','SmokeShellBlue','7Rnd_45ACP_1911'],[5,2,8]]]];
_u = _u + [[['M14_EP1','M9SD','NVGoggles','Binocular_Vector','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20Rnd_762x51_DMR','HandGrenade_West','15Rnd_9x19_M9SD'],[10,2,8]]]];
_u = _u + [[['M110_TWS_EP1','M9SD','NVGoggles','Binocular_Vector','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['20Rnd_762x51_B_SCAR','HandGrenade_West','15Rnd_9x19_M9SD'],[10,2,8]]]];
_u = _u + [[['m107','M9SD','NVGoggles','Binocular_Vector','ItemCompass','ItemGPS','ItemMap','ItemRadio','ItemWatch'],[['10Rnd_127x99_m107','HandGrenade_West','15Rnd_9x19_M9SD'],[10,2,8]]]];
*/
[_u, _side] Call Compile preprocessFile "Common\Config\Config_SetTemplates.sqf";