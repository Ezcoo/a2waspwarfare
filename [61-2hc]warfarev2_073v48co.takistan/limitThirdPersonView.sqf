gameplayLimit3dview = 1;

if (difficultyEnabled "3rdPersonView") then
{
	switch (gameplayLimit3dview) do
	{
		case 1://vehicles only
		{
			while {(true)} do
			{
				if (cameraView == "GROUP") then
				{
					if ((vehicle player) == player) then
						{player switchCamera "Internal";};
					if (cameraView != "INTERNAL") then
						{(vehicle player) switchCamera "Internal";};
				};
				sleep 1;
			};
		};
	};
};