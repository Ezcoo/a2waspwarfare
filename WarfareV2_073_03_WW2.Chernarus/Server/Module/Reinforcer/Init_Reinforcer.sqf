/*
	Reinforcement module by Benny.
*/

//--- Function.
REINFORCER_Func_FillVehicleCargo = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_FillVehicleCargo.sqf";
REINFORCER_Func_GetAirSpace = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_GetAirSpace.sqf";
REINFORCER_Func_GetGroundSpace = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_GetGroundSpace.sqf";
REINFORCER_Func_GetNavalSpace = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_GetNavalSpace.sqf";
REINFORCER_Func_GetTownLimit = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_GetTownLimit.sqf";
REINFORCER_Func_HandleAir = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleAir.sqf";
REINFORCER_Func_HandleAirUnits = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleAirUnits.sqf";
REINFORCER_Func_HandleGround = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleGround.sqf";
REINFORCER_Func_HandleGroundSimple = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleGroundSimple.sqf";
REINFORCER_Func_HandleGroundTransport = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleGroundTransport.sqf";
REINFORCER_Func_HandleGroundTransportUnits = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleGroundTransportUnits.sqf";
REINFORCER_Func_HandleNaval = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleNaval.sqf";
REINFORCER_Func_HandleNavalUnits = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_HandleNavalUnits.sqf";
REINFORCER_Func_PickUnits = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_PickUnits.sqf";
REINFORCER_Func_ProcessAir = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_ProcessAir.sqf";
REINFORCER_Func_ProcessGroundConvoy = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_ProcessGroundConvoy.sqf";
REINFORCER_Func_ProcessGroundSimple = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_ProcessGroundSimple.sqf";
REINFORCER_Func_ProcessNaval = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_ProcessNaval.sqf";
REINFORCER_Func_SpawnAirTransports = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_SpawnAirTransports.sqf";
REINFORCER_Func_SpawnGroundTransports = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_SpawnGroundTransports.sqf";
REINFORCER_Func_SpawnGroundSimple = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_SpawnGroundSimple.sqf";
REINFORCER_Func_SpawnNavalTransports = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_SpawnNavalTransports.sqf";
REINFORCER_Func_StartReinforcement = Compile preprocessFileLineNumbers "Server\Module\Reinforcer\Func\Reinforcer_StartReinforcement.sqf";

//--- Constants.
with missionNamespace do {
	//--- Do not touch, this represent the active instances.
	REINFORCER_ACTIVE_EAST = 0;
	REINFORCER_ACTIVE_GUER = 0;
	REINFORCER_ACTIVE_WEST = 0;
	
	REINFORCER_ALLOW_NAVAL = true;
	
	if (toLower(worldName) in ["takistan","zargabad"]) then { //--- Disable naval units on desert maps or waterless maps. Add the island in lowercase.
		REINFORCER_ALLOW_NAVAL = false;
	};
	
	REINFORCER_INTERVAL = 180; //--- Delay between each reinforcement spawn in the same town.
	
	REINFORCER_RANGE_SPAWN_AIR_RANGE = 2000; //--- Spawn range of air units.
	REINFORCER_RANGE_SPAWN_GROUND_RANGE = 1000; //--- Spawn range of ground units.
	REINFORCER_RANGE_SPAWN_SEA_RANGE = 1350; //--- Spawn range of naval units.
	REINFORCER_RANGE_SPAWN_SEA_MIN_WATER = 23; //--- Need at least x% of water to use and spawn the naval units.
	
	REINFORCER_RANGE_RANDOMIZE = 100; //--- Add some random distance to each spawn.
	REINFORCER_UNITS_DEAD_DELAY = 60; //--- The reinforcement units get removed earlier than the others when dead (override).
	REINFORCER_VEHICLES_EMPTY_DELAY = 200; //--- Reinforcer vehicles get removed if empty after x seconds. Requires WFBE_SE_FNC_HandleEmptyVehicle.
};

//--- Main thread.
execFSM "Server\Module\Reinforcer\FSM\reinforcer_main.fsm";