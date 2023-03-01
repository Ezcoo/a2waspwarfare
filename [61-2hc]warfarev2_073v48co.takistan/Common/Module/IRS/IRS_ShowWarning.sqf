private ['_projectile','_vehicle'];

_projectile = _this select 0;
_vehicle = _this select 1;

if (vehicle player == _vehicle) then {

	while {!(isNull _projectile)} do {
		["INCOMING MISSILE!"] call TitleTextMessage;
		sleep 0.4;
	};
	
	sleep 3;
	[""] call TitleTextMessage;
};