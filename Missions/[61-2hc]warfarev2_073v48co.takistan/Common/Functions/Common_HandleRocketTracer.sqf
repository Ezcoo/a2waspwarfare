private ["_unit","_weapon","_ammo","_rocket","_sp","_fp","_fp1","_at","_li","_vx","_vy","_vz"];

_ammo = _this select 4;
_at=["M_47_AT_EP1","M_AT13_AT","M_AT5_AT","M_AT2_AT","M_AT9_AT","M_AT6_AT","M_TOW_AT","M_TOW2_AT","M_Vikhr_AT","M_AT10_AT","M_AT11_AT"];

if (_ammo in _at) then { 

_unit = _this select 0;
_weapon = currentWeapon _unit;
_rocket = nearestObject [_unit,_ammo];

_vx = velocity _rocket select 0;
_vy = velocity _rocket select 1;
_vz = velocity _rocket select 2;

_sp = "#particlesource" createVehicleLocal getPos _rocket;
_sp setParticleRandom [0.03, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0,360];
_sp setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 12, 2,1],"", "Billboard", 1, 2.0, [0,0,0],[0,0,0], 1, 1, 0.80, 0.5, [0.65,0.45+random 4],[[1,1,1,0.10],[1,1,1,0.05],[1,1,1,0]],[1000],0.1,0.1,"","",_rocket,360];	
_sp setdropinterval 0.04;

_fp = "#particlesource" createVehicleLocal getPos _rocket;
_fp setParticleRandom [0.03, [0,0,0], [0,0,0], 0, 0, [0, 0, 0, 0], 0, 0,360];
_fp setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2,0],"", "Billboard", 1, 0.08+random 0.15, [0,2,0],[_vx*2,_vy*2,_vz*2], 0, 1, 0.80, 0.5, [0,2.95+random 4.15,0],[[1,0.6,0.2,-0.6],[1,1,1,0]],[1000],0.1,0.1,"","",_rocket,360];	
_fp setdropinterval 0.10+random 0.18;

sleep 0.7;

_fp1 = "#particlesource" createVehicleLocal getPos _rocket;
_fp1 setParticleRandom [0.03, [0,0,0], [0.3,0.3,0.3], 0, 0, [0, 0, 0, 0], 0, 0,360];
_fp1 setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 4, 1,1],"", "Billboard", 1, 0.09, [-0.05+random 0.05,1.7,-0.05],[_vx*2,_vy*2,_vz*2], 0, 1, 0.80, 0.5, [0.45,0],[[1,1,1,0],[1,1,1,-0.5],[1,1,1,-0.4],[1,1,1,0]],[1000],0.1,0.1,"","",_rocket,360];	
_fp1 setdropinterval 0.0004;

};


