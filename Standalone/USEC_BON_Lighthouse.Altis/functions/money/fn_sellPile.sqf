/*
	BONYO_fnc_sellPile
	
	DESCRIPTION:
		This function sells the given pile and gives it's worth to the local player
		
	PARAMETERS:
		Object
			The pile to sell
			
	RETURNS
		nothing
		
	EXAMPLE
		_pile call BONYO_fnc_sellPile
*/

private ["_pile","_total"];

_pile = _this;

if (isNil "_pile") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_total = 0;

{	
	_total = _total + (_x * (2 - random 1));
} forEach ((getItemCargo _pile) select 1);

{	
	_total = _total + (_x * (4 - random 2));
} forEach ((getMagazineCargo _pile) select 1);

{	
	_total = _total + (_x * (8 - random 4));
} forEach ((getWeaponCargo _pile) select 1);

{	
	_total = _total + (_x * (16 - random 8));
} forEach ((getBackpackCargo _pile) select 1);

_total = round _total;

[player, _total] call BONYO_fnc_giveMoney;

deleteVehicle _pile;

hint format ["Sold pile for $%1",_total];