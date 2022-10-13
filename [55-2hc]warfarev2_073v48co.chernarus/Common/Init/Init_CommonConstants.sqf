//--- DO NOT CHANGE.
WESTID = 0;
EASTID = 1;
RESISTANCEID = 2;
//--- DO NOT CHANGE.
QUERYUNITLABEL = 0;
QUERYUNITPICTURE = 1;
QUERYUNITPRICE = 2;
QUERYUNITTIME = 3;
QUERYUNITCREW = 4;
QUERYUNITUPGRADE = 5;
QUERYUNITFACTORY = 6;
QUERYUNITSKILL = 7;
QUERYUNITFACTION = 8;
QUERYUNITTURRETS = 9;
//--- DO NOT CHANGE.
QUERYGEARLABEL = 0;
QUERYGEARPICTURE = 1;
QUERYGEARCLASS = 2;
QUERYGEARTYPE = 3;
QUERYGEARCOST = 4;
QUERYGEARUPGRADE = 5;
QUERYGEARALLOWED = 6;
QUERYGEARHANDGUNPOOL = 7;
QUERYGEARMAGAZINES = 8;
QUERYGEARSPACE = 9;
QUERYGEARALLOWTWO = 10;

//--- Side Statics.
WFBE_C_WEST_ID = 0;
WFBE_C_EAST_ID = 1;
WFBE_C_GUER_ID = 2;
WFBE_C_CIV_ID = 3;
WFBE_C_UNKNOWN_ID = 4;

//--- Common Upgrades, each number match the upgrades arrays.
WFBE_UP_BARRACKS = 0;
WFBE_UP_LIGHT = 1;
WFBE_UP_HEAVY = 2;
WFBE_UP_AIR = 3;
WFBE_UP_PARATROOPERS = 4;
WFBE_UP_UAV = 5;
WFBE_UP_SUPPLYRATE = 6;
WFBE_UP_RESPAWNRANGE = 7;
WFBE_UP_AIRLIFT = 8;
WFBE_UP_FLARESCM = 9;
WFBE_UP_ARTYTIMEOUT = 10;
WFBE_UP_ICBM = 11;
WFBE_UP_FASTTRAVEL = 12;
WFBE_UP_GEAR = 13;
WFBE_UP_AMMOCOIN = 14;
WFBE_UP_EASA = 15;
WFBE_UP_SUPPLYPARADROP = 16;
WFBE_UP_ARTYAMMO = 17;
WFBE_UP_IRSMOKE = 18;
WFBE_UP_AIRAAM = 19;

/*
	### Working with the missionNamespace ###
	 * The With command allows us to swap the Global variable Namespace.
	 * It prevents the typical long variable declaration (missionNamespace setVariable...).

	In the declaration below, the parameters are first (they are checked with the isNil command).
	The isNil check prevent us from overriding MP parameters.
*/
with missionNamespace do {
//--- AI.
	if (isNil "WFBE_C_AI_COMMANDER_ENABLED") then {WFBE_C_AI_COMMANDER_ENABLED = 1}; //--- Enable or disable the AI Commanders.
	if (isNil "WFBE_C_AI_MAX") then {WFBE_C_AI_MAX = 10}; //--- Max AI allowed on each AI groups.
	if (isNil "WFBE_C_AI_DELEGATION") then {WFBE_C_AI_DELEGATION = 0}; //--- Enable AI delegation (0: Disabled, 1: creation of ai on the client, 2: Headless Client).
	if (isNil "WFBE_C_AI_TEAMS_ENABLED") then {WFBE_C_AI_TEAMS_ENABLED = 1}; //--- Enable or disable the AI Teams.
	if (isNil "WFBE_C_AI_TEAMS_JIP_PRESERVE") then {WFBE_C_AI_TEAMS_JIP_PRESERVE = 1}; //--- Keep the AI Teams units on JIP.
	WFBE_C_AI_COMMANDER_MOVE_INTERVALS = 3600;
	WFBE_C_AI_COMMANDER_SUPPLY_TRUCKS_MAX = 5;
	WFBE_C_AI_DELEGATION_FPS_INTERVAL = 60 * 3; //--- A client send it's FPS average each x seconds to the server.
	WFBE_C_AI_DELEGATION_FPS_MIN = 25; //--- A client can handle groups if it's FPS average is above x.
	WFBE_C_AI_DELEGATION_GROUPS_MAX = 1; //--- A client max have up to x groups managed on his computer (high values may makes lag, be careful).
	WFBE_C_AI_PATROL_RANGE = 400;
	WFBE_C_AI_TOWN_ATTACK_HOPS_WP = 4; //--- AI may use up to x WP to attack a town.

//--- Artillery.
	if (isNil "WFBE_C_ARTILLERY") then {WFBE_C_ARTILLERY = 1}; //--- Enable or disable Artillery fire missions (0: Disabled, 1: Short, 2: Medium, 3: Long).
	if (isNil "WFBE_C_ARTILLERY_UI") then {WFBE_C_ARTILLERY_UI = 0}; //--- Enable or disable Artillery UI for direct fire missions.
	WFBE_C_ARTILLERY_AMMO_RANGE_LASER = 175; //--- Artillery laser rounds detection range (Per Shell).
	WFBE_C_ARTILLERY_AMMO_RANGE_SADARM = 200; //--- Artillery SADARM rounds operative range (Per Shell).
	WFBE_C_ARTILLERY_AREA_MAX = 300; //---  Maximum spread area of artillery support.
	WFBE_C_ARTILLERY_INTERVALS = [400, 350, 300, 250]; //--- Delay between each fire mission for each upgrades.

	//--- Base
	if (isNil "WFBE_C_BASE_AREA") then {WFBE_C_BASE_AREA = 2}; //--- Force the bases to be grouped by areas.
	if (isNil "WFBE_C_BASE_RES") then {WFBE_C_BASE_RES = 0}; //--- RES Parameters (0 Disabled, 1 West, 2 East, 3 both).
	if (isNil "WFBE_C_BASE_DEFENSE_MAX_AI") then {WFBE_C_BASE_DEFENSE_MAX_AI = 40}; //--- Maximum AIs that will be able to man defense within the barracks area.
	if (isNil "WFBE_C_BASE_DEFENSE_MANNING_RANGE") then {WFBE_C_BASE_DEFENSE_MANNING_RANGE = 250}; //--- Within x meters, defenses may be manned.
	if (isNil "WFBE_C_BASE_START_TOWN") then {WFBE_C_BASE_START_TOWN = 1}; //--- Remove the spawn locations which are too far away from the towns.
	if (isNil "WFBE_C_BASE_STARTING_DISTANCE") then {WFBE_C_BASE_STARTING_DISTANCE = 7500}; //--- Sides need at last xkm of distance between them.
	if (isNil "WFBE_C_BASE_STARTING_MODE") then {WFBE_C_BASE_STARTING_MODE = 2}; //--- Starting Locations Mode: 0 = WN|ES; 1 = WS|EN; 2 = Random;
	WFBE_C_BASE_AREA_RANGE = 250; //--- A base area has a range of x meters.
	WFBE_C_BASE_HQ_BUILD_RANGE = 120; //--- HQ Build range.
	WFBE_C_BASE_AV_STRUCTURES = 260; //--- Base available structures.
	WFBE_C_BASE_PROTECTION_RANGE = 800;  //--- Base protection range.
	WFBE_C_BASE_HQ_REPAIR_PRICE_WEST = 25000; //--- HQ Repair price.
	WFBE_C_BASE_HQ_REPAIR_PRICE_EAST = 25000;
	WFBE_C_BASE_HQ_REPAIR_PRICE_GUER = 25000;
	WFBE_C_BASE_HQ_REPAIR_COUNT_WEST = 0; //--- How many times HQ has been repaired.
	WFBE_C_BASE_HQ_REPAIR_COUNT_EAST = 0;
	WFBE_C_BASE_HQ_REPAIR_COUNT_GUER = 0;
	WFBE_C_BASE_HQ_REPAIR_PRICE_1ST = 25000;
    WFBE_C_BASE_HQ_REPAIR_PRICE_2ND = 40000;
    WFBE_C_BASE_HQ_REPAIR_PRICE_3RD = 50000;
    WFBE_C_BASE_HQ_REPAIR_PRICE_CASH = 200000; //--- HQ Repair price with cash.
//--- Camps.
	if (isNil "WFBE_C_CAMPS_CREATE") then {WFBE_C_CAMPS_CREATE = 1}; //--- Create the camp models.
	WFBE_C_CAMPS_CAPTURE_BOUNTY = 500; //--- Bounty received by player whenever he capture a camp.
	WFBE_C_CAMPS_CAPTURE_RATE = 20;
	WFBE_C_CAMPS_CAPTURE_RATE_MAX = 25;
	WFBE_C_CAMPS_RANGE = 10;
	WFBE_C_CAMPS_RANGE_PLAYERS = 5;
	WFBE_C_CAMPS_REPAIR_DELAY = 20;
	WFBE_C_CAMPS_REPAIR_PRICE = 500;
	WFBE_C_CAMPS_REPAIR_RANGE = 15;

//--- Economy.
	if (isNil "WFBE_C_ECONOMY_CURRENCY_SYSTEM") then {WFBE_C_ECONOMY_CURRENCY_SYSTEM = 0}; //--- 0: Funds + Supply, 1: Funds.
	if (isNil "WFBE_C_ECONOMY_FUNDS_START_WEST") then {WFBE_C_ECONOMY_FUNDS_START_WEST = if (WF_Debug) then {900000} else {800}};
	if (isNil "WFBE_C_ECONOMY_FUNDS_START_EAST") then {WFBE_C_ECONOMY_FUNDS_START_EAST = if (WF_Debug) then {900000} else {800}};
	if (isNil "WFBE_C_ECONOMY_FUNDS_START_GUER") then {WFBE_C_ECONOMY_FUNDS_START_GUER = if (WF_Debug) then {900000} else {20000}};
	if (isNil "WFBE_C_ECONOMY_INCOME_INTERVAL") then {WFBE_C_ECONOMY_INCOME_INTERVAL = 60}; //--- Income Interval (Delay between each paycheck).
	if (isNil "WFBE_C_ECONOMY_INCOME_SYSTEM") then {WFBE_C_ECONOMY_INCOME_SYSTEM = 3}; //--- Income System (1:Full, 2:Half (Half -> 120 SV Town = 60$ / 60SV), 3: Commander System, 4: Commander System: Full)
	if (isNil "WFBE_C_ECONOMY_SUPPLY_START_WEST") then {WFBE_C_ECONOMY_SUPPLY_START_WEST = if (WF_Debug) then {900000} else {1200}};
	if (isNil "WFBE_C_ECONOMY_SUPPLY_START_EAST") then {WFBE_C_ECONOMY_SUPPLY_START_EAST = if (WF_Debug) then {900000} else {1200}};
	if (isNil "WFBE_C_ECONOMY_SUPPLY_START_GUER") then {WFBE_C_ECONOMY_SUPPLY_START_GUER = if (WF_Debug) then {900000} else {30000}};
	if (isNil "WFBE_C_MAX_ECONOMY_SUPPLY_LIMIT") then {WFBE_C_MAX_ECONOMY_SUPPLY_LIMIT = if (WF_Debug) then {900000} else {40000}};
	if (isNil "WFBE_C_ECONOMY_SUPPLY_SYSTEM") then {WFBE_C_ECONOMY_SUPPLY_SYSTEM = 1}; //--- Supply System (0: Trucks, 1: Automatic with time).
	WFBE_C_ECONOMY_INCOME_COEF = 8; //--- Town Multiplicator Coefficient (SV * x).
	WFBE_C_ECONOMY_INCOME_DIVIDED = 1.2; //--- Prevent commander from being a millionaire, and add the rest to the players pool.
	WFBE_C_ECONOMY_INCOME_PERCENT_MAX = 30; //--- Commander may set income up to x%.
	WFBE_C_ECONOMY_SUPPLY_TIME_INCREASE_DELAY = 60; //--- Increase SV delay.
	WFBE_C_ECONOMY_SUPPLY_MAX_TEAM_LIMIT = 50000;
	WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER = 12;

//--- Environment.
	if (isNil "WFBE_C_ENVIRONMENT_MAX_VIEW") then {WFBE_C_ENVIRONMENT_MAX_VIEW = 5000}; //--- Max view distance.
	if (isNil "WFBE_C_ENVIRONMENT_MAX_CLUTTER") then {WFBE_C_ENVIRONMENT_MAX_CLUTTER = 50}; //--- Max Terrain grid.
	if (isNil "WFBE_C_ENVIRONMENT_STARTING_HOUR") then {WFBE_C_ENVIRONMENT_STARTING_HOUR = 9}; //--- Starting Hour of the day.
	if (isNil "WFBE_C_ENVIRONMENT_STARTING_MONTH") then {WFBE_C_ENVIRONMENT_STARTING_MONTH = 6}; //--- Starting Month of the year.
	if (isNil "WFBE_C_ENVIRONMENT_WEATHER") then {WFBE_C_ENVIRONMENT_WEATHER = 0}; //--- Weather Type, 0: Clear, 1: Cloudy, 2: Rainy)
	if (isNil "WFBE_C_ENVIRONMENT_WEATHER_VOLUMETRIC") then {WFBE_C_ENVIRONMENT_WEATHER_VOLUMETRIC = 0}; //--- Enable volumetric clouds.
	WFBE_C_ENVIRONMENT_WEATHER_TRANSITION = 600; //--- Weather Transition period, change weather overcast each x seconds (longer is more realistic).

//--- Gameplay.
	if (isNil "WFBE_C_GAMEPLAY_AIR_AA_MISSILES") then {WFBE_C_GAMEPLAY_AIR_AA_MISSILES = 1}; //--- Enable Air vehicles Air-to-Air missiles (0: Disabled, 1: Enabled with Upgrade, 2: Enabled).
	if (isNil "WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED") then {WFBE_C_GAMEPLAY_BOUNDARIES_ENABLED = 1}; //--- Enable the map boundaries if defined.
	if (isNil "WFBE_C_GAMEPLAY_FAST_TRAVEL") then {WFBE_C_GAMEPLAY_FAST_TRAVEL = 1}; //--- Fast Travel (0 Disabled, 1 Free, 2 Fee).
	if (isNil "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE") then {WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE = 1}; //--- Handle the friendly fire.
	if (isNil "WFBE_C_GAMEPLAY_HANGARS_ENABLED") then {WFBE_C_GAMEPLAY_HANGARS_ENABLED = 1}; //--- Enable or disable hangars.
	if (isNil "WFBE_C_GAMEPLAY_MISSILES_RANGE") then {WFBE_C_GAMEPLAY_MISSILES_RANGE = 0}; //--- Incoming Guided missiles Range limit (0 = Disabled).
	if (isNil "WFBE_C_GAMEPLAY_TEAMSWAP_DISABLE") then {WFBE_C_GAMEPLAY_TEAMSWAP_DISABLE = 1}; //--- Disable teamswitch.
	if (isNil "WFBE_C_GAMEPLAY_THERMAL_IMAGING") then {WFBE_C_GAMEPLAY_THERMAL_IMAGING = 3}; //--- Thermal Imaging (0: Disabled, 1: Weapons, 2: Vehicles, 3: All).
	if (isNil "WFBE_C_GAMEPLAY_UID_SHOW") then {WFBE_C_GAMEPLAY_UID_SHOW = 1}; //--- Display the user ID (on teamswap/tk).
	if (isNil "WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE") then {WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE = 0}; //--- Upgrade clearance (on start), 0: Disabled, 1: West, 2: East, 3: Res, 4: West + East, 5: West + Res, 6: East + Res, 7: All.
	if (isNil "WFBE_C_GAMEPLAY_VICTORY_CONDITION") then {WFBE_C_GAMEPLAY_VICTORY_CONDITION = 2}; //--- Victory Condition (0: Annihilation, 1: Assassination, 2: Supremacy, 3: Towns).
	WFBE_C_GAMEPLAY_FAST_TRAVEL_RANGE = 175;
	WFBE_C_GAMEPLAY_FAST_TRAVEL_RANGE_MAX = 3500;
	WFBE_C_GAMEPLAY_FAST_TRAVEL_PRICE_KM = 215;
	WFBE_C_GAMEPLAY_FAST_TRAVEL_TIME_COEF = 0.8;
	WFBE_C_GAMEPLAY_VOTE_TIME = if (WF_Debug) then {8} else {40};

//--- Modules.
	if (isNil "WFBE_C_MODULE_BIS_BAF") then {WFBE_C_MODULE_BIS_BAF = 1}; //--- Enable BAF content.
	if (isNil "WFBE_C_MODULE_BIS_PMC") then {WFBE_C_MODULE_BIS_PMC = 1}; //--- Enable PMC content.
	if (isNil "WFBE_C_MODULE_WFBE_EASA") then {WFBE_C_MODULE_WFBE_EASA = 1}; //--- Enable the Exchangeable Armament System for Aircraft.
	if (isNil "WFBE_C_MODULE_WFBE_FLARES") then {WFBE_C_MODULE_WFBE_FLARES = 1}; //--- Enable the countermeasure system (0: Disabled, 1: Enabled with upgrade, 2: Enabled).
	if (isNil "WFBE_C_MODULE_WFBE_ICBM") then {WFBE_C_MODULE_WFBE_ICBM = 1}; //--- Enable the Intercontinental Ballistic Missile call for the commander.
	if (isNil "WFBE_C_MODULE_WFBE_IRSMOKE") then {WFBE_C_MODULE_WFBE_IRSMOKE = 1}; //--- Enable the use of IR Smoke.

//--- Players.
	if (isNil "WFBE_C_PLAYERS_AI_MAX") then {WFBE_C_PLAYERS_AI_MAX = 16}; //--- Max AI allowed on each player groups.
	WFBE_C_PLAYERS_BOUNTY_CAPTURE = 2000;
	WFBE_C_PLAYERS_BOUNTY_CAPTURE_ASSIST = 2000;
	WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION = 2000;
	WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION_ASSIST = 2000;
	WFBE_C_PLAYERS_COMMANDER_BOUNTY_CAPTURE_COEF = 60;
	WFBE_C_PLAYERS_COMMANDER_SCORE_BUILD = 2;
	WFBE_C_PLAYERS_COMMANDER_SCORE_CAPTURE = 5;
	WFBE_C_PLAYERS_COMMANDER_SCORE_UPGRADE = 2;
	WFBE_C_PLAYERS_GEAR_SELL_COEF = 0.6; //--- Sell price of the gear: item price * x (800 * 0.2 = 400)
	WFBE_C_PLAYERS_GEAR_VEHICLE_RANGE = 50; //--- Possible to buy gear in vehicle if that one is within that range.
	WFBE_C_PLAYERS_HALO_HEIGHT = 200; //--- Distance above which units are able to perform an HALO jump.
	WFBE_C_PLAYERS_MARKER_DEAD_DELAY = 60; //--- Time that a marker remain on a dead unit.
	WFBE_C_PLAYERS_MARKER_TOWN_RANGE = 0.05; //--- A town marker is updated (SV) on map if a unit is within the range (town range * coef).
	WFBE_C_PLAYERS_OFFMAP_TIMEOUT = 50; //--- Player may remain x second outside of the map before being killed.
	WFBE_C_PLAYERS_PENALTY_TEAMKILL = 1000; //--- Teamkill penalty.
	WFBE_C_PLAYERS_SCORE_CAPTURE = 23;
	WFBE_C_PLAYERS_SCORE_CAPTURE_ASSIST = 17;
	WFBE_C_PLAYERS_SCORE_CAPTURE_CAMP = 5;
	WFBE_C_PLAYERS_SCORE_DELIVERY = 3;
	WFBE_C_PLAYERS_SKILL_SOLDIER_UNITS_MAX = 6; //--- Skill (Soldiers), have more units than the others.
	WFBE_C_PLAYERS_SQUADS_MAX_PLAYERS = 4; //--- One player squad may contain up to x players.
	WFBE_C_PLAYERS_SQUADS_REQUEST_TIMEOUT = 100; //--- Time delay after which an unanswered request "fades".
	WFBE_C_PLAYERS_SQUADS_REQUEST_DELAY = 120; //--- Time delay between each potential squad hops.
	WFBE_C_PLAYERS_SUPPLY_TRUCKS_DELIVERY_RANGE = 30; //--- Supply Trucks (Clients) delivery range.
	WFBE_C_PLAYERS_SUPPLY_TRUCKS_DELIVERY_FUNDS_COEF = 4; //--- Funds awarded to a client for a delivery (SV * coef).
	WFBE_C_PLAYERS_SUPPORT_PARATROOPERS_DELAY = 1200; //--- Paratroopers Call Interval.
	WFBE_C_PLAYERS_UAV_SPOTTING_DELAY = 20; //--- Interval between each uav spotting routine.
	WFBE_C_PLAYERS_UAV_SPOTTING_DETECTION = 0.21; //--- UAV will reveal each targets that it knows about this value (0-4)
	WFBE_C_PLAYERS_UAV_SPOTTING_RANGE = 1100; //--- Max Range of the UAV spotting.

//--- Respawn.
	if (isNil "WFBE_C_RESPAWN_CAMPS_MODE") then {WFBE_C_RESPAWN_CAMPS_MODE = 2}; //--- Respawn Camps (0: Disabled, 1: Classic [from town center], 2: Enhanced [from nearby camps]).
	if (isNil "WFBE_C_RESPAWN_CAMPS_RANGE") then {WFBE_C_RESPAWN_CAMPS_RANGE = 550}; //--- How far a player need to be from a town to spawn at camps.
	if (isNil "WFBE_C_RESPAWN_CAMPS_RULE_MODE") then {WFBE_C_RESPAWN_CAMPS_RULE_MODE = 2}; //--- Respawn Camps Rule (0: Disabled, 1: West | East, 2: West | East | Resistance).
	if (isNil "WFBE_C_RESPAWN_DELAY") then {WFBE_C_RESPAWN_DELAY = 10}; //--- Respawn Delay (Players/AI).
	if (isNil "WFBE_C_RESPAWN_LEADER") then {WFBE_C_RESPAWN_LEADER = 2}; //--- Allow leader respawn (0: Disabled, 1: Enabled, 2: Enabled but default gear).
	if (isNil "WFBE_C_RESPAWN_MASH") then {WFBE_C_RESPAWN_MASH = 1}; //--- Allow mash respawn (0: Disabled, 1: Enabled, 2: Enabled but default gear).
	if (isNil "WFBE_C_RESPAWN_MOBILE") then {WFBE_C_RESPAWN_MOBILE = 2}; //--- Allow mobile respawn (0: Disabled, 1: Enabled, 2: Enabled but default gear).
	if (isNil "WFBE_C_RESPAWN_PENALTY") then {WFBE_C_RESPAWN_PENALTY = 4}; //--- Respawn Penalty (0: None, 1: Remove All, 2: Pay full gear price, 3: Pay 1/2 gear price, 4: pay 1/4 gear price, 5: Charge on Mobile).
	WFBE_C_RESPAWN_CAMPS_SAFE_RADIUS = 50;
	WFBE_C_RESPAWN_RANGE_LEADER = 50;
	WFBE_C_RESPAWN_RANGES = [250, 350, 500];

//--- Structures.
	if (isNil "WFBE_C_STRUCTURES_ANTIAIRRADAR") then {WFBE_C_STRUCTURES_ANTIAIRRADAR = 1};
	if (isNil "WFBE_C_STRUCTURES_COLLIDING") then {WFBE_C_STRUCTURES_COLLIDING = 1};
	if (isNil "WFBE_C_STRUCTURES_CONSTRUCTION_MODE") then {WFBE_C_STRUCTURES_CONSTRUCTION_MODE = 0}; //--- Structures construction mode (0: Time).
	if (isNil "WFBE_C_STRUCTURES_HQ_COST_DEPLOY") then {WFBE_C_STRUCTURES_HQ_COST_DEPLOY = 100}; //--- HQ Deploy / Mobilize Price.
	if (isNil "WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED") then {WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED = 200}; //--- HQ Deploy / Mobilize Price.
	if (isNil "WFBE_C_STRUCTURES_MAX") then {WFBE_C_STRUCTURES_MAX = 3};
	WFBE_C_STRUCTURES_ANTIAIRRADAR_DETECTION = 100;
	WFBE_C_STRUCTURES_BUILDING_DEGRADATION = 1; //--- Degredation of the building in time during a repair phase (over 100).
	WFBE_C_STRUCTURES_COMMANDCENTER_RANGE = 5500; //--- Command Center Range.
	WFBE_C_STRUCTURES_DAMAGES_REDUCTION = 6; //--- Building Damage Reduction (Current damage given / x, 1 = normal).
	WFBE_C_STRUCTURES_RUINS = if (WF_A2_Vanilla) then {"Land_budova4_ruins"} else {"Land_Mil_Barracks_i_ruins_EP1"}; //--- Ruins model.
	WFBE_C_STRUCTURES_SALE_DELAY = 50; //--- Building is sold after x seconds.
	WFBE_C_STRUCTURES_SALE_PERCENT = 50; //--- When a structure is sold, x% of supply goes back to the side.
	WFBE_C_STRUCTURES_SERVICE_POINT_RANGE = 50;
if (WF_A2_Vanilla) then {
		WFBE_C_BASE_COIN_DISTANCE_MIN = 8;
		WFBE_C_BASE_COIN_GRADIENT_MAX = 4;
} else {
		WFBE_C_BASE_COIN_DISTANCE_MIN = 100;
		WFBE_C_BASE_COIN_GRADIENT_MAX = 4;
};

//--- Towns.
	if (isNil "WFBE_C_TOWNS_AMOUNT") then {WFBE_C_TOWNS_AMOUNT = 7}; //--- Amount of towns (0: Very small, 1: Small, 2: Medium, 3: Large, 4: Full).
	if (isNil "WFBE_C_TOWNS_BUILD_PROTECTION_RANGE") then {WFBE_C_TOWNS_BUILD_PROTECTION_RANGE = 450}; //--- Prevent construction in towns within that radius.
	if (isNil "WFBE_C_TOWNS_CAPTURE_MODE") then {WFBE_C_TOWNS_CAPTURE_MODE = 2}; //--- Town capture mode (0: Normal, 1: Threshold, 2: All Camps).
	if (isNil "WFBE_C_TOWNS_DEFENDER") then {WFBE_C_TOWNS_DEFENDER = 2}; //--- Town defender Difficulty (0: Disabled, 1: Light, 2: Medium, 3: Hard, 4: Insane).
	if (isNil "WFBE_C_TOWNS_OCCUPATION") then {WFBE_C_TOWNS_OCCUPATION = 2}; //--- Town occupation Difficulty (0: Disabled, 1: Light, 2: Medium, 3: Hard, 4: Insane).
	if (isNil "WFBE_C_TOWNS_GEAR") then {WFBE_C_TOWNS_GEAR = 1}; //--- Buy Gear From (0: None, 1: Camps, 2: Depot, 3: Camps & Depot).
	if (isNil "WFBE_C_TOWNS_PATROLS") then {WFBE_C_TOWNS_PATROLS = 0}; //--- Enable town to town patrols.
	if (isNil "WFBE_C_TOWNS_REINFORCEMENT_DEFENDER") then {WFBE_C_TOWNS_REINFORCEMENT_DEFENDER = 0}; //--- Enable towns defender reinforcement.
	if (isNil "WFBE_C_TOWNS_REINFORCEMENT_OCCUPATION") then {WFBE_C_TOWNS_REINFORCEMENT_OCCUPATION = 0}; //--- Enable towns occupation reinforcement.
	if (isNil "WFBE_C_TOWNS_STARTING_MODE") then {WFBE_C_TOWNS_STARTING_MODE = 0}; //--- Town starting mode (0: Resistance, 1: 50% blu, 50% red, 2: Nearby Towns, 3: Random).
	if (isNil "WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER") then {WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER = 1}; //--- Lock the vehicles of the defender side.
	WFBE_C_TOWNS_CAPTURE_ASSIST = 400;
	WFBE_C_TOWNS_CAPTURE_RANGE = 40;
	WFBE_C_TOWNS_CAPTURE_RATE = 0.4;
	WFBE_C_TOWNS_CAPTURE_THRESHOLD_RANGE = 140;
	WFBE_C_TOWNS_DEFENSE_RANGE = 30;
	WFBE_C_TOWNS_DETECTION_RANGE_ACTIVE_COEF = 1; //--- Town activation range once active (town range * coef)
	WFBE_C_TOWNS_DETECTION_RANGE_COEF = 1; //--- Town activation range while idling (town range * coef)
	WFBE_C_TOWNS_DETECTION_RANGE_AIR = 50; //--- Detect Air if > x
	WFBE_C_TOWNS_MORTARS_SCAN = 60; //--- Scan the area around a target for friends and enemies.
	WFBE_C_TOWNS_MORTARS_INTERVAL = 200; //--- AI Mortars may fire each x seconds.
	WFBE_C_TOWNS_MORTARS_PRECOGNITION = 25; //--- AI Mortars may fire at a target by precognition. This value is a percentage.
	WFBE_C_TOWNS_MORTARS_RANGE_MAX = 750; //--- AI Mortars may not fire at target further than that range (Cannot be higher than artillery core values).
	WFBE_C_TOWNS_MORTARS_RANGE_MIN = 125; //--- AI Mortars may not fire at targets within that range (Cannot be lower than artillery core values).
	WFBE_C_TOWNS_MORTARS_SPLASH_RANGE = 60; //--- AI Mortar firing area of effect.
	WFBE_C_TOWNS_PATROL_HOPS = 5; //--- Amount of Waypoints given to the AI Patrol in towns (Higher is wider).
	WFBE_C_TOWNS_PATROL_RANGE = 500;
	WFBE_C_TOWNS_PURCHASE_RANGE = 60;
	WFBE_C_TOWNS_SUPPLY_LEVELS_TIME = [1, 2, 3, 4, 5];
	WFBE_C_TOWNS_SUPPLY_LEVELS_TRUCK = [5, 6, 7, 8, 10];
	WFBE_C_TOWNS_UNITS_INACTIVE = 90; //--- Remove units in town if no enemies are to be found within that time.
	WFBE_C_TOWNS_UNITS_SPAWN_CAPTURE_DELAY = 1200; //--- If x seconds has elapsed since a town last capture, units may spawn again during that town capture.
	WFBE_C_TOWNS_UNITS_WAYPOINTS = 9;

//--- Units.
	if (isNil "WFBE_C_UNITS_BALANCING") then {WFBE_C_UNITS_BALANCING = 1}; //--- Enable Units weaponry balancing.
	if (isNil "WFBE_C_UNITS_BOUNTY") then {WFBE_C_UNITS_BOUNTY = 1}; //--- Enable Units bounty on kill.
	if (isNil "WFBE_C_UNITS_CLEAN_TIMEOUT") then {WFBE_C_UNITS_CLEAN_TIMEOUT = 60}; //--- Lifespan of a dead body.
	if (isNil "WFBE_C_UNITS_EMPTY_TIMEOUT") then {WFBE_C_UNITS_EMPTY_TIMEOUT = 1200}; //--- Lifespan of an empty vehicle.
		WFBE_C_UNITS_BODIES_TIMEOUT = 60;
	if (isNil "WFBE_C_UNITS_KAMOV_DISABLED") then {WFBE_C_UNITS_KAMOV_DISABLED = 0}; //--- Enable Kamov.
	if (isNil "WFBE_C_UNITS_PRICING") then {WFBE_C_UNITS_PRICING = 0}; //--- Price Focus. (0: Default, 1: Infantry, 2: Tanks, 3: Air).
	if (isNil "WFBE_C_UNITS_RESTRICT_AIR") then {WFBE_C_UNITS_RESTRICT_AIR = 0}; //--- Advanced Aircraft restriction.
	if (isNil "WFBE_C_UNITS_TOWN_PURCHASE") then {WFBE_C_UNITS_TOWN_PURCHASE = 1}; //--- Allow AIs to be bought from depots.
	if (isNil "WFBE_C_UNITS_TRACK_INFANTRY") then {WFBE_C_UNITS_TRACK_INFANTRY = 1}; //--- Track units on map (infantry).
	if (isNil "WFBE_C_UNITS_TRACK_LEADERS") then {WFBE_C_UNITS_TRACK_LEADERS = 1}; //--- Track playable Team Leaders on map (infantry).
	WFBE_C_UNITS_BOUNTY_COEF = 1; //--- Bounty is the unit price * coef.
	WFBE_C_BUILDINGS_SCORE_COEF = 3; // Score for killing base structures and HQ is building bounty * coef
	WFBE_C_UNITS_BOUNTY_ASSISTANCE_COEF = 0.5; //--- Bounty assistance is the unit price * coef * assist coef.
	WFBE_C_UNITS_COUNTERMEASURE_PLANES = 64;
	WFBE_C_UNITS_COUNTERMEASURE_CHOPPERS = 32;
	WFBE_C_UNITS_CREW_COST = 120;
	WFBE_C_UNITS_PURCHASE_RANGE = 150;
	WFBE_C_UNITS_PURCHASE_GEAR_RANGE = 150;
	WFBE_C_UNITS_PURCHASE_GEAR_MOBILE_RANGE = 5;
	WFBE_C_UNITS_PURCHASE_GEAR_MOBILE_AI_RANGE = 45;
	WFBE_C_UNITS_PURCHASE_HANGAR_RANGE = 50;
	WFBE_C_UNITS_REPAIR_TRUCK_RANGE = 40;
	WFBE_C_UNITS_SALVAGER_SCAVENGE_RANGE = 60;
	WFBE_C_UNITS_SALVAGER_SCAVENGE_RATIO = 60; //--- Salvager Sell %.
	WFBE_C_UNITS_SKILL_DEFAULT = 1;
	WFBE_C_UNITS_SUPPORT_RANGE = 70; //--- Action range for repair/rearm/refuel.
	WFBE_C_UNITS_SUPPORT_HEAL_PRICE = 125;
	WFBE_C_UNITS_SUPPORT_HEAL_TIME = 10;
	WFBE_C_UNITS_SUPPORT_REARM_PRICE = 14;
	WFBE_C_UNITS_SUPPORT_REARM_TIME = 20;
	WFBE_C_UNITS_SUPPORT_REFUEL_PRICE = 16;
	WFBE_C_UNITS_SUPPORT_REFUEL_TIME = 10;
	WFBE_C_UNITS_SUPPORT_REPAIR_PRICE = 2;
	WFBE_C_UNITS_SUPPORT_REPAIR_TIME = 20;

	//--- Units Factions.
switch (true) do {
	case (WF_A2_CombinedOps): {
			if (isNil "WFBE_C_UNITS_FACTION_EAST") then {WFBE_C_UNITS_FACTION_EAST = 1}; //--- East Faction.
			if (isNil "WFBE_C_UNITS_FACTION_GUER") then {WFBE_C_UNITS_FACTION_GUER = 0}; //--- Guerilla Faction.
			if (isNil "WFBE_C_UNITS_FACTION_WEST") then {WFBE_C_UNITS_FACTION_WEST = 2}; //--- West Faction.
			WFBE_C_UNITS_FACTIONS_EAST = ['INS','RU','TKA']; //--- East Factions.
			WFBE_C_UNITS_FACTIONS_GUER = ['GUE','PMC','TKGUE']; //--- Guerilla Factions.
			WFBE_C_UNITS_FACTIONS_WEST = ['CDF','US','USMC']; //--- West Factions.
	};
};

//--- Victory.
	WFBE_C_VICTORY_THREEWAY = 0; //--- Victory Condition (0: Side a vs Side b [supremacy] minus defender).
	WFBE_C_VICTORY_THREEWAY_LOCATION_SWAP = 300; //--- When the defender loose depending on victory conditions, startup locations become available for respawn with a rotation (to prevent spawn camping).

//--- Overall mission coloration.
if (side player == west) then{
missionNamespace setVariable ["WFBE_C_WEST_COLOR", "ColorGreen"];
missionNamespace setVariable ["WFBE_C_EAST_COLOR", "ColorRed"];
missionNamespace setVariable ["WFBE_C_GUER_COLOR", "ColorBlue"];
missionNamespace setVariable ["WFBE_C_CIV_COLOR", "ColorYellow"];
missionNamespace setVariable ["WFBE_C_UNKNOWN_COLOR", "ColorBlue"];
}else{
missionNamespace setVariable ["WFBE_C_WEST_COLOR", "ColorRed"];
missionNamespace setVariable ["WFBE_C_EAST_COLOR", "ColorGreen"];
missionNamespace setVariable ["WFBE_C_GUER_COLOR", "ColorBlue"];
missionNamespace setVariable ["WFBE_C_CIV_COLOR", "ColorYellow"];
missionNamespace setVariable ["WFBE_C_UNKNOWN_COLOR", "ColorBlue"];
};

	/* Special Variables, Those are used after the typical declaration above. */

//--- Build area (Radius/Height).
	WFBE_C_BASE_COIN_AREA_HQ_DEPLOYED = [WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED, 25];
	WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED = [WFBE_C_STRUCTURES_HQ_RANGE_DEPLOYED / 2, 25];
	WFBE_C_BASE_COIN_AREA_REPAIR = [45, 10];

//--- Max structures.
	if (isNil 'WFBE_C_STRUCTURES_MAX_BARRACKS') then {WFBE_C_STRUCTURES_MAX_BARRACKS = WFBE_C_STRUCTURES_MAX};
	if (isNil 'WFBE_C_STRUCTURES_MAX_LIGHT') then {WFBE_C_STRUCTURES_MAX_LIGHT = WFBE_C_STRUCTURES_MAX};
	if (isNil 'WFBE_C_STRUCTURES_MAX_COMMANDCENTER') then {WFBE_C_STRUCTURES_MAX_COMMANDCENTER = WFBE_C_STRUCTURES_MAX};
	if (isNil 'WFBE_C_STRUCTURES_MAX_HEAVY') then {WFBE_C_STRUCTURES_MAX_HEAVY = WFBE_C_STRUCTURES_MAX};
	if (isNil 'WFBE_C_STRUCTURES_MAX_AIRCRAFT') then {WFBE_C_STRUCTURES_MAX_AIRCRAFT = WFBE_C_STRUCTURES_MAX};
	if (isNil 'WFBE_C_STRUCTURES_MAX_SERVICEPOINT') then {WFBE_C_STRUCTURES_MAX_SERVICEPOINT = WFBE_C_STRUCTURES_MAX * 2};
	if (isNil 'WFBE_C_STRUCTURES_MAX_TENTS') then {WFBE_C_STRUCTURES_MAX_TENTS = 3};

//--- Apply a towns unit coeficient.
	WFBE_C_TOWNS_UNITS_COEF = switch (WFBE_C_TOWNS_OCCUPATION) do {case 1: {1}; case 2: {1.5}; case 3: {2}; case 4: {2.5}; default {1}};
	WFBE_C_TOWNS_UNITS_DEFENDER_COEF = switch (WFBE_C_TOWNS_DEFENDER) do {case 1: {1}; case 2: {1.5}; case 3: {2}; case 4: {2.5}; default {1}};
};

["INITIALIZATION", "Init_CommonConstants.sqf: Constants are defined."] Call WFBE_CO_FNC_LogContent;