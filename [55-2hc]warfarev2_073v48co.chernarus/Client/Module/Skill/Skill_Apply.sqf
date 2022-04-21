/*
	Script: Skill Application System by Benny.
	Description: Skill Application.
*/

Private ["_unit"];

_unit = _this;

switch (WFBE_SK_V_Type) do {
	case 'Engineer': {
		/* Repair Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),
			(WFBE_SK_V_Root + 'Engineer' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"time - WFBE_SK_V_LastUse_Repair > WFBE_SK_V_Reload_Repair"
		];

	};
	case 'Officer': {
		/* MASH Ability require that the MASH parameter is enabled */
		if ((missionNamespace getVariable "WFBE_C_RESPAWN_MASH") > 0) then {
			/* MASH Ability */
			_unit addAction [
				("<t color='#f8d664'>" + localize 'STR_WF_ACTION_DeployMASH'+ "</t>"),
				(WFBE_SK_V_Root + 'Officer' + '.sqf'),
				[],
				80,
				false,
				true,
				"",
				"time - WFBE_SK_V_LastUse_MASH > WFBE_SK_V_Reload_MASH"
			];
			_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target'];
			//_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target'];

	};
_unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];

	};
	case 'SpecOps': {
		// Supply truck mission
		_unit addAction [
			"Load Supply to Truck (Debug 1)",
			'Client\Module\Skill\supplyMission.sqf',
			[str (call GetClosestFriendlyLocation), (((call GetClosestFriendlyLocation) getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER)],
			80,
			false,
			true,
			"",
			"(typeOf (vehicle player)) in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF']"
		];

		_unit addAction [
			"Load Supply to Truck (Debug 2)",
			'Client\Module\Skill\supplyMission.sqf',
			[str (call GetClosestFriendlyLocation), (((call GetClosestFriendlyLocation) getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER)],
			80,
			false,
			true,
			"",
			"(player distance (call GetClosestFriendlyLocation)) < 500"
		];

		/*
		_unit addAction [
			("<t color='#00e83e'>" + 'LOAD ' + str(((call GetClosestFriendlyLocation) getVariable 'supplyValue') * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER) + ' SUPPLY TO TRUCK' + "</t>"),
			('Client\Module\Skill\supplyMission.sqf'),
			[str (call GetClosestFriendlyLocation), (((call GetClosestFriendlyLocation) getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER)],
			80,
			false,
			true,
			"",
			"(((player distance (call GetClosestFriendlyLocation)) < 500) && (typeOf (vehicle player) == 'WarfareSupplyTruck_RU' || typeOf (vehicle player) == 'WarfareSupplyTruck_USMC' || typeOf (vehicle player) == 'WarfareSupplyTruck_INS' || typeOf (vehicle player) == 'WarfareSupplyTruck_Gue' || typeOf (vehicle player) == 'WarfareSupplyTruck_CDF'))"
		];*/


		/* Lockpicking Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),
			(WFBE_SK_V_Root + 'SpecOps' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"time - WFBE_SK_V_LastUse_Lockpick > WFBE_SK_V_Reload_Lockpick"
		];
		_unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
	};

	case 'Spotter': {
		/* Spotting Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),
			(WFBE_SK_V_Root + 'Sniper' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"time - WFBE_SK_V_LastUse_Spot > WFBE_SK_V_Reload_Spot"
		];

_unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
		_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target'];
	};

case 'Medic': {

                _unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
		_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target'];
	};
case 'Soldier': {

                _unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'),
			[],
			80,
			false,
			true,
			"",
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
		_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target'];
	};
};
