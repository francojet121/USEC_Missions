/*
	BONYO_fnc_setMoney
	
	DESCRIPTION:
		This function sets the balance of the given player's account to the given amount
		
	PARAMETERS:
		Player
			The player whose account will be set
		Amount
			The amount to set the account to
		ShowHint (DEFAULT: false)
			True if a hint should be shown
			
	RETURNS
		nothing
		
	EXAMPLE
		 [_unit, 1000, true] call BONYO_fnc_setMoney
*/

private ["_player","_amount","_showHint"];

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_player = (_this select 0);
_amount = (_this select 1);
_showHint = (_this select 2);

if (isNil "_player" || isNil "_amount") then {
	[format ["A given parameter is nil: %1",_this]] call BIS_fnc_error;
};

if (!(_player in (call CBA_fnc_players))) then {
	["Given unit is not a player"] call BIS_fnc_error;
};

if (isNil "_showHint") then {
	_showHint = false;
};

[-1, {
	if (local (_this select 0)) then {
		profileNamespace setVariable ["bonyo_points", _this select 1];
		saveProfileNamespace;
		
		if (_this select 2) then {
			hint format ["Money set to $%1",_this select 1];
		};
	};
}, [_player,_amount,_showHint]] call CBA_fnc_globalExecute;