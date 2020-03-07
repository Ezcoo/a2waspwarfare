Private ["_limit", "_side", "_sv", "_town"];

_side = _this select 0;
_town = _this select 1;

_sv = _town getVariable "supplyValue";

_limit = 1;
if (_side == WFBE_DEFENDER) then {
	_limit = switch (true) do {
		case(_sv <= 10): {1 + ceil(random 2)};
		case(_sv > 10 && _sv <= 20): {3};
		case(_sv > 20): {3 + ceil(random 2)};
		default {1}
	};
} else {
	_limit = switch (true) do {
		case(_sv <= 30): {1 + round(random 1)};
		case(_sv > 30 && _sv <= 50): {2};
		case(_sv > 50 && _sv <= 80): {3};
		case(_sv > 80): {3 + ceil(random 2)};
		default {1}
	};
};

_limit