/*
	BONYO_fnc_deposit
	
	DESCRIPTION:
		This function subtracts the given amount of Bonyo Points from the given player and adds it to the communal account
		
	PARAMETERS:
		Player
			The player to take from
		Amount
			The amount to take
			
	RETURNS
		nothing
		
	EXAMPLE
		[_unit, 50] call BONYO_fnc_deposit
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


[-1, {
	private ["_unit","_amount"];
	
	_unit = (_this select 0);
	_amount = (_this select 1);
	
	//Make the script local to the player depositing
	if (_unit == player) then {
		private ["_personalAccount"];
		
		_personalAccount = (profileNamespace getVariable ["bonyo_points",0]);
		
		//If the player has enough for this transaction
		if (_personalAccount >= _amount) then {
			_personalAccount = _personalAccount - _amount;
		
		//If the player does not have enough for this transaction
		} else {
			_amount = _personalAccount;
			_personalAccount = 0;
		};
		
		profileNamespace setVariable ["bonyo_points",_personalAccount];
		saveProfileNamespace;
		
		//Set the balance on the server
		[0, {
			private ["_communalBalance","_amount"];
			
			_amount = _this;
			
			_communalBalance = (profileNamespace getVariable ["bonyo_pointsCom",0]);
			
			_communalBalance = _communalBalance + _amount;
			
			profileNamespace setVariable ["bonyo_pointsCom",_communalBalance];
			saveProfileNamespace;
		}, _amount] call CBA_fnc_globalExecute;
		
		hint format ["Deposited: $%1",_amount];
	};
}, [_unit, _amount]] call CBA_fnc_globalExecute;