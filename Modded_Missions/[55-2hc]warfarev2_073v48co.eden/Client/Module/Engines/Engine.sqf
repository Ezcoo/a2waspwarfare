private ["_vehicle","_isOn","_get"];

_vehicle = _this select 0;
_isOn = _this select 1;
_get = _vehicle getVariable 'ID';
if (!isNil '_get') then {
if (!_isOn) then {
_vehicle setVariable ["Fuel",fuel _vehicle];
_vehicle setFuel 0;
_vehicle addAction ["<t color='"+"#00E4FF"+"'>STEALTH OFF</t>", "Client\Module\Engines\Startengine.sqf",[], 7];};
_vehicle setVariable ["ID",nil];};
