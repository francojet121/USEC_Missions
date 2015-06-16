/*
	BONYO_fnc_buyFort
	
	DESCRIPTION:
		This function attempts to purchase the given vehicle for the given price with the local player's account
		
	PARAMETERS:
		Vehicle
			The classname of the fortification to be bought
		Cost
			The amount that the fortification costs
			
	RETURNS
		nothing
		
	EXAMPLE
		 ["Land_BagFence_Long_F", 25] call BONYO_fnc_buyFort
*/

private ["_class","_cost"];

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_class = (_this select 0);
_cost = (_this select 1);

if (isNil "_class" || isNil "_cost") then {
	[format ["A given parameter is nil: %1",_this]] call BIS_fnc_error;
};


if ([player, _cost] call BONYO_fnc_purchase) then {
	//Create the fortification on the sever to prevent locality problems
	[0, {
		private ["_class", "_object","_player"];
		
		_class = (_this select 0);
		_player = (_this select 1);
		
		_object = _class createVehicle getMarkerPos "vehicleDeliveryArea";
		
		_object allowDamage false;
		
		[_object,_player] call BONYO_fnc_makeMoveable;
		
	}, [_class,player]] call CBA_fnc_globalExecute;
	
	hint "Fortification Purchased";
} else {
	hint "You do not have enough for this";
};