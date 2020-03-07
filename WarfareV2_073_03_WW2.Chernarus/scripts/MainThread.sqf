
EVO_Weath =
{
	if ((position rainy select 0) > 21944) then
	{
		_randx = 2000;
		_randy = 4463+(random 11857);
		_rnddir = (random 359);
		rainy setpos [_randx,_randy,0];
		//rainy setDir _rnddir;
		//"rainmark" setMarkerDir _rnddir;
	};
	if ((position rainy2 select 0) > 21944) then
	{
		_randx = 2000;
		_randy = 4463+(random 11857);
		_rnddir = (random 359);
		rainy2 setpos [_randx,_randy,0];
		//rainy2 setDir _rnddir;
		//"rainmark2" setMarkerDir _rnddir;
	};
	if ((position rainy3 select 0) > 21944) then
	{
		_randx = 2000;
		_randy = 4463+(random 11857);
		_rnddir = (random 359);
		rainy3 setpos [_randx,_randy,0];
		//rainy3 setDir _rnddir;
		//"rainmark3" setMarkerDir _rnddir;
	};
	if ((position rainy4 select 0) > 21944) then
	{
		_randx = 2000;
		_randy = 4463+(random 11857);
		_rnddir = (random 359);
		rainy4 setpos [_randx,_randy,0];
		//rainy3 setDir _rnddir;
		//"rainmark3" setMarkerDir _rnddir;
	};		
	rainy  setpos [(position rainy select 0)+10,(position rainy select 1),0];"rainmark" setMarkerPos position rainy;
	rainy2 setpos [(position rainy2 select 0)+10,(position rainy2 select 1),0];"rainmark2" setMarkerPos position rainy2;
	rainy3 setpos [(position rainy3 select 0)+10,(position rainy3 select 1),0];"rainmark3" setMarkerPos position rainy3;
	rainy4 setpos [(position rainy4 select 0)+10,(position rainy4 select 1),0];"rainmark4" setMarkerPos position rainy4;
	/*
	if(_counter == 0) then
	{
		_randx = 8000+(random 12000);
		_randy = 12000+(random 3000);
		_rnddir = (random 359);
		//foggy setDir _rnddir;
		//"fogmark" setMarkerDir _rnddir;
		foggy setpos [_randx,_randy,0];
		"fogmark" setMarkerPos position foggy;
		_counter = 200;
	};
	_counter = (_counter - 1);
	*/
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{	
	_time = time;
	//hint "weath";
	[] call EVO_Weath;
	//hint "";
	sleep 5.011;
	
	
};