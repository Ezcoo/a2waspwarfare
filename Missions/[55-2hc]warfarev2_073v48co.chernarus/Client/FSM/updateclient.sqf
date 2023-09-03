private["_lastCommanderTeam","_changeCommander","_timer"];

commanderTeam = (sideJoined) Call WFBE_CO_FNC_GetCommanderTeam;

_lastCommanderTeam = commanderTeam;
_changeCommander = false;
_timer = 0;

_inactivityTimeout = missionNamespace getVariable "WFBE_C_AFK_TIME";
_inactivityTimeout = _inactivityTimeout * 60; // Convert the given time from minutes to seconds.

while {!gameOver} do {

	//Marty : check the inactivity (AFK, Away From Keyboard) and kick the player after too long time elapsed
	// calculate the elapsed time from last action of the player 
	_currentTime = time ;
	_lastActionTime = player getVariable ["lastActionTime", time];
	_elapsedTime = _currentTime - _lastActionTime ;
	_countDownKick =round(_inactivityTimeout - _elapsedTime);
	//player sideChat format ["Elapsed Time: %1 seconds", _elapsedTime]; // Display the inacticity time of the player for testing purpose	

    if (_countDownKick < 30) then {
		hint format["You are AFK. If you dont move you will be kicked in %1", _countDownKick];
	};

	// Check if the player has been inactive for more than the specified duration, if so he's ejected from the mission.
    if (_elapsedTime > _inactivityTimeout) then {
        
		// Creation of a publicVariable named "kickAFK" that will be detected by BattleEye (customized filter) and will kick the client (=the player) that is using the kickAFK variable.
		// BattleEye is used with publicVariable in order to kick player because the serverCommand has been deactivated by Bohemia since the arma2OA updated for security reason. But Weirdly they didnt mention it clearly.
		// DON'T FORGET TO CREATE THE TEXT FILE FOR BATTLEYE. This text file must be located in the BattlEye folder where the server.cfg of the mission is. This file is called publicVariable.txt and contain the instruction : 5 "kickAFK" 
		_namePlayer = name player ;
		["KICK", format["%1 Kicked for AFKing", _namePlayer]] Call WFBE_CO_FNC_LogContent;

		kickAFK = format["%1 Kicked for AFKing", _namePlayer];
		publicVariable "kickAFK";
	
		//endMission "END1"; //not good. The player stays in the slot. Must be kicked using BattlEye Filter.

    };
	
	// Verify if the player moved since the last check position
	_currentPosition 	= getPos player;
	_lastPosition 		= player getVariable ["lastPosition", getPos player] ;
      
	if (str(_currentPosition) != str(_lastPosition)) then {            	 
         player setVariable ["lastActionTime", time]; // If the player moved, it saves the current time into lastActionTime variable.
    };

	player setVariable ["lastPosition", position player]; // Saving the last position of the player with the current one.
	// Marty. 

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