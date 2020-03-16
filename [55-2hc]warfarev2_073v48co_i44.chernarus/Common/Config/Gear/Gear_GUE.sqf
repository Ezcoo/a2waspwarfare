_faction = "GUE";

_u = [];//--- Magazine
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level

//--- Magazines
/*_u = _u + ["I44_5rd_792x57_Ball_K98"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [4];
_z = _z + [0];

_u = _u + ["I44_10rd_77x56R_Ball_LeeEnfield"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [7];
_z = _z + [0];
*/
_u = _u + ["I44_4xM19_12ga_00Buckshot_M37"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [12];
_z = _z + [1];
/*
_u = _u + ["I44_32rd_9x19_Ball_MP40"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [17];
_z = _z + [1];

_u = _u + ["I44_6rd_12x20R_Ball_WebleyMk6"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [2];
_z = _z + [0];

_u = _u + ["I44_Mine_AT_GrenadeNo75"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [25];
_z = _z + [0];

_u = _u + ["I44_32rd_9x19_Ball_Sten"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [17];
_z = _z + [1];

_u = _u + ["I44_8rd_9x19_Ball_P08"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [2];
_z = _z + [0];

_u = _u + ["I44_30rd_77x56R_Mix_Bren"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [17];
_z = _z + [0];

_u = _u + ["I44_5rd_792x57_Ball_K98"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [4];
_z = _z + [0];

_u = _u + ["I44_8rd_9x19_Ball_P38"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [3];
_z = _z + [1];
*/
_u = _u + ["5x_22_LR_17_HMR"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [2];

[_faction, _u, _p, _n, _o, _z] Call Compile preprocessFile "Common\Config\Config_Magazines.sqf";

_u = [];//--- Weapon
_p = [];//--- Picture
_n = [];//--- Label
_o = [];//--- Price
_z = [];//--- Upgrade level
_m = [];//--- Magazines (-1 = auto, [x,y,z] = forced magazines)

//--- Weapons
/*_u = _u + ["I44_K98k"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [90];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_LeeEnfieldNo4Mk1"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [145];
_z = _z + [1];
_m = _m + [-1];
*/
_u = _u + ["I44_M37Ithaca_20"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [220];
_z = _z + [2];
_m = _m + [-1];
/*
_u = _u + ["I44_MP40"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [225];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["I44_StenMk2"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [225];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["I44_StenMk5"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["I44_BrenMk1"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [150];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_K98kZf42"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [215];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_LeeEnfieldNo4Mk1_T"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [235];
_z = _z + [1];
_m = _m + [-1];
*/
_u = _u + ["HuntingRifle"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [275];
_z = _z + [2];
_m = _m + [-1];

/* Secondary weapons */

/*_u = _u + ["I44_PzFaust100"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [2];
_m = _m + [-1];

_u = _u + ["I44_RPzB54"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [375];
_z = _z + [3];
_m = _m + [-1];
*/
/* Pistols */

/*_u = _u + ["I44_P08"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [8];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_P38"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["I44_WebleyMk6"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [20];
_z = _z + [1];
_m = _m + [-1];
*/

/* Misc */

_u = _u + ["ItemCompass"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [4];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemGPS"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [25];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemMap"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemRadio"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["ItemWatch"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [5];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_Binocular_TypeEE"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_itemBayonet"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [15];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_itemShovel"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [10];
_z = _z + [0];
_m = _m + [-1];

_u = _u + ["I44_MedpackSmall"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [250];
_z = _z + [1];
_m = _m + [-1];

_u = _u + ["I44_MedpackLarge"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [500];
_z = _z + [3];
_m = _m + [-1];

[_faction, _u, _p, _n, _o, _z, _m] Call Compile preprocessFile "Common\Config\Config_Weapons.sqf";


//--- Backpacks & Tripods
/*Ü_u = _u + ["I44_Bag_Tripod_Lafette"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [75];
_z = _z + [0];

_u = _u + ["Tripod_Bag"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [25];
_z = _z + [0];

_u = _u + ["I44_Bag_GrW34"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [750];
_z = _z + [2];

_u = _u + ["I44_Backpack_M2flamethrower"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [205];
_z = _z + [1];

_u = _u + ["I44_Bag_MG42"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [155];
_z = _z + [1];

_u = _u + ["I44_Bag_G_NCO"];
_p = _p + [''];
_n = _n + [''];
_o = _o + [85];
_z = _z + [0];

[_faction, _u, _p, _n, _o, _z, _m] Call Compile preprocessFile "Common\Config\Config_Weapons.sqf";
*/