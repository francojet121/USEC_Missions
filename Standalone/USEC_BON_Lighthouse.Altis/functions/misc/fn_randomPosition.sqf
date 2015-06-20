/*
	BONYO_fnc_randomPosition
	
	DESCRIPTION:
		This function generates a random position between the specified points
		
	PARAMETERS:
		Bottom Left
			The bottom leftmost possible point
		Top Right
			The top rightmost possible point
		AllowWater (DEFAULT: false)
			True if the point may exist over water
			
	RETURNS
		nothing
		
	EXAMPLE
		 [[0,0,0], [100,100,0], false] call BONYO_fnc_randomPosition
*/

private ["_bl","_tr","_allowWater","_pos"];

_bl = (_this select 0);
_tr = (_this select 1);
_allowWater = (_this select 2);

if (isNil "_allowWater") then {
	_allowWater = false;
};

_pos = [(random ((_bl select 0) - (_tr select 0))) + (_tr select 0), (random ((_bl select 1) - (_tr select 1))) + (_tr select 1),0];

if (surfaceIsWater _pos && !_allowWater) then {
	_pos = [_bl,_tr,_allowWater] call BONYO_fnc_randomPosition;
};

_pos;