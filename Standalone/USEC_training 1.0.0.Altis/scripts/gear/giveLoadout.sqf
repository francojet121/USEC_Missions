private ["_unit","_role"];

_unit = (_this select 0);
_role = (_this select 1);

//Define all standard gear in a file so it can be changed later if needed
#include "standardGear.sqf"

//Give the unit all basic gear
#include "templates\basic.sqf"

//Give the unit role specific gear
switch (_role) do {
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
	
	default {
		systemChat format ["Missing Loadout: %1",_role];
		diag_log format ["Missing Loadout: %1",_role];
	};
};