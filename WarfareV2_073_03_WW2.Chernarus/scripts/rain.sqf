// This script is run on the client only. It adjusts the weather if you are in a trigger according to your speed.
// Should you die in a trigger it will reset weather in 10 seconds. depending on the spawn style this may need to be adjusted
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	waitUntil {vehicle player in list rainy or vehicle player in list rainy2 or vehicle player in list rainy3 or vehicle player in list rainy4};
	//2 setRain 1.0;
	if ((speed vehicle player) > 100) then
	{
		30 setOvercast 1.0;
	}
	else
	{
		if ((speed vehicle player) > 25) then
		{
			30 setOvercast 1.0;
		}
		else
		{
			if ((speed vehicle player) < 25) then
			{
				30 setOvercast 1.0;
			};
		};
	};
	waitUntil {not (vehicle player in list rainy or vehicle player in list rainy2 or vehicle player in list rainy3 or vehicle player in list rainy4) or not alive player};
	if (not alive player) then
	{
		30 setOvercast 0.0;
	}
	else
	{
	
		if ((speed vehicle player) > 100 or not alive player) then
		{
			30 setOvercast 0.0;
		}
		else
		{
			if ((speed vehicle player) > 25) then
			{
				30 setOvercast 0.0;
			}
			else
			{
				if ((speed vehicle player) < 25) then
				{
					30 setOvercast 0.0;
				};
			};
		};
	};
	2 setRain 0.0;
	sleep 1.0;
};
		
		
		