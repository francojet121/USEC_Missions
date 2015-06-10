private ["_newUnit","_oldUnit"];

_newUnit = (_this select 0);
_oldUnit = (_this select 1);

//Loadout the player only if not the initial respawn
if (!(_oldUnit isEqualTo objNull)) then {
	[_newUnit] call USEC_fnc_giveLoadout;
};

//Sync the players rank with his name
_newUnit call USEC_fnc_syncRank;