private ['_projectile','_vehicle'];

_projectile = _this select 0;
_vehicle = _this select 1;

if (vehicle player == _vehicle) then {

	while {!(isNull _projectile)} do {
		playSound ["inbound",true];
		sleep 0.55;
	};
};