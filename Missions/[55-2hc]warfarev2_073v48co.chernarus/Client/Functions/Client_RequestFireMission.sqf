Private ["_count","_destination","_index","_type","_units", "_arty_countdown"];

_destination 	= _this select 0;
_index 			= _this select 1;
_arty_countdown = _this select 2;

_units = [group player, false, _index, WFBE_Client_SideJoinedText] Call GetTeamArtillery;
_type = ((missionNamespace getVariable Format ['WFBE_%1_ARTILLERY_CLASSNAMES', WFBE_Client_SideJoinedText]) select _index) find (typeOf (_units select 0));

if (count _units < 1 || _type < 0) exitWith {};

{[_x, _destination, WFBE_Client_SideJoined, artyRange] Spawn WFBE_CO_FNC_FireArtillery} forEach _units;

//Keep weapons reloaded.
// _units = [Group player,true,_index,sideJoinedText] Call GetTeamArtillery;
// {if (!someAmmo _x) then {[_x, sideJoined] Call RearmVehicle}} forEach _units;


// Marty arty countdown to finish
[_arty_countdown] spawn 
{
	_arty_countdown = _this select 0;
    _startTime = time;

    while {(_startTime + _arty_countdown) > time} do {
        //_currentTime = floor((_startTime + _arty_countdown) - time);
        //systemChat format ["Temps restant : %1 secondes", _currentTime];
        sleep 1;
    };

    _text_when_arty_ready_again = localize "STR_WF_INFO_Arty_cool_down_over";
    hint _text_when_arty_ready_again ;

};