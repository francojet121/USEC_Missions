if (isServer) then {
//Get a Town/Road
	MissionNumber = MissionNumber + 1;
	_radius = 20;
	_orient = 60;
	_units = [];
	_objects = [];
	_townArray = [_radius] call usec_mission_findRoad;
	_town = _townArray select 0;
	_roads = _townArray select 1;
	_crashRoad = (_roads select (floor(random (count _roads))));
	_crashPos = (position _crashRoad);
	_dir = (getDir _crashRoad) + (_orient - (random (_orient * 2)));

//Work out enemy numbers
	_guardNumber = (playersNumber west  * 5);
	//_guardNumber = (({side _x == west} count allUnits)  * 5);
	if (_guardNumber < 5) then {_guardNumber = 5};
	if (_guardNumber > 40) then {_guardNumber = 40};

//Place a wreck
	_wreck = "UH60_wreck_EP1" createVehicle _crashPos;
	_wreck setDir _dir;_wreck setpos _crashPos;
	_cPos = (_wreck modeltoworld [-0.5,2,-2.2]);
	_crater = "CraterLong" createVehicle _cPos;
	_crater setDir _dir;_crater setpos _crashPos;
	_objects = _objects + [_wreck,_crater];

//Place crew
	_crewType = (USEC_MissionPilots select (floor(random (count USEC_MissionPilots))));
	_pilotPosArray = (USEC_CrashHeloPos select (floor(random (count USEC_CrashHeloPos))));
	_pilotPos = _wreck modeltoworld (_pilotPosArray select 0);
	_pilotDir = ((_pilotPosArray select 1) + _dir);
	_group = createGroup west;
	_pilot = 	_group createUnit [_crewType, _crashPos, [], 8, "NONE"];
	_pilot setDamage 0;
	_pilot setPos _pilotPos;
	_pilot setDir _pilotDir;
	_pilot disableAI "ANIM";
	_copilot = 	_group createUnit [_crewType, _crashPos, [], 2, "NONE"];
	_copilot setDamage 1;
	{removeAllWeapons _x} forEach Units _group;
	_units = _units + [_pilot,_copilot];
	
	_pilot setVariable ["NORRN_unconscious", true,true];
	_pilot setVariable["USEC_isDead",true,true];
	_pilot setCaptive 1;

//Place some stationary enemy at helo
	sleep 1;
	_new = [_guardNumber,_crashPos] call usec_mission_defendArea;
	_units = _units + _new;
	
//Create Barricades
	_barricade1 = [20,_crashRoad,0] call usec_mission_placeBarricade;
	_barricade2 = [20,_crashRoad,1] call usec_mission_placeBarricade;	
	_objects = _objects + [_barricade1,_barricade2];

//Place some wandering
	_group2 = createGroup east;
	for "_i" from 1 to (ceil(_guardNumber / 3)) do {		
		_type = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
		_crewman = _group2 createUnit [_type, _crashPos, [], _guardNumber, "NONE"];
		_units = _units + [_crewman];
	};
	_wp = _group2 addWaypoint [_barricade1,5];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";	
	_wp setWaypointSpeed "Limited";
	_wp setWaypointFormation "FILE";
	_wp = _group2 addWaypoint [_barricade2,5];
	_wp setWaypointType "MOVE";
	_wp = _group2 addWaypoint [_barricade1,5];
	_wp setWaypointType "CYCLE";
	_group setCombatMode "RED";
	
//Place wandering civilians
	_new = [];
	_new = [(position _town),3] call usec_mission_spawnGroupCivilian;
	_group3 = group (_new select 0);
	[_group3, (position _town), 1000] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
//Place Proper Patrol
	_new = [];
	_new = [(position _town),ceil(_guardNumber / 3)] call usec_mission_spawnGroup;
	_group3 = group (_new select 0);
	[_group3, (position _town), 1000] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
//Create some house guards
	_new = [];
	_new = [_wreck,_guardNumber] call usec_mission_placeBuildingGuards;	//Guards
	_units = _units + _new;
	
//Place some area guards	
	for "_i" from 1 to ceil((playersNumber west) + 1) do {
		_new = [_wreck,4] call usec_mission_createLoiters;
		_units = _units + _new;
	};
	
//Prepare for cleanup
	_cleanupGroups = [];
	{
		_isIn = ((group _x) in _cleanupGroups);
		if (!_isIn) then {_cleanupGroups = _cleanupGroups + [(group _x)];};
	} forEach _units;
	
//Publish Mission
	USEC_MissionPublisher = [4,MissionNumber,_town,_pilot,_wreck];
	publicVariable "USEC_MissionPublisher";

//Wait until end
	_missionGo = true;
	_stime = time;
	_attack = 0;
	while {_missionGo} do {
		_stillAlive = alive _pilot;
		_ctime = ((time - _stime) /60);
		_nearby = (({isPlayer _x} count (nearestObjects [(position _pilot), ["Man"], 50])) > 0);
		if (_nearby) then {
			_attack = _attack + 1;
			_timeR = (ceil(random 100) + (80 - (_guardNumber * 3)));
			if (_attack > _timeR) then {
				_attack = 0;
				_new = [];
				_new = [_town,ceil((playersNumber west) + 1)] call usec_mission_spawnInternalGroup;
				_units = _units + _new;
				_groupNew = group (_new select 0);
				[_groupNew,(position _pilot)] call BIS_fnc_taskAttack;
			};
		};
		if (!_stillAlive) then {
			_missionGo = false;
		};
		if (_ctime > 60) then {
			_missionGo = false;
		};
		if ((_pilot distance _crashPos) > 2000) then {
			_missionGo = false;
		};
		sleep 2;
	};
	
	sleep (60 * 15);
	
	{deleteVehicle _x} forEach _objects;
	{deleteVehicle _x} forEach _units;
	{deleteGroup _x} forEach _cleanupGroups;
};