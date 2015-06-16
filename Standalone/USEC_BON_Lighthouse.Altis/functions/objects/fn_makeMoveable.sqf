/*
	BONYO_fnc_makeMoveable
	
	DESCRIPTION:
		This function makes the given object moveable by the given player
		
	PARAMETERS:
		Object
			The object that will be made moveable
		Player
			The player that will be able to move the object
			
	RETURNS
		nothing
		
	EXAMPLE
		 [_object,_player] call BONYO_fnc_makeMoveable
*/

private ["_object","_player"];

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_object = (_this select 0);
_player = (_this select 1);

if (isNil "_object" || isNil "_player") then {
	[format ["A given parameter is nil",_this]] call BIS_fnc_error;
};

if (!(_player in (call CBA_fnc_players))) then {
	["Given unit is not a player"] call BIS_fnc_error;
};


[_object,false] call BONYO_fnc_collision;

//Only add the addactions on _player local machine
[-1, {
	if (local (_this select 1)) then {
		(_this select 0) addAction ["Move", {
			
			removeAllActions (_this select 0);
			
			(_this select 0) attachTo [player, [0,2,0.5]];
			player setVariable ["bonyo_fortOffset", [0,2,0.5]];
			
			player setVariable ["bonyo_moveFort", {
				private ["_distance","_object","_pos","_newPos"];
				
				_distance = (_this select 0);
				_object = (_this select 1);
				
				_pos = (player getVariable ["bonyo_fortOffset", [0,0,0]]);
				_newPos = [_pos select 0, _pos select 1, (_pos select 2) + _distance];
				
				player setVariable ["bonyo_fortOffset",_newPos];
				
				_object attachTo [player, _newPos]
			}];
			
			player setVariable ["bonyo_fortActions",[
				player addAction ["Move Up", {
					(_this select 3) call (player getVariable ["bonyo_moveFort", {"moveFort broke" call BONYO_fnc_print;}]);
				}, [0.1,(_this select 0)], 6],
				
				player addAction ["Move Down", {
					(_this select 3) call (player getVariable ["bonyo_moveFort", {"moveFort broke" call BONYO_fnc_print;}]);
				}, [-0.1,(_this select 0)], 6],
				
				player addAction ["<t color='#FF0000'>--------------------------------</t>", "", nil, 6],
				
				player addAction ["Move Up Long", {
					(_this select 3) call (player getVariable ["bonyo_moveFort", {"moveFort broke" call BONYO_fnc_print;}]);
				}, [1,(_this select 0)], 6],
				
				player addAction ["Move Down Long", {
					(_this select 3) call (player getVariable ["bonyo_moveFort", {"moveFort broke" call BONYO_fnc_print;}]);
				}, [-1,(_this select 0)], 6],
				
				player addAction ["<t color='#FF0000'>--------------------------------</t>", "", nil, 6],
				
				player addAction ["Place", {
					{
						player removeAction _x;
					} forEach (player getVariable ["bonyo_fortActions", []]);
					
					detach (_this select 3);
					
					[_this select 3,true] call BONYO_fnc_collision;
					
					//Add object to the servers object list so it can be save
					[0, {
						BONYO_var_objectList = BONYO_var_objectList + [_this];
					}, _this select 3] call CBA_fnc_globalExecute;
				}, _this select 0, 6]
			]];
			
		},nil, 6, false, true];
	};
}, _this] call CBA_fnc_globalExecute;