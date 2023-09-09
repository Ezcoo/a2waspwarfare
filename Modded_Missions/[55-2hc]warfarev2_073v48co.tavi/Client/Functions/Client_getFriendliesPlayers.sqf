/* 
	Author: Marty
	Name: Client_getFriendliesPlayers.sqf
	Parameters:
	  0 - none
	Description:
	    Return an Array of all friendlies players of the current client.
*/

private["_FriendliesPlayers", "_getEastPlayers", "_getWestPlayers"];

switch (playerSide) do
{
    case west : 
    {
        // If the client player is in west side (blufor) then we get all the west players side too :
        _getWestPlayers = compile preprocessFileLineNumbers "Client\Functions\Client_getWestPlayers.sqf";
        _FriendliesPlayers = call _getWestPlayers ;
    };

    case east : 
    {
        // If the client player is in east side (ofpor) then we get all the east players side too :
        _getEastPlayers = compile preprocessFileLineNumbers "Client\Functions\Client_getEastPlayers.sqf";
        _FriendliesPlayers = call _getEastPlayers ;   

        
    };
};

_FriendliesPlayers


