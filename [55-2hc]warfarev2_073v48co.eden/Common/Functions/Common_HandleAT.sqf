private ["_unit","_weapon","_limit","_ammo","_rocket","_speed","_at"];

_ammo = _this select 4;
_at=["R_MEEWS_HEAT","R_MEEWS_HEDP","R_SMAW_HEDP","R_SMAW_HEAA"];

if (_ammo in _at) then { 
_unit = _this select 0;
_weapon = currentWeapon _unit;
_rocket = nearestObject [_unit,_ammo];

     
        _vec = velocity _rocket;
		_vecnorm = (velocity _rocket) distance [0,0,0];

       _speed = 480;
      _rocket setVelocity [
	   _speed*(_vec select 0)/_vecnorm,
	   _speed*(_vec select 1)/_vecnorm,
	   _speed*(_vec select 2)/_vecnorm
	   ];
    };







