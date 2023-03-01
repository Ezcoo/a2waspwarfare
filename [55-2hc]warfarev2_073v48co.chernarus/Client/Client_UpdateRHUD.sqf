disableSerialization;

CutRsc["OptionsAvailable","PLAIN",0];
_icons = [
"",
""
];

if (isNil 'BIS_CONTROL_CAM') then { RUBHUD = True } else {RUBHUD = false};

waituntil{!isnil"totalTowns"};

private["_total"];

//// Getting the amount of all towns
_total = count towns;
_secondExecRUBHUD = false;

while {true} do {
	sleep 2;
	if (RUBHUD && !_secondExecRUBHUD) then {
		if (isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {CutRsc["OptionsAvailable","PLAIN",0];_delay = 0};	
		if (!isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {
			_lineLabel = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1345;	
			_textLabel1 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1346;
			_textLabel2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1348;
			//Commander name
			_textLabel3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1350;
			
			_textLabel4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1352;
			_textLabel5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1354;
			_textLabel6 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1356;
			_textLabel7 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1358;
			_textLabel8 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1360;
			//FPS
			_textLabel_FPS_3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1363;
			//Server FPS
			_textLabel_FPS_5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1365;
			
			
			
			_player = Leader player;		
			//Show background
			
			_lineLabel ctrlShow true;
			
			if (side player == WEST) then {
			_lineLabel CtrlSetBackgroundColor [0,0.4,1,1]} else {_lineLabel CtrlSetBackgroundColor [1,0.2,0,1]};
			
			_textLabel1 ctrlSetText "Health:";
			
			_textLabel2 ctrlSetText "UpTime:";
			
			_textLabel3 ctrlSetText "Commander:";
			_textLabel4 ctrlSetText "Money:";
			_textLabel5 ctrlSetText "Income:";
			_textLabel6 ctrlSetText "Supply:";
			_textLabel7 ctrlSetText "SV Min:";
			_textLabel8 ctrlSetText "City:";
			_textLabel_FPS_3 ctrlSetText "FPS Client:";
			_textLabel_FPS_5 ctrlSetText "FPS Server:";
			_textLabel1 ctrlShow true;
			_textLabel2 ctrlShow true;
			_textLabel3 ctrlShow true;
			_textLabel4 ctrlShow true;
			_textLabel5 ctrlShow true;
			_textLabel6 ctrlShow true;
			_textLabel7 ctrlShow true;
			_textLabel8 ctrlShow true;
			_textLabel_FPS_3 ctrlShow true;
			_textLabel_FPS_5 ctrlShow true;
			_lineLabel ctrlShow true;	
				
			//HEALTH		
			_textControl5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1347;
			_textControl5 ctrlShow true;
			_status = damage _player;
			_health = 1 - _status;
			_healthAct = (1 - _status) * 100;
			_textControl5 ctrlSetText Format ["%1/100",str(round _healthAct)];
			if (_health <= 1) then {_textControl5 ctrlSetTextColor [0, 1, 0, 1]};
			if (_health <= 0.89) then {_textControl5 ctrlSetTextColor [1, 0.8831, 0, 1]};
			if (_health <= 0.79) then {_textControl5 ctrlSetTextColor [1, 0.65, 0, 1]};
			if (_health <= 0.60) then {_textControl5 ctrlSetTextColor [1, 0.15, 0, 1]};
			if (_health <= 0.08 ) then {_textControl5 ctrlSetTextColor [0.45, 0.25, 0.25, 1]};
			
			//UPTIME
			_uptime = Call GetTime; //added-MrNiceGuy
			_textControl4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1349;
			_textControl4 ctrlShow true;
			if (_uptime select 2 >= 10)then{
			_textControl4 ctrlSetTextColor [0.7, 0.7, 0.7, 1];_textControl4 ctrlSetText Format ["%1:%2:%3",_uptime select 1,_uptime select 2, _uptime select 3];
			}else{
			_textControl4 ctrlSetTextColor [0.7, 0.7, 0.7, 1];_textControl4 ctrlSetText Format ["%1:0%2:%3",_uptime select 1,_uptime select 2, _uptime select 3];
			};
			
			//COMMANDER
			_textControl2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1351;
			_textControl2 ctrlShow true;
			if (!isNull commanderTeam) then {
			_textControl2 ctrlSetTextColor [0.85, 0, 0, 1];_textControl2 ctrlSetText Format [" %1", name (leader commanderTeam)];	
			}else{
			_textControl2 ctrlSetTextColor [0.85, 0, 0, 1];_textControl2 ctrlSetText Format [" %1", "AI"];
			};
			//MONEY
			_logik = (side player) Call WFBE_CO_FNC_GetSideLogic;
			
			_textControl3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1353;
			_textControl3 ctrlShow true;
			_textControl3 ctrlSetTextColor [0, 0.825294, 0.449803, 1];
			_textControl3 ctrlSetText Format ["%1 $",Call GetPlayerFunds];
			
			_textControl4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1355;
			_textControl4 ctrlShow true;
			_textControl4 ctrlSetTextColor [0, 0.825294, 0.449803, 1];
			_textControl4 ctrlSetText Format ["+ %1 $",sideJoined Call GetIncome];
			//SUPPLY
			_textControl5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1357;
			_textControl5 ctrlShow true;
			_textControl5 ctrlSetTextColor [1, 0.8831, 0, 1];
			_textControl5 ctrlSetText Format ["%1",(sideJoined) Call GetSideSupply];
			
			_textControl6 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1359;
			_textControl6 ctrlShow true;
			_textControl6 ctrlSetTextColor [1, 0.6831, 0, 1];
			_textControl6 ctrlSetText Format ["+ %1", (sideJoined Call GetTotalSupplyValue)]; //, sideJoined Call GetTownsHeld];
			
			
			_textControl7 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1361;
			_textControl7 ctrlShow true;
			_textControl7 ctrlSetTextColor [0.85, 0, 0, 1];
			_textControl7 ctrlSetText Format ["%1 on %2", sideJoined Call GetTownsHeld,_total];				
		
			//Client FPS
			_clientFPS = round(diag_fps);			
			_textControl_FPS_4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1364;
			_textControl_FPS_4 ctrlShow true;
			_textControl_FPS_4 ctrlSetTextColor [0, 1, 0, 1];_textControl_FPS_4 ctrlSetText Format ["%1",_clientFPS];
			if (_clientFPS < 40) then {_textControl_FPS_4 ctrlSetTextColor [1, 0.8431, 0, 1];_textControl_FPS_4 ctrlSetText Format ["%1",_clientFPS]};
			if (_clientFPS < 20) then {_textControl_FPS_4 ctrlSetTextColor [1, 0, 0, 1];_textControl_FPS_4 ctrlSetText Format ["%1",_clientFPS]};

			//Server FPS
			waitUntil { !isNil {missionNamespace getVariable "WFBE_VAR_SERVER_FPS"};};
			
			_serverFPS = missionNamespace getVariable "WFBE_VAR_SERVER_FPS";			
			_textControl_FPS_6 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1366;
			_textControl_FPS_6 ctrlShow true;
			_textControl_FPS_6 ctrlSetTextColor [0, 1, 0, 1];_textControl_FPS_6 ctrlSetText Format ["%1",_serverFPS];
			if (_serverFPS < 35) then {_textControl_FPS_6 ctrlSetTextColor [1, 0.8431, 0, 1];_textControl_FPS_6 ctrlSetText Format ["%1", str (_serverFPS)]};
			if (_serverFPS < 20) then {_textControl_FPS_6 ctrlSetTextColor [1, 0, 0, 1];_textControl_FPS_6 ctrlSetText Format ["%1", str (_serverFPS)]};

			if (!_secondExecRUBHUD) then {_secondExecRUBHUD = true;};
						
		};
	} else {
		if (_secondExecRUBHUD) then {_secondExecRUBHUD = false;};
		if (isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {CutRsc["OptionsAvailable","PLAIN",0];_delay = 0};	
		if (!isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {
			_lineLabel = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1345;	
			_textLabel1 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1346;
			_textLabel2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1348;
			_textLabel3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1350;
			_textLabel4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1352;
			_textLabel5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1354;
			_textLabel6 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1356;
			_textLabel7 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1358;	
			_textLabel8 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1360;
			
			_textControl2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1351;
			_textControl3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1353;
			_textControl4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1355;
			_textControl5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1357;
			_textControl6 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1359;
			_textControl7 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1361;
			
			_textLabel_FPS_3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1362;			
			_textControl_FPS_2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1361;	
			_textControl_FPS_4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1363;						
			
			_textControl2 ctrlShow false;
			_textControl3 ctrlShow false;
			_textControl4 ctrlShow false;
			_textControl5 ctrlShow false;
			_textControl7 ctrlShow false;
			_textControl_FPS_4 ctrlShow false;			
			
			_textLabel1 ctrlShow false;
			_textLabel2 ctrlShow false;
			_textLabel3 ctrlShow false;
			_textLabel4 ctrlShow false;
			_textLabel5 ctrlShow false;
			_textLabel6 ctrlShow false;
			_textLabel7 ctrlShow false;			
			_textLabel_FPS_3 ctrlShow false;		
			
			_lineLabel ctrlShow false;			
		};		
	};
};