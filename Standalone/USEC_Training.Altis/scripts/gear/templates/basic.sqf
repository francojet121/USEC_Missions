//Take all the units stuff
removeHeadgear _unit:
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
removeUniform _unit;
removeAllWeapons _unit:
removeAllAssignedItems _unit;


//Give the unit his basic clothes
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addHeadgear _helmet;
_unit addBackpack _bag;


//Give the units his items
_unit addItem _watch;
_unit assignItem _watch;

_unit addItem _compass;
_unit assignItem _compass;

_unit addItem _map;
_unit assignItem _map;

_unit addItem _radioSR;
_unit assignItem _radioSR;

_unit addItem _nvgR;
_unit assignItem _nvgR;


//Give the unit his medical stuff
{
	_unit addItem _bandagePacking;
	_unit addItem _bandageElastic;
	_unit addItem _bandageBasic;
} forEach [1,2,3,4,5];

_unit addItem _cat;


//Give unit grenades
{
	_unit addItem _frag;
} forEach [1,2];

{
	_unit addItem _smoke;
} forEach [1,2,3];

_unit addItem _smokeGreen;
_unit addItem _smokeRed;
_unit addItem _smokeYellow;