if (local player) then {
	Nuke = Compile preprocessFile "Client\Module\CruiseMissile\nuke.sqf";
	NukeIncomming = Compile preprocessFile "Client\Module\CruiseMissile\nukeincoming.sqf";
};

if (isServer) then {
	NukeDammage = Compile preprocessFileLineNumbers "Client\Module\CruiseMissile\damage.sqf";
	NukeRadiation = Compile preprocessFileLineNumbers "Client\Module\CruiseMissile\radzone.sqf";
};