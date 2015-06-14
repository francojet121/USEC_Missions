/*
	BONYO_fnc_loadLocker
	
	DESCRIPTION:
		This function loads the contents of local player into the given box
		
	PARAMETERS:
		Object
			Box to load the locker into
			
	RETURNS
		nothing
		
	EXAMPLE
		_box call BONYO_fnc_loadLocker
*/

private ["_box","_contents"];

_box = _this;

if (isNil "_box") then {
	["The given argument is nil"] call BIS_fnc_error;
};

clearItemCargo _box;
clearWeaponCargo _box;
clearMagazineCargo _box;
clearBackpackCargo _box;
			
_contents = (profileNamespace getVariable ["bonyo_locker", [[],[],[]]]);

{
	_box addItemCargoGlobal _x;
} forEach (_contents select 0);

{
	_box addMagazineCargoGlobal _x;
} forEach (_contents select 1);

{
	_box addWeaponCargoGlobal _x;
} forEach (_contents select 2);

{
	_box addBackpackCargoGlobal _x;
} forEach (_contents select 3);

//Because BIS_fnc_basicBackpack doesn't work for some reason
//Damn you BI
{
	clearItemCargo _x;
	clearWeaponCargo _x;
	clearMagazineCargo _x;
} forEach (everyBackpack _box);