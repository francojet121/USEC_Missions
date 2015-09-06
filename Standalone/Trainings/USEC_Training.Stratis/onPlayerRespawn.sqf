private ["_newUnit","_oldUnit"];

_newUnit = (_this select 0);
_oldUnit = (_this select 1);

//Sync the players rank with his name
_newUnit call USEC_fnc_syncRank;

//Non USEC-Standard code below here ------------------------------------------