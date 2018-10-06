Private ["_pos","_side"];

_pos = _this select 0;
_side = _this select 1;

[_pos, _side] Spawn {
	Private ["_object","_gridmarkers","_col","_pos","_side","_px","_py","_nam","_buildings","_artyRadarInRange","_radar_range"];
	
	_pos = _this select 0;
	_side = _this select 1;
	
	if(_side == side player)then{
		_startAlpha = 0.6;
		_col = "ColorRed";
		_radar_range = missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIARTYRADAR_DETECTION";

		_buildings = (WFBE_Client_SideJoined) Call WFBE_CO_FNC_GetSideStructures;
		_artyRadarInRange = if (isNull (['ArtyRadarTYPE',_buildings,_radar_range,WFBE_Client_SideJoined,player] Call BuildingInRange)) then {false} else {true};


		if (antiArtyRadarInRange) then {
			if (_artyRadarInRange) then {
				
				_px = floor ( (_pos select 0) / 100);
				_py = floor ( (_pos select 1) / 100);
				_nam = format["grid_%1_%2",_px,_py];

				
				createMarkerLocal[_nam,[(_px*100)+50,(_py*100)+50,0]];
				_nam setMarkerShapeLocal "RECTANGLE";
				_nam setMarkerSizeLocal [150,150];
				_nam setMarkerColorLocal _col;
				_nam setMarkerAlphaLocal _startAlpha;
				
				sleep 75;		
				deleteMarkerLocal _nam;
			};
		};
	};
};


