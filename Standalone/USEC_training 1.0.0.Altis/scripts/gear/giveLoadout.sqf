private ["_unit","_role"];

_unit = (_this select 0);
_role = (_this select 1);

//Only set role on the machine the unit is local to
if (!local _unit) exitWith {};

diag_log format ["giveLoadout has param %1",_this];

//If we are not given a role then use the one already assigned (Or basic is non is)
if (isNil "_role") then {
	_role = _unit getVariable ["USEC_var_role","basic"];
	diag_log format ["_unit loaded with %1 via stored role",_role];
	
//If we are given a role then update the stored role and loadout with the new one
} else {
	diag_log format ["Setting USEC_var_role to %1",_role];
	_unit setVariable ["USEC_var_role",_role];
};

//Define all standard gear in a file so it can be changed later if needed
#include "standardGear.sqf"

//Give the unit all basic gear
#include "templates\basic.sqf"

//Give the unit role specific gear
switch (_role) do {
	case "basic": {
		//Do nothing if we should just have basic
	};
	
	case "zeus": {
		#include "templates\zeus.sqf"
	};
	
	case "rifleman": {
		#include "templates\rifleman.sqf"
	};
	
	case "squadleader": {
		#include "templates\squadleader.sqf"
	};
	
	case "marksman": {
		#include "templates\marksman.sqf"
	};
	
	case "teamleader": {
		#include "templates\teamleader.sqf"
	};
	
	case "mg": {
		#include "templates\mg.sqf"
	};
	
	case "riflemanat": {
		#include "templates\riflemanat.sqf"
	};
	
	case "medic": {
		#include "templates\medic.sqf"
	};
	
	//If we get an undefined role then make sure they know
	default {
		systemChat format ["Missing Loadout: %1",_role];
		diag_log format ["Missing Loadout: %1",_role];
	};
};