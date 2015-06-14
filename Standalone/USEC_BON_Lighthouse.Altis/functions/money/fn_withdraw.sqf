/*
	BONYO_fnc_withdraw
	
	DESCRIPTION:
		This function subtracts the given amount of Bonyo Points from the communal balance and adds it the the personal balance of the given player
		
	PARAMETERS:
		Player
			The player to give to
		Amount
			The amount to take
			
	RETURNS
		nothing
		
	EXAMPLE
		[_unit, 50] call BONYO_fnc_withdraw
*/
private ["_unit","_amount"];

if (isNil "_this") then {
	["Given argument is nil"] call BIS_fnc_error;
};

_unit = (_this select 0);
_amount = (_this select 1);

if (isNil "_unit" || isNil "_amount") then {
	[format ["One of the given arguments is nil: %1",_this]] call BIS_fnc_error;
};

if (!(_unit in (call CBA_fnc_players))) then {
	["Given unit is not a player"] call BIS_fnc_error;
};

[0, {
	private ["_unit","_amount","_communalBalance"];
	
	_unit = (_this select 0);
	_amount = (_this select 1);
	
	_communalBalance = (profileNamespace getVariable ["bonyo_pointsCom",0]);
	
	
	//If there is enough in the communal balance
	if (_communalBalance >= _amount) then {
		_communalBalance = _communalBalance - _amount;
	
	//If there is not enough in the communal balance
	} else {
		_amount = _communalBalance;
		_communalBalance = 0;
	};
	
	profileNamespace setVariable ["bonyo_pointsCom",_communalBalance];
	saveProfileNamespace;
	
	//Add to the units account
	[-1, {
		private ["_unit","_unit"];
		
		_unit = (_this select 0);
		_amount = (_this select 1);
		
		if (player == _unit) then {
			private ["_personalBalance"];
			
			_personalBalance = (profileNamespace getVariable ["bonyo_points",0]);
			_personalBalance = _personalBalance + _amount;
			
			profileNamespace setVariable ["bonyo_points",_personalBalance];
			saveProfileNamespace;
			
			hint format ["Widthdrew: $%1", _amount];
		};
	}, [_unit,_amount]] call CBA_fnc_globalExecute;
}, [_unit, _amount]] call CBA_fnc_globalExecute;