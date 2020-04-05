/*
	author: Net_2
	description: none
	returns: nothing
*/

private ['_ColorName','_ColorHealth','_ColorDistance','_ColorVehicleType','_isNot','_isIn','_man','_manName','_who','_distance','_health','_screen','_text','_noVeh','_yesVeh','_CND','_Display'];

disableSerialization;

_colorName = "#AAFFAA";
_colorHealth = "#FFFFFF";
_colorDistance = "#AAAAFF";
_colorVehicleType = "#FFFFFF";

_isNot = "<t align='center'><t color='%5'>%1</t><br/><t color='%6'>[%2%3]</t><br/><t color='%7'>%4 m</t></t>";
_isIn = "<t align='center'><t color='%4'>%1</t><br/><t color='%5'>[%2]</t><br/><t color='%6'>%3 m</t></t>";

while {true} do
{

	sleep 0.015;

    _cursorTarget = WFBE_CL_FNC_NET_VisibleCursorTarget;
    _display = _DC displayCtrl (3456);

    if (alive player && !isNull _Man && alive _Man && _Man != player && isPlayer _Man) then {
    	_who = (vehicle _Man);
    	_distance = round (_Man distance vehicle player);
        _health = ceil ((1 - getDammage vehicle _Man) * 100);

        if (!(_cursorTarget isEqualTo objNull)) then {
            _screen = (worldToScreen [(getPosATL cursorTarget select 0), (getPosATL cursorTarget select 1), (getPosATL cursorTarget select 2) + 4]);

            _man = _cursorTarget;
            _manName = name _man;

            _text = getText (configFile >> "CfgVehicles" >> (typeOf _who) >> "DisplayName");
            _noVeh = parseText format [_isNot, _manName, _health, " %", _distance, _colorName, _colorHealth, _colorDistance];
            _yesVeh = parsetext format [_isIn, _manName, _text, _distance, _colorName, _colorVehicleType, _colorDistance];
            _CND = (if (_who != _man && alive _who) then {if (_man == effectiveCommander _who) then {_yesVeh} else {parseText ""}} else {if (alive _man) then {_noVeh} else {parseText ""}});

            _display ctrlSetPosition [(_screen select 0)-0.2,(_screen select 1)];
            _display ctrlSetStructuredText _CND;
            _display ctrlSetFade WFBE_CL_FNC_NET_PlayerTagsAlpha;
            _display ctrlCommit 0;
        } else {
            _display ctrlSetStructuredText parseText "";
            _display ctrlCommit 0;
        };

    };

};