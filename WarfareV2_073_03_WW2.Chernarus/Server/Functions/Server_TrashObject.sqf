/*
	Trash an entity. Groups can only be removed once that all it's units are DELETED!
	 Parameters:
		- Object.
*/

Private ["_delay","_group","_isMan","_object"];

_object = _this;

if !(isNull _object) then {
	_isMan = if (_object isKindOf "Man") then {true} else {false};
	
	_group = if (_isMan) then {group _object} else {grpNull};
	if !(_isMan) then {_object removeAllEventHandlers "hit"};
	_object removeAllEventHandlers "killed";
	
	//--- Override?.
	_delay = if (isNil {_object getVariable "wfbe_garbage_delay"}) then {missionNamespace getVariable "WFBE_C_UNITS_CLEAN_TIMEOUT"} else {_object getVariable "wfbe_garbage_delay"};
	
	sleep _delay;
	
	["INFORMATION", Format["Server_TrashObject.sqf: Deleting [%1], it has been [%2] seconds.", _object, _delay]] Call WFBE_CO_FNC_LogContent;
	
	if (_isMan) then {hideBody _object; sleep 6};
	
	deleteVehicle _object;
	
	if (_isMan) then {
		if !(isNull _group) then {
			if (isNil {_group getVariable "wfbe_persistent"}) then {if (count (units _group) <= 0) then {deleteGroup _group}};
		};
	};
};