private["_lastCommanderTeam","_changeCommander","_timer"];

commanderTeam = (sideJoined) Call WFBE_CO_FNC_GetCommanderTeam;

_lastCommanderTeam = commanderTeam;
_changeCommander = false;
_timer = 0;

//Marty : AFK time inactivity in seconds (10 min = 600 s)
//_inactivityTimeout = 10; 
_inactivityTimeout = 600;
while {!gameOver} do {
	//Marty : check the inactivity (Away From Keyboard, AFK) and kick the player after too long time elapsed
	// calculate the elapsed time from last action of the player 
    _currentTime = time ;
	_lastActionTime = player getVariable ["lastActionTime", time];
	_elapsedTime = _currentTime - _lastActionTime ;
	//player sideChat format ["Elapsed Time: %1 seconds", _elapsedTime];

    // Check if the player has been inactive for more than the specified duration, if so he's ejected from the mission.
    if (_elapsedTime > _inactivityTimeout) then {
        
        hint "you are terminated for AFKing";// Afficher un message de déconnexion
		//_name = name player ;
		//player sideChat format ["_name: %1", _name];
		//serverCommand format ["#kick %1",_name];
		//failMission "END1";
		
		endMission "END1"; //not good. The player stays in the slot. Must be kicked using servercommand.
    };
	
	// Verify if the player moved since the last check position
	_currentPosition 	= getPos player;
	_lastPosition 		= player getVariable ["lastPosition", getPos player] ;
      
	if (str(_currentPosition) != str(_lastPosition)) then {            	 
         player setVariable ["lastActionTime", time]; // If the player moved, it saves the current time

    };
	player setVariable ["lastPosition", position player]; // Saving the last position of the player with the current one.
	//Marty 

	commanderTeam = (sideJoined) Call WFBE_CO_FNC_GetCommanderTeam;
	if (IsNull commanderTeam && !IsNull _lastCommanderTeam) then {_changeCommander = true};
	if (!IsNull commanderTeam && IsNull _lastCommanderTeam) then {_changeCommander = true};
	if (!isNull commanderTeam && !isNull _lastCommanderTeam) then {
		if (commanderTeam != _lastCommanderTeam) then {_changeCommander = true};
	};

	if(_changeCommander && !gameOver) then {
		_changeCommander = false;
		_lastCommanderTeam = commanderTeam;
		_MHQ = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;

		if (IsNull commanderTeam) then {
			if (!IsNull _MHQ) then {
				_MHQ RemoveAction 0;
				_MHQ RemoveAction 1;
				_MHQ RemoveAction 2;
				_MHQ RemoveAction 3;
			};
			if (!isNil "HQAction") then {player removeAction HQAction};
			if (count (hcAllGroups player) > 0) then {HCRemoveAllGroups player};
			{[_x,false] Call SetTeamAutonomous} forEach clientTeams;
		};

		if (!isNull(commanderTeam)) then {
			if (commanderTeam == Group player) then {
				if (!IsNull _MHQ) then {
					_MHQ addAction [localize "STR_WF_Unlock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && locked _target'];
					_MHQ addAction [localize "STR_WF_Lock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && !(locked _target)'];
				};
				_deployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
				if (_deployed) then {
					[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_DEPLOYED",true,MCoin] Call Compile PreprocessFile "Client\Init\Init_Coin.sqf";
				} else {
					[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call Compile PreprocessFile "Client\Init\Init_Coin.sqf";
				};
				HQAction = leader(group player) addAction [localize "STR_WF_BuildMenu","Client\Action\Action_Build.sqf", [_MHQ], 100, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"];
				[Localize "STR_WF_CHAT_PlayerCommander"] Call TitleTextMessage;

				playSound ["playerSelectedAsCommander", true];

				["INFORMATION", Format ["Player %1 has become a new commander in %2 team).", name player, side group player]] Call WFBE_CO_FNC_LogContent;
			} else {
				if (!isNil "HQAction") then {player removeAction HQAction};
				if (count (hcAllGroups player) > 0) then {HCRemoveAllGroups player};
			};
		};
	};
	sleep 1;
};