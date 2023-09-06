if (local player) then {
	Nuke = Compile preprocessFile "Client\Module\Nuke\nuke.sqf";
	NukeIncoming = Compile preprocessFile "Client\Module\Nuke\nukeincoming.sqf";
	MessageICBM = compile preprocessFileLineNumbers "Client\Module\Nuke\ICBM_Message.sqf"; // Generate an error
};

if (isServer) then {
	NukeDammage = Compile preprocessFileLineNumbers "Client\Module\Nuke\damage.sqf";
	NukeRadiation = Compile preprocessFileLineNumbers "Client\Module\Nuke\radzone.sqf";
};