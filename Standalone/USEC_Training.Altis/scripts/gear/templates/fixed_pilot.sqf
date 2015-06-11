//Give the pilot his outfit
_unit forceAddUniform _pilotUniform;
_unit addHeadgear _pilotHelmetFixed;
_unit addVest _pilotVest;
_unit addBackpack _parachute;

//Give the pilot his items
_unit addItem _watch;
_unit assignItem _watch;

_unit addItem _compass;
_unit assignItem _compass;

_unit addItem _map;
_unit assignItem _map;

_unit addItem _radioSR;
_unit assignItem _radioSR;

_unit addItem _nvgSL;
_unit assignItem _nvgSL;

_unit addItem _gps;
_unit assignItem _gps;

//Give the pilot his weapon and ammo
{
	_unit addMagazine _pilotSMGAmmo;
} forEach [1,2,3];

_unit addWeapon _pilotSMG;

//Give the pilot his smokes
{
	_unit addMagazine _smoke;
	_unit addMagazine _smokeYellow;
} forEach [1,2];