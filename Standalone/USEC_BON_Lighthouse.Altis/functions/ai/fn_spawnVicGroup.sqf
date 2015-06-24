/*
	BONYO_fnc_spawnVicGroup
	
	DESCRIPTION:
		This function spawns a random enemy vehicle at the given point
		This function must be called on the server
		
	PARAMETERS:
		3DPosition
			The location to spawn the AI
			
	RETURNS
		Group
			the group that was spawned
		
	EXAMPLE
		 _pos call BONYO_fnc_spawnVicGroup
*/
"In fnc" call BONYO_fnc_print;

if (!isServer) then {
	["This function must be executed on the server"] call BIS_fnc_error;
};

private ["_rifleman","_mg","_marksman","_teamLeader","_squadLeader","_officer","_riflemanAT","_medic","_sniper","_spotter","_engineer","_exSpecialist","_grenadier","_crewman","_pilot","_aircrew"];
private ["_groupProto","_grp","_spawnPoint","_vic"];

_groupProto = [];
_spawnPoint = _this;
_grp = createGroup EAST;

//Choose a random faction to load
switch ([1,2,3,4,5,6,7] call BIS_fnc_selectRandom) do {
	case 1: {
		#include "infantry\factions\csat.sqf"
	};
	
	case 2: {
		#include "infantry\factions\nato.sqf"
	};
	
	case 3: {
		#include "infantry\factions\guerilla.sqf"
	};
	
	case 4: {
		#include "infantry\factions\indArmy.sqf"
	};
	
	case 5: {
		#include "infantry\factions\usArmyOCP.sqf"
	};
	
	case 6: {
		#include "infantry\factions\USMCMarpat.sqf"
	};
	
	case 7: {
		#include "infantry\factions\russianMSV.sqf"
	};
};

//Choose a random vehicle and create it
#include "vehicle\vehicles.sqf"

//Add the vehicle to the group
_grp addVehicle _vic;

"Starting to create units" call BONYO_fnc_print;
//Spawn each member of the group and set them up for bonyo
{
	private ["_unit"];
	
	_unit = (_grp createUnit [_x select 0, _spawnPoint, [], 0, "NONE"]);
	[_unit] join _grp;
	
	_unit setRank (_x select 1);
	
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
} forEach [[_rifleman, "SERGEANT"],[_rifleman, "CORPORAL"],[_rifleman, "PRIVATE"]];

//Make the units get into their vehicle
(units _grp) orderGetIn true;

//Add every unit in the group to the curator list
{
	_x addCuratorEditableObjects [units _grp, true];
} forEach allCurators;

_grp;