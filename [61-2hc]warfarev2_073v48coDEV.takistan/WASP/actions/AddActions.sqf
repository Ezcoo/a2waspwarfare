
While {!(Alive Player)} do {sleep 2;};

//player addAction [localize "STR_WF_Gear", "WASP\actions\GearYouUnit.sqf", [], 1, false, false, "", "cursorTarget distance player < 3 && cursorTarget in units player"];

//player addAction [localize "STR_WASP_actions_ChangeWheels", "WASP\actions\car_wheel_new.sqf", [], 1, false, true, "", "(cursorTarget isKindOf 'Car')&&(player distance cursorTarget<5)"];


//OnArmor
//player addAction [localize "STR_WASP_actions_OnArmor-GetOnArmor", "WASP\actions\OnArmor\GetOnArmor.sqf", [], 1, false, true, "", "(cursorTarget isKindOf 'Tank')&&(player distance cursorTarget<7)"];
//player addAction [localize "STR_WASP_actions_OnArmor-GetOnArmor-group", "WASP\actions\OnArmor\GetOnArmorBots.sqf", [], 1, false, true, "", "(cursorTarget isKindOf 'Tank')&&(player distance cursorTarget<30)"];
//player addAction [localize "STR_WASP_actions_OnArmor-GetOutArmor-group", "WASP\actions\OnArmor\GetOutBots.sqf", [], 1, false, true, "", "(cursorTarget isKindOf 'Tank')&&(player distance cursorTarget<30)"];

//player addEventHandler ["HandleDamage", {false;if (player != (_this select 3)) then {(_this select 3) setDammage 0}}]; //--- God-Slayer mode.
208 = player addAction ["<t color='#FF0000'>"+ "RECOVER HQ" + "  " + str (missionNameSpace getVariable 'WFBE_C_BASE_HQ_REPAIR_PRICE_CASH') +"$" +"</t>", "WASP\actions\Action_RepairMHQDepot.sqf", [], 1, false, true, "", "!(alive ((SideJoined) Call WFBE_CO_FNC_GetSideHQ))&&(leader  (SideJoined call GetCommanderTeam) == leader (vehicle player))&&(typeOf cursorTarget in ['Land_fortified_nest_big_EP1','WFBE_C_DEPOT'])&&(cursorTarget distance player < 100)"];