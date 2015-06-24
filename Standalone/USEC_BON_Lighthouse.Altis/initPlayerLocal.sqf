//Setup all the special objects for each player that joins
[] call BONYO_fnc_prepareSpecialObjects;

BONYO_var_enemyList = [];

["Bonyo", "Create away Mission", {
	private ["_name"];
	
	_name = player getVariable ["awayName", "Away Mission"];
	
	[_this select 0, _name] call BONYO_fnc_createCustomAwayMission;
}] call Ares_fnc_RegisterCustomModule;