/*
	author: Net_2
	description: none
	returns: nothing
*/

private [_cruiseMissile];

_cruiseMissile = _this select 0;

while {alive _cruiseMissile} do {
    playSound ["CruiseMissileImmediate",true];
    sleep 0.83;
};