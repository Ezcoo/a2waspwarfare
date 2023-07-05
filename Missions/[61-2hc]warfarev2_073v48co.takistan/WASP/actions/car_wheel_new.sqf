
private ["_x","_skip","_caller","_vcl","_is_wheel_change"];
_caller		= _this select 0;
_vcl 		=  cursorTarget;


_is_wheel_change = _vcl getVariable "wheel_change";
if(isnil '_is_wheel_change') then
{
	if(canMove _vcl) then
	{
		hint localize "STR_WASP_actions_ChangeWheels-CanMove";
		sleep 5;
		hint "";
	}
	else
	{
		_skip = false;
		for [{_x = 0},{_x < 1},{_x = _x + 1}] do {
			sleep 0.5;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 0.5;
			waitUntil {animationState player == "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon" || !alive player || vehicle player != player || !alive _vcl || _vcl distance player > 5};
			if (!alive player || vehicle player != player || !alive _vcl || _vcl distance player > 5) exitWith {_skip = true};
		};

		if (!_skip) then {
			_vcl setVariable ["wheel_change", 1, true];
			[_vcl, "this setHit ['wheel_1_1_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_1_2_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_1_3_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_1_4_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_2_1_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_2_2_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_2_3_steering', 0];"] call WASP_procInitComm;
			[_vcl, "this setHit ['wheel_2_4_steering', 0];"] call WASP_procInitComm;
		};
	};
}
else
{
	hint localize "STR_WASP_actions_ChangeWheels-NoWheel";
	sleep 5;
	hint "";
};







