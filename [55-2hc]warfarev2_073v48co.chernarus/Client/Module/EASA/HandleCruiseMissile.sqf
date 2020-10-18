/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

_unit = _this select 0;
_projectile = _this select 6;

_projectilePos = getPos _projectile;

if (typeOf _unit == 'F35B') then {

    if ((currentWeapon (vehicle player)) == 'Ch29Launcher_Su34') then {

        if (_unit getVariable "WFBE_JASSM") then {

            if (isMultiplayer) then {"WARNING!!! CRUISE MISSILE LAUNCH DETECTED!!!" Call CommandChatMessage};
            [nil, "LocalizeMessage", ['CruiseMissileLaunch']] Call WFBE_CO_FNC_SendToClients;
            [nil, "NukeIncomingImmediate", [_projectile]] Call WFBE_CO_FNC_SendToClients;
            [_projectile] spawn NukeIncomingImmediate;

            while {alive _projectile} do {
                _projectilePos = getPos _projectile;

                sleep 0.2;
            };

            _unit setVariable ["WFBE_JASSM", false];
            (vehicle player) removeWeapon 'Ch29Launcher_Su34';

            [_projectilePos] spawn Nuke;

            ["RequestSpecial", ["ICBM",sideJoined,_projectilePos,nil,clientTeam]] Call WFBE_CO_FNC_SendToServer;
            [nil, "HandleSpecial", ["icbm-display", _projectilePos]] Call WFBE_CO_FNC_SendToClients;

        };

    };
};

if (typeOf _unit == 'Su34') then {

    if ((currentWeapon (vehicle player)) == 'Ch29Launcher_Su34') then {

        if (_unit getVariable "WFBE_KH102") then {

            if (isMultiplayer) then {"WARNING!!! CRUISE MISSILE LAUNCH DETECTED!!!" Call CommandChatMessage};
            [nil, "LocalizeMessage", ['CruiseMissileLaunch']] Call WFBE_CO_FNC_SendToClients;
            [nil, "NukeIncomingImmediate", [_projectile]] Call WFBE_CO_FNC_SendToClients;
            [_projectile] spawn NukeIncomingImmediate;

            while {alive _projectile} do {
                _projectilePos = getPos _projectile;

                sleep 0.2;
            };

            _unit setVariable ["WFBE_KH102", false];
            (vehicle player) removeWeapon 'Ch29Launcher_Su34';

            [_projectilePos] spawn Nuke;

            ["RequestSpecial", ["ICBM",sideJoined,_projectilePos,nil,clientTeam]] Call WFBE_CO_FNC_SendToServer;
            [nil, "HandleSpecial", ["icbm-display", _projectilePos]] Call WFBE_CO_FNC_SendToClients;

        };

    };

};