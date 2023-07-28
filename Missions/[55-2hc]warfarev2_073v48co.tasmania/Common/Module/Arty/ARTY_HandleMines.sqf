/* ILLUM Handler, Battlefield light bringer */
Private ['_deployPos','_destination','_mine','_force','_shell','_targetToHit','_velocity'];
_shell = _this select 0;
_destination = _this select 1;
_velocity = _this select 2;

//--- 10M Above.
_destination set [2, 10];

//--- Positionate the shell in the air.
_shell setPos _destination;
_targetToHit = objNull;

//--- Retrieve the shell position.
_deployPos = getPos _shell;
deleteVehicle _shell;


_pos = _deployPos;

_explosive = "ARTY_Sh_122_HE";
_bombLocX = _pos select 0;
_bombLocY = _pos select 1;
_bombLocZ = 20 + random(60);
_warhead = createVehicle [_explosive, [_bombLocX,_bombLocY,_bombLocZ], [], 0, "CAN_COLLIDE"];
_holder = createVehicle ["weaponHolder", [_bombLocX,_bombLocY,_bombLocZ], [], 0, "CAN_COLLIDE"];
_warhead setPosATL (getPosATL _holder);

_minePos = _deployPos;
_minePosX = _minePos select 0;
_minePosY = _minePos select 1;
_minePosZ = 0;

//--- Deploy mines.
for "_i" from 0 to 5 do { 
	_mine = "Mine" createVehicle _deployPos;
	_mine setPosATL [_minePosX + random(70), _minePosY + random(70), _minePosZ];
};
