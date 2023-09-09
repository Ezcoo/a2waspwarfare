/* 
	Author: Marty
	Name: Client_getWestPlayers.sqf
	Parameters:
	  0 - none
	Description:
	    Return an Array of  all West side players.
*/

private["_westPlayers"];
_westPlayers = [];

{
    if (isPlayer _x) then 
    {
        if (side _x == west) then 
        {
            _westPlayers = _westPlayers + [_x];
        };
    };

} forEach allUnits;

_westPlayers
