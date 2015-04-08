/*--------------------------------------------------------------------
	Author: Unity Security Force (B.Knyte)
	
	teleport.sqf
	Script for teleporting between destinations, they can be fixed or dynamic positions
	
	Call from initPlayerLocal.sqf OR vehicle/item init with:
		execVM "USEC\teleport.sqf";
--------------------------------------------------------------------*/

_dest = _this select 3 select 0;
_offset = _this select 3 select 1;
_isVehicle = _this select 3 select 2;

if (_isVehicle == 1) then {
	if (speed _dest < .5) then {
		player setPosASL [(getPosASL _dest select 0) + ((_offset select 0) * cos(getDir _dest)),(getPosASL _dest select 1) + ((_offset select 1) * sin(getDir _dest)),(getPosASL _dest select 2) + (_offset select 2)];
		player setDir (getDir _dest);
	} else {
		Hint "Vehicle in transit. Standby";
	};
} else {
	player setPosASL [(getPosASL _dest select 0) + ((_offset select 0) * cos(getDir _dest)),(getPosASL _dest select 1) + ((_offset select 1) * sin(getDir _dest)),(getPosASL _dest select 2) + (_offset select 2)];
	player setDir (getDir _dest);
};