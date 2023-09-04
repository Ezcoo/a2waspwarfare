private["_sideEnemyText"];

_sideJoined = side group player;
["DEBUG", Format ["ICMB_Message.sqf: Debug info [_sideJoined] = %1", _sideJoined]] Call WFBE_CO_FNC_LogContent;

_sideJoinedText = str _sideJoined; 
["DEBUG", Format ["ICMB_Message.sqf: Debug info [_sideJoinedText] = %1", _sideJoinedText]] Call WFBE_CO_FNC_LogContent;

// Exemple de détermination du type d'une variable
maVariable = 42;

if (isNil "maVariable") then {
    hint "La variable est indéfinie (nil).";
} else {
    if (isNumber maVariable) then {
        hint "La variable est de type nombre (number).";
    } else {
        if (isString maVariable) then {
            hint "La variable est de type chaîne de caractères (string).";
        } else {
            if (isArray maVariable) then {
                hint "La variable est de type tableau (array).";
            } else {
                if (isClass maVariable) then {
                    hint "La variable est de type classe (class).";
                } else {
                    hint "Type de variable non reconnu.";
                };
            };
        };
    };
};

/*
_sideEnemyText = ""
//["DEBUG", Format ["ICMB_Message.sqf: Debug info [_sideJoinedText] = %1", _sideJoinedText]] Call WFBE_CO_FNC_LogContent;

if (_sideJoinedText == "WEST") then 
{
    _sideEnemyText = "EAST";
}
else
{
    _sideEnemyText = "WEST";
}
player sideChat format ["_sideEnemyText = %1", _sideEnemyText]; 
//["DEBUG", Format ["ICMB_Message.sqf: Debug info [_sideEnemyText] = %1", _sideEnemyText]] Call WFBE_CO_FNC_LogContent;
*/


//["DEBUG", Format ["ICMB_Message.sqf: Debug info [_sideJoinedText] = %1", _sideJoinedText]] Call WFBE_CO_FNC_LogContent;
/*
// Utilisation de _sideJoinedText dans les lignes suivantes
_clients_in_Friendly_Team = missionNamespace getVariable Format['WFBE_%1TEAMS', _sideJoinedText];
["DEBUG", Format ["ICMB_Message.sqf: Debug info [_clients_in_Friendly_Team] = %1", _clients_in_Friendly_Team]] Call WFBE_CO_FNC_LogContent;

_clients_in_Enemy_Team = missionNamespace getVariable Format['WFBE_%1TEAMS', _sideEnemyText];  // Utilisation de _sideEnemyText
//["DEBUG", Format ["ICMB_Message.sqf: Debug info [clientTeams] = %1", clientTeams]] Call WFBE_CO_FNC_LogContent;
["DEBUG", Format ["ICMB_Message.sqf: Debug info [_clients_in_Enemy_Team] = %1", _clients_in_Enemy_Team]] Call WFBE_CO_FNC_LogContent;
*/