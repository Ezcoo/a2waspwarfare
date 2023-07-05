private["_camp","_town","_flag","_newSID","_force","_camp_cap_rate","_camp_range","_camp_range_players","_town_starting_sv"];


_town = _this select 1;

_camps = _this select 0;
_flags = _this select 2;

_newSID = -1;
_force = 0;

_camp_cap_rate = missionNamespace getVariable "WFBE_C_CAMPS_CAPTURE_RATE";
_camp_range = missionNamespace getVariable "WFBE_C_CAMPS_RANGE";
_camp_range_players = missionNamespace getVariable "WFBE_C_CAMPS_RANGE_PLAYERS";
_town_starting_sv = _town getVariable "startingSupplyValue";

while {!WFBE_GameOver} do {

	for "_i" from 0 to ((count _camps) - 1) step 1 do
	{

		_camp = _camps select _i;
		_flag = _flags select _i;

		_base = _camp getVariable "wfbe_camp_bunker";

		if(alive _base) then {
			//--- Filter players and ai.
			_objects = _camp nearEntities["Man", _camp_range];
			_in_range = _objects;
			{
				if (isPlayer _x) then {if (_x distance _camp > _camp_range_players) then {_objects = _objects - [_x]}};
			} forEach _in_range;

			_west = west countSide _objects;
			_east = east countSide _objects;
			_resistance = resistance countSide _objects;

			if(_west > 0 || _east > 0 || _resistance > 0) then{
				_skip = false;
				_protected = false;
				_captured = false;
				_sideID = _camp getVariable "sideID";
				_supplyValue = _camp getVariable "supplyValue";

				_town_sideID = _town getVariable "sideID";

				_resistanceDominion = if (_resistance > _east && _resistance > _west) then {true} else {false};
				_westDominion = if (_west > _east && _west > _resistance) then {true} else {false};
				_eastDominion = if (_east > _west && _east > _resistance) then {true} else {false};

				if (_sideID == WFBE_C_GUER_ID && _resistanceDominion) then {_force = _resistance;_protected = true;_skip = true};
				if (_sideID == WFBE_C_EAST_ID && _eastDominion) then {_force = _east;_protected = true;_skip = true};
				if (_sideID == WFBE_C_WEST_ID && _westDominion) then {_force = _west;_protected = true;_skip = true};

				switch (true) do {
					case _resistanceDominion: {_resistance = if (_east > _west) then {_resistance - _east} else {_resistance - _west};	_force = _resistance; _east = 0; _west = 0};
					case _westDominion: {_west = if (_east > _resistance) then {_west - _east} else {_west - _resistance}; _force = _west; _east = 0; _resistance = 0};
					case _eastDominion: {_east = if (_west > _resistance) then {_east - _west} else {_east - _resistance}; _force = _east; _west = 0; _resistance = 0};
				};

				if (!_resistanceDominion && !_westDominion && !_eastDominion) then {_west = 0; _east = 0; _resistance = 0};

				if !(_skip) then {
					_newSID = switch (true) do {case (_west > 0): {WFBE_C_WEST_ID}; case (_east > 0): {WFBE_C_EAST_ID}; case (_resistance > 0): {WFBE_C_GUER_ID}};
					_supplyValue = round(_supplyValue - ((_resistance + _east + _west)*_camp_cap_rate));
					if (_supplyValue < 1) then {_supplyValue = _town_starting_sv; _captured = true};
					_camp setVariable ["supplyValue",_supplyValue,true];
				};

				if (_protected) then {
					if (_supplyValue < _town_starting_sv) then {
					_supplyValue = _supplyValue + round(_force * _camp_cap_rate);
					if (_supplyValue > _town_starting_sv) then {_supplyValue = _town_starting_sv};
					_camp setVariable ["supplyValue",_supplyValue,true];
					};
				};
				if(_captured)then{
					_newSide = (_newSID) Call WFBE_CO_FNC_GetSideFromID;
					_side = (_sideID) Call WFBE_CO_FNC_GetSideFromID;

					if (_sideID != WFBE_C_UNKNOWN_ID) then {
						if (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_side]) then {[_side,"LostAt",["Strongpoint",_town]] Spawn SideMessage};
					};

					if (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_newSide]) then {[_newSide,"CapturedNear",["Strongpoint",_town]] Spawn SideMessage};

					_camp setVariable ["sideID",_newSID,true];
					_flag setFlagTexture (missionNamespace getVariable Format["WFBE_%1FLAG",str _side]);

					[nil, "CampCaptured", [_camp,_newSID,_sideID]] Call WFBE_CO_FNC_SendToClients;
				};
			};
		}else{};

		sleep 0.01;
	};
	sleep 0.1;
};