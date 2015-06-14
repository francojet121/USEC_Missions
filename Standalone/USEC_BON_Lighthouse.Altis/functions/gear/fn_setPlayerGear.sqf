/*
	BONYO_fnc_setPlayerGear
	
	DESCRIPTION:
		This function sets the given unit's gear to the Bonyo standard
		This function must be executed on the machine that unit is local to
		
	PARAMETERS:
		unit (DEFAULT : player)
			The unit whose gear will be set
			
	RETURNS
		nothing
		
	EXAMPLE
		_unit call BONYO_fnc_setPlayerGear
*/

private ["_unit"];

_unit = _this;

//If we are given a nil value then default to player
if (isNil "_unit") then {
	_unit = player;
};

//This has to be executed locally so if the unit is not local then print the problem and exit the script
if (!local _unit) then {
	(format ["Attempted to set gear on non-local player: %1", _unit]) call BONYO_fnc_print;
	if (true) exitWith {};
};

//Take all the unit's gear that they respawn with	
removeHeadgear _unit:
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
removeUniform _unit;
removeAllWeapons _unit:
removeAllAssignedItems _unit;

//Give the unit the Bonyo uniform and items
_unit addUniform "U_B_CombatUniform_NKPBlack";

_unit addItem "itemGPS";
_unit assignItem "itemGPS";

_unit addItem "itemMap";
_unit assignItem "itemMap";

_unit addItem "itemCompass";
_unit assignItem "itemCompass";

_unit addItem "tf_anprc152_2";
_unit assignItem "tf_anprc152_2";

_unit addItem "itemWatch";
_unit assignItem "itemWatch";

//Give the unit the Standard Bonyo Weapon and ammo
_unit addMagazines ["30Rnd_9x21_Mag",4];
_unit addWeapon "SMG_02_F";

{
	_unit addItem "ACE_fieldDressing";
} forEach [1,2,3,4,5];

_unit addItem "ACE_morphine";

_unit switchMove "";