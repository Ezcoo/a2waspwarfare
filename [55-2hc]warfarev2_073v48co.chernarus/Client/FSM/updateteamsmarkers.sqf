private["_sideText","_label","_count"];

_sideText = sideJoinedText;
_label = "";
_count = 1;

{
	_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];
	createMarkerLocal [_marker,[0,0,0]];
	//_marker setMarkerTypeLocal "b_inf";
	_marker setMarkerTypeLocal "Arrow"; 		//Marty : draw the players' marker on the map as an Arrow.
	//_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerColorLocal "ColorOrange"; 	//Marty : change the color of each players' marker to be easily visible.
	_marker setMarkerSizeLocal [1,1];
	_count = _count +1;
} forEach clientTeams;

while {!gameOver} do {
	_count = 1;
	{
		deleteMarkerLocal "";
		_label = Format["AI [%1]",_count];
		deleteMarkerLocal _label;

		if !(isNil '_x') then {
			//_markerType = "b_inf"; //Marty : I don't think it is necessary if it's already initialized at begining of the script.
			//_markerType = "Arrow"; //Marty change.
			_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];

			if (alive (leader _x)) then {
				_label = "";
				if (isPlayer (leader _x)) then {
					_label = Format["%1 [%2]",name (leader _x),_count];
					_marker setMarkerTextLocal _label;
					_marker setMarkerPosLocal GetPos (leader _x);
					_marker setMarkerAlphaLocal 1;
					_playerDirection = getDir leader _x; 		//Marty : get the players' angle direction (= azimut) in order to draw the arrow marker in the same direction. 
					_marker setMarkerDirLocal _playerDirection;	//Marty : set the players' angle direction to the marker.
				} else {
					_label = Format["AI [%1]",_count];
					_marker setMarkerTextLocal _label;
					_marker setMarkerPosLocal GetPos (leader _x);
					_marker setMarkerAlphaLocal 0;
				};
			} else {
				label = "";
				if (isPlayer (leader _x)) then {
					_label = Format["%1 [%2]",name (leader _x),_count]
				};
				deleteMarkerLocal _label;
			};
			//_marker setMarkerTypeLocal _markerType; //Marty : I don't think it is necessary if it's already initialized at begining of the script.
		};


		_count = _count + 1;
	} forEach clientTeams;
	sleep 0.01;
};