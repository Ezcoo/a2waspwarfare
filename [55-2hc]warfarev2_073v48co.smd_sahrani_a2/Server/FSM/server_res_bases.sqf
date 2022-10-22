private["_side", "_sideText","_sideID", "_startingLocation", "_allysLoc", "_types", "_structureRelPos", "_structurePos",
"_structureLabel", "_alives", "_checkNeeds", "_barrack", "_light", "_heavy", "_air", "_resTemplates",
"_resTemplatesRequire", "_resTemplatesTypes", "_resTemplatesCost", "_barracksTemplate", "_lightTemplate", "_heavyTemplate", "_airTemplate",
"_minInfFunds", "_minLightFunds", "_minHeavyFunds", "_minAirFunds"];

_side = _this select 0;
_structurePos = _this select 1;
_bar_count = _this select 2;
_sideText = str _side;
_sideID = (_side) Call WFBE_CO_FNC_GetSideID;


_types = ["Gue_WarfareBBarracks"];
_structureLabel = ["B"];
_alives = [];

_checkNeeds = {
	Private ["_building","_canBuy","_needs","_require"];
	_require = _this select 0;
	_building = _this select 1;
	_needs = [];
	if (_require select 0) then {_needs = _needs + [alive (_building select 0)]};
	if (_require select 1) then {_needs = _needs + [alive (_building select 1)]};
	if (_require select 2) then {_needs = _needs + [alive (_building select 2)]};
	if (_require select 3) then {_needs = _needs + [alive (_building select 3)]};
	_canBuy = true;
	{if (!_x) then {_canBuy = false}} forEach _needs;
	_canBuy
};

for [{_count = 0},{_count < 1},{_count = _count + 1}] do {
	_type = _types select _count;
	_building = _type createVehicle (_structurePos);
	_building setVehicleInit Format["[this,false,%1,'%2'] ExecVM 'Client\Init\Init_BaseStructure.sqf'",_sideID,_structureLabel select _count];
	_building setVariable ["wfbe_side", _side];
	Call Compile Format ["_building AddEventHandler ['killed',{[_this select 0,_this select 1,'%1'] Spawn BuildingKilled}];",_type];

	_building addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}];
	processInitCommands;
	_alives = _alives + [_building];
};

_barrack = _alives select 0;

_resTemplates = missionNamespace getVariable Format["WFBE_%1RESTEAMTEMPLATES",_sideText];
_resTemplatesRequire = missionNamespace getVariable Format["WFBE_%1RESTEAMTEMPLATEREQUIRES",_sideText];
_resTemplatesTypes = missionNamespace getVariable Format["WFBE_%1RESTEAMTYPES",_sideText];
_resTemplatesCost = missionNamespace getVariable Format["WFBE_%1RESTEAMCOST",_sideText];

_barracksTemplate = [];
_o = 0;
{
	if (_resTemplatesTypes select _o == 0) then {_barracksTemplate = _barracksTemplate + [_o]};
	_o = _o + 1;
} forEach _resTemplates;



WF_Logic setVariable [Format["%1TeamInf%2",_sideText, _bar_count],false];
WF_Logic setVariable [Format["%1TeamBaseDefenceInf%2",_sideText, _bar_count],false];

while{({alive _x} count _alives) != 0}do{

	_teamInfAlive = WF_Logic getVariable Format["%1TeamInf%2",_sideText, _bar_count];

	if (!_teamInfAlive) then {
			_ranTemp = _barracksTemplate select round(random((count _barracksTemplate)-1));
			_templateToUse = _resTemplates select _ranTemp;
			_templateRequire = _resTemplatesRequire select _ranTemp;
			_templateCost = _resTemplatesCost select _ranTemp;


			[_side,_templateToUse,_templateRequire,_alives,Format["%1TeamInf%2",_sideText, _bar_count],"moveto"] ExecVM "Server\FSM\res_team.sqf";
			WF_Logic setVariable [Format["%1TeamInf%2",_sideText, _bar_count],true];

	};

	_teamBaseDefenceInfAlive = WF_Logic getVariable Format["%1TeamBaseDefenceInf%2",_sideText, _bar_count];

	if (!_teamBaseDefenceInfAlive) then {
			_ranTemp = _barracksTemplate select (random((count _barracksTemplate)-1));
			_templateToUse = _resTemplates select _ranTemp;
			_templateRequire = _resTemplatesRequire select _ranTemp;
			_templateCost = _resTemplatesCost select _ranTemp;


			[_side,_templateToUse,_templateRequire,_alives,Format["%1TeamBaseDefenceInf%2",_sideText, _bar_count],"patrol"] ExecVM "Server\FSM\res_team.sqf";
			WF_Logic setVariable [Format["%1TeamBaseDefenceInf%2",_sideText, _bar_count],true];

	};

	sleep 1200;
};

