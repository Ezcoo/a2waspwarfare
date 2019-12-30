private ["_className","_procedureName","_response","_uid","_scoreDiff"];

_className = _this select 0;
_procedureName = _this select 1;
_uid = _this select 2;
_response = _this select 3;
_hasScoreDiff = false;
_scoreDiff = 0;

if (count _this > 4) then {
    _hasScoreDiff = true;
};

if (_hasScoreDiff) then {
    _scoreDiff = this select 4;
};

sleep (random 3);

if (_hasScoreDiff) then {
    Format["Database was called with parameters: className = %1, _procedureName = %2, GUID = %3, _scoreDiff = %4", _className, _procedureName, _uid, _scoreDiff] Call GroupChatMessage;
    Format["Response from database (player skill (earned points per minute): %1", _response] Call GroupChatMessage;
} else {
    Format["Database was called with parameters: className = %1, _procedureName = %2, GUID = %3", _className, _procedureName, _uid] Call GroupChatMessage;
    Format["Response from database (player skill (earned points per minute): %1", _response] Call GroupChatMessage;
};