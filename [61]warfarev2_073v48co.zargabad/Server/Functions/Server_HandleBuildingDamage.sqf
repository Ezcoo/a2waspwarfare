Private ["_difference","_building","_redu"];
_building =_this select 0;
_ammo = _this select 2;


_redu = if (_building isKindOf "Warfare_HQ_base_unfolded") then {5} else {missionNamespace getVariable "WFBE_C_STRUCTURES_DAMAGES_REDUCTION"};

switch (_ammo) do {
	case "B_30mm_HE" :{_redu = 20};
	case "B_23mm_AA" :{_redu = 20};
};


_difference = ((_this select 1) - (getDammage (_this select 0)))/(_redu);
((getDammage (_this select 0))+_difference)