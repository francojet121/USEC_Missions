/*
	- Destroy weapon caches
	- Clear a town of insurgents
	- Once all caches destroyed, finish mission
	- End mission automatically after one hour
*/
if (isServer) then {
	//Variables
		MissionNumber = MissionNumber + 1;
		_objectClass = (USEC_MissionTargetDestroy select (floor(random (count USEC_MissionTargetDestroy))));
		_playersNo =  ((playersNumber west) + 1);
		_objectQty = (floor(random _playersNo));
		if (_objectQty < _playersNo) then {_objectQty = _playersNo};
		if (_objectQty > 5) then {_objectQty = 5};
		_selectedBuildings = [];
		_objects = [];
		_units = [];
		
	//Get a Town
		_townArray = [_objectQty] call usec_mission_findTown;
		_town = _townArray select 0;
		_townBuildings = _townArray select 1;
		
	//Place some objects
		_array = [];
		if (count _townBuildings > 0) then {			
			player sideChat format ["%1 (%2 buildings)",(text _town),(count _townBuildings)];
			_objects = [_objectQty,_town] call usec_mission_placeBuildingObjects;
		} else {
			hint "no buildings!";
		};
	//Place some guards
		_guardNumber = (playersNumber west  * 4);
		if (_guardNumber < 5) then {_guardNumber = 5};
		if (_guardNumber > 30) then {_guardNumber = 30};
		_units = [_town,_guardNumber] call usec_mission_placeBuildingGuards;
		
	//Place some area guards
	_new = [];
	for "_i" from 1 to ceil((playersNumber west) + 1) do {
		_new = [_town,4] call usec_mission_createLoiters;
		_units = _units + _new;
	};
	
//Place Proper Patrol
	_new = [];
	_new = [(position _town),ceil(_guardNumber / 3)] call usec_mission_spawnGroup;
	_group = group (_new select 0);
	[_group, (position _town), 1000] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
	//Place some defenders
	_roads = (position _town) nearRoads 400;
	_crashRoad = (_roads select (floor(random (count _roads))));
	_crashPos = (position _crashRoad);
	_new = [_guardNumber,_crashPos] call usec_mission_defendArea;
	_units = _units + _new;
	
	//Publish Mission
		USEC_MissionPublisher = [3,MissionNumber,_town,_objects];
		publicVariable "USEC_MissionPublisher";

	//DELETE THIS
	//ALSO: REMOVE MARKERS!
	/*
	player setcaptive true;
	USEC_MissionPublisher spawn fnc_usec_offerMission;
	player setpos (position _town);
	*/
	// ----
	
	//Wait for complete
	_missionGo = true;
	_stime = time;
	_cleanupGroups = [];
	{
		_isIn = ((group _x) in _cleanupGroups);
		if (!_isIn) then {_cleanupGroups = _cleanupGroups + [(group _x)];};
	} forEach _units;
	_attack = 0;
	
	while {_missionGo} do {
		_stillAlive = {alive _x} count _objects;
		_ctime = ((time - _stime) /60);
		_nearby = (({isPlayer _x} count (nearestObjects [(position _town), ["Man"], 400])) > 0);
		if (_nearby) then {
			_attack = _attack + 1;
			_timeR = (ceil(random 100) + (80 - (_guardNumber * 3)));
			if (_attack > _timeR) then {
				_attack = 0;
				_new = [];
				_new = [_town,((playersNumber west) + 1)] call usec_mission_spawnInternalGroup;
				_units = _units + _new;
				_groupNew = group (_new select 0);
				[_groupNew,(position _nearby select 0)] call BIS_fnc_taskAttack;
			};
		};
		if (_stillAlive == 0) then {
			_missionGo = false;
		};
		if (_ctime > 60) then {
			_missionGo = false;
		};		
		sleep 2;
	};
	
	sleep (60 * 15);
	{deleteVehicle _x} forEach _objects;
	{deleteVehicle _x} forEach _units;
	{deleteGroup _x} forEach _cleanupGroups;
};