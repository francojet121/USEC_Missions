/*
	BONYO_fnc_print
	
	DESCRIPTION:
		This function prints the given parameter to both the system chat and RPT of every machine
		
	PARAMETERS:
		ANY
			This parameter will be converted to a string automatically
			
	RETURNS
		nothing
		
	EXAMPLE
		"Hello World" call BONYO_fnc_print
*/

private ["_text"];

_text = _this;

//This only matters if we are in singleplayer
if (!isMultiplayer) then {
	diag_log str _this;
	systemChat str _this;
} else {
	[-2, {
		diag_log str _this;
		systemChat str _this;
	}, _text] call CBA_fnc_globalExecute;
};