private ["_pos","_i","_box"];


"awayMission" setMarkerText "Ammo Cache";
["AwayMission",["Ammo Cache"]] call BIS_fnc_showNotification;

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

//Add random mags
_box addMagazineCargo ["30Rnd_556x45_Stanag", round random 50];
_box addMagazineCargo ["30Rnd_65x39_caseless_mag", round random 50];
_box addMagazineCargo ["20Rnd_762x51_Mag", round random 50];
_box addMagazineCargo ["7Rnd_408_Mag", round random 50];
_box addMagazineCargo ["5Rnd_127x108_Mag", round random 50];
_box addMagazineCargo ["100Rnd_65x39_caseless_mag", round random 50];
_box addMagazineCargo ["200Rnd_65x39_cased_Box", round random 50];
_box addMagazineCargo ["30Rnd_9x21_Mag", round random 50];
_box addMagazineCargo ["16Rnd_9x21_Mag", round random 50];
_box addMagazineCargo ["200Rnd_65x39_Belt", round random 50];
_box addMagazineCargo ["30Rnd_45ACP_Mag_SMG_01", round random 50];
_box addMagazineCargo ["9Rnd_45ACP_Mag", round random 50];
_box addMagazineCargo ["150Rnd_762x54_Box", round random 50];
_box addMagazineCargo ["6Rnd_45ACP_Cylinder", round random 50];
_box addMagazineCargo ["10Rnd_762x54_Mag", round random 50];
_box addMagazineCargo ["rhs_30Rnd_545x39_AK", round random 50];
_box addMagazineCargo ["rhs_30Rnd_762x39mm", round random 50];
_box addMagazineCargo ["rhsusf_20Rnd_762x51_m118_special_Mag", round random 50];
_box addMagazineCargo ["rhsusf_50Rnd_762x51", round random 50];
_box addMagazineCargo ["rhs_200rnd_556x45_M_SAW", round random 50];
_box addMagazineCargo ["rhs_10Rnd_762x54mmR_7N1", round random 50];

//Add random GL
_box addMagazineCargo ["1Rnd_HE_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_HE_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_Smoke_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_Smoke_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_SmokeRed_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_SmokeRed_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_SmokeGreen_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_SmokeGreen_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_SmokeYellow_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_SmokeYellow_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_SmokePurple_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_SmokePurple_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_SmokeBlue_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_SmokeBlue_Grenade_shell", round random 25];
_box addMagazineCargo ["1Rnd_SmokeOrange_Grenade_shell", round random 25];
_box addMagazineCargo ["3Rnd_SmokeOrange_Grenade_shell", round random 25];