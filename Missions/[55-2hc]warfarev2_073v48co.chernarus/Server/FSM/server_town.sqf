

// "towns" use it to get all initiated towns on map

_timeAttacked = 0;
_activeEnemies = 0;
_force = 0;
_lastUp = 0;
_skipTimeSupply = false;
_newSID = -1;
_newSide = civilian;
_town_camps_capture_rate = missionNamespace getVariable "WFBE_C_CAMPS_CAPTURE_RATE_MAX";
_town_capture_mode = missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_MODE";
_town_capture_range = switch (_town_capture_mode) do {
	case  0: {"WFBE_C_TOWNS_CAPTURE_RANGE"};
	case 1: {"WFBE_C_TOWNS_CAPTURE_THRESHOLD_RANGE"};
	default {"WFBE_C_TOWNS_CAPTURE_RANGE"};
};
_town_capture_range = missionNamespace getVariable _town_capture_range;
_town_capture_rate = missionNamespace getVariable 'WFBE_C_TOWNS_CAPTURE_RATE';
_town_supply_time_delay = missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_TIME_INCREASE_DELAY";
_town_supply_time = if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 1) then {true} else {false};

_town_defender_enabled = if ((missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER") > 0) then {true} else {false};
_town_occupation_enabled = if ((missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION") > 0) then {true} else {false};
_isTimeToUpdateSuppluys = false;
for "_j" from 0 to ((count towns) - 1) step 1 do
{
	_loc = towns select _j;
	["INITIALIZATION",Format ["server_town.sqf : Initialized for [%1].", _loc getVariable "name"]] Call WFBE_CO_FNC_LogContent;
	sleep 0.01;
};

while {!WFBE_GameOver} do {

	for "_i" from 0 to ((count towns) - 1) step 1 do
	{

		_location = towns select _i;
		_startingSupplyValue = _location getVariable "startingSupplyValue";
		_maxSupplyValue = _location getVariable "maxSupplyValue";

				_sideID = _location getVariable "sideID";
				_side = (_sideID) Call WFBE_CO_FNC_GetSideFromID;
				_objects = (_location nearEntities[["Man","Car","Motorcycle","Tank","Air","Ship"], 	_town_capture_range]) unitsBelowHeight 10;

				_west = west countSide _objects;
				_east = east countSide _objects;
				_resistance = resistance countSide _objects;

				_activeEnemies = switch (_sideID) do {
					case WFBE_C_WEST_ID: {_east + _resistance};
					case WFBE_C_EAST_ID: {_west + _resistance};
					case WFBE_C_GUER_ID: {_east + _west};
				};

				_supplyValue = _location getVariable "supplyValue";

				if (!WFBE_ISTHREEWAY && _town_supply_time) then {
					//--- If we're running on 2 sides, skip the time based supply if the defender hold the town.
					_skipTimeSupply = if (_sideID == WFBE_DEFENDER_ID) then {true} else {false};
				};

				if(_town_supply_time && _sideID != WFBE_C_UNKNOWN_ID && !_skipTimeSupply) then
				{

					if (_activeEnemies == 0 && (_supplyValue < _maxSupplyValue) && _sideID != RESISTANCEID) then
					{

						if (_isTimeToUpdateSuppluys) then {
							//diag_log format ["town number: %1", _i];
							//_lastUp = time + _town_supply_time_delay;
							_increaseOf = 1;
							if (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_side]) then {

								_upgrades = (_side) Call WFBE_CO_FNC_GetSideUpgrades;
								_increaseOf = 2 * ((missionNamespace getVariable "WFBE_C_TOWNS_SUPPLY_LEVELS_TIME") select (_upgrades select WFBE_UP_SUPPLYRATE));
							};
							_supplyValue = _supplyValue + _increaseOf;
							if (_supplyValue > _maxSupplyValue) then {_supplyValue = _maxSupplyValue};
							_location setVariable ["supplyValue", _supplyValue, true];
						};
					};
				};

	if(_west > 0 || _east > 0 || _resistance > 0) then {
		_skip = false;
		_protected = false;
		_captured = false;

		if(_town_capture_mode == 1) then {
			_resistanceDominion = if (_resistance > _east && _resistance > _west) then {true} else {false};
			_westDominion = if (_west > _east && _west > _resistance) then {true} else {false};
			_eastDominion = if (_east > _west && _east > _resistance) then {true} else {false};

			if (_sideID == WFBE_C_GUER_ID && _resistanceDominion) then {_force = _resistance;_protected = true;_skip = true};
			if (_sideID == WFBE_C_EAST_ID && _eastDominion) then {_force = _east;_protected = true;_skip = true};
			if (_sideID == WFBE_C_WEST_ID && _westDominion) then {_force = _west;_protected = true;_skip = true};

			if (_resistanceDominion) then {
				_resistance = if (_east > _west) then {_resistance - _east} else {_resistance - _west};
				_force = _resistance;
				_east = 0;
				_west = 0;
			};
			if (_westDominion) then {
				_west = if (_east > _resistance) then {_west - _east} else {_west - _resistance};
				_force = _west;
				_east = 0;
				_resistance = 0;
			};
			if (_eastDominion) then {
				_east = if (_west > _resistance) then {_east - _west} else {_east - _resistance};
				_force = _east;
				_west = 0;
				_resistance = 0;
			};

			if (!_resistanceDominion && !_westDominion && !_eastDominion) then {_west = 0; _east = 0; _resistance = 0};
		};

		if(_town_capture_mode == 0) then {
			//--- Classic capture.
			if (_sideID == WFBE_C_GUER_ID && _resistance > 0) then {_force = _resistance;_protected = true;_skip = true};
			if (_sideID == WFBE_C_EAST_ID && _east > 0) then {_force = _east;_protected = true;_skip = true};
			if (_sideID == WFBE_C_WEST_ID && _west > 0) then {_force = _west;_protected = true;_skip = true};

			if (_east > 0 && _west > 0) then {_skip = true};
			if (_west > 0 && _resistance > 0) then {_skip = true};
			if (_resistance > 0 && _east > 0) then {_skip = true};
		};

		if(_town_capture_mode == 2) then {
			_resistanceDominion = if (_resistance > _east && _resistance > _west) then {true} else {false};
			_westDominion = if (_west > _east && _west > _resistance) then {true} else {false};
			_eastDominion = if (_east > _west && _east > _resistance) then {true} else {false};

			if (_sideID == RESISTANCEID && _resistanceDominion) then {_force = _resistance;_protected = true;_skip = true};
			if (_sideID == EASTID && _eastDominion) then {_force = _east;_protected = true;_skip = true};
			if (_sideID == WESTID && _westDominion) then {_force = _west;_protected = true;_skip = true};

			if (_resistanceDominion) then {
				_resistance = if (_east > _west) then {_resistance - _east} else {_resistance - _west};
				_force = _resistance;
				_east = 0;
				_west = 0;
			};
			if (_westDominion) then {
				_west = if (_east > _resistance) then {_west - _east} else {_west - _resistance};
				_force = _west;
				_east = 0;
				_resistance = 0;
			};
			if (_eastDominion) then {
				_east = if (_west > _resistance) then {_east - _west} else {_east - _resistance};
				_force = _east;
				_west = 0;
				_resistance = 0;
			};

			if (!_resistanceDominion && !_westDominion && !_eastDominion) then {_west = 0; _east = 0; _resistance = 0};

			_totalCamps = _location Call GetTotalCamps;

			if (_west > 0 && west in WFBE_PRESENTSIDES) then {
				if (_totalCamps != ([_location,west] Call GetTotalCampsOnSide)) then {_skip = true};
			};
			if (_east > 0 && east in WFBE_PRESENTSIDES) then {
				if (_totalCamps != ([_location,east] Call GetTotalCampsOnSide)) then {_skip = true};
			};
			if (_resistance > 0 && resistance in WFBE_PRESENTSIDES) then {
				if (_totalCamps != ([_location,resistance] Call GetTotalCampsOnSide)) then {_skip = true};
			};
		};

		if !(_skip) then {
			_newSID = switch (true) do {case (_west > 0): {WFBE_C_WEST_ID}; case (_east > 0): {WFBE_C_EAST_ID}; case (_resistance > 0): {WFBE_C_GUER_ID};};
			_newSide = (_newSID) Call WFBE_CO_FNC_GetSideFromID;
			_rate = _town_capture_rate * (([_location,_newSide] Call WFBE_CO_FNC_GetTotalCampsOnSide) / (_location Call WFBE_CO_FNC_GetTotalCamps)) * _town_camps_capture_rate;
			if (_rate < 1) then {_rate = 1};

			if (_sideID != WFBE_C_UNKNOWN_ID) then {
				if (_activeEnemies > 0 && time > _timeAttacked && (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_side])) then {_timeAttacked = time + 60;[_side, "IsUnderAttack", ["Town", _location]] Spawn SideMessage};
			};

			_supplyValue = round(_supplyValue - (_resistance + _east + _west) * _rate);
			if (_supplyValue < 1) then {_supplyValue = _startingSupplyValue; _captured = true};
			_location setVariable ["supplyValue",_supplyValue,true];
		};

		if (_protected) then {
			if (_supplyValue < _startingSupplyValue) then {
				_supplyValue = _supplyValue + _force * _town_capture_rate;
				if (_supplyValue > _startingSupplyValue) then {_supplyValue = _startingSupplyValue};
				_location setVariable ["supplyValue",_supplyValue,true];
			};
		};

		if(_captured) then {
			["INFORMATION", Format ["server_town.sqf: Town [%1] was captured by [%2] From [%3].", _location, _newSide, _side]] Call WFBE_CO_FNC_LogContent;

			if (_sideID != WFBE_C_UNKNOWN_ID) then {
				if (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_side]) then {[_side, "Lost", _location] Spawn SideMessage};
			};

			if (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_newSide]) then {[_newSide, "Captured", _location] Spawn SideMessage};

			_location setVariable ["sideID",_newSID,true];

			[nil, "TownCaptured", [_location, _sideID, _newSID]] Call WFBE_CO_FNC_SendToClients;
			if ((missionNamespace getVariable "WFBE_C_CAMPS_CREATE") > 0) then {[_location, _sideID, _newSID] Spawn WFBE_SE_FNC_SetCampsToSide};

			//--- Clear the town defenses, units first then replace the defenses if needed.
			[_location, _side, "remove"] Call WFBE_SE_FNC_OperateTownDefensesUnits;

			//--- Check if the side is enabled in town and add defenses if needed.
			_side_enabled = false;
			if (_newSide == WFBE_DEFENDER) then {
				if (_town_defender_enabled) then {_side_enabled = true};
			} else {
				if (_town_occupation_enabled) then {_side_enabled = true};
			};

			//--- If the side is defined, we create the new side's defenses.
			if (_side_enabled) then {[_location, _newSide, _sideID] Call WFBE_SE_FNC_ManageTownDefenses};
		};
		};
		sleep 0.05;
	};
	_isTimeToUpdateSuppluys = false;
	sleep 5;
	if (time >= _lastUp) then {
		_isTimeToUpdateSuppluys = true;
		_lastUp = time + _town_supply_time_delay;

	};
};
