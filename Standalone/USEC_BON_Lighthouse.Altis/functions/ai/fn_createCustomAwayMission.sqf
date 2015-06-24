/*
	BONYO_fnc_createCustomAwayMission
	
	DESCRIPTION:
		This function generates a custom made away mission at the given location
		
	PARAMETERS:
		Array
			3d Location of the away mission
		Name
			The display name of the away mission
			
	RETURNS
		nothing
		
	EXAMPLE
		 [100,245,0] call BONYO_fnc_createCustomAwayMission
*/

//This has to run on the server
if (!isServer) then {
	[0, {
		_this call BONYO_fnc_createCustomAwayMission;
	}, _this] call CBA_fnc_globalExecute;
} else {
	private ["_pos","_name"];
	
	_pos = (_this select 0);
	_name = (_this select 1);
	
	{
		deleteVehicle _x;
	} forEach BONYO_var_awayList;

	deleteMarker "awayMission";

	createMarker ["awayMission",_pos];
	"awayMission" setMarkerColor "ColorEAST";
	"awayMission" setMarkerShape "ICON";
	"awayMission" setMarkerType "hd_warning";
	"awayMission" setMarkerText _name;
	
	//Give each unit within 250m the kill EH
	{
		if (!(_x in (call CBA_fnc_players))) then {
			_x addEventHandler ["killed", {
				private ["_unit","_killer","_reward"];
				
				_unit = (_this select 0);
				_killer = (_this select 1);
				
				_reward = 1;
				
				switch (rank _unit) do {
					case "PRIVATE": {_reward = 10};
					case "CORPORAL": {_reward = 15};
					case "SERGEANT": {_reward = 20};
					case "LIEUTENANT": {_reward = 25};
					case "CAPTAIN": {_reward = 30};
					case "MAJOR": {_reward = 35};
					case "COLONEL": {_reward = 40};
				};
				
				[-2, {
					if (local (_this select 0)) then {
						[player,_this select 1,true] call BONYO_fnc_giveMoney;
					};
				}, [_killer,_reward]] call CBA_fnc_globalExecute;
			}];
		};
	} forEach (_pos nearObjects ["Man", 250]);
	
	//Pop the notification
	[-1, {
		["AwayMission",[_this]] call BIS_fnc_showNotification;
	},_name] call CBA_fnc_globalExecute;
};