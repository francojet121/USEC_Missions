/*
	BONOY_fnc_setupStarter
	
	DESCRIPTION:
		This function adds the starter addactions to the given object
		
	PARAMETERS:
		Object
			Object that will be given actions
			
	RETURNS
		nothing
		
	EXAMPLE
		 _object call BONOY_fnc_setupStarter
*/

private ["_object"];

_object = _this;

if (isNil "_object") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_object addAction ["Start Wave", {
	[0, {
		(BONYO_var_wave + 1) call BONYO_fnc_spawnWave;
		[-1, {
			["TaskAssigned",["",format ["Wave %1",_this]]] call BIS_fnc_showNotification;
		}, BONYO_var_wave + 1] call CBA_fnc_globalExecute;
		
		(BONYO_var_wave + 1) call BONYO_fnc_setWave;
	}] call CBA_fnc_globalExecute;
}, nil, 6, false, true, "", "
	private ['_alive'];
	
	_alive = false;
	
	{
		if (alive _x) then {
			_alive = true;
		};
	} forEach BONYO_var_enemyList;
	
	!_alive;
"];

_object addAction ["Buy Trackers $100", {
	if ([_this select 1, 100] call BONYO_fnc_purchase) then {
		hint "Trackers Purchased";
		
		{
			private ["_flare","_smoke"];
			
			_flare = "F_40mm_Red" createVehicle [0,0,500];
			_smoke = "SmokeShellRed" createVehicle [0,0,500];
			
			_flare attachTo [_x, [0,0,50]];
			_smoke attachTo [_x, [0,0,50]];
			
			[_flare,_smoke] spawn {
				sleep 20;
				
				{
					deleteVehicle _x;
				} forEach _this;
			};
		} forEach BONYO_var_enemyList;
	} else {
		hint "You do not have enough for this"
	};
}, nil, 6, false, true, "", "
	private ['_alive'];
	
	_alive = false;
	
	{
		if (alive _x) then {
			_alive = true;
		};
	} forEach BONYO_var_enemyList;
	
	_alive;
"];