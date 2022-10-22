/*
	Attempt to get ArmA version, will throw an error if Vanilla or < 1.62 but it doesn't matter.
*/

Private ["_product"];

_product = productVersion;
if (isNil '_product') exitWith {
	VERSION_SET = true;
	["WARNING", "Init_Version.sqf: Couldn't determine the ArmA Version, command productVersion is unknown. This message along the error can be safely ignored."] Call WFBE_CO_FNC_LogContent;
};

//--- If the command is known then can update oue global variables.
ARMA_VERSION = _product select 2;
ARMA_RELEASENUMBER = _product select 3;

VERSION_SET = true;
["INITIALIZATION", Format["Init_Version.sqf: Determined the current version of ArmA %1", _product]] Call WFBE_CO_FNC_LogContent;