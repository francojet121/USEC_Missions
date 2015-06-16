/*
	BONYO_fnc_save
	
	DESCRIPTION:
		This function saves every object in BONYO_var_objectList that is alive
		This function must be run on the server
		
	PARAMETERS:
		nothing
			
	RETURNS
		nothing
		
	EXAMPLE
		 call BONYO_fnc_save
*/

if (!isServer) then {
	["This function must be executed on the server"] call BIS_fnc_error;
};

private ["_fullList"];

_fullList = [];

{
	if (alive _x) then {
		_fullList = _fullList + [[
			typeOf _x,
			getPosATL _x,
			getDir _x
		]];
	};
} forEach (BONYO_var_objectList + (getMarkerPos "respawn_west" nearObjects ["LandVehicle",250]) + (getMarkerPos "respawn_west" nearObjects ["Air",250]));

profileNamespace setVariable [BONYO_info_saveVar, _fullList];
saveProfileNamespace;

[-1, {
	systemChat "Bonyo saved";
}] call CBA_fnc_globalExecute;