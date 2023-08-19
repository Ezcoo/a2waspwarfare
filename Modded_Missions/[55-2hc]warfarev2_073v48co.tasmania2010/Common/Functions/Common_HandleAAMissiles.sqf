private ["_u","_wp","_rkt","_am","_i","_vlnrd","_vl","_vlnr","_vcnr",
"_vc","_vcnrd","_vg","_vgnr","_vgnrd","_trg","_fp","_spd","_dis","_trvldis","_sltd",
"_sspd","_acc","_agl","_trgtp","_rtp",
"_msl","_trgp","_trgv","_ttimp","_prd","_t"];

_u = _this select 0;
_wp = currentWeapon _u;
_am = _this select 4;
_rkt = nearestObject [_u,_am];

if (isNull _rkt) exitwith {};

/* Add missiles you want here */
_msl = ["M_9M311_AA","M_Sidewinder_AA","M_R73_AA","M_Maverick_AT"];
_rtp =[];
_sltd = 0;
_t=0;
_acc = 0;
_agl= 0.002;
_i = 0;


if (!(_am in _msl)) exitWith{};

Switch (true) do {
    case (_am isKindOf "M_9M311_AA") : 		{_rtp =["Building"];_sltd = 920;_acc = 1.2;_agl = 0.115;_i = 0.1;_prd= 0.3;};
    case (_am isKindOf "M_Sidewinder_AA") : {_rtp =["Building"];_sltd = 850;_acc = 1;_agl = 0.0095;_i = 0.1;_prd= 0.5;};
    case (_am isKindOf "M_R73_AA") :        {_rtp =["Building"];_sltd = 865;_acc = 0.9;_agl = 0.0095;_i = 0.1;_prd= 0.5;};
    case (_am isKindOf "M_Maverick_AT") :        {_rtp =["Building"];_sltd = 865;_acc = 0.9;_agl = 0.0095;_i = 0.1;_prd= 0.5;};
};


if (isPlayer _u) then {_trg =cursorTarget}else{_trg = assignedTarget _u};


_trgtp =typeOf _trg;
_fp = getPosASL _rkt;

if(isNull _trg || _u aimedAtTarget [_trg] == 0 || {_trgtp isKindOf _x} count _rtp != 0) exitWith {};

                  sleep _i;
                  _sspd = (velocity _rkt) distance [0,0,0];
                 _spd = _sspd;
				 
                        While {!isNull _rkt} do {

                         _dis = _fp distance (getPosASL _trg);
                        _trvldis = _fp distance _rkt;
                        _trgv=velocity _trg;

                        _ttimp = _prd*((_rkt distance _trg)/(velocity _rkt distance [0,0,0]));
                        _trgp = [(getPosASL _trg select 0) +(_ttimp)*(_trgv select 0),(getPosASL _trg select 1)+(_ttimp)*(_trgv select 1),(getPosASL _trg select 2)+(_ttimp)*(_trgv select 2)];

                        if (_trvldis > _dis) then {_agl=0;breakTo "OUT";};

                        _vl = velocity _rkt;
                        _vlnr = _vl distance [0,0,0];
                        if (_vlnr != 0) then {
                            _vlnrd = [(_vl select 0)/_vlnr,(_vl select 1)/_vlnr,(_vl select 2)/_vlnr];
                        } else {
                            _vlnrd = [0,0,0];
                        };

                        _vcnr =_trgp distance (getPosASL _rkt);
                        _vc =[(_trgp select 0)-((getPosASL _rkt) select 0),(_trgp select 1)-((getPosASL _rkt) select 1),(_trgp select 2)-((getPosASL _rkt) select 2)];
                        if (_vcnr != 0) then {
                            _vcnrd = [((_vc select 0)/_vcnr),((_vc select 1)/_vcnr),((_vc select 2)/_vcnr)];
                        } else {
                            _vcnrd = [0,0,0];
                        };

                        _t = _trvldis/_spd;
                        _spd = _sltd - (_sltd-_sspd) * exp( (-1)*_acc*(_t));

                        _vg = [_agl*(_vcnrd select 0) + (_vlnrd select 0),_agl*(_vcnrd select 1) + (_vlnrd select 1),_agl*(_vcnrd select 2) + (_vlnrd select 2)];
                        _vgnr =_vg distance [0,0,0];
                        _vgnrd = [(_vg select 0)/_vgnr,(_vg select 1)/_vgnr,(_vg select 2)/_vgnr];
                        _rkt setvectorDirandUp [[(_vgnrd select 0),(_vgnrd select 1),(_vgnrd select 2)],[0,0,1]];
                        _rkt setVelocity [(_vgnrd select 0)*_spd,(_vgnrd select 1)*_spd,(_vgnrd select 2)*_spd];                                                                                            
                                               };
                     					   				
scopeName "OUT";
exit;


