
EVO_CWeath =
{
	"rainmarkt" setMarkerPosLocal getMarkerPos "rainmark";
	//"rainmark" setMarkerDirLocal getdir rainy;
	
	"rainmarkt2" setMarkerPosLocal getMarkerPos "rainmark2";
	//"rainmark2" setMarkerDirLocal getdir rainy2;
	
	"rainmarkt3" setMarkerPosLocal getMarkerPos "rainmark3";
	//"rainmark3" setMarkerDirLocal getdir rainy3;

	"rainmarkt4" setMarkerPosLocal getMarkerPos "rainmark4";
	//"fogmark" setMarkerDirLocal getdir foggy;
};







for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{	
	_time = time;
	[] call EVO_CWeath;
	sleep 5.011;
};