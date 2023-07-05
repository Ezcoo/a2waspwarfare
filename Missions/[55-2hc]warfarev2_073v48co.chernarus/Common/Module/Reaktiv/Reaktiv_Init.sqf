/*
	Reaktiv armor system.
*/

WFBE_CO_MOD_Reaktiv_OnDamageReceived = Compile preprocessFileLineNumbers "Common\Module\Reaktiv\Reaktiv_OnHandleDamage.sqf";

// [27293040# 93518: m1_abrams.p3d,"",0.152753,B 1-1-A:1 (Benny),"R_M136_AT"]
// [27293040# 93518: m1_abrams.p3d,"telo",0.152063,B 1-1-A:1 (Benny),"R_M136_AT"]	  Hull
// [27293040# 93518: m1_abrams.p3d,"motor",0.416528,B 1-1-A:1 (Benny),"R_M136_AT"]   Engine
// [27293040# 93518: m1_abrams.p3d,"pas_l",0.897494,B 1-1-A:1 (Benny),"R_M136_AT"]   HitLTrack
// [27293040# 93518: m1_abrams.p3d,"pas_p",0.0198488,B 1-1-A:1 (Benny),"R_M136_AT"]  HitRTrack
// [27293040# 93518: m1_abrams.p3d,"l svetlo",0,B 1-1-A:1 (Benny),"R_M136_AT"]       Reflectors >> Left 
// [27293040# 93518: m1_abrams.p3d,"p svetlo",0,B 1-1-A:1 (Benny),"R_M136_AT"]       Reflectors >> Right 
// [27293040# 93518: m1_abrams.p3d,"vez",0.0419956,B 1-1-A:1 (Benny),"R_M136_AT"]    Main turret

// [vehicle, [Overall, Hull->telo, Engine->motor, Left track->pas_l, Right track->pas_p, turret->vez]]; values in the array define the damage absorption from the vehicle part.

_u =      [["M1A1", [3, 3, 1, 4, 4, 2]];
_u = _u + [["M1A1_US_DES_EP1", [3, 3, 1, 4, 4, 2]];
