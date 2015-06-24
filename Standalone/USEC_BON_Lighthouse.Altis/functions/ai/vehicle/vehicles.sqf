private ["_vicList"];

_vicList = [];

_vicList pushback "B_G_Offroad_01_armed_F";

"Creating vic" call BONYO_fnc_print;

_vic = (_vicList call BIS_fnc_selectRandom) createVehicle _spawnPoint;