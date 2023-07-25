Private ['_HQRadio','_base','_buildings','_condition','_get','_idbl','_isDeployed','_oc','_weat','_rearmor'];

["INITIALIZATION", Format ["Init_Client.sqf: Client initialization begins at [%1]", time]] Call WFBE_CO_FNC_LogContent;

sideJoined = side player;
sideJoinedText = str sideJoined;
//--- WF3 Compatible.
WFBE_Client_SideJoined = sideJoined;
WFBE_Client_SideJoinedText = sideJoinedText;
WFBE_Allow_HostileGearSaving = true;

player call Compile preprocessFileLineNumbers "WASP\rpg_dropping\DropRPG.sqf";
//--- Position the client on the temp spawn (Common is not yet init'd so we call is straigh away).
player setPos ([getMarkerPos Format["%1TempRespawnMarker",sideJoinedText],1,10] Call Compile preprocessFile "Common\Functions\Common_GetRandomPosition.sqf");
(vehicle player) addEventHandler ["Fired",{_this Spawn HandleAT}]; (vehicle player) addEventHandler ["Fired",{_this Spawn HandleRocketTraccer}];

_rearmor = {
   				_ammo = _this select 4;
   				_result = 0;

   				switch (_ammo) do {
                    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
     				default {_result = _this select 2;};
    			};
   				_result
  			};

player addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
[] execVM "Common\Functions\Common_Bipod.sqf";

BoundariesIsOnMap = Compile preprocessFile "Client\Functions\Client_IsOnMap.sqf";
BoundariesHandleOnMap = Compile preprocessFile "Client\Functions\Client_HandleOnMap.sqf";
BuildUnit = Compile preprocessFile "Client\Functions\Client_BuildUnit.sqf";
ChangePlayerFunds = Compile preprocessFile "Client\Functions\Client_ChangePlayerFunds.sqf";
CommandChatMessage = Compile preprocessFile "Client\Functions\Client_CommandChatMessage.sqf";
FX = Compile preprocessFile "Client\Functions\Client_FX.sqf";
GetIncome = Compile preprocessFile "Client\Functions\Client_GetIncome.sqf";
GetPlayerFunds = Compile preprocessFile "Client\Functions\Client_GetPlayerFunds.sqf";
GetRespawnAvailable = Compile preprocessFile "Client\Functions\Client_GetRespawnAvailable.sqf";
GetStructureMarkerLabel = Compile preprocessFile "Client\Functions\Client_GetStructureMarkerLabel.sqf";
GetTime = Compile preprocessFile "Client\Functions\Client_GetTime.sqf";
GroupChatMessage = Compile preprocessFile "Client\Functions\Client_GroupChatMessage.sqf";
HandleHQAction = Compile preprocessFile "Client\Functions\Client_HandleHQAction.sqf";
HandlePVF = Compile preprocessFile "Client\Functions\Client_HandlePVF.sqf";
MarkerAnim = Compile preprocessFile "Client\Functions\Client_MarkerAnim.sqf";
OnRespawnHandler = Compile preprocessFile "Client\Functions\Client_OnRespawnHandler.sqf";
PreRespawnHandler = Compile preprocessFile "Client\Functions\Client_PreRespawnHandler.sqf";
ReplaceArray = Compile preprocessFile "Client\Functions\Client_ReplaceArray.sqf";
RequestFireMission = Compile preprocessFile "Client\Functions\Client_RequestFireMission.sqf";
SetControlFadeAnim = Compile preprocessFile "Client\Functions\Client_SetControlFadeAnim.sqf";
SetControlFadeAnimStop = Compile preprocessFile "Client\Functions\Client_SetControlFadeAnimStop.sqf";
SupportHeal = Compile preprocessFile "Client\Functions\Client_SupportHeal.sqf";
SupportRearm = Compile preprocessFile "Client\Functions\Client_SupportRearm.sqf";
SupportRefuel = Compile preprocessFile "Client\Functions\Client_SupportRefuel.sqf";
SupportRepair = Compile preprocessFile "Client\Functions\Client_SupportRepair.sqf";
TaskSystem = Compile preprocessFile "Client\Functions\Client_TaskSystem.sqf";
TitleTextMessage = Compile preprocessFile "Client\Functions\Client_TitleTextMessage.sqf";
UIChangeComboBuyUnits = Compile preprocessFile "Client\Functions\Client_UIChangeComboBuyUnits.sqf";
UIFillListBuyUnits = Compile preprocessFile "Client\Functions\Client_UIFillListBuyUnits.sqf";
UIFillListTeamOrders = Compile preprocessFile "Client\Functions\Client_UIFillListTeamOrders.sqf";
UIFindLBValue = Compile preprocessFile "Client\Functions\Client_UIFindLBValue.sqf";


//--- Namespace related (GUI).
BIS_FNC_GUIset = {UInamespace setVariable [_this select 0, _this select 1]};
BIS_FNC_GUIget = {UInamespace getVariable (_this select 0)};

//--- New Fnc.
WFBE_CL_FNC_ChangeClientFunds = Compile preprocessFileLineNumbers "Client\Functions\Client_ChangePlayerFunds.sqf";
WFBE_CL_FNC_DelegateTownAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateTownAI.sqf";
WFBE_CL_FNC_DelegateAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAI.sqf";
WFBE_CL_FNC_DelegateAIStaticDefence = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAIStaticDefence.sqf";
WFBE_CL_FNC_GetAIID = Compile preprocessFileLineNumbers "Client\Functions\Client_GetAIID.sqf";
WFBE_CL_FNC_GetBackpackContent = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Client\Functions\Client_GetBackpackContent.sqf"} else {{[[],[]]}};
WFBE_CL_FNC_GetClientFunds = Compile preprocessFileLineNumbers "Client\Functions\Client_GetPlayerFunds.sqf";
WFBE_CL_FNC_GetClosestAirport = Compile preprocessFileLineNumbers "Client\Functions\Client_GetClosestAirport.sqf";
WFBE_CL_FNC_GetClosestCamp = Compile preprocessFileLineNumbers "Client\Functions\Client_GetClosestCamp.sqf";
WFBE_CL_FNC_GetClosestDepot = Compile preprocessFileLineNumbers "Client\Functions\Client_GetClosestDepot.sqf";
WFBE_CL_FNC_GetGearCargoSize = Compile preprocessFileLineNumbers "Client\Functions\Client_GetGearCargoSize.sqf";
WFBE_CL_FNC_GetMagazinesSize = Compile preprocessFileLineNumbers "Client\Functions\Client_GetMagazinesSize.sqf";
WFBE_CL_FNC_GetParsedGear = Compile preprocessFileLineNumbers "Client\Functions\Client_GetParsedGear.sqf";
WFBE_CL_FNC_GetVehicleCargoSize = Compile preprocessFileLineNumbers "Client\Functions\Client_GetVehicleCargoSize.sqf";
WFBE_CL_FNC_GetVehicleContent = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Client\Functions\Client_GetVehicleContent.sqf"} else {{[[],[],[]]}};
WFBE_CL_FNC_GetUnitBackpack = if !(WF_A2_Vanilla) then {Compile preprocessFileLineNumbers "Client\Functions\Client_GetUnitBackpack.sqf"} else {{""}};
WFBE_CL_FNC_HandlePVF = Compile preprocessFileLineNumbers "Client\Functions\Client_HandlePVF.sqf";
WFBE_CL_FNC_OnKilled = Compile preprocessFileLineNumbers "Client\Functions\Client_OnKilled.sqf";
WFBE_CL_FNC_OperateCargoGear = Compile preprocessFileLineNumbers "Client\Functions\Client_OperateCargoGear.sqf";
WFBE_CL_FNC_ReplaceMagazinesGear = Compile preprocessFileLineNumbers "Client\Functions\Client_ReplaceMagazinesGear.sqf";
WFBE_CL_FNC_RemoveMagazineGear = Compile preprocessFileLineNumbers "Client\Functions\Client_RemoveMagazineGear.sqf";
WFBE_CL_FNC_UI_Gear_AddTemplate = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_AddTemplate.sqf";
WFBE_CL_FNC_UI_Gear_DeleteTemplate = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_DeleteTemplate.sqf";
WFBE_CL_FNC_UI_Gear_DisplayInventory = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_DisplayInventory.sqf";
WFBE_CL_FNC_UI_Gear_FillCargoList = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_FillCargoList.sqf";
WFBE_CL_FNC_UI_Gear_FillList = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_FillList.sqf";
WFBE_CL_FNC_UI_Gear_FillTemplates = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_FillTemplates.sqf";
WFBE_CL_FNC_UI_Gear_ParseTemplateContent = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_ParseTemplateContent.sqf";
WFBE_CL_FNC_UI_Gear_Sanitize = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_Sanitize.sqf";
WFBE_CL_FNC_UI_Gear_UpdatePrice = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_UpdatePrice.sqf";
WFBE_CL_FNC_UI_Gear_UpdateTarget = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_UpdateTarget.sqf";
WFBE_CL_FNC_UI_Gear_UpdateView = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_UpdateView.sqf";
WFBE_CL_FNC_UI_Respawn_Selector = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Respawn_Selector.sqf";

//Affichage Rubber maps:
	Local_GUIWorking = false;
	//GPS BASE ZOOM
	zoomgps = 0.025;

	[]spawn{
		while {!gameover} do{
			if (/*Local_GUIActive &&*/ !Local_GUIWorking /*&& (isNull Local_Camera)*/ && !(visibleMap) && (isNil "BIS_CONTROL_CAM") /*&& (RUBOSD == 1)*/) then {Local_GUIWorking=true; 1365 cutRsc ["RscOverlay","PLAIN",0]};//if GUI is not working, but it should - restart it
			sleep 0.8;
		};
	};


Call Compile preprocessFileLineNumbers 'Client\Functions\Client_FNC_Groups.sqf'; //--- FUNCTIONS: Groups.
Call Compile preprocessFileLineNumbers 'Client\Functions\Client_FNC_OnFired.sqf'; //--- FUNCTIONS: onFired EH.
Call Compile preprocessFileLineNumbers 'Client\Functions\Client_FNC_Special.sqf'; //--- FUNCTIONS: Specials.

//clientInitComplete = true;

//--- UI Namespace release from previous possible games (only on titles dialog!).
{uiNamespace setVariable [_x, displayNull]} forEach ["wfbe_title_capture"];

//--- Waiting for the common part to be executed.
waitUntil {commonInitComplete};

["INITIALIZATION", Format ["Init_Client.sqf: Common initialization is complete at [%1]", time]] Call WFBE_CO_FNC_LogContent;

if (ARMA_VERSION >= 162 && ARMA_RELEASENUMBER > 97105 || ARMA_VERSION > 162) then {
	//--- Profile namespace related.
	WFBE_CL_FNC_UI_Gear_SaveTemplateProfile = Compile preprocessFileLineNumbers "Client\Functions\Client_UI_Gear_SaveTemplateProfile.sqf";
	Call Compile preprocessFileLineNumbers "Client\Init\Init_ProfileVariables.sqf";
};

//--- Queue Protection.
missionNamespace setVariable ['WFBE_C_QUEUE_BARRACKS',0];
missionNamespace setVariable ['WFBE_C_QUEUE_BARRACKS_MAX',10];
missionNamespace setVariable ['WFBE_C_QUEUE_LIGHT',0];
missionNamespace setVariable ['WFBE_C_QUEUE_LIGHT_MAX',5];
missionNamespace setVariable ['WFBE_C_QUEUE_HEAVY',0];
missionNamespace setVariable ['WFBE_C_QUEUE_HEAVY_MAX',5];
missionNamespace setVariable ['WFBE_C_QUEUE_AIRCRAFT',0];
missionNamespace setVariable ['WFBE_C_QUEUE_AIRCRAFT_MAX',2];
missionNamespace setVariable ['WFBE_C_QUEUE_AIRPORT',0];
missionNamespace setVariable ['WFBE_C_QUEUE_AIRPORT_MAX',2];
missionNamespace setVariable ['WFBE_C_QUEUE_DEPOT',0];
missionNamespace setVariable ['WFBE_C_QUEUE_DEPOT_MAX',4];

//--- Handle the weather.
_weat = missionNamespace getVariable "WFBE_C_ENVIRONMENT_WEATHER";
if (_weat != 3) then {
	_oc = 0.05;
	switch (_weat) do {
		case 0: {_oc = 0};
		case 1: {_oc = 0.5};
		case 2: {_oc = 1};
	};
	60 setOvercast _oc;
};

if ((missionNamespace getVariable "WFBE_C_ENVIRONMENT_WEATHER_VOLUMETRIC") > 0) then {[] Exec "CA\Modules\clouds\data\scripts\bis_cloudsystem.sqs"};

//--- Global Client Variables.
sideID = sideJoined Call GetSideID;
clientTeam = group player;
clientTeams = missionNamespace getVariable Format['WFBE_%1TEAMS',sideJoinedText];
playerType = typeOf player;
playerDead = false;
paramBoundariesRunning = false;

disableserialization;
keyPressed = compile preprocessFile "Common\Functions\Common_DisableTablock.sqf";
keyPressedViewDistance = compile preprocessFile "Common\Functions\Common_AdjustViewDistance.sqf";
_display = findDisplay 46;
_display displayAddEventHandler ["KeyDown","_this call keyPressed"];
_display displayAddEventHandler ["KeyDown","_this call keyPressedViewDistance"];

(vehicle player) addEventHandler ["Fired",{_this Spawn HandleAT}];
execVM "WASP\global_marking_monitor.sqf";
WFBE_Client_Logic = (WFBE_Client_SideJoined) Call WFBE_CO_FNC_GetSideLogic;
WFBE_Client_SideID = sideID;
WFBE_Client_Color = switch (WFBE_Client_SideJoined) do { case west: {missionNamespace getVariable "WFBE_C_WEST_COLOR"}; case east: {missionNamespace getVariable "WFBE_C_EAST_COLOR"}; case resistance: {missionNamespace getVariable "WFBE_C_GUER_COLOR"}};
WFBE_Client_Team = clientTeam;
WFBE_Client_Teams = clientTeams;
WFBE_Client_Teams_Count = count WFBE_Client_Teams;
WFBE_Client_IsRespawning = false;
WFBE_Client_LastGroupJoinRequest = -5000;
WFBE_Client_PendingRequests = [];
WFBE_Client_PendingRequests_Accepted = [];

commanderTeam = objNull;
buildingMarker = 0;
CCMarker = 0;
gearCost = 0;
currentTG = 50;
if (currentTG == 50) then {setTerrainGrid currentTG};
lastBuilt = [];
unitQueu = 0;
fireMissionTime = -1000;
artyRange = 15;
artyPos = [0,0,0];
playerUAV = objNull;
comTask = objNull;
voted = false;
votePopUp = true;
manningDefense = true;
currentFX = 0;
lastParaCall = -1200;
lastSupplyCall = -1200;
canBuildWHQ = true;
WFBE_RespawnDefaultGear = false;
WFBE_ForceUpdate = true;

//--- Load Terrain grid if it wasn't loaded from the profile.
if (isNil 'currentTG') then {
	currentTG = if ((missionNamespace getVariable "WFBE_C_ENVIRONMENT_MAX_CLUTTER") < 25) then {missionNamespace getVariable "WFBE_C_ENVIRONMENT_MAX_CLUTTER"} else {25};
	setTerrainGrid currentTG;
};

hqInRange = false;
barracksInRange = false;
gearInRange = false;
lightInRange = false;
heavyInRange = false;
aircraftInRange = false;
serviceInRange = false;
commandInRange = false;
depotInRange = false;
antiAirRadarInRange = false;
hangarInRange = false;

enableTeamSwitch false;

//--- Import the client side upgrade informations.
ExecVM "Common\Config\Core_Upgrades\Labels_Upgrades.sqf";

//--- Update the player.
if (isMultiplayer) then {["RequestSpecial", ["update-teamleader", WFBE_Client_Team, player]] Call WFBE_CO_FNC_SendToServer};

/* HUD ON/OFF VALUE */
if (isNil "RUBHUD") then {RUBHUD = true};
if (isNil "RUBGPS") then {RUBGPS = 1};
if (isNil "RUBOSD") then {RUBOSD = 1};

/* HUD MODULE */
ExecVM "Client\Client_UpdateRHUD.sqf";

//--- Disable Artillery Computer.
Call Compile "enableEngineArtillery false;";

//--- Commander % stock init.
if ((missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM") in [3,4]) then {
	if (isNil {WFBE_Client_Logic getVariable "wfbe_commander_percent"}) then {WFBE_Client_Logic setVariable ["wfbe_commander_percent", 70]};
};

/* Exec SQF|FSM Misc stuff. */
if ((missionNamespace getVariable "WFBE_C_UNITS_TRACK_LEADERS") > 0) then {[] execVM "Client\FSM\updateteamsmarkers.sqf"};
[] execFSM "Client\FSM\updateactions.fsm";
/* Don't pause the client initialization process. */
[] Spawn {
	waitUntil {townInit};
	/* Handle the capture GUI */
	["INITIALIZATION", "Init_Client.sqf: Initializing the Town Capture FSM"] Call WFBE_CO_FNC_LogContent;
	[] execVM "Client\FSM\client_title_capture.sqf";
	/* Handle the map town markers */
	["INITIALIZATION", "Init_Client.sqf: Initializing the Towns Marker FSM"] Call WFBE_CO_FNC_LogContent;
	[] execVM "Client\FSM\updatetownmarkers.sqf";
	waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_structures"}};
	if ((missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0) then {
		waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_supply"}};
	};
	/* Handle the client actions */
	["INITIALIZATION", "Init_Client.sqf: Initializing the Available Actions FSM"] Call WFBE_CO_FNC_LogContent;
	[] execFSM "Client\FSM\updateavailableactions.fsm";
	/* Resources Handler */
	if !((missionNamespace getVariable "WFBE_C_ECONOMY_INCOME_SYSTEM") in [3,4]) then {
		["INITIALIZATION", "Init_Client.sqf: Initializing the Resources SQF"] Call WFBE_CO_FNC_LogContent;
		(sideJoined) execVM "Client\FSM\resources_cli.sqf";
	};
};

[] Spawn {
	Private ["_commanderTeam"];
	waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_commander"}};
	/* Commander Handling */
	["INITIALIZATION", "Init_Client.sqf: Initializing the Commander Update FSM"] Call WFBE_CO_FNC_LogContent;
	[] ExecVM "Client\FSM\updateclient.sqf";
};

//--- Add the briefing (notes).
[] Call Compile preprocessFile "briefing.sqf";

//--- HQ Radio system.
waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_radio_hq"}};
_HQRadio = WFBE_Client_Logic getVariable "wfbe_radio_hq";
["INITIALIZATION", Format["Init_Client.sqf: Initialized the Radio Announcer [%1]", _HQRadio]] Call WFBE_CO_FNC_LogContent;
waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_radio_hq_id"}};
WFBE_V_HQTopicSide = WFBE_Client_Logic getVariable "wfbe_radio_hq_id";
["INITIALIZATION", Format["Init_Client.sqf: Initializing the Radio Announcer Identity [%1]", WFBE_V_HQTopicSide]] Call WFBE_CO_FNC_LogContent;
_HQRadio setIdentity WFBE_V_HQTopicSide;
_HQRadio setRank "COLONEL";
_HQRadio setGroupId ["HQ"];
_HQRadio kbAddTopic [WFBE_V_HQTopicSide,"Client\kb\hq.bikb","Client\kb\hq.fsm",{call compile preprocessFileLineNumbers "Client\kb\hq.sqf"}];
player kbAddTopic [WFBE_V_HQTopicSide,"Client\kb\hq.bikb","Client\kb\hq.fsm",{call compile preprocessFileLineNumbers "Client\kb\hq.sqf"}];
sideHQ = _HQRadio;

["INITIALIZATION", "Init_Client.sqf: Radio announcer is initialized."] Call WFBE_CO_FNC_LogContent;

/* Wait for a valid signal (Teamswaping) with failover */
if (isMultiplayer && (missionNamespace getVariable "WFBE_C_GAMEPLAY_TEAMSWAP_DISABLE") > 0 && time > 7) then {
	Private ["_get","_timelaps"];
	_get = true;

	sleep (random 0.1);

	["RequestJoin", [player, sideJoined]] Call WFBE_CO_FNC_SendToServer;

	_timelaps = 0;
	while {true} do {
		sleep 0.1;
		_get = missionNamespace getVariable 'WFBE_P_CANJOIN';
		if !(isNil '_get') exitWith {["INITIALIZATION", Format["Init_Client.sqf: [%1] Client [%2], Can join? [%3]",sideJoined,name player,_get]] Call WFBE_CO_FNC_LogContent};

		_timelaps = _timelaps + 0.1;
		if (_timelaps > 5) then {
			_timelaps = 0;
			["WARNING", Format["Init_Client.sqf: [%1] Client [%2] join is pending... no ACK was received from the server, a new request will be submited.",sideJoined,name player]] Call WFBE_CO_FNC_LogContent;
			["RequestJoin", [player, sideJoined]] Call WFBE_CO_FNC_SendToServer;
		};
	};

	if !(_get) exitWith {
		["WARNING", Format["Init_Client.sqf: [%1] Client [%2] has teamswapped/STACKED and is now being sent back to the lobby.",sideJoined,name player]] Call WFBE_CO_FNC_LogContent;

		sleep 3;
		failMission "END1";
	};
};

/* Get the client starting location */
["INITIALIZATION", "Init_Client.sqf: Retrieving the client spawn location."] Call WFBE_CO_FNC_LogContent;
_base = objNull;
if (time < 30) then {
	waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_startpos"}};
	_base = WFBE_Client_Logic getVariable "wfbe_startpos";
} else {
	waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_hq"}};
	waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_structures"}};
	_base = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
	_buildings = (sideJoined) Call WFBE_CO_FNC_GetSideStructures;

	if (count _buildings > 0) then {_base = _buildings select 0};
};

["INITIALIZATION", Format["Init_Client.sqf: Client spawn location has been determined at [%1].", _base]] Call WFBE_CO_FNC_LogContent;

/* Position the client at the previously defined location */
player setPos ([_base,20,30] Call GetRandomPosition);

/* HQ Building Init. */
waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_hq_deployed"}};
["INITIALIZATION", "Init_Client.sqf: Initializing COIN Module."] Call WFBE_CO_FNC_LogContent;
_isDeployed = (sideJoined) Call WFBE_CO_FNC_GetSideHQDeployStatus;
if (_isDeployed) then {
	[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_DEPLOYED",true,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
} else {
	[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
};

//--- Add Killed EH to the HQ on each client if needed (JIP), skip LAN host.
if (!isServer && !_isDeployed) then {
	[] spawn {
		waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_hq"}};
		(WFBE_Client_SideJoined Call WFBE_CO_FNC_GetSideHQ) addEventHandler ["killed", {["RequestSpecial", ["process-killed-hq", _this]] Call WFBE_CO_FNC_SendToServer}];
	};
};

_greenList = [];
{_greenList = _greenList + [missionNamespace getVariable Format ["%1%2",WFBE_Client_SideJoinedText,_x]]} forEach ["BAR","LVF","HEAVY","AIR"];
missionNamespace setVariable ["COIN_UseHelper", _greenList];

/* Options menu. */
Options = player addAction ["<t color='#42b6ff'>" + (localize "STR_WF_Options") + "</t>","Client\Action\Action_Menu.sqf", "", 1, false, true, "", "_target == player"];

/* Zeta Cargo Lifter. */
[] Call Compile preprocessFile "Client\Module\ZetaCargo\Zeta_Init.sqf";
/* Set Groups ID. */
[] Call Compile preprocessFile "Client\Functions\Client_SetGroupsID.sqf";

sleep 1;

//--- Make sure that player is always the leader.
if (leader(group player) != player) then {(group player) selectLeader player};

/* Override player's Gear.*/
// [player,Format ["WFBE_%1DEFAULTWEAPONS",sideJoinedText] Call GetNamespace,Format ["WFBE_%1DEFAULTAMMO",sideJoinedText] Call GetNamespace] Call EquipLoadout;
/* Skill Module. */
[] Call Compile preprocessFile "Client\Module\Skill\Skill_Init.sqf";


_default = [];
switch (WFBE_SK_V_Type) do {
case "Spotter": {_default = missionNamespace getVariable Format["WFBE_%1_DefaultGearSpot", WFBE_Client_SideJoinedText]};
case "Officer": {_default = missionNamespace getVariable Format["WFBE_%1_DefaultGearOfficer", WFBE_Client_SideJoinedText]};
case "Soldier": {_default = missionNamespace getVariable Format["WFBE_%1_DefaultGearSoldier", WFBE_Client_SideJoinedText]};
case "Engineer": {_default = missionNamespace getVariable Format["WFBE_%1_DefaultGearEngineer", WFBE_Client_SideJoinedText]};
case "SpecOps": {_default = missionNamespace getVariable Format["WFBE_%1_DefaultGearLock", WFBE_Client_SideJoinedText]};
case "Medic": {_default = missionNamespace getVariable Format["WFBE_%1_DefaultGearMedic", WFBE_Client_SideJoinedText]};
};

//_default = missionNamespace getVariable Format["WFBE_%1_DefaultGear", WFBE_Client_SideJoinedText];
if (count _default <= 3) then {
	[player, _default select 0, _default select 1, _default select 2] Call WFBE_CO_FNC_EquipUnit;
} else {
	[player, _default select 0, _default select 1, _default select 2, _default select 3, _default select 4] Call WFBE_CO_FNC_EquipUnit;
};

/* Default gear menu filler. */
WF_Logic setVariable ['filler','primary'];

/* Skill Module. */
[] Call Compile preprocessFile "Client\Module\Skill\Skill_Init.sqf";
(player) Call WFBE_SK_FNC_Apply;

[] execVM "WASP\baserep\init.sqf";
[] execVM "WASP\actions\AddActions.sqf";

/* Vote System, define whether a vote is already running or not */
waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_votetime"}};
["INITIALIZATION", "Init_Client.sqf: Vote system is initialized."] Call WFBE_CO_FNC_LogContent;
if ((WFBE_Client_Logic getVariable "wfbe_votetime") > 0) then {createDialog "WFBE_VoteMenu"};

/* Debug System - Client */
if (WF_Debug) then {
	onMapSingleClick "vehicle player setpos _pos;(vehicle player) setVelocity [0,0,-0.1];diag_log getpos player;"; //--- Teleport

	//player addEventHandler ["HandleDamage", {false}];
	// player setCaptive true;
	player addEventHandler ["HandleDamage", {false;if (player != (_this select 3)) then {(_this select 3) setDammage 1}}]; //--- God-Slayer mode.
};
execVM "limitThirdPersonView.sqf";

if ((missionNamespace getVariable "WFBE_C_ARTILLERY_UI") > 0) then {[] ExecVM "ca\modules\ARTY\data\scripts\init.sqf"}; //--- Artillery UI.
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_EASA") > 0) then {Call Compile preprocessFileLineNumbers "Client\Module\EASA\EASA_Init.sqf"}; //--- EASA.
if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") > 0 && WF_A2_Vanilla) then {Call Compile preprocessFileLineNumbers "Client\Module\CM\CM_Init.sqf"}; //--- Countermeasures.

/* Key Binding */
[] Call Compile preprocessFile "Client\Init\Init_Keybind.sqf";

/* JIP Handler */
waitUntil {townInit};
["INITIALIZATION", "Init_Client.sqf: Towns are initialized."] Call WFBE_CO_FNC_LogContent;

//--- Define the CoIn placement method.
switch (missionNamespace getVariable "WFBE_C_STRUCTURES_COLLIDING") do {
    //--- Smooth.
    case 1: {
		missionNamespace setVariable ["WFBE_C_STRUCTURES_PLACEMENT_METHOD",{
           		 Private ["_color","_itemcategory","_preview","_area","_eside"];
			_itemcategory = _this select 0;
			_preview = _this select 1;
			_color = _this select 2;
            _eside = if (side commanderTeam == west) then {east} else {west};
            	_affected = ["Warfare_HQ_base_unfolded","Base_WarfareBBarracks","Base_WarfareBLightFactory","Base_WarfareBHeavyFactory",
            					"Base_WarfareBAircraftFactory","Base_WarfareBUAVterminal","Base_WarfareBVehicleServicePoint","BASE_WarfareBAntiAirRadar"];
			_area = [_preview,((sidejoined) Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_basearea"] Call WFBE_CO_FNC_GetClosestEntity2;

            	if(_area getVariable 'avail' <= 0) then { _color = _colorRed };
           		if (surfaceIsWater(position _preview)) then { _color = _colorRed };

			if ({_preview isKindOf _x} count _affected != 0) then {
                	Private["_building","_sort","_strs","_lax","_lay"];
                	_strs = ((position _preview) nearObjects ["House",25]) - [_preview];
               		if (count _strs == 0) exitWith {};
                	_sort = [_preview,_strs] Call SortByDistance;
                	_building = _sort select 0;
                	_lax=((boundingBox _building) select 1) select 0;
                	_lay=((boundingBox _building) select 1) select 1;
                	if(_preview distance _building < 1.5*(_lax max _lay)) then {
				_color = _colorRed
			} else{
				_color = _colorGreen
			};
            	};

			if (_itemcategory == 2) then {

                	Private["_i","_factory","_sorted","_walls","_factories","_area","_lx","_ly","_type","_p","_entities"];

                	_color = _colorGreen;
                	_walls = nearestObjects [_preview,[typeOf _preview],2];

                	if(count _walls > 1) then {_color = _colorRed} else{_color = _colorGreen};
                if(count (nearestObjects [_preview,missionNamespace getVariable (Format["WFBE_%1DEFENSENAMES",sideJoined]),((((boundingbox _preview) select 1) select 0) max (((boundingbox _preview) select 1) select 1)) max 2] - [_preview]) > 0) then {_color = _colorRed} else{_color = _colorGreen};
				_entities = (position _preview) nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'],12];
				if ((count _entities > 0) && {side _x != sideJoined} count _entities !=0) then {_color = _colorRed};
                _factories =	 nearestObjects[_preview,["Warfare_HQ_base_unfolded","WarfareBBaseStructure","Base_WarfareBContructionSite"],25];
				if (count _factories == 0) exitWith {};
                _sorted = [_preview,_factories] Call SortByDistance;
                _factory = _sorted select 0;
                _type=typeOf _factory;
                _lx=((boundingbox _factory) select 1) select 0;
                _ly=((boundingbox _factory) select 1) select 1;

                switch (true) do {
					case ( _factory isKindOf "Warfare_HQ_base_unfolded"):{_p=0.6};
					case ( _factory isKindOf "Base_WarfareBBarracks"):{_p=0.57};
					case ( _factory isKindOf "Base_WarfareBLightFactory"):{_p=0.6};
					case ( _factory isKindOf "Base_WarfareBHeavyFactory"):{_p=0.54};
					case ( _factory isKindOf "Base_WarfareBAircraftFactory"):{_p=0.74};
					case ( _factory isKindOf "Base_WarfareBUAVterminal"):{_p=1};
					case ( _factory isKindOf "Base_WarfareBContructionSite"):{_p=12};

					default {_p=1};
				};

                	if(_preview distance _factory < _p*(_lx min _ly)) then {_color = _colorRed};

			}else{
				private ["_objects","_sideEfacs","_object"];
				_sideEfacs = if (side commanderTeam == west) then {east} else {west};
				_objects = nearestObjects [_preview,["WarfareBBaseStructure","Base_WarfareBContructionSite"],25];
				if (count _objects > 0) then {
					if (side (_objects select 0) == _sideEfacs && _preview distance (_objects select 0) < 10)then {_color = _colorRed};
				};
			};

			if (_itemcategory == 3) then {
				Private["_camos"];
				_color = _colorGreen;
                _camos = nearestObjects [_preview,[typeOf _preview],25];

                	if(count _camos > 1) then {
                    	_color = _colorRed
                    } else{
                	_color = _colorGreen};
			};

			if (typeOf _preview == "Sign_Danger" && !isNull ([_preview,((sidejoined) Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_basearea"] Call WFBE_CO_FNC_GetClosestEntity2)) then {
				_color = _colorRed;
				hintsilent "Minefields are not allowed at base!";
			};
            	if (_itemcategory != 0 && typeOf _preview isKindOf "Base_WarfareBVehicleServicePoint") then {
                	_color = _colorGreen;
            	};

            	if ((typeOf _preview) isKindOf "StaticWeapon") then { _color = _colorGreen; };

			if (_itemcategory == 0) then {
				Private ["_town","_townside","_eArea"];
				_town = [_preview] Call GetClosestLocation;
			    _townside =  (_town getVariable "sideID") Call GetSideFromID;
			    _eArea = [_preview,((_eside) Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_basearea"] Call WFBE_CO_FNC_GetClosestEntity3;
	            if ((_preview distance _town < 600 && _townside != sideJoined) || !isNull _eArea) then {
					_color = _colorRed;
					 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
				};
	        };

            	if( !((typeOf _preview) iskindOf "Warfare_HQ_base_unfolded"))then{
                    _current_side  = side commanderTeam;
                    _opposite_side = east;

                    if(_current_side == west)then{
                        _opposite_side = east;
	} else{
                        _opposite_side = west;
	};

            		_detected = (_area nearEntities [["Man","Car","Motorcycle","Tank","Air","Ship"], missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE"]) unitsBelowHeight 20;
            		{
            			if(_itemcategory !=0 && side _x == _opposite_side)exitwith{
            				_color = _colorRed;
            				hintSilent parseText "<t color='#fb0808'> Enemies are detected near your base! </t>";
            			};

            		}foreach _detected;
};

			_color
		}];
	};
};

sleep 3;
/* JIP System, initialize the camps and towns properly. */
[] Spawn {
	sleep 2;
	["INITIALIZATION", "Init_Client.sqf: Updating JIP Markers."] Call WFBE_CO_FNC_LogContent;
	Call Compile preprocessFileLineNumbers "Client\Init\Init_Markers.sqf";
};

/* Repair Truck CoIn Handling. */
[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_REPAIR",false,RCoin,"REPAIR"] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";

/* A new player come to reinforce the battlefield */
[sideJoinedText,'UnitsCreated',1] Call UpdateStatistics;

/* Towns Task System */
["TownAddComplete"] Spawn TaskSystem;

/* Client death handler. */
WFBE_PLAYERKEH = player addEventHandler ['Killed', {[_this select 0,_this select 1] Spawn WFBE_CL_FNC_OnKilled; [_this select 0,_this select 1, sideID] Spawn WFBE_CO_FNC_OnUnitKilled}];
hint parseText "<t color='#ffff00'>v25072023<br/>Full changelog available in our Discord!<br/><br/>Be sure to join it:<br/>discord.me/warfare<br/>or<br/>https://discord.gg/gRhPHUuWpy<br/><br/>New players, check the Guides section for the #tips-and-tricks channel and read the #commanding-guide. More guides coming soon(tm). If you have any questions, don't hesitate to ask in the side chat preferably, or on our discord! <br/><br/>Veterans! Check the #game-status channel before joining the game, and balance the game accordingly (count other veterans per team and see the bot's message for the current score status of the match)!<br/><br/>As always, thanks to our contributors for helping me to develop the mission:<br/>An-2 is a good plane<br/>Quad<br/>0=1<br/>Marty<br/><br/>Remember to check our discord every 1-2 weeks or so for new suggestions that we're voting on the #vote-suggestions channel (will @everyone ping for this). It will help us to prioritise things for development that the community wants! Thanks again, and have fun on the server! :)</t>";
//--- Valhalla init.
[] Spawn {
	[] Call Compile preprocessFile "Client\Module\Valhalla\Init_Valhalla.sqf";
};

/* Client Init Done - Remove the blackout */
12452 cutText [(localize 'STR_WF_Loading')+"...","BLACK IN",5];

["INITIALIZATION", Format ["Init_Client.sqf: Client initialization ended at [%1]", time]] Call WFBE_CO_FNC_LogContent;
clientInitComplete = true;