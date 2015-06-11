private ["_unit","_role"];

_unit = (_this select 0);
_role = (_this select 1);

//Only set role on the machine the unit is local to
if (!local _unit) exitWith {};

//If we are not given a role then use the one already assigned (Or basic is non is)
if (isNil "_role") then {
	_role = _unit getVariable ["USEC_var_role","basic"];
	
//If we are given a role then update the stored role and loadout with the new one
} else {
	_unit setVariable ["USEC_var_role",_role];
};

//Take all the units stuff
removeHeadgear _unit:
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
removeUniform _unit;
removeAllWeapons _unit:
removeAllAssignedItems _unit;

//Define all standard gear in a file so it can be changed later if needed
#include "standardGear.sqf"

//Give the unit role specific gear
switch (_role) do {
	case "basic": {
		#include "templates\basic_uniform.sqf";
	};
	
	case "zeus": {
		#include "templates\zeus.sqf"
	};
	
	case "rifleman": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\rifleman.sqf"
	};
	
	case "squadleader": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\squadleader.sqf"
	};
	
	case "fixedpilot": {
		#include "templates\fixed_pilot.sqf";
		#include "templates\basic_medical.sqf";
	};
	
	case "aircrew": {
		#include "templates\aircrew.sqf";
		#include "templates\basic_medical.sqf";
	};
	
	case "marksman": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\marksman.sqf"
	};
	
	case "teamleader": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\teamleader.sqf"
	};
	
	case "mg": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\mg.sqf"
	};
	
	case "riflemanat": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\riflemanat.sqf"
	};
	
	case "medic": {
		#include "templates\basic_uniform.sqf";
		#include "templates\basic_medical.sqf";
		#include "templates\basic_grenade.sqf";
		#include "templates\medic.sqf"
	};
	
	//If we get an undefined role then make sure they know and just give them basic
	default {
		#include "templates\basic_uniform.sqf";
		systemChat format ["Missing Loadout: %1",_role];
		diag_log format ["Missing Loadout: %1",_role];
	};
};