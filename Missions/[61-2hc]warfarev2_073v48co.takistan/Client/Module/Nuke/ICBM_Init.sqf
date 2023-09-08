if (local player) then {
	Nuke = Compile preprocessFile "Client\Module\Nuke\nuke.sqf";
	NukeIncoming = Compile preprocessFile "Client\Module\Nuke\nukeincoming.sqf";

	ICBM_FriendySide_Message = compile preprocessFileLineNumbers "Client\Module\Nuke\ICBM_friendlySide_Message.sqf";
	ICBM_EnemySide_Message = compile preprocessFileLineNumbers "Client\Module\Nuke\ICBM_EnemySide_Message.sqf";
};
	
if (isServer) then {
	NukeDammage = Compile preprocessFileLineNumbers "Client\Module\Nuke\damage.sqf";
	NukeRadiation = Compile preprocessFileLineNumbers "Client\Module\Nuke\radzone.sqf";
};