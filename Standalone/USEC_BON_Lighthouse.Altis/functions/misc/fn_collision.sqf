/*
	BONYO_fnc_collision
	
	DESCRIPTION:
		This function enables/disables collision of the given object with all players
		This function has a global effect
		
	PARAMETERS:
		Object
			The object whose collision will be enabled/disabled
		Enable
			True to enable collision, False to disable
			
	RETURNS
		nothing
		
	EXAMPLE
		 [_object, false] call BONYO_fnc_collision
*/

private ["_object","_enable"];

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_object = (_this select 0);
_enable = (_this select 1);

if (isNil "_object" || isNil "_enable") then {
	[format ["A given parameter is nil",_this]] call BIS_fnc_error;
};

[-2, {
	if (local (_this select 0)) then {
		{
			//If enabling collision
			if (_this select 1) then {
				
				//Enable collision on the local machine of the object
				(_this select 0) enableCollisionWith _x;
				
				//Enable collision on the local machine of the player
				[-2, {
					if (local (_this select 0)) then {
						(_this select 0) enableCollisionWith (_this select 1);
					};
				}, [_x, _this select 0]] call CBA_fnc_globalExecute;
				
			//If disabling collision
			} else {
			
				//Disable collision on the local machine of the object
				(_this select 0) disableCollisionWith _x;
				
				//Disable collision on the local machine of the player
				[-2, {
					if (local (_this select 0)) then {
						(_this select 0) disableCollisionWith (_this select 1);
					};
				}, [_x, _this select 0]] call CBA_fnc_globalExecute;
			
			};
		} forEach (call CBA_fnc_players);
	};
}, _this] call CBA_fnc_globalExecute;