/*
	Triggered whenever damages are sent to the vehicle.
*/

//todo: gethit with setvariable

_values = missionNamespace getVariable Format ["%1_Reaktiv", typeOf (_this select 0)];
_damage = _this select 2;

if !(isnil {_values}) then {
	switch (_this select 1) do {
		case "": {_damage = _damage / (_values select 0)}; //--- Overall.
		case "telo": {_damage = _damage / (_values select 1)}; //--- Hull
		case "motor": {_damage = _damage / (_values select 2)}; //--- Engine.
		case "pas_l": {_damage = _damage / (_values select 3)}; //--- Left track.
		case "pas_p": {_damage = _damage / (_values select 4)}; //--- Right track.
		case "vez": {_damage = _damage / (_values select 5)}; //--- Turret.
	};
};

_damage