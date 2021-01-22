Private['_args'];

_args = _this;

switch (_args select 0) do {
	case "update-teamleader": {
		Private ["_leader","_team"];
		_team = _args select 1;
		_leader = _args select 2;

		_team setVariable ["wfbe_teamleader", _leader];
	};
	case "group-query": {
		Private ["_group","_player","_side"];
		_group = _args select 1;
		_player = _args select 2;
		_side = _args select 3;

		if (alive _player) then {
			if (alive leader _group) then {
				if (isPlayer leader _group) then {
					//--- Player, forward the request.
					if (WF_A2_Vanilla) then {
						[getPlayerUID (leader _group), "HandleSpecial", ["group-join-request", _player]] Call WFBE_CO_FNC_SendToClients;
					} else {
						[leader _group, "HandleSpecial", ["group-join-request", _player]] Call WFBE_CO_FNC_SendToClient;
					};
				} else {
					if (isNil {_group getVariable "wfbe_uid"}) then { //--- Ensure that the group is ai-controlled.
						[_player, _group, _side] Call WFBE_CO_FNC_ChangeUnitGroup;

						//--- Tell the player that his request is granted.
						if (WF_A2_Vanilla) then {
							[getPlayerUID (_player), "HandleSpecial", ["group-join-accept", _group]] Call WFBE_CO_FNC_SendToClients;
						} else {
							[_player, "HandleSpecial", ["group-join-accept", _group]] Call WFBE_CO_FNC_SendToClient;
						};
					};
				};
			};
		};
	};
	case "Paratroops": {
		_args spawn KAT_Paratroopers;
	};

	case "ParaVehi": {
		_args spawn KAT_ParaVehicles;
	};

	case "ParaAmmo": {
		_args spawn KAT_ParaAmmo;
	};

	case "RespawnST": {
		Private ["_side","_st"];
		_side = _args select 1;
		_st = (_side call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_ai_supplytrucks";
		{if (!isNull (driver _x)) then {driver _x setDammage 1};_x setDammage 1} forEach _st;
		["INFORMATION", Format ["Server_HandleSpecial.sqf: [%1] Supply Trucks were forced respawn.", str _side]] Call WFBE_CO_FNC_LogContent;
	};

	case "uav": {
		_args spawn KAT_UAV;
	};

	case "upgrade-sync": {
		Private ["_side","_upgrade_id","_upgrade_level"];
		_side = _args select 1;
		_upgrade_id = _this select 2;
		_upgrade_level = _this select 3;

		if !(isNil {missionNamespace getVariable Format["WFBE_upgrade_%1_%2_%3_sync", str _side, _upgrade_id, _upgrade_level]}) then {missionNamespace setVariable [Format["WFBE_upgrade_%1_%2_%3_sync", str _side, _upgrade_id, _upgrade_level], true]};
	};
	case "update-clientfps": {
		Private ["_fps","_uid"];
		_uid = _args select 1;
		_fps = _args select 2;

		_get = missionNamespace getVariable format["WFBE_AI_DELEGATION_%1", _uid];
		if !(isNil "_get") then {
			_get set [0, _fps];
			missionNamespace setVariable [format["WFBE_AI_DELEGATION_%1", _uid], _get];
		};
	};
	case "update-town-delegation": {
		Private ["_town","_vehicles"];
		_town = _args select 1;
		_vehicles = _args select 2;

		_town setVariable ['wfbe_active_vehicles', (_town getVariable 'wfbe_active_vehicles') + _vehicles];
		{
			[_x] spawn WFBE_SE_FNC_HandleEmptyVehicle;
			_x setVariable ["WFBE_Taxi_Prohib", true];
		} forEach _vehicles;
	};
	case "ICBM": {
		Private ["_base","_bomb","_droppos1","_droppos2","_dropPosX","_dropPosY","_dropPosZ","_playerTeam","_side","_target"];
		_side = _args select 1;
		_base = _args select 2;
		_target = _args select 3;
		_playerTeam = _args select 4;
		["INFORMATION", Format ["Server_HandleSpecial.sqf: [%1] Team [%2] [%3] called in an ICBM Nuke.", str _side, _playerTeam, name (leader _playerTeam)]] Call WFBE_CO_FNC_LogContent;
		if (isNull _target || !alive _target) exitWith {};
		_dropPosX = getPos _base select 0;
		_dropPosY = getPos _base select 1;
		_dropPosZ = getPos _base select 2;
		_droppos1 = [_dropPosX + 4, _dropPosY + 4, _dropPosZ];
		_droppos2 = [_dropPosX + 8, _dropPosY + 8, _dropPosZ];
		waitUntil {!alive _target || isNull _target};
		_bomb = "BO_GBU12_LGB" createVehicle [(getpos _target select 0),(getpos _target select 1), 0];
		_bomb = createVehicle ["BO_GBU12_LGB",_droppos1,[], 0, "None"];
		_bomb = createVehicle ["BO_GBU12_LGB",_droppos2,[], 0, "None"];
		[_base] Spawn NukeDammage;
	};
	case "process-killed-hq": {
		(_args select 1) Spawn WFBE_SE_FNC_OnHQKilled;
	};
	case "connected-hc": {
		Private ["_hc","_id","_uid"];
		_hc = _args select 1;
		_id = owner _hc;
		_uid = getPlayerUID _hc;

		["INFORMATION", Format["Server_HandleSpecial.sqf: Headless client is now connected [%1] [%2] with Owner ID [%3].", _hc, _uid, _id]] Call WFBE_CO_FNC_LogContent;

		if (_id != 0) then {
			//--- Add the Headless client to our candidates.
			missionNamespace setVariable [Format["WFBE_HEADLESS_%1", _uid], group _hc];
			missionNamespace setVariable ["WFBE_HEADLESSCLIENTS_ID", (missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID") + [group _hc]];
		} else {
			["WARNING", Format["Server_HandleSpecial.sqf: Headless client [%1] Owner ID is [0], it is server controlled.",_hc]] Call WFBE_CO_FNC_LogContent;
		};
	};
	case "track-playerobject": {
		Private ["_get","_object","_uid"];
		_uid = _args select 1;
		_object = _args select 2;

		_get = missionNamespace getVariable Format ["WFBE_CLIENT_%1_OBJECTS", _uid];

		if (isNil '_get') then {
			missionNamespace setVariable [Format ["WFBE_CLIENT_%1_OBJECTS", _uid], [_object]];
		} else {
			_get = _get - [objNull] + [_object];
			missionNamespace setVariable [Format ["WFBE_CLIENT_%1_OBJECTS", _uid], _get];
		};
	};
	case "repair-camp": {
		Private ["_camp_sideID","_logic","_repairSideID","_townModel"];
		_logic = _args select 1;
		_repairSideID = _args select 2;

		if (alive (_logic getVariable 'wfbe_camp_bunker')) exitWith {};

		_townModel = (missionNamespace getVariable "WFBE_C_CAMP") createVehicle (getPos _logic);
		_townModel setDir ((getDir _logic) + (missionNamespace getVariable "WFBE_C_CAMP_RDIR"));
		_townModel setPos (getPos _logic);
		_townModel addEventHandler ["killed", {(_this select 0) Spawn WFBE_SE_FNC_OnBuildingKilled}];
		_townModel addEventHandler ["handleDamage",{getDammage (_this select 0)+((_this select 2)/(missionNamespace getVariable "WFBE_C_CAMP_HEALTH_COEF"))}];
		_logic setVariable ["wfbe_camp_bunker", _townModel, true];

		//--- Do we have to update the camp SID ?
		_camp_sideID = _logic getVariable "sideID";
		if (_camp_sideID != _repairSideID) then {
			Private ["_town"];
			_logic setVariable ["sideID", _repairSideID, true];

			//--- Notify / update map if needed.
			[nil, "CampCaptured", [_logic, _repairSideID, _camp_sideID, true]] Call WFBE_CO_FNC_SendToClients;
		};
	};
};