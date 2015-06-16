/*
	BONYO_fnc_buyVehicle
	
	DESCRIPTION:
		This function attempts to purchase the given vehicle for the given price with the local player's account
		
	PARAMETERS:
		Vehicle
			The classname of the vehicle to be bought
		Cost
			The amount that the vehicle costs
			
	RETURNS
		nothing
		
	EXAMPLE
		 ["B_Quadbike_01_F", 1000] call BONYO_fnc_buyVehicle
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
	//Crete the vehicle on the sever to prevent locality problems
	[0, {
		private ["_class","_vehicle"];
		
		_class = _this;

		_vehicle = _class createVehicle getMarkerPos "vehicleDeliveryArea";
		
		//Vehicle invincibility script
		_vehicle spawn {
			while {!isNil "_this" && alive _this} do {
				if (getPos _this distance getMarkerPos "respawn_west" <= 250) then {
					_this allowDamage false;
				} else {
					_this allowDamage true;
				};
				
				sleep 1;
			};
		};
	}, _class] call CBA_fnc_globalExecute;
	
	hint "Vehicle Purchased";
} else {
	hint "You do not have enough for this";
};