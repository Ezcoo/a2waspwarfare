/*
	Create a unit.
	 Parameters:
		- Classname
		- Group
		- Position
		- Side ID
		- {Global Init}
		- {PLacement}
*/

Private ["_get", "_global", "_position", "_side", "_skill", "_special", "_team", "_type", "_unit"];

_type = _this select 0;
_team = _this select 1;
_position = _this select 2;
_side = _this select 3;
_global = if (count _this > 4) then {_this select 4} else {true};
_special = if (count _this > 5) then {_this select 5} else {"FORM"};

if (typeName _side == "SIDE") then {_side = (_side) Call WFBE_CO_FNC_GetSideID};

_get = missionNamespace getVariable _type;
_skill = if !(isNil '_get') then {_get select QUERYUNITSKILL} else {missionNamespace getVariable "WFBE_C_UNITS_SKILL_DEFAULT"};
_unit = _team createUnit [_type, _position, [], 5, _special];
_unit setSkill _skill;

if (_global) then {
	if (_side != WFBE_DEFENDER_ID || WFBE_ISTHREEWAY) then {
		if ((missionNamespace getVariable "WFBE_C_UNITS_TRACK_INFANTRY") > 0) then {
			_unit setVehicleInit Format["[this,%1] ExecVM 'Common\Init\Init_Unit.sqf';", _side];
			processInitCommands;
		} else {
			if (isPlayer leader _team) then {[_unit, _side] ExecVM 'Common\Init\Init_Unit.sqf'};
		};
	};
};

_unit addEventHandler ['Killed', Format ['[_this select 0,_this select 1,%1] Spawn WFBE_CO_FNC_OnUnitKilled', _side]];
	
["INFORMATION", Format ["Common_CreateUnit.sqf: [%1] Unit [%2] was created at [%3] and has been assigned to team [%4]", _side Call WFBE_CO_FNC_GetSideFromID, _type, _position, _team]] Call WFBE_CO_FNC_LogContent;

if (_type == "I44_Man_R_F_P08") then
{
_unit addMagazine "I44_10rd_792x57_Tracer_G43"; _unit addWeapon "I44_G43"; 
_unit addMagazine "I44_10rd_792x57_Tracer_G43"; _unit addMagazine "I44_10rd_792x57_Tracer_G43"; 
_unit addMagazine "I44_10rd_792x57_Tracer_G43"; _unit addMagazine "I44_10rd_792x57_Tracer_G43"; 
_unit addMagazine "I44_Rocket_88mm_RPzBGr4322_RPzB54"; _unit addWeapon "I44_RPzB54"; 
_unit addMagazine "I44_Rocket_88mm_RPzBGr4322_RPzB54"; _unit addMagazine "I44_Rocket_88mm_RPzBGr4322_RPzB54"; 
_unit addMagazine "I44_HandGrenade_StiHgr24";
};

if (_type == "I44_Man_R_F_P38") then
{
_unit addMagazine "I44_m2_flamethrower_mag"; _unit addWeapon "I44_M2_flameThrower"; 
_unit addMagazine "I44_m2_flamethrower_mag"; _unit addMagazine "I44_m2_flamethrower_mag"; 
_unit addBackpack "I44_Backpack_M2flamethrower"; 
};

/*if (_type == "I44_Man_R_F_P38") then
{
_unit addMagazine "I44_m2_flamethrower_mag"; _unit addWeapon "I44_M2_flameThrower"; 
_unit addBackpack "I44_Backpack_M2flamethrower"; 
};*/

if (_type == "I44_Man_G_WH_Medic") then
{
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addWeapon "I44_K98k"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
};

if (_type == "I44_Man_G_SS_Medic") then
{
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addWeapon "I44_K98k"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
};  

if (_type == "I44_Man_G_SS_Medic_Winter") then
{
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addWeapon "I44_K98k"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
};

if (_type == "I44_Man_G_WL_FJ_Medic") then
{
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addWeapon "I44_K98k"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98"; 
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
_unit addMagazine "I44_5rd_792x57_Mix_K98"; _unit addMagazine "I44_5rd_792x57_Mix_K98";
};  

if (_type == "I44_Man_B_Army_AB_Medic") then
{
_unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; _unit addWeapon "I44_LeeEnfieldNo4Mk1"; 
_unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; _unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; 
_unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; _unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield";
};

if (_type == "I44_Man_A_Army_AB_Medic_Winter") then
{
_unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; _unit addWeapon "I44_LeeEnfieldNo4Mk1"; 
_unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; _unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; 
_unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield"; _unit addMagazine "I44_10rd_77x56R_Ball_LeeEnfield";
};

if (_type == "I44_Man_A_Army_DDay_Medic") then
{
_unit addMagazine "I44_5rd_762x63_Mix_M1903"; _unit addWeapon "I44_M1903A3"; 
_unit addMagazine "I44_5rd_762x63_Mix_M1903"; _unit addMagazine "I44_5rd_762x63_Mix_M1903"; 
_unit addMagazine "I44_5rd_762x63_Mix_M1903"; _unit addMagazine "I44_5rd_762x63_Mix_M1903";
};

if (_type == "I44_Man_A_Army_Ranger_Medic") then
{
_unit addMagazine "I44_5rd_762x63_Mix_M1903"; _unit addWeapon "I44_M1903A3"; 
_unit addMagazine "I44_5rd_762x63_Mix_M1903"; _unit addMagazine "I44_5rd_762x63_Mix_M1903"; 
_unit addMagazine "I44_5rd_762x63_Mix_M1903"; _unit addMagazine "I44_5rd_762x63_Mix_M1903";
};

_unit