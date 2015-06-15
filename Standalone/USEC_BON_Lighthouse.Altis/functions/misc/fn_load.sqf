/*
	BONYO_fnc_load
	
	DESCRIPTION:
		This function loads all saved objects for this bonyo map
		This function must be run on the server
		
	PARAMETERS:
		nothing
			
	RETURNS
		nothing
		
	EXAMPLE
		 call BONYO_fnc_load
*/

if (!isServer) then {
	["This function must be executed on the server"] call BIS_fnc_error;
};

{
	private ["_class", "_position", "_dir","_object"];
	
	_class = (_x select 0);
	_position = (_x select 1);
	_dir = (_x select 2);
	
	_object = _class createVehicle _position;
	
	_object setDir _dir;
	
	clearItemCargoGlobal _object;
	clearWeaponCargoglobal _object;
	clearMagazineCargoGlobal _object;
	clearBackpackCargoGlobal _object;
	
	BONYO_var_objectList = BONYO_var_objectList + [_object];
	
	//If it's a vehicle then add the protection loop to it
	if ((_object isKindOf "Air") || (_object isKindOf "LandVehicle")) then {
		_object spawn {
			while {!isNil "_this" && alive _this} do {
				if (getPos _this distance getMarkerPos "respawn_west" <= 100) then {
					_this allowDamage false;
				} else {
					_this allowDamage true;
				};
				
				sleep 1;
			};
		};
	};
} forEach (profileNamespace getvariable [BONYO_info_saveVar, []]);