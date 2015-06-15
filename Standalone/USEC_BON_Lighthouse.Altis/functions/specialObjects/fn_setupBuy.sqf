/*
	BONYO_fnc_setupBuy
	
	DESCRIPTION:
		This function adds the various addactions for the buying stand to the given object
		
	PARAMETERS:
		Objet
			The object to add actions to
			
	RETURNS
		nothing
		
	EXAMPLE
		 _object call BONYO_fnc_setupBuy
*/

private ["_object"];

_object = _this;

if (isNil "_object") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_object addAction ["Coming Soon", ""];