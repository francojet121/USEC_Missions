
usec_mission_findRoad = {
	//Find a nearby town and return the town plus buildings
	private["_towns","_hasTown","_try","_townBuildings","_town","_array","_objectQty"];
	_radius = _this select 0;
	_towns = (nearestLocations [[7000,7000,0],["NameCityCapital","NameCity","NameVillage"],20000]);
	_hasTown = false;
	_try = 0;
	_townBuildings = [];
	_roads = [];
	_town = _towns select (floor(random (count _towns)));	
	while {!_hasTown and (_try < 10)} do {
		//Find a town
		_town = _towns select (floor(random (count _towns)));
		_townBuildings = nearestObjects [(position _town), USEC_MissionBuildingTypes, 500];
		_try2 = 0;
		_hasBuilding = false;
		while {!_hasTown and (_try2 < 10)} do {
			_nearObj = (_townBuildings select (floor(random (count _townBuildings))));
			_roads = (position _nearObj) nearRoads _radius;
			if (count _roads > 0) then {
				_hasTown = true;
			} else {
				_try2 = _try2 + 1;
			};
		};
	};
	_array = [_town,_roads];
	_array;
};

usec_mission_selectBuilding = {
	private["_towns","_hasTown","_try","_townBuildings","_town","_array","_building"];
	
	//Find the Location
	_towns = (nearestLocations [[7000,7000,0],["NameCityCapital","NameCity","NameVillage"],20000]);
	_hasTown = false;
	_try = 0;
	_townBuildings = [];
	_town = _towns select (floor(random (count _towns)));	
	while {!_hasTown and (_try < 10)} do {
		//Find a town
		_town = _towns select (floor(random (count _towns)));
		_townBuildings = nearestObjects [(position _town), USEC_DirectAction_Buildings, 500];
		if (count _townBuildings > 0) then {
			_hasTown = true;
		} else {
			_try = _try + 1;
		};
	};
	_building = _townBuildings select 0;
	_array = [_town,_building];
	_array;
};

usec_mission_createDirectAction = {
	private["_town","_building","_index","_cleanup","_objType","_objRelPos","_objPos","_objDir","_obj","_group","_crewman"];
	_town = _array select 0;
	_building = _array select 1;
	
	//Set Variables
	_index = USEC_DirectAction_Buildings find (typeOf _building);
	
	//Spawn the stuff
	_cleanupUnit = [];
	{
		_objType = _x select 0;
		_objRelPos = _x select 1;
		_objPos = _building modelToWorld _objRelPos;
		_objDir = (_x select 2) + (direction _building);
		
		if (_objType == "TK_INS_Soldier_2_EP1") then {
			_group = creategroup EAST;
			_type = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
			_obj = _group createUnit [_type, _objPos, [], 100, "NONE"];
			_obj addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
		} else {
			_obj = _objType createVehicle _objPos;
		};
		_cleanupUnit set [count _cleanupUnit,_obj];
		if (_obj isKindOf "StaticWeapon") then {
			_group = creategroup EAST;
			_type = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
			_crewman = _group createUnit [_type, _objPos, [], 100, "NONE"];
			_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
			_crewman assignAsGunner _obj;
			_crewman moveInGunner _obj;
			_cleanupUnit set [count _cleanupUnit,_crewman];
		};
		if (_objType in USEC_DirectAction_GroundObjects) then {
			_obj setpos [_objPos select 0, _objPos select 1, 0];
		} else {
			_obj setposATL _objPos;
		};
		_obj setDir _objDir;
	} forEach (USEC_DirectAction_Positions select _index);
	player setcaptive true;
	player setpos position _building;
	_cleanupUnit;
};

usec_mission_placeBarricade = {
	//Places a barricade a certain distance from a point on a road
	private["_try","_barricadeDis","_dis","_hasLoc","_place","_barricade"];
	_try = 0;
	_barricadeDis = _this select 0;
	_dis = 0;
	_hasLoc = false;
	_place = (roadsConnectedTo (_this select 1)) select (_this select 2);
	while {(_try < 20) and (_dis < _barricadeDis) and !_hasLoc} do {
		if (count (roadsConnectedTo _place) > 0) then {
			_place = (roadsConnectedTo _place) select (_this select 2);
			_dis = _place distance _wreck;
		};
		_try = _try + 1;
	};
	_barricade = "Fort_Barricade_EP1" createVehicle (position _place);
	_barricade setDir (getDir _place);
	_barricade setPos (position _place);
	_barricade;
};

usec_mission_spawnGroup = {
	private["_place","_qty","_units","_type","_crewman"];
	_place = _this select 0;
	_qty = _this select 1;
	_units = [];
	_group = createGroup east;
	for "_i" from 1 to _qty do {		
		_type = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
		_crewman = _group createUnit [_type, _place, [], _qty, "NONE"];
		_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
		_units = _units + [_crewman];
	};
	_units;
};

usec_mission_spawnGroupCivilian = {
	private["_place","_qty","_units","_type","_crewman"];
	_place = _this select 0;
	_qty = _this select 1;
	_units = [];
	_group = createGroup civilian;
	for "_i" from 1 to _qty do {		
		_type = (USEC_MissionCivilians select (floor(random (count USEC_MissionCivilians))));
		_crewman = _group createUnit [_type, _place, [], _qty, "NONE"];
		_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_civilianKilled}];
		_crewman allowFleeing 0;
		_units = _units + [_crewman];
	};
	_units;
};

/*
usec_mission_placeRovingPatrol = {
	//Places a roving patrol along a point on a road
	//[_patrolDis,_initialRoad,_soldiers] call usec_mission_placeRovingPatrol
	private["_try","_patrolDis","_place","_qty","_group","_type","_crewman","_units"];
	_try = 0;
	_patrolDis = _this select 0;
	_place = _this select 1;
	_qty = _this select 2;
	_group = createGroup east;
	_units = [_place,_qty] call usec_mission_spawnGroup;
	[_group, _place, 1000] call bis_fnc_taskPatrol;
	_units;
};
*/
usec_mission_defendArea = {
	//_new = [_qty,_position] call usec_mission_defendArea;
	private["_group","_type","_crewman","_units","_crashPos","_guardNumber"];
	_group = createGroup east;
	_units = [];
	_guardNumber = _this select 0;
	_crashPos = _this select 1;
	for "_i" from 1 to _guardNumber do {		
		_type = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
		_crewman = _group createUnit [_type, _crashPos, [], _guardNumber, "NONE"];
		_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
		_units = _units + [_crewman];
	};
	[_group, _crashPos] call bis_fnc_taskDefend;
	_units;
};

usec_mission_getBuildingPlace = {
	//Finds a place to place something in a building
	private["_hidingPlaces","_hidingPlace","_offset","_place","_dir","_array"];
	_building = _this select 0;
	_hidingPlaces = USEC_MissionBuildingPlaces select (USEC_MissionBuildingTypes find (typeOf _building));
	_hidingPlace = (_hidingPlaces select (floor(random (count _hidingPlaces))));
	_offset = _hidingPlace select 0;
	_place = _building modeltoworld _offset;
	_dir = _hidingPlace select 1;
	_array = [_place,_dir];
	_array;
};
usec_mission_placeBuildingGuards = {
	//Places a quantity of guards in a town
	//[_town,_class,_qty] call usec_mission_placeBuildingGuards;
	private["_town","_class","_guardQty","_townBuildings","_units","_index","_building","_group","_array","_place","_dir","_crewman","_try","_color","_isCiv","_classCiv","_group2"];
	_town = _this select 0;
	_guardQty = _this select 1;

	_townBuildings = nearestObjects [(position _town), USEC_MissionBuildingTypes, 400];
	_units = [];
	_try = 0;

	while {((count _units) < _guardQty) and (_try < (_guardQty * 5))} do {
		_index = (floor(random (count _townBuildings)));
		_building = _townBuildings select _index;
		_array = [_building] call usec_mission_getBuildingPlace;
		_place = _array select 0;
		_dir = _array select 1;
		_guards = count nearestObjects [_place, ["Man"], 1];
		_color = "ColorRed";
		_isCiv = round(random 2);
		if (_guards == 0) then {
			if (_isCiv > 1) then {
				_classCiv = (USEC_MissionCivilians select (floor(random (count USEC_MissionCivilians))));
				_group2 = createGroup Civilian;
				_crewman = _group2 createUnit [_classCiv, _place, [], 0, "NONE"];
				_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_civilianKilled}];
				_crewman allowFleeing 0;
				_color = "ColorBlue";
			} else {
				_class = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
				_group = createGroup east;
				_crewman = _group createUnit [_class, _place, [], 0, "NONE"];
				_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
				_color = "ColorRed";
			};

			_crewman setPosATL _place;
			_crewman setdir _dir;
			_units = _units + [_crewman];
			/*
			_markerName = format["m_guard_%1",(count _units)];
			_markerstr = createMarker[_markerName,_place];
			_markerstr setMarkerShape "ICON";
			_markerName setMarkerType "DOT";
			_markerName setMarkerColor _color;
			*/
		};
		_try = _try + 1;
	};
	_units;
};

usec_mission_spawnInternalGroup = {
	//_new = [_town,_qty] call usec_mission_spawnInternalGroup;
	private["_town","_qty","_townBuildings","_building","_noPeople","_new","_units","_try"];
	_town = _this select 0;
	_qty = _this select 1;
	_units = [];
	_try = 0;
	while {((count _units) < _qty) and (_try < (_qty * 5))} do {
		_townBuildings = nearestObjects [(position _town), USEC_MissionBuildingTypes, 400];
		_building = (_townBuildings select (floor(random (count _townBuildings))));
		_noPeople = (({isPlayer _x} count nearestObjects [(position _town), ["Man"], 10]) == 0);
		if (_noPeople) then {
			_array = [_building] call usec_mission_getBuildingPlace;
			_place = _array select 0;
			_dir = _array select 1;
			_units = [_place,_qty] call usec_mission_spawnGroup;
		};
		_try = _try + 1;
	};
	_units;
};

usec_mission_createLoiters = {
	//[_type,_town,_qty] call usec_mission_createLoiters;
	//creates a group who loiter at a position
	private["_type","_pos","_qty","_group","_crewman","_wp","_units"];
	_pos = (position (_this select 0));
	_qty = _this select 1;
	_group = createGroup east;
	_units = [];
	for "_i" from 1 to _qty do {
		_type = (USEC_MissionSoldiers select (floor(random (count USEC_MissionSoldiers))));
		_crewman = _group createUnit [_type, _pos, [], 100, "NONE"];
		_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
		_units = _units + [_crewman];
	};
	_wp = _group addWaypoint [_pos,100];
	_wp setWaypointType "Dismissed";
	_wp setWaypointBehaviour "SAFE";	
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointFormation "WEDGE";
	_group setCombatMode "RED";
	_units;
};

usec_mission_findTown = {
	//Find a nearby town and return the town plus buildings
	private["_towns","_hasTown","_try","_townBuildings","_town","_array","_objectQty"];
	_objectQty = _this select 0;
	_towns = (nearestLocations [[7000,7000,0],["NameCityCapital","NameCity","NameVillage"],20000]);
	_hasTown = false;
	_try = 0;
	_townBuildings = [];
	_town = _towns select (floor(random (count _towns)));	
	while {!_hasTown and (_try < 10)} do {
		//Find a town
		_town = _towns select (floor(random (count _towns)));
		_townBuildings = nearestObjects [(position _town), USEC_MissionBuildingTypes, 500];
		if (count _townBuildings > _objectQty) then {
			_hasTown = true;
		} else {
			_try = _try + 1;
		};
	};
	_array = [_town,_townBuildings];
	_array;
};


usec_mission_placeBuildingObjects = {
	//Place objects inside random buildings
	private["_objectQty","_town","_townBuildings","_selectedBuildings","_index","_building","_array","_place","_dir","_markerName","_markerstr","_crate","_objects"];
	_objectQty = _this select 0;
	_town = _this select 1;
	_townBuildings = nearestObjects [(position _town), USEC_MissionBuildingTypes, 500];
	_selectedBuildings = [];
	_objects = [];
	if (count _townBuildings < _objectQty) then {
		_objectQty = (count _townBuildings);
	};
	while {((count _selectedBuildings) < _objectQty)} do {
		_index = (floor(random (count _townBuildings)));
		_building = _townBuildings select _index;
		if (!(_building in _selectedBuildings)) then {
			_selectedBuildings = _selectedBuildings + [_building];
			_array = [_building] call usec_mission_getBuildingPlace;
			_place = _array select 0;
			_dir = _array select 1;
			/*
			_markerName = format["m_cache_%1",(count _selectedBuildings)];
			_markerstr = createMarker[_markerName,_place];
			_markerstr setMarkerShape "ICON";
			_markerName setMarkerType "DOT";
			_markerName setMarkerColor "ColorYellow";
			*/
			_crate = _objectClass createVehicle _place;
			_crate setPosATL _place;
			_crate setdir _dir;
			_objects = _objects + [_crate];
		};
	};
	_objects;
};

usec_mission_addGuard = {
	private["_type","_vehicle","_group","_locSpawn","_canShoot","_canCargo","_crewman"];
	_vehicle = _this select 0;
	_group = _this select 1;
	_type = _this select 2;
	_locSpawn = _this select 3;
	_canShoot = ((_vehicle emptypositions "Gunner") > 0);
	_canCargo = ((_vehicle emptypositions "Cargo") > 0);
	if (_canCargo) then {
		_crewman = _group createUnit [_type, _locSpawn, [], 0, "NONE"];
		_crewman addMPEventHandler ["mpkilled", {_this spawn fnc_usec_enemyKilled}];
		if (!_canShoot) then {	
			_crewman assignAsCargo _vehicle;
			_crewman moveInCargo _vehicle;
			
		} else {
			_crewman assignAsGunner _vehicle;
			_crewman moveInGunner _vehicle;
		};
		USEC_MissionCleanup = USEC_MissionCleanup + [_crewman];
		[_crewman] spawn {
			private["_driver","_vehicle","_group"];
			_crewman = _this select 0;
			_vehicle = vehicle _crewman;
			waitUntil{!(alive _crewman) or !(canMove _crewman)};
			_group = createGroup east;
			[_crewman] join _group;
		};
	};
};

usec_mission_findLocation = {
	//Find a nearby town and return the town plus buildings
	private["_locations","_location"];
	_type = _this;
	_locations = (nearestLocations [[7000,7000,0],_type,20000]);
	player sideChat format["Count: %1",(count _locations)];
	_location = _locations select (floor(random (count _locations)));
	_location;
};

usec_mission_attackTeam = {
	private["_potentialLocs","_searching","_enemyPos","_enemyLoc","_enemyUnits","_group","_leader","_wp","_loop","_isClose","_object","_pos"];
	_pos = _this select 0;
	_object = _this select 1;
	_dis = _this select 2;
	_potentialLocs = nearestLocations [_pos, ["NameCityCapital","NameLocal","NameCity","NameVillage","StrongpointArea","Hill","FlatArea","FlatAreaCity","FlatAreaCitySmall","VegetationFir","VegetationBroadleaf"], (_dis select 1)];
	_enemyPos = [(position _object),(_dis select 0),(_dis select 1),10,1,10,0,[],_potentialLocs] call BIS_fnc_findSafePos;
	_enemyUnits = [_enemyPos,4] call usec_mission_spawnGroup;
	_group = group (_enemyUnits select 0);
	_leader = leader _group;
	[_group,_pos] call BIS_fnc_taskAttack;
	
	while {alive _object;} do {
		_leader = leader _group;
		sleep 5;
	};
	sleep (5 * 60);
	{deleteVehicle _x} forEach _enemyUnits;
	deleteGroup _group;
};

usec_mission_sabotageTeam = {
	private["_potentialLocs","_searching","_enemyPos","_enemyLoc","_enemyUnits","_group","_leader","_wp","_loop","_isClose","_object","_pos","_status"];
	_pos = _this select 0;
	_object = _this select 1;
	_dis = _this select 2;
	_potentialLocs = nearestLocations [_pos, ["NameCityCapital","NameLocal","NameCity","NameVillage","StrongpointArea","Hill","FlatArea","FlatAreaCity","FlatAreaCitySmall","VegetationFir","VegetationBroadleaf"], (_dis select 1)];
	_enemyPos = [(position _object),(_dis select 0),(_dis select 1),10,1,10,0,[],_potentialLocs] call BIS_fnc_findSafePos;

	_enemyUnits = [_enemyPos,4] call usec_mission_spawnGroup;
	_group = group (_enemyUnits select 0);
	_leader = leader _group;
	_wp = _group addWaypoint [_pos, 0];
	_wp setWPPos _pos;
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "AWARE";
	
	_loop = true;
	_status = 0;
	_isClose = false;
	_tactical = floor(random 3);
	while {_loop} do {
		_leader = leader _group;
		_targetAlive = alive _object;
		_status = _object getVariable ["status",0];
		if (_leader distance _pos < 5) then {_loop = false};
		if (!_targetAlive) then {_loop = false};
		if ({alive _x} count units _group == 0) then {_loop = false};
		if (_status == 2) then {_loop = false};
		if ((_leader distance _object < 100) and !_isClose and (_tactical > 1)) then {
			_isClose = true;
			_group setBehaviour "COMBAT";
			_group setCombatMode "RED";
			/*
			if ((daytime > 20) and (daytime < 5)) then {
				//Night, so hold fire
				_group setBehaviour "STEALTH";
				_group setCombatMode "GREEN";
			};
			*/
		};
		sleep 1;
	};
	if (({alive _x} count units _group > 0) and (_status != 2)) then {
		_leader addmagazine "PipeBomb";
		_leader fire ['pipebombmuzzle', 'pipebombmuzzle', 'pipebomb'];
		
		_wp = _group addWaypoint [_enemyPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointSpeed "FULL";
		_wp setWaypointBehaviour "COMBAT";
		_group setCombatMode "RED";
		
		//Wait till away
		_loop = true;
		while {_loop} do {
			_targetAlive = alive _object;
			_status = _object getVariable ["status",0];
			if (_leader distance _object > 20) then {_loop = false};
			if (!(alive _leader)) then {_loop = false};
			if (!_targetAlive) then {_loop = false};
			if (_status == 2) then {_loop = false};
			sleep 0.1;
		};
		if (_status != 2) then {
			_leader action ["TOUCHOFF", _leader];
			while {alive _object;} do {
				sleep 5;
			};
		};
	};
	sleep (5 * 60);
	{deleteVehicle _x} forEach _enemyUnits;
	deleteGroup _group;
};