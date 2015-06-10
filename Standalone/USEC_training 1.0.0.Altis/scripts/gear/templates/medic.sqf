_unit addMagazines [_rifleAmmo, 10];
_unit addWeapon _rifle;

_unit addPrimaryWeaponItem _opticShort;

//Squad medic needs some more medical stuff

{
	_unit addItem _bandageBasic;
	_unit addItem _bandageElastic;
	_unit addItem _quickClot;
} forEach [1,2,3,4,5,6,7,8,9,10];

{
	_unit addItem _bandagePacking;
} forEach [1,2,3];

{
	_unit addItem _cat;
	_unit addItem _blood;
	
} forEach [1,2];

{
	_unit addItem _plasma;
	_unit addItem _epipen;
	_unit addItem _morphine;
} forEach [1,2,3,4,5];

{
	_unit addItem _atropine;
} forEach [1,2,3,4,5,6,7,8];

_unit addItem _pak;
_unit addItem _surgical;


//Squad Medic also needs some more smokes
{
	_unit addItem _smoke;
	_unit addItem _smokePurple;
} forEach [1,2,3];