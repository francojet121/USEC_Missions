/*
	- Spawn a convoy of vehicles
	- Have a target in one of them
	- Player must stop the convoy
	- If the player is attacked, sends some of his guys to attack those people
	- Gets out of car when disabled
	- Runs away and gives up when all his guards are shot
*/
	hint "CC Debug 1";
if (isServer) then {
/*
	MISSION FUNCTIONS
*/
fnc_mission1_scaredMan = {
	_this addeventhandler ["Killed",{fearValue = fearValue + 30}];
};

MissionNumber = MissionNumber + 1;

_args = _this;
_index = floor(random (count USEC_IslandConvoyPts));
_array = USEC_IslandConvoyPts select _index;
_locSpawn = _array select 0;
_locDest = _array select 1;
_crewClass = "rhs_msv_rifleman";
_index = floor(random (count USEC_MissionCars));
_vehicleClass = USEC_MissionCars select _index;
_spec = "NONE";
_height1 = 0;
_height2 = 0;
if (_vehicleClass isKindOf "Air") then {
	_spec = "FLY";
	_height1 = 50;
	_height2 = 100;
};
USEC_MissionCleanup = [];

_gpDrivers = createGroup east;

_index = floor(random (count USEC_MissionTargetPeople));
_targetClass = USEC_MissionTargetPeople select _index;

//FRONT VEHICLE
	_vhVeh1 = createVehicle [_vehicleClass,_locSpawn,[], 20, _spec];
	USEC_MissionCleanup = USEC_MissionCleanup + [_vhVeh1];
	
	//Create Driver
	_driver = _gpDrivers createUnit [_crewClass, _locSpawn, [], 0, "NONE"];
	_driver assignAsDriver _vhVeh1;
	_driver moveindriver _vhVeh1;
	USEC_MissionCleanup = USEC_MissionCleanup + [_driver];
	
	[_driver] spawn {
		private["_driver","_vehicle","_group"];
		_driver = _this select 0;
		_vehicle = vehicle _driver;
		waitUntil{!(alive _driver) or !(canMove _vehicle)};
		_group = createGroup east;
		[_driver] join _group;
	};

//MAIN VEHICLE
	sleep 2;
	_vhVeh2 = createVehicle [_vehicleClass,_locSpawn,[], 20, _spec];
	USEC_MissionCleanup = USEC_MissionCleanup + [_vhVeh2];
	
	//Create Driver
	_driver = _gpDrivers createUnit [_crewClass, _locSpawn, [], 0, "NONE"];
	_driver assignAsDriver _vhVeh2;
	_driver moveindriver _vhVeh2;
	USEC_MissionCleanup = USEC_MissionCleanup + [_driver];
	
	[_driver] spawn {
		_driver = _this select 0;
		_vehicle = vehicle _driver;
		waitUntil{!(alive _driver) or !(canMove _vehicle)};
		_group = createGroup east;
		[_driver] join _group;
	};
	
//REAR VEHICLE
	sleep 2;
	_vhVeh3 = createVehicle [_vehicleClass,_locSpawn,[], 20,_spec];
	USEC_MissionCleanup = USEC_MissionCleanup + [_vhVeh3];
	
	//Create Driver
	_driver = _gpDrivers createUnit [_crewClass, _locSpawn, [], 0, "NONE"];
	_driver assignAsDriver _vhVeh3;
	_driver moveindriver _vhVeh3;
	USEC_MissionCleanup = USEC_MissionCleanup + [_driver];
	
	[_driver] spawn {
		private["_driver","_vehicle","_group"];
		_driver = _this select 0;
		_vehicle = vehicle _driver;
		waitUntil{!(alive _driver) or !(canMove _vehicle)};
		_group = createGroup east;
		[_driver] join _group;
	};
	
//	_gpVeh1 = createGroup east;
//	_gpVeh2 = createGroup east;
//	_gpVeh3 = createGroup east;
	
	//Create Guards
	[_vhVeh1,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;
	[_vhVeh1,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;
	[_vhVeh1,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;

	//Create Guards
	[_vhVeh2,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;

	//Create Guards
	[_vhVeh3,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;
	[_vhVeh3,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;
	[_vhVeh3,_gpDrivers,_crewClass,_locSpawn] call usec_mission_addGuard;
	
//TARGET
	_gpTarget = createGroup east;
	_target = _gpTarget createUnit [_targetClass, _locSpawn, [], 0, "NONE"];
	_target assignAsCargo _vhVeh2;
	_target moveInCargo _vhVeh2;
	missionTarget = _target;
	targetAway = false;
	USEC_MissionCleanup = USEC_MissionCleanup + [_target];
	
	if (count (weapons _target) == 0) then {
		_target addMagazine "16Rnd_9x21_Mag";
		_target addMagazine "16Rnd_9x21_Mag";
		_target addMagazine "16Rnd_9x21_Mag";
		_target addWeapon "hgun_P07_F";
	};

	//Drivers
	_gpDrivers allowFleeing 0;
	_gpVeh1 allowFleeing 0;
	_gpVeh2 allowFleeing 0;
	_gpVeh3 allowFleeing 0;
	_gpTarget allowFleeing 0;
	
//PUBLISH MISSION
	USEC_MissionPublisher = [1,MissionNumber,_target];
	publicVariable "USEC_MissionPublisher";
	
	{
		_x call fnc_mission1_scaredMan;
		_x addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled;}];
	} forEach USEC_MissionCleanup;
	_cleanup = USEC_MissionCleanup;
	
	/*
	//DELETE THIS
	USEC_MissionPublisher spawn fnc_usec_offerMission;
	player setpos [(position _target select 0),(position _target select 1),0];
	// ----
	*/
	
//Tell drivers to drive to destination
	_wp = _gpDrivers addWaypoint [_locDest,10];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointFormation "FILE";
	_wp setWaypointStatements ["true", "targetAway = true;"];

//START	
	//Driver/target stay in vehicle
	_vehicle = _vhVeh2;
	_vehicle1 = _vhVeh3;
	_vehicle2 = _vhVeh1;
	_driver = driver _vehicle;
	
	while {((canMove _vehicle) and (alive _driver) and (alive _target) and (canMove _target) and !targetAway)} do {
		//Driver is alive, keep both in vehicle
		if (vehicle _driver == _driver) then {
			_driver assignAsDriver _vehicle;
			_driver moveInDriver _vehicle;
		};
		if (vehicle _target == _target) then {
			_target assignAsCargo _vehicle;
			_target moveInCargo _vehicle;
		};
		sleep 1;
	};
	if (!targetAway) then {
		if (canMove _vehicle) then {
			hint "driver dead";
			//Driver dead, but vehicle can move
			_target assignAsDriver _vehicle;
			[_target] orderGetIn true;
			waitUntil{(driver _vehicle == _target) or !(canMove _vehicle) or !(alive _target) or targetAway};
			_wp = (group _target) addWaypoint [_locDest,10];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "CARELESS";
			_wp setWaypointSpeed "FULL";
			_wp setWaypointStatements ["true", "targetAway = true;"];
			waitUntil{!(canMove _vehicle) or !(alive _target) or targetAway};
		};
		hint "vehicle screwed";
		_vehicle = _vehicle1;
		while {((canMove _vehicle) and ((_vehicle distance _target) < 200) and (alive _target) and (canMove _target) and !targetAway)} do {
			//Get in another vehicle
			unassignVehicle (driver _vehicle);
			_target assignAsDriver _vehicle;
			[_target] orderGetIn true;
			waitUntil{(driver _vehicle == _target) or !(canMove _vehicle) or !(alive _target) or targetAway};
			_wp = (group _target) addWaypoint [_locDest,10];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "CARELESS";
			_wp setWaypointSpeed "FULL";
			_wp setWaypointStatements ["true", "targetAway = true;"];
			waitUntil{!(canMove _vehicle) or !(alive _target) or targetAway};
		};
		hint "second vehicle screwed";
		_vehicle = _vehicle2;
		while {((canMove _vehicle) and ((_vehicle distance _target) < 200) and (alive _target) and (canMove _target) and !targetAway)} do {
			//Get in another vehicle
			unassignVehicle (driver _vehicle);
			_target assignAsDriver _vehicle;
			[_target] orderGetIn true;
			waitUntil{(driver _vehicle == _target) or !(canMove _vehicle) or !(alive _target) or targetAway};
			_wp = (group _target) addWaypoint [_locDest,10];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "CARELESS";
			_wp setWaypointSpeed "FULL";
			_wp setWaypointStatements ["true", "targetAway = true;"];
			waitUntil{!(canMove _vehicle) or !(alive _target) or targetAway};
		};
		hint "all vehicles screwed! RUN!";
		
		//Vehicle is f*cked, run!
		 unassignVehicle _target;
		_wp = (group _target) addWaypoint [_locDest,10];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointStatements ["true", "targetAway = true;"];
		
		fearValue = 0;
		_eh1 = _target addeventhandler ["FiredNear",
			{
				_unit = _this select 0;
				_firer = _this select 1;
				_dis = _this select 2;
				if (((side _unit) != (side _firer)) and (_dis < 20)) then {
					fearValue = fearValue + (20 - _dis);
				};
			}
		];
		_eh2 = _target addeventhandler ["Hit",
			{
				_unit = _this select 0;
				_firer = _this select 1;
				_damage = _this select 2;
				_damage = _damage + (damage _unit);
				if ((side _unit) != (side _firer)) then {
					fearValue = fearValue + 500;
				};
			}
		];
		
		while {(fearValue < 500) and (alive _target) and (canMove _target) and !targetAway} do {
			_vehicleList = nearestObjects [_target, ["Car","Motorcycle","Helicopter"], 200];
			
			if (vehicle _target == _target) then {
				if (({canMove _x} count _vehicleList) > 0) then {
					{
						_canDrive = _x emptypositions "Driver";
						if ((canMove _x) and (_canDrive > 0)) then {
							_target assignAsDriver _x;
							[_target] orderGetIn true;
							waitUntil{!(canMove _x) or !(alive _target) or targetAway or fearValue>=500};
						};
					} forEach _vehicleList;
				};
			};
			sleep 1;
		};
	};
	
	sleep 1;
	
	unassignVehicle _target;
	
	if (targetAway) then {
		//HE GOT AWAY!
		_target setVariable["status",1,true];
	} else {
		if (alive _target) then {
			//HE IS CAPTURED!
			_target switchMove "TestSurrender";
			_target setVariable["status",3,true];
			sleep 4;
			//Wait till a player gets close
			_doLoop = true;
			while {_doLoop} do {
				_vehicleList = nearestObjects [_target, ["Man"],3];
				_doLoop = ({isPlayer _x} count _vehicleList) == 0;
				sleep 1;
			};
			_target setVariable["status",4,true];
		} else {
			//HE IS KILLED!
			_target setVariable["status",2,true];
		};
	};
	
	
	
	sleep 60;
	
	targetAway = false;
	{deleteVehicle _x} forEach _cleanup;
	{deleteGroup _x} forEach [_gpDrivers,_gpVeh1,_gpVeh2,_gpVeh3];
};