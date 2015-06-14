/*
	BONYO_fnc_setupATM
	
	DESCRIPTION:
		This function adds the various actions relating to the ATM to an object
		
	PARAMETERS:
		Object
			The object which actions are added to
			
	RETURNS
		nothing
		
	EXAMPLE
		_object call BONYO_fnc_setupATM
*/

private ["_atm"];

_atm = _this;

if (isNil "_atm") then {
	["Given parameter is nil"] call BIS_fnc_error;
};

_atm addAction ["Check Balance", {(_this select 1) call BONYO_fnc_checkBalance}, nil, 6];

_atm addAction ["<t color='#FF0000'>------------------------------</t>", {}, nil, 6];

_atm addAction ["Deposit $50", {[(_this select 1),50] call BONYO_fnc_deposit}, nil, 6];
_atm addAction ["Deposit $500", {[(_this select 1),500] call BONYO_fnc_deposit}, nil, 6];
_atm addAction ["Deposit $5000", {[(_this select 1),5000] call BONYO_fnc_deposit}, nil, 6];

_atm addAction ["<t color='#FF0000'>------------------------------</t>", {}, nil, 6];

_atm addAction ["Withdraw $50", {[(_this select 1),50] call BONYO_fnc_withdraw}, nil, 6];
_atm addAction ["Withdraw $500", {[(_this select 1),500] call BONYO_fnc_withdraw}, nil, 6];
_atm addAction ["Withdraw $5000", {[(_this select 1),5000] call BONYO_fnc_withdraw}, nil, 6];