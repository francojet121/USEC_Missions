/*
	BONYO_fnc_setupLocker
	
	DESCRIPTION:
		This function adds the event handler to the given object
		This function has a local effect and must be executed on every machine
		
	PARAMETERS:
		Object
			The object (Assumed to have an inventory) to add the EH to
			
	RETURNS
		nothing
		
	EXAMPLE
		_box call BONYO_fnc_setupLocker
*/

private ["_box"];

_box = _this;

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_box addEventHandler ["ContainerOpened", {
	private ["_box","_player","_personalBox"];
	
	_box = (_this select 0);
	_player = (_this select 1);
	
	_personalBox = "Box_NATO_Wps_F" createVehicleLocal [0,0,5000];
	_personalBox allowDamage false;
	_personalBox hideObject true;
	
	_personalBox attachTo [_player, [0,0,0]];
	
	_personalBox call BONYO_fnc_loadLocker;
	
	_personalBox addeventHandler ["ContainerClosed", {
		private ["_player", "_box"];
		
		_box = (_this select 0);
		_player = (_this select 1);
		
		_box call BONYO_fnc_saveLocker;
	}];
	
	_player action ["gear", _personalBox];
}];