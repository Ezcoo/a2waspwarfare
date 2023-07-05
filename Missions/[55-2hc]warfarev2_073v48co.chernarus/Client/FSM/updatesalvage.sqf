private["_vehicle","_salvagerRange","_percentage"];

_vehicle = _this select 0;

_salvagerRange = missionNamespace getVariable "WFBE_C_UNITS_SALVAGER_SCAVENGE_RANGE";
_percentage = missionNamespace getVariable "WFBE_C_UNITS_SALVAGER_SCAVENGE_RATIO";


while {!gameOver || !(alive _vehicle)} do {
	if(!(isNull (driver _vehicle)) && !gameOver && alive _vehicle) then 
	{
		_vehicles = nearestObjects [getPos _vehicle, ['Car','Motorcycle','Ship','Air','Tank','StaticWeapon'],_salvagerRange];

		_wrecks = [];
		{
			if !(alive _x) then {_wrecks = _wrecks + [_x]};
		} forEach _vehicles;

		_hqs = [];
		{_hqs = _hqs + [_x Call WFBE_CO_FNC_GetSideHQ]} forEach WFBE_PRESENTSIDES;

		_wrecks = _wrecks - _hqs;

		_overAllCost = 0;
		{
			_isNeeded = _x getVariable 'keepAlive';
		
			if (isNil '_isNeeded') then {
				_get = missionNamespace getVariable (typeOf _x);
				_salvageCost = 250;
				if !(isNil '_get') then {
					_salvageCost = round(((_get select QUERYUNITPRICE)*_percentage) / 100);
				};
		
				_overAllCost = _overAllCost + _salvageCost;
				(Format [localize 'STR_WF_CHAT_Salvaged_Unit',_salvageCost,[typeOf _x,'displayName'] Call GetConfigInfo]) Call GroupChatMessage;
		
				deleteVehicle _x;
			};
		} foreach _wrecks;

		if (_overAllCost > 0) then {(_overAllCost) Call ChangePlayerfunds};
	};
	sleep 5;
};