private ["_unit"];

_unit = _this;

[-1, {
	private ["_player","_role"];
	
	_player = (_this select 0);
	_role = (_this select 1);
	
	if (local _player) then {
		diag_log format ["Setting units role to %1 via remote", _role];
		_player setVariable ["USEC_var_role",_role];
	};
}, [_unit,_unit getVariable ["USEC_var_role",nil]]] call CBA_fnc_globalExecute;