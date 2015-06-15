/*
	BONYO_fnc_purchase
	
	DESCRIPTION:
		This function checks that the given player has at least the given amount of money, it then subtracts that amount and returns if the given player had enough
		
	PARAMETERS:
		Player
			The player who is making the transaction
		Amount
			The cost of the transaction
			
	RETURNS
		BOOLEAN
			True if the transaction was successful
		
	EXAMPLE
		 [_unit, 50] call BONOY_fnc_purchase
*/

private ["_player","_amount"];

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_player = (_this select 0);
_amount = (_this select 1);

if (isNil "_player" || isNil "_amount") then {
	[format ["A given parameter is nil: %1",_this]] call BIS_fnc_error;
};

if (!(_player in (call CBA_fnc_players))) then {
	["Given unit is not a player"] call BIS_fnc_error;
};

private ["_balance","_ret"];

_balance = (profileNamespace getVariable ["bonyo_points",0]);
_ret = false;

if (_balance >= _amount) then {
	profileNamespace setVariable ["bonyo_points",_balance - _amount];
	saveProfileNamespace;
	
	_ret = true;
};

_ret;