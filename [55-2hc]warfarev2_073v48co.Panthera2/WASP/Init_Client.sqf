if (!isServer || local player) then {
	waitUntil {!isNull(player)};
};

//WASP_EHkilledPL = player addEventHandler ["killed", {[] execVM "WASP\actions\OnKilled.sqf";}];

//[] execVM "WASP\actions\OnArmor\timer.sqf";
//Кнопки
//waitUntil {(findDisplay 46)==(findDisplay 46)};
  //(findDisplay 46) displayAddEventHandler ["KeyDown", "hint (""Клава нажата:""+str _this)"];
  
//WASP_KEYpressed = compile preprocessfile "WASP\KeyDown.sqf";
//(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call WASP_KEYpressed"];



//OnArmor!

//WASP_ = createTrigger [type, position];

//[] execVM "WASP\actions\SitsOnArmor\init.sqf";