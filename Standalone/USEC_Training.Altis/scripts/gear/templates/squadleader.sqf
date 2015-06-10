removeBackpack _unit;

_unit addBackpack _radioLR;

_unit addMagazines [_rifleAmmo, 10];
_unit addWeapon _rifleGL;

_unit addWeapon _bino;

_unit addItem _gps;
_unit assignItem _gps;

_unit unAssignItem _nvgR;
_unit removeItem _nvgR;

_unit addItem _nvgSL;
_unit assignItem _nvgSL;

_unit addPrimaryWeaponItem _opticLong;

{
	_unit addItem _GLHE;
} forEach [1,2,3];

{
	_unit addItem _GLSmoke;
	_unit addItem _GLSmokeRed;
	_unit addItem _GLSmokeGreen;
	_unit addItem _GLSmokeYellow;
} forEach [1,2];