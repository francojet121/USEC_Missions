/*
	BONYO_fnc_spawnInfGroup
	
	DESCRIPTION:
		This function spawns a random group of infantry at a random ei spawnpoint
		This function must be called on the server
		
	PARAMETERS:
		nothing
			
	RETURNS
		nothing
		
	EXAMPLE
		 call BONYO_fnc_spawnInfGroup
*/

if (!isServer) then {
	["This function can only be called on the server"] call BIS_fnc_error;
};

private ["_rifleman","_mg","_marksman","_teamLeader","_squadLeader","_officer","_riflemanAT","_medic","_sniper","_spotter","_engineer","_exSpecialist","_grenadier","_crewman","_pilot","_aircrew"];
private ["_groupProto","_grp","_spawnPoint"];

_groupProto = [];
_spawnPoint = (BONYO_var_enemySpawn_inf call BIS_fnc_selectRandom);
_grp = createGroup EAST;

//Choose a random faction to load
switch ([1] call BIS_fnc_selectRandom) do {
	case 1: {
		#include "infantry\factions\csat.sqf"
	};
};

//Choose a random group type to load
#include "infantry\groups.sqf"

//Spawn each member of the group and set them up for bonyo
{
	private ["_unit"];
	
	_unit = (_grp createUnit [_x select 0, getMarkerPos _spawnPoint, [], 0, "NONE"]);
	
	_unit setRank (_x select 1);
	
	[-2, {
		BONYO_var_enemyList = BONYO_var_enemyList + [_this];
	}, _unit] call CBA_fnc_globalExecute;
	
	//Give the unit's killer money
	_unit addEventHandler ["killed", {
		private ["_unit","_killer","_reward"];
		
		_unit = (_this select 0);
		_killer = (_this select 1);
		
		_reward = 1;
		
		switch (rank _unit) do {
			case "PRIVATE": {_reward = 10};
			case "CORPORAL": {_reward = 15};
			case "SERGEANT": {_reward = 20};
			case "LIEUTENANT": {_reward = 25};
			case "CAPTAIN": {_reward = 30};
			case "MAJOR": {_reward = 35};
			case "COLONEL": {_reward = 40};
		};
		
		[-2, {
			if (local (_this select 0)) then {
				[player,_this select 1,true] call BONYO_fnc_giveMoney;
			};
		}, [_killer,_reward]] call CBA_fnc_globalExecute;
	}];
} forEach _groupProto;


//Add every unit in the group to the curator list
{
	_x addCuratorEditableObjects [units _grp, true];
} forEach allCurators;

_grp addWaypoint [getMarkerPos "respawn_west", 50];