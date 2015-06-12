if (isServer) then {
	//Variables
		MissionNumber = MissionNumber + 2;
		_objectClass = (USEC_MissionTargetCollect select (floor(random (count USEC_MissionTargetCollect))));
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
			_objects = [1,_town] call usec_mission_placeBuildingObjects;
		} else {
			hint "no buildings!";
		};
	_object = _objects select 0;
	_object setVariable ["status",0,true];
		
	//Place some guards
		_guardNumber = (playersNumber west  * 2);
		if (_guardNumber < 5) then {_guardNumber = 5};
		if (_guardNumber > 30) then {_guardNumber = 30};
		_units = [_town,_guardNumber] call usec_mission_placeBuildingGuards;
	
//Place Detection
	_trg = createTrigger["EmptyDetector",(getPos _object)];
	_trg setTriggerArea[800,800,0,false];
	_trg setTriggerActivation["WEST","EAST D",false];
	_trg setTriggerStatements["this", "hint 'detected';", ""];
	_trg setTriggerTimeout [3, 3, 3, true];

//Place Proper Patrol
	_new = [];
	_new = [(position _object),ceil(_guardNumber / 3)] call usec_mission_spawnGroup;
	_group = group (_new select 0);
	[_group, (position _object), 1000] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
//Place Proper Patrol 2
	_new = [];
	_new = [(position _object),ceil(_guardNumber / 3)] call usec_mission_spawnGroup;
	_group = group (_new select 0);
	[_group, (position _object), 400] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
//Place Proper Patrol 3
	_new = [];
	_new = [(position _object),ceil(_guardNumber / 3)] call usec_mission_spawnGroup;
	_group = group (_new select 0);
	[_group, (position _object), 50] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
//Place Proper Patrol 4
	_new = [];
	_new = [(position _object),1] call usec_mission_spawnGroup;
	_group = group (_new select 0);
	[_group, (position _object), 20] call bis_fnc_taskPatrol;
	_units = _units + _new;
	
	//Publish Mission
		USEC_MissionPublisher = [5,MissionNumber,_town,_object];
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
		_ctime = ((time - _stime) /60);
		_status = _object getVariable["status",0];
		if (_status == 1) then {
			_missionGo = false;
		};
		if (_status == 3) then {
			_missionGo = false;
		};
		if (_ctime > 60) then {
			_missionGo = false;
		};
		if (triggeractivated _trg) then {
			_object setVariable ["status",1,true];
		};
		sleep 2;
	};
	
	sleep (60 * 15);
	{deleteVehicle _x} forEach _objects;
	{deleteVehicle _x} forEach _units;
	{deleteGroup _x} forEach _cleanupGroups;
	deleteVehicle _trg;
};