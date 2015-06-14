/*
	BONYO_fnc_giveMoney
	
	DESCRIPTION:
		This function gives the given player the given amount of money
		
	PARAMETERS:
		Player
			The player to receive the money
		
		Amount
			The amount of money to be given
			
		Show Hint (DEFAULT: false)
			if true a hint will be shown informing the unit how much they picked up
			
	RETURNS
		nothing
		
	EXAMPLE
		[_unit, 50, true] call BONYO_fnc_giveMoney
*/

private ["_unit","_amount","_showHint"];

if (isNil "_this") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_unit = (_this select 0);
_amount = (_this select 1);
_showHint = (_this select 2);

if (isNil "_unit" || isNil "_amount") then {
	[format ["A given parameter is nil: %1", _this]] call BIS_fnc_error;
};

if (!(_unit in (call CBA_fnc_players))) then {
	["The given unit is not a player"] call BIS_fnc_error;
};

if (isNil "_showHint") then {
	_showHint = false;
};

[-1, {
	private ["_unit","_amount","_showHint","_personalBalance"];
	
	_unit = (_this select 0);
	_amount = (_this select 1);
	_showHint = (_this select 2);
	
	if (player == _unit) then {
		_personalBalance = (profileNamespace getVariable ["bonyo_points",0]);
		_personalBalance = _personalBalance + _amount;
		
		profileNamespace setVariable ["bonyo_points",_personalBalance];
		saveProfileNamespace;
		
		if (_showHint) then {
			hint format ["Picked up $%1",_amount];
		};
	};
}, [_unit, _amount, _showHint]] call CBA_fnc_globalExecute;