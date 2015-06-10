private ["_unit","_rank"];

_unit = _this;
_rank = "PRIVATE";

if ((name _unit) find "PVT" > -1) then {
	_rank = "PRIVATE";
};

if ((name _unit) find "PFC" > -1) then {
	_rank = "PRIVATE";
};

if ((name _unit) find "LCPL" > -1) then {
	_rank = "CORPORAL";
};

if ((name _unit) find "CPL" > -1) then {
	_rank = "CORPORAL";
};

if ((name _unit) find "SGT" > -1) then {
	_rank = "SERGEANT";
};

if ((name _unit) find "LT" > -1) then {
	_rank = "LIEUTENANT";
};

if ((name _unit) find "CAPT" > -1) then {
	_rank = "CAPTAIN";
};

if ((name _unit) find "MAJ" > -1) then {
	_rank = "MAJOR";
};

if ((name _unit) find "COL" > -1) then {
	_rank = "COLONEL";
};

[-2, {(_this select 0) setUnitRank (_this select 1);}, [_unit, _rank]] call CBA_fnc_globalExecute;