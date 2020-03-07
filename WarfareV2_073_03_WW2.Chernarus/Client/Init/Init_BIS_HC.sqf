/*
	Custom Module Initialization. High Command (commander).
*/

//--- We'll work with the WF_Logic here.
_logic = WF_Logic;
_group = group _logic;

//--- HC main is laready running
_isMain = if (_logic == BIS_HC_mainscope) then {true} else {false};

//--- Code executed only on first HC scope
if (_isMain) then {
	HC_lastUnitReporting	 = []; //hc unit - array of groups
	HC_lastUnitReportingTime = 0;
	HC_lastUnitReportingMarkerName = "";
	HC_lastUnitReportingTimeMax = 45; //no older reports than this from teams are considered
	_logic setvariable ["sound",false];
};

//--- Scope name
for "_i" from 0 to 1000 do {
	_name = format ["BIS_HC_%1",_i];
	if (isnil _name) exitwith {call compile format ["%1 = _logic",_name]};
};

//--- Functions are loaded
waitUntil {!isnil "BIS_fnc_init"};

//--- [HC Parameters]. ---\\
WFBE_HC_Path = "Client\Module\HC";

//--- Detect all (obsolete)
_logic setvariable ["addAllGroups", false];

//--- Radio activations
_logic setvariable ["radios", []];

//--- Chain of Command
_logic setvariable ["chainofcommand", false];

//--- Task created
_logic setvariable ["onTaskCreated", {}];

//--- Task assigned
_logic setvariable ["onTaskAssigned", {}];

//--- Local script ---------------------------------------------------------------------------------------
waitUntil {!isNil {BIS_MPF_initDone}};
  
if (_isMain) then {
	// [nil, nil, "per", rEXECVM, "ca\modules\HC\data\scripts\HC_local.sqf"] call RE
	execVM (WFBE_HC_Path+"\HC_local.sqf");
};