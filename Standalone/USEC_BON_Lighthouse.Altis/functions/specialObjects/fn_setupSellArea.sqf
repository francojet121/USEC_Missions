/*
	BONYO_fnc_setupSellArea
	
	DESCRIPTION:
		This function adds the object detection loop to the given object
		
	PARAMETERS:
		Object
			The object marking the sell area
			
	RETURNS
		nothing
		
	EXAMPLE
		_object call BONYO_fnc_setupSellArea
*/

private ["_object"];

_object = _this;

if (isNil "_object") then {
	["Given argument is nil"] call BIS_fnc_error;
};

(_object) spawn {
	private ["_pos"];
	
	_pos = _this;
	
	while {!isNil "_this"} do {
		{
			if (!(_x getVariable ["bonyo_donationAction", false])) then {
				[-2, {
					if (local _this && !(_this getVariable ["bonyo_donationAction",false])) then {
						_this addAction ["Sell", {(_this select 0) call BONYO_fnc_sellPile}, nil, 6, false, true];
					};
					
					_this setVariable ["bonyo_donationAction", true];
				}, _x] call CBA_fnc_globalExecute;
			};
		} forEach ((getPos _this) nearObjects ["GroundWeaponHolder", 4]);
		sleep 1;
	};
};