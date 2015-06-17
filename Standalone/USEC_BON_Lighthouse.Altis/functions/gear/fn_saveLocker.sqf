/*
	BONYO_fnc_saveLocker
	
	DESCRIPTION:
		This function saves the contents of the given box to the local players locker
		
	PARAMETERS:
		Object
			Box to save contents of
			
	RETURNS
		nothing
		
	EXAMPLE
		_box call BONYO_fnc_saveLocker
*/

private ["_box","_contents","_table"];

_box = _this;

if (isNil "_box") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_table = [];
_contents = [getItemCargo _this];

{
	private ["_i","_sub"];
	
	_sub = [];
	
	for [{_i=0}, {_i< count (_x select 0)}, {_i=_i+1}] do {
		_sub pushBack [_x select 0 select _i,_x select 1 select _i];
	};
	
	_table pushBack _sub;
} forEach _contents;

_contents = [getMagazineCargo _box];

{
	private ["_i","_sub"];
	
	_sub = [];
	
	for [{_i=0}, {_i< count (_x select 0)}, {_i=_i+1}] do {
		_sub pushBack [_x select 0 select _i,_x select 1 select _i];
	};
	
	_table pushBack _sub;
} forEach _contents;

_contents = [getWeaponCargo _box];

{
	private ["_i","_sub"];
	
	_sub = [];
	
	for [{_i=0}, {_i< count (_x select 0)}, {_i=_i+1}] do {
		_sub pushBack [[_x select 0 select _i] call BIS_fnc_baseWeapon,_x select 1 select _i];
	};
	
	_table pushBack _sub;
} forEach _contents;

_contents = [getBackpackCargo _box];

{
	private ["_i","_sub"];
	
	_sub = [];
	
	for [{_i=0}, {_i< count (_x select 0)}, {_i=_i+1}] do {
		_sub pushBack [_x select 0 select _i, _x select 1 select _i];

	};
	
	_table pushBack _sub;
} forEach _contents;

deleteVehicle _box;

profileNameSpace setvariable ["bonyo_locker", _table];
saveProfileNamespace;