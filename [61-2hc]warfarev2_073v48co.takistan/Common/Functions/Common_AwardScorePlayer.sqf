Private["_score","_killed"];


_killed = _this;

// Coef is 5 on purpose to balance the score better!
_score = if (score _killed < 0) then {1} else {100+5*(score _killed) / 100};

_score