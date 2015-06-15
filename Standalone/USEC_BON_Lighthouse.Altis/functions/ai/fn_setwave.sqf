/*
	BONOY_fnc_setWave
	
	DESCRIPTION:
		This function sets the wave to the given number
		This function has a global effect
		
	PARAMETERS:
		Number
			The number which BONYO_var_wave will be set to
			
	RETURNS
		nothing
		
	EXAMPLE
		 10 call BONOY_fnc_setWave
*/

private ["_num"];

_num = _this;

if (isNil "_num") then {
	["The given argument is nil"] call BIS_fnc_error;
};

[0, {
	BONYO_var_wave = _this;
}, _num] call CBA_fnc_globalExecute;