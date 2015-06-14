/*
	BONYO_fnc_checkBalance
	
	DESCRIPTION:
		This function prints the current balance of the given player and the communal balance
		
	PARAMETERS:
		Player
			The player to check the balance of
			
	RETURNS
		nothing
		
	EXAMPLE
		_player call BONYO_fnc_checkBalance
*/

private ["_player"];

_player = _this;

//Make sure the passed unit exists
if (isNil "_player") then {
	["Argument is nil"] call BIS_fnc_error;
};

//Make sure the passed unit is a player
if (!(_player in (call CBA_fnc_players))) then {
	["Given unit is not a player"] call BIS_fnc_error;
};


//Take the red pill and see how deep the rabbit hole goes
[0, {
	private ["_communalBalance"];
	
	_communalBalance = (profileNamespace getVariable ["bonyo_pointsCom",0]);
	
	[-1, {
		private ["_communalBalance","_unit","_privateBalance"];
		
		_communalBalance = (_this select 0);
		_unit = (_this select 1);
		
		if (_unit == player) then {
			_privateBalance = (profileNamespace getVariable ["bonyo_points",0]);
			
			hint format ["Personal Balance: $%1\nCommunal Balance: $%2",_privateBalance,_communalBalance];
		};
	}, [_communalBalance,_this]] call CBA_fnc_globalExecute;
}, _player] call CBA_fnc_globalExecute;