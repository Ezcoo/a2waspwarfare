/* 
	Author: Marty
	Name: Client_getEnemiesPlayers.sqf
	Parameters:
	  0 - none
	Description:
	    Return an Array of all enemies players of the current client.
*/

private["_EnemiesPlayers", "_getEastPlayers", "_getWestPlayers"];

switch (playerSide) do
{
    case west : 
    {
        // If the client player is in west side (blufor) then we get all the east players (ofpor) :
        _getEastPlayers = compile preprocessFileLineNumbers "Client\Functions\Client_getEastPlayers.sqf";
        _EnemiesPlayers = call _getEastPlayers ;   
    };

    case east : 
    {
        // If the client player is in east side (ofpor) then we get all the west players (blufor) :
        _getWestPlayers = compile preprocessFileLineNumbers "Client\Functions\Client_getWestPlayers.sqf";
        _EnemiesPlayers = call _getWestPlayers ;
    };
};

_EnemiesPlayers


