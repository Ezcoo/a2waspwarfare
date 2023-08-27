//params ["_name"]
private["_PlayerName"];

// take the first argument given during the call of the script with ExecVM. Here it is the name of the player we want to kick.
_PlayerName = _this select 0; 
        
hint format["from server file : %1 you are terminated for AFKing", _PlayerName]; // Afficher un message de déconnexion
//_name = name player ;
//player sideChat format ["_PlayerName: %1", _PlayerName];
serverCommand format ["#kick %1",_PlayerName];
//failMission "END1";

//endMission "END1"; //not good. The player stays in the slot. Must be kicked using servercommand.



