0 fadeSound 0;
cutRsc["default", "BLACK FADED", 0];

// Weather Settings

// If overcast> 0.8, it will rain.
// Chances of change below.
overcast_chance=60;// Out of 100% (25 = 1/4, 50 = 1/2 etc)
fog_chance=10;
rain_chance=25;

overcast_min=(0*100);
fog_min=(0*100);
rain_min=(0*100);
duration_min=10;// Minutes (+transition time)
transition_min=1;//Minutes

overcast_max=(1*100);
fog_max=(1*100);
rain_max=(1*100);
duration_max=40;//Minutes
transition_max=10;//Minutes

execVM "\usec_code\scripts\usecWeather.sqf";

null = 	[] execVM "\usec_code\setup.sqf";
sleep 1;

execVM "ied_functions.sqf";
execVM "ied_startServer.sqf";
execVM "ied_startClient.sqf";

if (isServer) then {
	_speakers=[
		[5995.3457, 11535.709, 8.7557735,-0.5],
		[5986.8213, 11544.072, 8.7557735,85.2],
		[5995.228, 11552.615, 8.7557735,184],
		[5786.57, 11309.94, 10.794543,135],
		[5852.5752, 11483.85, 3.3558311,1.37],
		[5858.625, 11490.421, 3.3558311,-89]
	];

	{
		_item = createVehicle ["Loudspeaker",[_x select 0,_x select 1,_x select 2],[],0,"CAN_COLLIDE"];
		_item setDir (_x select 3);
		_item setPosATL [_x select 0,_x select 1,_x select 2];
	} foreach _speakers
};