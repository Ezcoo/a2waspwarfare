/* 
	Author: Marty
	Name: Client_getEastPlayers.sqf
	Parameters:
	  0 - none
	Description:
	    Return an Array of all East side players.
*/

private["_EastPlayers"];
_EastPlayers = [];

{
    if (isPlayer _x) then 
    {
        if (side _x == east) then 
        {
            _EastPlayers = _EastPlayers + [_x];
        };
    };

} forEach allUnits;

_EastPlayers
