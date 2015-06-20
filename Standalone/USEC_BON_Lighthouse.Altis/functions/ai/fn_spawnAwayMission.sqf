/*
	BONYO_fnc_spawnAwayMission
	
	DESCRIPTION:
		This function spawns an away mission at a random location on the map (On land...Hopefully)
		This function must be called on the server
		
	PARAMETERS:
		nothing
			
	RETURNS
		nothing
		
	EXAMPLE
		 call BONYO_fnc_spawnAwayMission
*/

//Error checking
if (!isServer) then {
	["This function must be executed on the server"] call BIS_fnc_error;
};

//Function Body
private ["_pos","_oList"];

_pos = [getMarkerPos "coord_bl", getMarkerPos "coord_tr", false] call BONYO_fnc_randomPosition;


{
	deleteVehicle _x;
} forEach BONYO_var_awayList;

deleteMarker "awayMission";

createMarker ["awayMission",_pos];
"awayMission" setMarkerColor "ColorEAST";
"awayMission" setMarkerShape "ICON";
"awayMission" setMarkerType "hd_warning";


//Objectives that can be anywhere
_oList = [
	"ammo_cache"
];

if (isOnRoad _pos) then {
	//Objectives that would fit well on a road
	//_oList pushBack [];
} else {
	//Objectives that would fit well not on a road
	//_oList pushBack [];
};

_pos execVM format ["functions\ai\away\%1.sqf",(_oList call BIS_fnc_selectRandom)];