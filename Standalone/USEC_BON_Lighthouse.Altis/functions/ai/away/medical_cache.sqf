private ["_pos","_i","_box"];


"awayMission" setMarkerText "Medical Cache";

[-1, {
	["AwayMission",["Medical Cache"]] call BIS_fnc_showNotification;
}] call CBA_fnc_globalExecute;

_pos = _this;

//Spawn a few groups
for [{_i=0}, {_i<count (call CBA_fnc_players)}, {_i=_i+1}] do {
	private ["_grp","_newPos"];
	
	_newPos = [(_pos select 0) + ((random 200) - 100), (_pos select 1) + ((random 200) - 100), 0];
	
	_grp = _newPos call BONYO_fnc_spawnInfGroup;
	
	[_grp, _pos, (random 240) + 10] call BIS_fnc_taskPatrol;
	
	{
		BONYO_var_awayList pushBack _x;
	} forEach units _grp;
};

_box = ("B_CargoNet_01_ammo_F" createVehicle _pos);

BONYO_var_awayList pushBack _box;

clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

//Add random meds
_box addItemCargoGlobal ["ACE_fieldDressing", round random 100];
_box addItemCargoGlobal ["ACE_morphine", round random 75];
_box addItemCargoGlobal ["ACE_tourniquet", round random 50];
_box addItemCargoGlobal ["ACE_epinephrine", round random 30];
_box addItemCargoGlobal ["ACE_bloodIV_500", round random 20];