_player = _this select 0;
_didJIP = _this select 1;

if (_didJIP && time > 60) then {
	_player setDamage 1;
};