Private ["_side", "_town"];

_town = _this select 0;
_side = _this select 1;

_process = "ground";
_available_air = false;
_available_sea = false;
_available_ground = false;
_available_ground_convoy = false;

//--- We got ground units at least?
if !(isNil {missionNamespace getVariable Format["REINFORCER_%1_GROUND_UNITS", _side]}) then {_available_ground = true};
if !(isNil {missionNamespace getVariable Format["REINFORCER_%1_GROUND_UNITS_CONVOY", _side]}) then {_available_ground_convoy = true};

//--- Same for air?.
if !(isNil {missionNamespace getVariable Format["REINFORCER_%1_AIR_UNITS", _side]}) then {_available_air = true};

//--- What about navals ones?
_water_places = [];
_water_percent = 0;

if (missionNamespace getVariable "REINFORCER_ALLOW_NAVAL") then {
	if !(isNil {missionNamespace getVariable Format["REINFORCER_%1_NAVAL_UNITS", _side]}) then {
		_properties = (_town) Call REINFORCER_Func_GetNavalSpace;
		_water_places = _properties select 0;
		_water_percent = _properties select 1;
		
		//--- Make sure that we have enough water! we don't want to spawn our fleet in a bathtube.
		if (_water_percent >= (missionNamespace getVariable "REINFORCER_RANGE_SPAWN_SEA_MIN_WATER")) then {_available_sea = true};
	};
};

//--- Are we dealing with an island or a peninsula? if so we don't want to use ground units.
if (_available_sea && _water_percent > 80) then {_available_ground = false; _available_ground_convoy = false};

//--- What shall we process.
if (_available_sea && (_available_ground || _available_ground_convoy)) then {
	if (random 100 <= _water_percent) then {_process = "sea"}
} else {
	if (_available_sea) then {_process = "sea"};
};

if (_available_air) then {
	if (_available_air && !_available_sea && !_available_ground && !_available_ground_convoy) then {
		_process = "air"
	} else {
		if (random 100 < 25) then {_process = "air"};
	};
};

if (_process == "ground" && !_available_ground && !_available_ground_convoy) then {_process = ""};

switch (_process) do {
	case "air": {
		[_side, (_town) Call REINFORCER_Func_GetAirSpace, _town] Call REINFORCER_Func_ProcessAir;
	};
	case "ground": {
		_properties = [_town, _side] Call REINFORCER_Func_GetGroundSpace;
		_meadow_places = _properties select 0;
		if (_available_ground && _available_ground_convoy) then {
			if (random 100 > 38) then {
				[_side, _meadow_places, _town] Call REINFORCER_Func_ProcessGroundSimple
			} else {
				[_side, _meadow_places, _town] Call REINFORCER_Func_ProcessGroundConvoy
			};
		} else {
			if (_available_ground) then {[_side, _meadow_places, _town] Call REINFORCER_Func_ProcessGroundSimple};
			if (_available_ground_convoy) then {[_side, _meadow_places, _town] Call REINFORCER_Func_ProcessGroundConvoy};
		};
	};
	case "sea": {
		[_side, _water_places, _town] Call REINFORCER_Func_ProcessNaval;
	};
};