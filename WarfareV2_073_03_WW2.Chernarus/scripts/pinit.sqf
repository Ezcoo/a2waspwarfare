

_pos = [0,0,0];


_rainmarkt = createMarkerLocal ["rainmarkt", _pos];
_rainmarkt setMarkerTypeLocal "DOT";
_rainmarkt setMarkerColorLocal "ColorBlack";
_rainmarkt setMarkerTextLocal "R A I N";
_rainmarkt setMarkerSizeLocal [0, 0];

_rainmarkt = createMarkerLocal ["rainmarkt2", _pos];
_rainmarkt setMarkerShapeLocal "ICON";
_rainmarkt setMarkerTypeLocal "DOT";
_rainmarkt setMarkerColorLocal "ColorBlack";
_rainmarkt setMarkerTextLocal "R A I N";
_rainmarkt setMarkerSizeLocal [0, 0];

_rainmarkt = createMarkerLocal ["rainmarkt3", _pos];
_rainmarkt setMarkerShapeLocal "ICON";
_rainmarkt setMarkerTypeLocal "DOT";
_rainmarkt setMarkerColorLocal "ColorBlack";
_rainmarkt setMarkerTextLocal "R A I N";
_rainmarkt setMarkerSizeLocal [0, 0];

_rainmarkt = createMarkerLocal ["rainmarkt3", _pos];
_rainmarkt setMarkerShapeLocal "ICON";
_rainmarkt setMarkerTypeLocal "DOT";
_rainmarkt setMarkerColorLocal "ColorBlack";
_rainmarkt setMarkerTextLocal "R A I N";
_rainmarkt setMarkerSizeLocal [0, 0];

_rainmarkt = createMarkerLocal ["rainmarkt4", _pos];
_rainmarkt setMarkerShapeLocal "ICON";
_rainmarkt setMarkerTypeLocal "DOT";
_rainmarkt setMarkerColorLocal "ColorBlack";
_rainmarkt setMarkerTextLocal "R A I N";
_rainmarkt setMarkerSizeLocal [0, 0];

_cthread = [] execVM "scripts\MainThreadC.sqf";
//_handle = [] execVM "scripts\fog.sqf";
_handle = [] execVM "scripts\rain.sqf";

