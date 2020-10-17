/*
	author: Net_2
	description: Monitors missile glitching and adds a warning to log if player might be missile glitching
	returns: nothing
*/

private ["_unit","_weapon","_rocket","_ammo","_missile","_currentMag","_ammoCount"];

_unit = _this select 0;
_weapon = currentWeapon _unit;
_muzzle = currentMuzzle (gunner (vehicle _unit));
_ammo = _this select 4;
_rocket = nearestObject [_unit,_ammo];

if (isNull _rocket || ({isPlayer _x} count (crew _unit) == 0)) exitwith {};

_missile = ["M_AT5_AT","M_AT13_AT","M_TOW_AT","M_TOW2_AT"];

if (!(_ammo in _missile)) exitWith {};

_unitStartZDeg = atan ((vectorDir _unit) select 2);
_rocketStartZDegDiff = ((atan ((vectorDir _rocket) select 2)) - _unitStartZDeg);

_rocketZDegDiffMax = -500;

if (_rocketStartZDegDiff > 25) then {
    while {!isNull _rocket} do {
        sleep 0.1;

        _currentRocketZDeg = atan ((vectorDir _rocket) select 2);
        _currentRocketZDegDiff = _rocketStartZDegDiff - (_currentRocketZDeg - _unitStartZDeg);

        if (_currentRocketZDegDiff > _rocketZDegDiffMax) then {
            _rocketZDegDiffMax = _currentRocketZDegDiff;
        };
    };

    if (_rocketZDegDiffMax > 25) then {
        ["WARNING", Format["Player with UID [%1] was detected to be possibly missile glitching. (Max angle difference in [Z,(X,Y)] plane: [%2°]", str (getPlayerUID _unit), _rocketZDegDiffMax]] Call WFBE_CO_FNC_LogContent;
    };
};