if (local player) then {
	CruiseMissile = Compile preprocessFile "Client\Module\CruiseMissile\nuke.sqf";
	CruiseMissileIncoming = Compile preprocessFile "Client\Module\CruiseMissile\cruiseMissileIncoming.sqf";
};

if (isServer) then {
	CruiseMissileDamage = Compile preprocessFileLineNumbers "Client\Module\CruiseMissile\damage.sqf";
	CruiseMissileRadiation = Compile preprocessFileLineNumbers "Client\Module\CruiseMissile\radzone.sqf";
};